<?php
// connect to db
$link = mysql_connect('webapps-db.web.itd', 'fleming', 'ma15&8lue');
if (!$link) {
    die('Not connected : ' . mysql_error());
}

if (! mysql_select_db('fleming') ) {
    die ('MYSQL ERROR!!!!: ' . mysql_error());
}
?>

