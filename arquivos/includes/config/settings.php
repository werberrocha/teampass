<?php
// DATABASE connexion parameters
define("DB_HOST", "172.17.0.3");
define("DB_USER", "teampass_admin");
define("DB_PASSWD", "def50200e3cd1a2bfbed95e557151d2387a2f90d927d9589cdfd98db4ca860aa9f9599bbd4f1236e6b56e1b5af21468ec48404374c06c820be64fa53b093422c7d3c1cf6070b522aaf08299db38dcb43e1484263f249ea8e5ca9e91f4abf3a3f7f");
define("DB_NAME", "teampass");
define("DB_PREFIX", "teampass_");
define("DB_PORT", "3306");
define("DB_ENCODING", "utf8");
define("DB_SSL", false); // if DB over SSL then comment this line
// if DB over SSL then uncomment the following lines
//define("DB_SSL", array(
//    "key" => "",
//    "cert" => "",
//    "ca_cert" => "",
//    "ca_path" => "",
//    "cipher" => ""
//));
define("DB_CONNECT_OPTIONS", array(
    MYSQLI_OPT_CONNECT_TIMEOUT => 10
));
define("SECUREPATH", "/var/www/sk");
define("SECUREFILE", "K7j9pcLXF9ej8GYLyQcNzyNKEun4Xra6nHj2XvnZ");

if (isset($_SESSION['settings']['timezone']) === true) {
    date_default_timezone_set($_SESSION['settings']['timezone']);
}
