#!/bin/bash
BASE_PATH=$(dirname "${BASH_SOURCE}")
BASE_PATH=$(cd "${BASE_PATH}"; pwd)

# source PGE env
export PYTHONPATH=$BASE_PATH:$PYTHONPATH
export PATH=$BASE_PATH:$PATH
export PYTHONPATH=${PYTHONPATH}:${HOME}/verdi/etc
export PYTHONPATH=${HOME}/verdi/etc:$BASE_PATH:$PYTHONPATH
export PATH=$BASE_PATH:$PATH

# source environment
source $HOME/verdi/bin/activate


echo "##########################################" 1>&2
echo -n "Running sling_acquisitions: " 1>&2
date 1>&2
/usr/bin/python $BASE_PATH/sling_acquisitions.py > sling_acquisitions.log 2>&1
STATUS=$?
echo -n "Finished running sling_acquisitions: " 1>&2
date 1>&2
if [ $STATUS -ne 0 ]; then
  echo "Failed to run sling_acquisitions." 1>&2
  cat sling_acquisitions.log 1>&2
  echo "{}"
  exit $STATUS
fi
