#!/bin/bash
BASE_PATH=$(dirname "${BASH_SOURCE}")
BASE_PATH=$(cd "${BASE_PATH}"; pwd)

# source PGE env
export PYTHONPATH=$BASE_PATH:$PYTHONPATH
export PATH=$BASE_PATH:$PATH
export PYTHONPATH=${PYTHONPATH}:${HOME}/verdi/etc
# source ISCE env
export GMT_HOME=/usr/local/gmt
export ARIAMH_HOME=$HOME/ariamh
export STANDARD_PRODUCT_HOME=$HOME/standard_product
source $ARIAMH_HOME/isce.sh
source $ARIAMH_HOME/giant.sh
export TROPMAP_HOME=$HOME/tropmap
export UTILS_HOME=$ARIAMH_HOME/utils
export GIANT_HOME=/usr/local/giant/GIAnT
export PYTHONPATH=${HOME}/verdi/etc:$ISCE_HOME/applications:$ISCE_HOME/components:$BASE_PATH:$ARIAMH_HOME:$TROPMAP_HOME:$GIANT_HOME:$PYTHONPATH
export PATH=$BASE_PATH:$TROPMAP_HOME:$GMT_HOME/bin:$PATH

# source environment
source $HOME/verdi/bin/activate


echo "##########################################" 1>&2
echo -n "Running sling_acquisitions: " 1>&2
date 1>&2
/usr/bin/python3 $BASE_PATH/sling_acquisitions.py > sling_acquisitions.log 2>&1
STATUS=$?
echo -n "Finished running sling_acquisitions: " 1>&2
date 1>&2
if [ $STATUS -ne 0 ]; then
  echo "Failed to run sling_acquisitions." 1>&2
  cat sling_acquisitions.log 1>&2
  echo "{}"
  exit $STATUS
fi
