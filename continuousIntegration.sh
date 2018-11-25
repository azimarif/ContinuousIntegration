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
