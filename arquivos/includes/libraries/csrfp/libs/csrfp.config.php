<?php
/**
 * Configuration file for CSRF Protector
 */

return array(
    "CSRFP_TOKEN" => "d72e375471be7f551f05b05c2c390d1d6c26ba5bb39a0f5eb0",
    "logDirectory" => "../log",
    "failedAuthAction" => array(
        "GET" => 0,
        "POST" => 0),
    "errorRedirectionPage" => "",
    "customErrorMessage" => "",
    "jsPath" => "../js/csrfprotector.js",
    "jsUrl" => "./includes/libraries/csrfp/js/csrfprotector.js",
    "tokenLength" => 50,
    "cookieConfig" => array(
        "expire" => '',
        "path" => '',
        "domain" => '',
        "secure" => true,
        "httponly" => true,
        "samesite" => "Lax", // None || Lax  || Strict
        ),
    "disabledJavascriptMessage" => "This site attempts to protect users against <a href=\"https://www.owasp.org/index.php/Cross-Site_Request_Forgery_%28CSRF%29\">
    Cross-Site Request Forgeries </a> attacks. In order to do so, you must have JavaScript enabled in your web browser otherwise this site will fail to work correctly for you.
    See details of your web browser for how to enable JavaScript.",
    "verifyGetFor" => array("*type=duo_check*", "*upload.attachments.php*", "*upload.files.php*", "*type=ga_generate_qr*")
);
