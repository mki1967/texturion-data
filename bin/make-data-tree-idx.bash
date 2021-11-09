dirs() {
    read LINE;
    END=$?;
    while [[ ${END} == 0 ]] ;
    do dirname "${LINE}";
       read LINE;
       END=$?;
    done;
}

encodelines() {
    read LINE; 
    END=$?;
    while [[ ${END} == 0 ]] ;
    do
	echo '     <li>'\
	     '<a href="data/'${LINE}'/index.html">'${LINE}'</a></li>'
	echo ' '
	read LINE; 
	END=$?;
    done;
    }


OUT='data-index.html'

BIN_DIR=`dirname $0`
cd $BIN_DIR/..
BIN_DIR=`cd "$BIN_DIR";pwd`
cd $BIN_DIR/..

OUT='data-tree-index.html'

cat > ${OUT} - << EOF
<!DOCTYPE html>
<html>
  <body>
    <h1> TEXTURION DATA FOLDERS: </h1>
    <ul>
EOF
find ./data -name '*.texturion' -ls| grep -o 'data/.*$' | grep -o '/.*$' | dirs | sort -u | encodelines >> ${OUT}
cat >> $OUT - << EOF
    </ul>
  </body>
</html>
EOF

update_dirs() {
    read LINE; 
    END=$?;
    while [[ ${END} == 0 ]] ; do
	pushd ${LINE};
	$BIN_DIR/make-public-idx.bash $(echo ${LINE}| grep -o '/.*$')
	popd ;
	read LINE; 
	END=$?;
    done;
}

find ./data -name '*.texturion' -ls| grep -o 'data/.*$' | dirs | sort -u | update_dirs

