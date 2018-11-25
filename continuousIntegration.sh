#! /bin/bash

if [ $# -eq 0 ]; then
  echo "Syntax:"
  echo "./continuousIntegration.sh <git Repository URL> [Time Interval]"
  exit
fi

repoURL=$1
timeInterval=$2
repoName=$(echo $repoURL | rev | cut -d '/' -f1 | rev | cut -d '.' -f1)

if [ ! -d "$repoName" ]; then
  git clone "$repoURL"
fi

if [ -z "$timeInterval" ]; then
  timeInterval=60
fi

cd "$repoName"

while true; do
  git pull; clear; date ; tree; mocha --reporter landing
  sleep "$timeInterval"
done
