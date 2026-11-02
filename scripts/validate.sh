#!/usr/bin/env bash
set -euo pipefail

target=${1:-.}

if [[ ! -d "$target" ]]; then
  printf 'Directory not found: %s\n' "$target" >&2
  exit 2
fi

if ! command -v rg >/dev/null 2>&1; then
  printf 'validate.sh requires ripgrep (rg).\n' >&2
  exit 2
fi

source_globs=(
  -g '*.js' -g '*.jsx' -g '*.ts' -g '*.tsx'
  -g '*.vue' -g '*.svelte' -g '*.astro' -g '*.html'
  -g '!**/*.d.ts' -g '!**/node_modules/**' -g '!**/dist/**' -g '!**/build/**'
)

env_files=$(rg --files --hidden --no-ignore \
  -g '.env' -g '.env.*' -g '!.env.example' \
  -g '!**/node_modules/**' -g '!**/dist/**' -g '!**/build/**' -g '!**/.git/**' \
  -- "$target" || true)

if [[ -n "$env_files" ]]; then
  printf 'Environment files found; remove secrets from the UI output:\n%s\n' "$env_files" >&2
  exit 1
fi

patterns=(
  -e '\b(fetch|XMLHttpRequest|WebSocket|EventSource)\s*\('
  -e '\b(axios|superagent)\s*(\(|\.)'
  -e '\b(localStorage|sessionStorage|document\.cookie|process\.env|import\.meta\.env)\b'
  -e '(firebase|supabase|@tanstack/react-query|@apollo/client|@aws-sdk|@prisma/client)'
  -e '-----BEGIN (OPENSSH|RSA|EC|DSA|ENCRYPTED)? ?PRIVATE KEY-----'
)

if matches=$(rg -n -o --no-heading --color never "${source_globs[@]}" "${patterns[@]}" -- "$target"); then
  printf '%s\n' "$matches"
  printf '\nPotential backend or secret residue found. Review each match.\n' >&2
  exit 1
else
  status=$?
  if [[ $status -ne 1 ]]; then
    printf 'Scan failed with ripgrep status %s.\n' "$status" >&2
    exit 2
  fi
fi

printf 'No common backend or private-key patterns found. Manual review is still required.\n'
