encodelines() {
    echo '<script>'
    cat - <<'EOF'
function makeUl( names ){
    const texturionPrefix="https://mki1967.github.io/texturion/?input=";
    let base=document.URL;
    let ul="<ul>\n";
    for( let i=0; i<names.length; i++){
	url=new URL(names[i], base );
	ul+="<li>"+
            "<a href='"+texturionPrefix+url+"'>"+names[i]+"</a>"+
            "</li>\n"
    }
    ul+="</ul>\n";
    return ul;
}
EOF
    echo 'window.onload = function(){'
    echo '  var names=[];'
    read LINE; 
    END=$?;
    while [[ ${END} == 0 ]] ;
    do
	echo '  names.push("'$LINE'");' 
	read LINE; 
	END=$?;
    done;
    echo '  document.getElementById("items").innerHTML= makeUl( names );'
    echo '}'
    echo '</script>'
}

cat - << 'EOF'
<!DOCTYPE html>
<html>
  <head>
EOF

ls -1 *.texturion | encodelines 

cat - << EOF
  </head>
  <body>
    <h2>TEXTURION DATA:</h2>
    <code>${1}</code>
    <div id='items'>
    </div>
  </body>
</html>
EOF
