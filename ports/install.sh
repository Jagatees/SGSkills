#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

usage() {
  cat <<'EOF'
Usage:
  ./ports/install.sh <target> [destination]

Targets:
  codex      Install sg-news-brief into ~/.codex/skills
  claude     Install command into <destination>/.claude/commands (default: current directory)
  gemini     Install command into <destination>/.gemini/commands (default: current directory)
  universal  Copy universal prompt into <destination> (default: current directory)

Examples:
  ./ports/install.sh codex
  ./ports/install.sh claude ~/my-project
  ./ports/install.sh gemini ~/my-project
  ./ports/install.sh universal ~/Desktop
EOF
}

if [[ $# -lt 1 ]] || [[ $# -gt 2 ]]; then
  usage
  exit 1
fi

target="$1"
destination="${2:-$PWD}"

install_codex() {
  local src="${REPO_ROOT}/skills/public/sg-news-brief"
  local dst="${HOME}/.codex/skills"
  mkdir -p "${dst}"
  cp -R "${src}" "${dst}/"
  echo "Installed Codex skill to: ${dst}/sg-news-brief"
  echo "Next: restart Codex and run: Use \$sg-news-brief and give me a Singapore news brief for the last 24 hours."
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
