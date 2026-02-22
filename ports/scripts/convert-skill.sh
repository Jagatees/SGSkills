#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
SKILLS_DIR="${REPO_ROOT}/skills/public"
CLAUDE_DIR="${REPO_ROOT}/ports/claude/.claude/commands"
GEMINI_DIR="${REPO_ROOT}/ports/gemini/.gemini/commands"
UNIVERSAL_DIR="${REPO_ROOT}/ports/universal"

usage() {
  cat <<'USAGE'
Usage:
  ./ports/scripts/convert-skill.sh <skill-name|all>

Examples:
  ./ports/scripts/convert-skill.sh sg-news-brief
  ./ports/scripts/convert-skill.sh all
USAGE
}

if [[ $# -ne 1 ]]; then
  usage
  exit 1
fi

target="$1"

list_skills() {
  find "${SKILLS_DIR}" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort
}

extract_description() {
  local skill_file="$1"
  awk '/^description:/ {sub(/^description:[[:space:]]*/,""); print; exit}' "${skill_file}"
}

extract_body() {
  local skill_file="$1"
  awk '
    BEGIN {dash=0}
    /^---$/ {dash++; next}
    dash >= 2 {print}
  ' "${skill_file}"
}

generate_universal() {
  local skill="$1"
  local skill_file="${SKILLS_DIR}/${skill}/SKILL.md"
  local description body out
  description="$(extract_description "${skill_file}")"
  body="$(extract_body "${skill_file}")"
  out="${UNIVERSAL_DIR}/${skill}-prompt.md"

  cat > "${out}" <<EOF2
# Universal Prompt: ${skill}

Use this in any AI assistant that does not support native Codex skills.

Do not skip required input gates in the spec.

Prompt:
You are running the ${skill} workflow.

Task description:
${description}

If the user provides arguments, treat them as scope preferences.

Follow this skill specification exactly:

${body}

Output requirements:
- Use absolute dates (for example: February 21, 2026).
- Include confidence labels and explicit caveats when data is missing.
- Keep facts and inference clearly separated where required by the spec.
EOF2
}

generate_claude() {
  local skill="$1"
  local skill_file="${SKILLS_DIR}/${skill}/SKILL.md"
  local description body out
  description="$(extract_description "${skill_file}")"
  body="$(extract_body "${skill_file}")"
  out="${CLAUDE_DIR}/${skill}.md"

  cat > "${out}" <<EOF2
Run the \`${skill}\` workflow for Singapore context.

If user provides arguments, treat them as scope preferences.

Task description:
${description}

Follow this skill specification exactly:

${body}

Output rules:
1. Use absolute dates.
2. Use full clickable source URLs where factual claims are present.
3. Keep confidence and caveats explicit.
4. Do not claim admission guarantees or certainty beyond evidence.
EOF2
}

generate_gemini() {
  local skill="$1"
  local skill_file="${SKILLS_DIR}/${skill}/SKILL.md"
  local description body out
  description="$(extract_description "${skill_file}")"
  body="$(extract_body "${skill_file}")"
  out="${GEMINI_DIR}/${skill}.toml"

  cat > "${out}" <<EOF2
description = "${description}"
prompt = """
Run the \`${skill}\` workflow for Singapore context.

If user provides arguments, treat them as scope preferences.

Follow this skill specification exactly:

${body}

Output rules:
- Use absolute dates.
- Use full clickable source URLs where factual claims are present.
- Keep confidence and caveats explicit.
- Do not claim admission guarantees or certainty beyond evidence.

User arguments: {{args}}
"""
EOF2
}

mkdir -p "${CLAUDE_DIR}" "${GEMINI_DIR}" "${UNIVERSAL_DIR}"

skills=()
if [[ "${target}" == "all" ]]; then
  while IFS= read -r skill_name; do
    skills+=("${skill_name}")
  done < <(list_skills)
else
  skills=("${target}")
fi

for skill in "${skills[@]}"; do
  skill_file="${SKILLS_DIR}/${skill}/SKILL.md"
  if [[ ! -f "${skill_file}" ]]; then
    echo "Skill not found: ${skill}"
    exit 1
  fi

  generate_universal "${skill}"
  generate_claude "${skill}"
  generate_gemini "${skill}"
  echo "Generated ports for: ${skill}"
done
