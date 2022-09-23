#!/usr/bin/env bash
set -euxo pipefail

#AT SAM3 Relatives
RELATED_1="atsam3"
mkdir -p html/$RELATED_1
python3 scripts/htmlcomparesvd.py html/$RELATED_1 svd/atsam3x8e.svd.patched
sed -i 's#<table>#<p>Only a representative member of each family included; click to view entire family</p><table>#' html/$RELATED_1/index.html
#sed -i 's#atsam3a#<a href="atsam3a/index.html">ATSAM3A</a>#' html/$RELATED_1/index.html
#sed -i 's#atsam3n#<a href="atsam3n/index.html">ATSAM3N</a>#' html/$RELATED_1/index.html
#sed -i 's#atsam3s#<a href="atsam3s/index.html">ATSAM3S</a>#' html/$RELATED_1/index.html
#sed -i 's#atsam3u#<a href="atsam3u/index.html">ATSAM3U</a>#' html/$RELATED_1/index.html
sed -i 's#atsam3x8e-AU#<a href="atsam3x/index.html">ATSAM3X8E-AU</a>#' html/$RELATED_1/index.html

#mkdir -p html/$RELATED_1/atsam3a
#python3 scripts/htmlcomparesvd.py html/$RELATED_1/atsam3a svd/atsam3a*.svd.patched

#mkdir -p html/$RELATED_1/atsam3n
#python3 scripts/htmlcomparesvd.py html/$RELATED_1/atsam3n svd/atsam3n*.svd.patched

#mkdir -p html/$RELATED_1/atsam3s
#python3 scripts/htmlcomparesvd.py html/$RELATED_1/atsam3s svd/atsam3s*.svd.patched

#mkdir -p html/$RELATED_1/atsam3u
#python3 scripts/htmlcomparesvd.py html/$RELATED_1/atsam3u svd/atsam3u*.svd.patched

mkdir -p html/$RELATED_1/atsam3x
python3 scripts/htmlcomparesvd.py html/$RELATED_1/atsam3x svd/atsam3x*.svd.patched



cat > html/comparisons.html <<EOF
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name=viewport content="width=device-width, initial-scale=1">
<title>atsam-rs Peripheral Comparisons</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>

<body>
<nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.html">stm32-rs Device Coverage</a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Peripheral Comparisons</a></li>
      </ul>
    </div>
  </div>
</nav>

<h1>Device families</h1>
<ul>
  <li><a href="$RELATED_1/index.html">ATSAM3</a></li>
</ul>
</body>
</html>
EOF