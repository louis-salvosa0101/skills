#!/usr/bin/env bash
set -euo pipefail

# Load helpers without running the example provisioning stages.
source <(sed '/^run_wizard() {/,$d' "$(dirname "$0")/../skills/engineering/wizard/template.sh")

test_dir=$(mktemp -d)
trap 'rm -f "$test_dir/.env" "$test_dir/link"; rmdir "$test_dir"' EXIT
ENV_FILE="$test_dir/.env"
value="spaces # hash $ dollar and ' quote"
write_env TEST_VALUE "$value"
[[ "$(_existing TEST_VALUE)" == "$value" ]]
write_env TEST_VALUE replacement
[[ "$(_existing TEST_VALUE)" == replacement ]]
[[ $(grep -c '^TEST_VALUE=' "$ENV_FILE") == 1 ]]
if ln -s "$ENV_FILE" "$test_dir/link" && [[ -L "$test_dir/link" ]]; then
  ENV_FILE="$test_dir/link"
  write_env TEST_VALUE "$value"
  [[ -L "$ENV_FILE" && "$(_existing TEST_VALUE)" == "$value" ]]
else
  printf 'Skipped symlink check: real symlinks unavailable\n'
fi
write_env TEST_VALUE "$value"
ask TEST_VALUE "Value" <<< ''
[[ "$TEST_VALUE" == "$value" ]]
if ask TEST_VALUE "Value" </dev/null; then exit 1; fi
if ask_secret TEST_VALUE "Secret" </dev/null; then exit 1; fi
printf 'Wizard regression checks passed\n'
