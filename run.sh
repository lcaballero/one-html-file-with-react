#!/bin/build

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"

bash() {
  mkdir -p .dist
  (
    cd "$DIR" &&
      cp index.html main.js "$DIR/.dist"
  )
}

clean() {
  rm -rf .dist
}

"$@"
