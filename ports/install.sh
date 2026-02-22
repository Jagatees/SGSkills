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
                - all (codex target only; default for codex)

Examples:
  ./ports/install.sh codex
  ./ports/install.sh codex . sg-news-brief
  ./ports/install.sh codex . sg-govtech-announcement-scanner
  ./ports/install.sh codex . sg-open-data-storyteller
  ./ports/install.sh codex . sg-school-admission-orchestrator
  ./ports/install.sh codex . sg-school-eligibility-checker
  ./ports/install.sh codex . sg-school-discovery-finder
  ./ports/install.sh claude ~/my-project sg-open-data-storyteller
  ./ports/install.sh gemini ~/my-project sg-open-data-storyteller
  ./ports/install.sh universal ~/Desktop sg-open-data-storyteller
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
    skill="sg-news-brief"
  fi
fi

install_codex() {
  local dst="${HOME}/.codex/skills"
  mkdir -p "${dst}"

  case "${skill}" in
    all)
      cp -R "${REPO_ROOT}/skills/public/." "${dst}/"
      echo "Installed all Codex skills to: ${dst}"
      ;;
    sg-news-brief|sg-govtech-announcement-scanner|sg-open-data-storyteller|sg-school-admission-orchestrator|sg-school-eligibility-checker|sg-school-discovery-finder)
      cp -R "${REPO_ROOT}/skills/public/${skill}" "${dst}/"
      echo "Installed Codex skill to: ${dst}/${skill}"
      ;;
    *)
      echo "Unknown skill for codex: ${skill}"
      echo "Valid options: sg-news-brief, sg-govtech-announcement-scanner, sg-open-data-storyteller, sg-school-admission-orchestrator, sg-school-eligibility-checker, sg-school-discovery-finder, all"
      exit 1
      ;;
  esac

  echo "Next: restart Codex and run a prompt like: Use \$${skill} ..."
}

install_claude() {
  local src=""
  local out=""
  case "${skill}" in
    sg-news-brief)
      src="${SCRIPT_DIR}/claude/.claude/commands/sg-news-brief.md"
      out="sg-news-brief.md"
      ;;
    sg-open-data-storyteller)
      src="${SCRIPT_DIR}/claude/.claude/commands/sg-open-data-storyteller.md"
      out="sg-open-data-storyteller.md"
      ;;
    *)
      echo "Unknown skill for claude: ${skill}"
      echo "Valid options: sg-news-brief, sg-open-data-storyteller"
      exit 1
      ;;
  esac

  local dst="${destination}/.claude/commands"
  mkdir -p "${dst}"
  cp "${src}" "${dst}/${out}"
  echo "Installed Claude command to: ${dst}/${out}"
  echo "Next: in Claude Code, run: /${out%.md} <your arguments>"
}

install_gemini() {
  local src=""
  local out=""
  case "${skill}" in
    sg-news-brief)
      src="${SCRIPT_DIR}/gemini/.gemini/commands/sg-news-brief.toml"
      out="sg-news-brief.toml"
      ;;
    sg-open-data-storyteller)
      src="${SCRIPT_DIR}/gemini/.gemini/commands/sg-open-data-storyteller.toml"
      out="sg-open-data-storyteller.toml"
      ;;
    *)
      echo "Unknown skill for gemini: ${skill}"
      echo "Valid options: sg-news-brief, sg-open-data-storyteller"
      exit 1
      ;;
  esac

  local dst="${destination}/.gemini/commands"
  mkdir -p "${dst}"
  cp "${src}" "${dst}/${out}"
  echo "Installed Gemini command to: ${dst}/${out}"
  echo "Next: in Gemini CLI, run: /${out%.toml} <your arguments>"
}

install_universal() {
  local src=""
  local out=""
  case "${skill}" in
    sg-news-brief)
      src="${SCRIPT_DIR}/universal/sg-news-brief-prompt.md"
      out="sg-news-brief-prompt.md"
      ;;
    sg-open-data-storyteller)
      src="${SCRIPT_DIR}/universal/sg-open-data-storyteller-prompt.md"
      out="sg-open-data-storyteller-prompt.md"
      ;;
    *)
      echo "Unknown skill for universal: ${skill}"
      echo "Valid options: sg-news-brief, sg-open-data-storyteller"
      exit 1
      ;;
  esac

  local dst="${destination}"
  mkdir -p "${dst}"
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
