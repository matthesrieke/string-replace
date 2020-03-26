#!/bin/bash

set -e

function fail() {
  echo "$@" >&2 && exit 1
}

[ $# -ne 0 ] && exec gpt $*

[ -z "${INPUT_SOURCE}" ] && fail 'missing ${INPUT_SOURCE}'
[ -z "${OUTPUT_OUTPUT}" ] && fail 'missing ${OUTPUT_OUTPUT}'

if [ "${INPUT_SOURCE_MIME_TYPE}" = "text/plain" ]; then
  echo copying ${INPUT_SOURCE} to ${OUTPUT_OUTPUT}
  cp ${INPUT_SOURCE} ${OUTPUT_OUTPUT}
else
  fail 'missing or unexpected ${INPUT_SOURCE_MIME_TYPE}'
fi

echo replacing strings...
sed -i 's/wps/javaPS/g' ${OUTPUT_OUTPUT}
