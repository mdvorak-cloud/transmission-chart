function merge() {
  echo "Merging $2 into $1"
  if [ -f "$1" ]; then
    yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' "$1" "$2" >/tmp/settings.json
    cp /tmp/settings.json "$1"
  else
    cp "$2" "$1"
  fi
}

echo "${WHITELIST_JSON}" >/tmp/whitelist.json
merge "${TARGET}" /tmp/whitelist.json
merge "${TARGET}" "${FROM}"
