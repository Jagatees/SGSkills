#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

usage() {
  cat <<'USAGE'
Usage:
  ./ports/install.sh <target> [destination] [skill]

Targets:
  codex      Install one skill (or all skills) into ~/.codex/skills
  claude     Install command into <destination>/.claude/commands (default: current directory)
  gemini     Install command into <destination>/.gemini/commands (default: current directory)
  universal  Copy universal prompt into <destination> (default: current directory)

Arguments:
  destination   Optional for claude/gemini/universal (defaults to current directory)
  skill         Optional. One of:
                - sg-news-brief
                - sg-govtech-announcement-scanner
                - sg-open-data-storyteller
                - sg-school-admission-orchestrator
                - sg-school-eligibility-checker
                - sg-school-discovery-finder
                - sg-school-finder-orchestrator
                - all (default for codex, claude, gemini, universal)

Examples:
  ./ports/install.sh codex
  ./ports/install.sh codex . sg-news-brief
  ./ports/install.sh codex . sg-govtech-announcement-scanner
  ./ports/install.sh codex . sg-open-data-storyteller
  ./ports/install.sh codex . sg-school-admission-orchestrator
  ./ports/install.sh codex . sg-school-eligibility-checker
  ./ports/install.sh codex . sg-school-discovery-finder
  ./ports/install.sh codex . sg-school-finder-orchestrator
  ./ports/install.sh claude ~/my-project sg-open-data-storyteller
  ./ports/install.sh claude ~/my-project all
  ./ports/install.sh gemini ~/my-project sg-open-data-storyteller
  ./ports/install.sh gemini ~/my-project all
  ./ports/install.sh universal ~/Desktop sg-open-data-storyteller
  ./ports/install.sh universal ~/Desktop all
USAGE
}

if [[ $# -lt 1 ]] || [[ $# -gt 3 ]]; then
  usage
  exit 1
fi

target="$1"
destination="${2:-$PWD}"
skill="${3:-}"

if [[ -z "${skill}" ]]; then
  if [[ "${target}" == "codex" ]]; then
    skill="all"
  else
    skill="all"
  fi
fi

ALL_SKILLS=(
  "sg-news-brief"
  "sg-govtech-announcement-scanner"
  "sg-open-data-storyteller"
  "sg-school-admission-orchestrator"
  "sg-school-eligibility-checker"
  "sg-school-discovery-finder"
  "sg-school-finder-orchestrator"
)

install_codex() {
  local dst="${HOME}/.codex/skills"
  mkdir -p "${dst}"

  case "${skill}" in
    all)
      cp -R "${REPO_ROOT}/skills/public/." "${dst}/"
      echo "Installed all Codex skills to: ${dst}"
      ;;
    sg-news-brief|sg-govtech-announcement-scanner|sg-open-data-storyteller|sg-school-admission-orchestrator|sg-school-eligibility-checker|sg-school-discovery-finder|sg-school-finder-orchestrator)
      cp -R "${REPO_ROOT}/skills/public/${skill}" "${dst}/"
      echo "Installed Codex skill to: ${dst}/${skill}"
      ;;
    *)
      echo "Unknown skill for codex: ${skill}"
      echo "Valid options: sg-news-brief, sg-govtech-announcement-scanner, sg-open-data-storyteller, sg-school-admission-orchestrator, sg-school-eligibility-checker, sg-school-discovery-finder, sg-school-finder-orchestrator, all"
      exit 1
      ;;
  esac

  if [[ "${skill}" == "all" ]]; then
    echo "Next: restart Codex and run a prompt like: Use \$sg-news-brief ..."
  else
    echo "Next: restart Codex and run a prompt like: Use \$${skill} ..."
  fi
}

install_claude() {
  local dst="${destination}/.claude/commands"
  mkdir -p "${dst}"
  if [[ "${skill}" == "all" ]]; then
    cp "${SCRIPT_DIR}/claude/.claude/commands/"*.md "${dst}/"
    echo "Installed all Claude commands to: ${dst}"
    echo "Next: in Claude Code, run: /<skill-name> <your arguments>"
    return
  fi

  local src="${SCRIPT_DIR}/claude/.claude/commands/${skill}.md"
  local out="${skill}.md"
  if [[ ! -f "${src}" ]]; then
    echo "Unknown skill for claude: ${skill}"
    echo "Valid options: ${ALL_SKILLS[*]} all"
    exit 1
  fi

  cp "${src}" "${dst}/${out}"
  echo "Installed Claude command to: ${dst}/${out}"
  echo "Next: in Claude Code, run: /${out%.md} <your arguments>"
}

install_gemini() {
  local dst="${destination}/.gemini/commands"
  mkdir -p "${dst}"
  if [[ "${skill}" == "all" ]]; then
    cp "${SCRIPT_DIR}/gemini/.gemini/commands/"*.toml "${dst}/"
    echo "Installed all Gemini commands to: ${dst}"
    echo "Next: in Gemini CLI, run: /<skill-name> <your arguments>"
    return
  fi

  local src="${SCRIPT_DIR}/gemini/.gemini/commands/${skill}.toml"
  local out="${skill}.toml"
  if [[ ! -f "${src}" ]]; then
    echo "Unknown skill for gemini: ${skill}"
    echo "Valid options: ${ALL_SKILLS[*]} all"
    exit 1
  fi

  cp "${src}" "${dst}/${out}"
  echo "Installed Gemini command to: ${dst}/${out}"
  echo "Next: in Gemini CLI, run: /${out%.toml} <your arguments>"
}

install_universal() {
  local dst="${destination}"
  mkdir -p "${dst}"
  if [[ "${skill}" == "all" ]]; then
    cp "${SCRIPT_DIR}/universal/"*-prompt.md "${dst}/"
    echo "Copied all universal prompts to: ${dst}"
    echo "Next: open any prompt file and paste it into your AI tool."
    return
  fi

  local src="${SCRIPT_DIR}/universal/${skill}-prompt.md"
  local out="${skill}-prompt.md"
  if [[ ! -f "${src}" ]]; then
    echo "Unknown skill for universal: ${skill}"
    echo "Valid options: ${ALL_SKILLS[*]} all"
    exit 1
  fi

  cp "${src}" "${dst}/${out}"
  echo "Copied universal prompt to: ${dst}/${out}"
  echo "Next: open the file and paste the template into your AI tool."
}

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
