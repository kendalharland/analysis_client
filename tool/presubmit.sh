#!/bin/bash

# Fast fail the script on failures.
set -e

unformatted=($(dartfmt -n .))
if [ ${#unformatted[@]} -gt 0 ]; then 
  echo >&2 "Dart files must be formatted. Please run:"
  for ffile in $unformatted; do
    echo >&2 "  dartfmt -w $PWD/$ffile"
  done
  exit 1
fi

pub run test test/test_all.dart && exit 0
exit 1

