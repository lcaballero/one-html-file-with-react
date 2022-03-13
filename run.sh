#!/bin/bash

build() {
  mkdir -p .dist
  cp index.html \
     main.js \
     .dist
}

clean() {
  rm -rf .dist
}

"$@"
