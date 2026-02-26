#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${REPO_URL:-https://github.com/Jagatees/SGSkills.git}"
REPO_REF="${REPO_REF:-main}"
SKILL="${1:-all}"

case "${SKILL}" in
  all|sg-skill-creator|sg-news-brief|sg-govtech-announcement-scanner|sg-open-data-storyteller|sg-transit-service-tracker|sg-transit-live-eta-tracker|sg-school-admission-orchestrator|sg-school-eligibility-checker|sg-school-discovery-finder|sg-school-finder-orchestrator)
    ;;
  *)
    echo "Unknown skill: ${SKILL}"
    echo "Valid options: all, sg-skill-creator, sg-news-brief, sg-govtech-announcement-scanner, sg-open-data-storyteller, sg-transit-service-tracker, sg-transit-live-eta-tracker, sg-school-admission-orchestrator, sg-school-eligibility-checker, sg-school-discovery-finder, sg-school-finder-orchestrator"
    exit 1
    ;;
esac

tmp_dir="$(mktemp -d)"
cleanup() {
  rm -rf "${tmp_dir}"
}
trap cleanup EXIT

git clone --depth 1 --branch "${REPO_REF}" "${REPO_URL}" "${tmp_dir}" >/dev/null 2>&1
bash "${tmp_dir}/ports/install.sh" codex . "${SKILL}"
