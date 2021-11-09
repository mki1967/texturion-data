BIN_DIR=`dirname $0`
BIN_DIR=`cd "$BIN_DIR";pwd`
cd $BIN_DIR/../data/

$BIN_DIR/make-data-tree-idx.bash

