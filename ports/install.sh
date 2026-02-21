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
  skill         Optional for codex. One of:
                - sg-news-brief
                - sg-open-data-storyteller
                - all (default)

Examples:
  ./ports/install.sh codex
  ./ports/install.sh codex . sg-news-brief
  ./ports/install.sh codex . sg-open-data-storyteller
  ./ports/install.sh claude ~/my-project
  ./ports/install.sh gemini ~/my-project
  ./ports/install.sh universal ~/Desktop
USAGE
}

if [[ $# -lt 1 ]] || [[ $# -gt 3 ]]; then
  usage
  exit 1
fi

target="$1"
destination="${2:-$PWD}"
skill="${3:-all}"

install_codex() {
  local dst="${HOME}/.codex/skills"
  mkdir -p "${dst}"

  case "${skill}" in
    all)
      cp -R "${REPO_ROOT}/skills/public/." "${dst}/"
      echo "Installed all Codex skills to: ${dst}"
      ;;
    sg-news-brief|sg-open-data-storyteller)
      cp -R "${REPO_ROOT}/skills/public/${skill}" "${dst}/"
      echo "Installed Codex skill to: ${dst}/${skill}"
      ;;
    *)
      echo "Unknown skill for codex: ${skill}"
      echo "Valid options: sg-news-brief, sg-open-data-storyteller, all"
      exit 1
      ;;
  esac

  echo "Next: restart Codex and run a prompt like: Use \$${skill} ..."
}

install_claude() {
  local src="${SCRIPT_DIR}/claude/.claude/commands/sg-news-brief.md"
  local dst="${destination}/.claude/commands"
  mkdir -p "${dst}"
  cp "${src}" "${dst}/sg-news-brief.md"
  echo "Installed Claude command to: ${dst}/sg-news-brief.md"
  echo "Next: in Claude Code, run: /sg-news-brief last 24 hours audience=founders/SMEs length=standard"
}

install_gemini() {
  local src="${SCRIPT_DIR}/gemini/.gemini/commands/sg-news-brief.toml"
  local dst="${destination}/.gemini/commands"
  mkdir -p "${dst}"
  cp "${src}" "${dst}/sg-news-brief.toml"
  echo "Installed Gemini command to: ${dst}/sg-news-brief.toml"
  echo "Next: in Gemini CLI, run: /sg-news-brief last 24 hours audience=public length=standard"
}

install_universal() {
  local src="${SCRIPT_DIR}/universal/sg-news-brief-prompt.md"
  local dst="${destination}"
  mkdir -p "${dst}"
  cp "${src}" "${dst}/sg-news-brief-prompt.md"
  echo "Copied universal prompt to: ${dst}/sg-news-brief-prompt.md"
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
