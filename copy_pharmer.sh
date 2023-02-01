#!/bin/bash

target_file="./Release/pharmer"
dest_dir="${SILCSBIODIR}/programs"

if [[ ! -d ${dest_dir} ]]; then
  echo "Error: folder does not exist ==> ${dest_dir}"
  echo "       please check environment variable \$SILCSBIODIR ==> ${SILCSBIODIR}"
  exit 1
elif [[ ! -w ${dest_dir} ]]; then
  echo "Error: you do not have write permission in ${dest_dir}"
  exit 1
fi

if [[ ! -f ${target_file} ]]; then
  echo "Error: ${target_file} does not exist!"
  exit 1
fi

cp "${target_file}" "${dest_dir}"

