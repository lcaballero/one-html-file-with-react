#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"

build() {
  mkdir -p .dist
  (
    cd "$DIR/src" &&
      cp index.html \
         main.js \
         react-dom.development.js react.development.js babel.min.js \
         main.css reset.css has-layout.css \
         "$DIR/.dist"
  )
}

clean() {
  rm -rf .dist
}

start::server() {
  ulimit -n 8192 && \
    caddy -root .dist \
          -pidfile pid \
          -port 1111 2>&1 > /dev/null &
}

stop::server() {
  if [ -f "$DIR/pid" ]; then
    kill -9 "$(< "$DIR/pid")"
    rm "$DIR/pid"
  fi
}

show() {
  cat <<EOF
DIR = $DIR
EOF
}

"$@"
