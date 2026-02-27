#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${REPO_URL:-https://github.com/Jagatees/SGSkills.git}"
REPO_REF="${REPO_REF:-main}"
SKILL="${1:-all}"

tmp_dir="$(mktemp -d)"
cleanup() {
  rm -rf "${tmp_dir}"
}
trap cleanup EXIT

git clone --depth 1 --branch "${REPO_REF}" "${REPO_URL}" "${tmp_dir}" >/dev/null 2>&1

if [[ "${SKILL}" != "all" ]] && [[ ! -f "${tmp_dir}/skills/public/${SKILL}/SKILL.md" ]]; then
  echo "Unknown skill: ${SKILL}"
  echo "Run with 'all' or a valid skill slug under skills/public/<slug>/SKILL.md"
  exit 1
fi

bash "${tmp_dir}/ports/install.sh" codex . "${SKILL}"
