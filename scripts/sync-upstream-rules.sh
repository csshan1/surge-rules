#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
rules_dir="$repo_root/rules"

mkdir -p "$rules_dir"

items=(
  "OpenAI|https://raw.githubusercontent.com/EAlyce/conf/refs/heads/main/Rule/OpenAI.list"
  "Apple|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Apple/Apple_All_No_Resolve.list"
  "GitHub|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/GitHub/GitHub.list"
  "Microsoft|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Microsoft/Microsoft.list"
  "Telegram|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Telegram/Telegram.list"
  "Epic|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Epic/Epic.list"
  "Sony|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Sony/Sony.list"
  "Steam|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Steam/Steam.list"
  "Nintendo|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Nintendo/Nintendo.list"
  "YouTube|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/YouTube/YouTube.list"
  "Netflix|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Netflix/Netflix.list"
  "Disney|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Disney/Disney.list"
  "Spotify|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Spotify/Spotify.list"
  "TikTok|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/TikTok/TikTok.list"
  "BiliBili|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/BiliBili/BiliBili.list"
  "ChinaMedia|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/ChinaMedia/ChinaMedia.list"
  "GlobalMedia|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/GlobalMedia/GlobalMedia_All_No_Resolve.list"
  "Proxy|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Proxy/Proxy_All_No_Resolve.list"
  "ChinaMax|https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/ChinaMax/ChinaMax_All.list"
)

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

for item in "${items[@]}"; do
  name="${item%%|*}"
  url="${item#*|}"
  tmp_file="$tmp_dir/${name}.list"
  target_file="$rules_dir/${name}.list"

  echo "Syncing ${name}.list"
  curl --fail --location --retry 3 --retry-delay 2 --connect-timeout 20 --max-time 120 \
    "$url" \
    --output "$tmp_file"

  if [[ ! -s "$tmp_file" ]]; then
    echo "Downloaded file is empty: $url" >&2
    exit 1
  fi

  mv "$tmp_file" "$target_file"
done

echo "Upstream rule sync complete."
