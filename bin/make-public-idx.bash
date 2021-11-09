export MKI3D_APP='https://mki1967.github.io/mki3d/mki3d_www/mki3d.html'
export MKI3D_TRAVEL='https://mki1967.github.io/mki3d/mki3d_www/travel.html'

BIN_DIR=`dirname $0`
# $BIN_DIR/make-mki3d-idx.bash > INDEX_MKI3D_PUBLIC.html
$BIN_DIR/make-dynamic-idx.bash ${1} > index.html

