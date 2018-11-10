#!/bin/bash
BASE_PATH=$(dirname "${BASH_SOURCE}")
BASE_PATH=$(cd "${BASE_PATH}"; pwd)

# source PGE env
export PYTHONPATH=$BASE_PATH:$PYTHONPATH
export PYTHONPATH=${PYTHONPATH}:${HOME}/verdi/etc 
export PATH=$BASE_PATH:$PATH

# source environment
source $HOME/verdi/bin/activate

echo "##########################################" 1>&2
echo -n "Running sling_acquisitions.py on $1: " 1>&2
date 1>&2
$BASE_PATH/sling_acquisitions.py $BASE_PATH/$1 > sling_acquisitions.log 2>&1
STATUS=$?
echo -n "Finished running $1 sling_acquisitions.py: " 1>&2
date 1>&2
if [ $STATUS -ne 0 ]; then
  echo "Failed to run $1 sling_acquisitions.py." 1>&2
  cat sling_acquisitions.log 1>&2
  echo "{}"
  exit $STATUS
fi
