#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SKILLS_DIR="${REPO_ROOT}/skills/public"

list_skills() {
  find "${SKILLS_DIR}" -mindepth 2 -maxdepth 2 -type f -name "SKILL.md" \
    | while IFS= read -r path; do
        basename "$(dirname "${path}")"
      done \
    | sort
}

ALL_SKILLS=()
while IFS= read -r skill; do
  [[ -n "${skill}" ]] && ALL_SKILLS+=("${skill}")
done < <(list_skills)

usage() {
  cat <<USAGE
Usage:
  ./ports/install.sh <target> [destination] [skill]

Targets:
  codex      Install one skill (or all skills) into ~/.codex/skills
  claude     Install command into <destination>/.claude/commands (default: current directory)
  gemini     Install command into <destination>/.gemini/commands (default: current directory)
  universal  Copy universal prompt into <destination> (default: current directory)

Arguments:
  destination   Optional for claude/gemini/universal (defaults to current directory)
  skill         Optional. Any current skill slug, or "all" (default)

Current skills:
$(printf '  - %s\n' "${ALL_SKILLS[@]}")

Examples:
  ./ports/install.sh codex
  ./ports/install.sh codex . sg-skill-creator
  ./ports/install.sh claude ~/my-project sg-weather-now
  ./ports/install.sh gemini ~/my-project all
  ./ports/install.sh universal ~/Desktop sg-hdb-bto-announcements
USAGE
}

if [[ $# -lt 1 ]] || [[ $# -gt 3 ]]; then
  usage
  exit 1
fi

target="$1"
destination="${2:-$PWD}"
skill="${3:-all}"

has_skill() {
  local needle="$1"
  local s
  for s in "${ALL_SKILLS[@]}"; do
    if [[ "${s}" == "${needle}" ]]; then
      return 0
    fi
  done
  return 1
}

ensure_valid_skill() {
  if [[ "${skill}" == "all" ]]; then
    return 0
  fi
  if ! has_skill "${skill}"; then
    echo "Unknown skill: ${skill}"
    echo "Valid options: ${ALL_SKILLS[*]} all"
    exit 1
  fi
}

install_codex() {
  local dst="${HOME}/.codex/skills"
  mkdir -p "${dst}"

  if [[ "${skill}" == "all" ]]; then
    local s
    for s in "${ALL_SKILLS[@]}"; do
      cp -R "${REPO_ROOT}/skills/public/${s}" "${dst}/"
    done
    echo "Installed all Codex skills to: ${dst}"
    echo "Next: restart Codex and run a prompt like: Use \$${ALL_SKILLS[0]} ..."
    return
  fi

  cp -R "${REPO_ROOT}/skills/public/${skill}" "${dst}/"
  echo "Installed Codex skill to: ${dst}/${skill}"
  echo "Next: restart Codex and run a prompt like: Use \$${skill} ..."
}

install_claude() {
  local dst="${destination}/.claude/commands"
  mkdir -p "${dst}"

  if [[ "${skill}" == "all" ]]; then
    local copied=0 s src
    for s in "${ALL_SKILLS[@]}"; do
      src="${SCRIPT_DIR}/claude/.claude/commands/${s}.md"
      if [[ -f "${src}" ]]; then
        cp "${src}" "${dst}/"
        copied=$((copied + 1))
      fi
    done
    echo "Installed ${copied} Claude commands to: ${dst}"
    return
  fi

  local src="${SCRIPT_DIR}/claude/.claude/commands/${skill}.md"
  if [[ ! -f "${src}" ]]; then
    echo "Claude port missing for: ${skill}"
    echo "Run: ./ports/scripts/convert-skill.sh ${skill}"
    exit 1
  fi

  cp "${src}" "${dst}/${skill}.md"
  echo "Installed Claude command to: ${dst}/${skill}.md"
}

install_gemini() {
  local dst="${destination}/.gemini/commands"
  mkdir -p "${dst}"

  if [[ "${skill}" == "all" ]]; then
    local copied=0 s src
    for s in "${ALL_SKILLS[@]}"; do
      src="${SCRIPT_DIR}/gemini/.gemini/commands/${s}.toml"
      if [[ -f "${src}" ]]; then
        cp "${src}" "${dst}/"
        copied=$((copied + 1))
      fi
    done
    echo "Installed ${copied} Gemini commands to: ${dst}"
    return
  fi

  local src="${SCRIPT_DIR}/gemini/.gemini/commands/${skill}.toml"
  if [[ ! -f "${src}" ]]; then
    echo "Gemini port missing for: ${skill}"
    echo "Run: ./ports/scripts/convert-skill.sh ${skill}"
    exit 1
  fi

  cp "${src}" "${dst}/${skill}.toml"
  echo "Installed Gemini command to: ${dst}/${skill}.toml"
}

install_universal() {
  local dst="${destination}"
  mkdir -p "${dst}"

  if [[ "${skill}" == "all" ]]; then
    local copied=0 s src
    for s in "${ALL_SKILLS[@]}"; do
      src="${SCRIPT_DIR}/universal/${s}-prompt.md"
      if [[ -f "${src}" ]]; then
        cp "${src}" "${dst}/"
        copied=$((copied + 1))
      fi
    done
    echo "Copied ${copied} universal prompts to: ${dst}"
    return
  fi

  local src="${SCRIPT_DIR}/universal/${skill}-prompt.md"
  if [[ ! -f "${src}" ]]; then
    echo "Universal port missing for: ${skill}"
    echo "Run: ./ports/scripts/convert-skill.sh ${skill}"
    exit 1
  fi

  cp "${src}" "${dst}/${skill}-prompt.md"
  echo "Copied universal prompt to: ${dst}/${skill}-prompt.md"
}

ensure_valid_skill

case "${target}" in
  codex)
    install_codex
    ;;
  claude)
    install_claude
    ;;
  gemini)
    install_gemini
    ;;
  universal)
    install_universal
    ;;
  -h|--help|help)
    usage
    ;;
  *)
    echo "Unknown target: ${target}"
    usage
    exit 1
    ;;
esac
