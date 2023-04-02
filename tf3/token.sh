#!/bin/bash
set -e
eval "$(jq -r '@sh "export do_token=\(.do_token) do_sshkey=\(.do_sshkey)"')"

finger=`curl -X GET -H "Content-Type: application/json" \
-H "Authorization: Bearer $do_token" \
"https://api.digitalocean.com/v2/account/keys?per_page=200" | \
 jq '.ssh_keys[] | select(.name == '\"$do_sshkey\"') | .fingerprint'`

echo "{\"output\": $finger}"






