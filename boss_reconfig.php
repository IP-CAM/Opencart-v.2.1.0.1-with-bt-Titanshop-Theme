<?php
/**
 * USER INSTRUCTION:
 *
 * 1. upload boss_reconfig.php to your opencart folder (/public_html)
 * 2. configure boss_reconfig.php at CONFIGURE HERE section
 * 3. run boss_reconfig.php from your web browser: http://www.yourdomain.com/boss_reconfig.php
 * 4. delete boss_reconfig.php.
 */

################################################################################
### CONFIGURE HERE
################################################################################

$dbdriver = "mysqli";	# Database driver
$dbhost = "localhost";	# Database host name
$dbname = "opencart"; # Database name
$dbuser = "root"; # Database username
$dbpass = ""; # Database password
$dbport = "3306"; # Database password
$prefix = "oc_"; # Database prefix tables






################################################################################
### DO NOT EDIT BELOW
################################################################################

$file = fopen("config.php","w") or exit("NOT FOUND FILE!");
$content2 = "<?php
// HTTP
define('HTTP_SERVER', 'http://" . $_SERVER['HTTP_HOST'] .rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') . "/');

// HTTPS
define('HTTPS_SERVER', 'https://" . $_SERVER['HTTP_HOST'] .rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') . "/');

// DIR
define('DIR_APPLICATION', '".realpath(dirname(__FILE__)) ."/catalog/');
define('DIR_SYSTEM', '".realpath(dirname(__FILE__)) ."/system/');
define('DIR_LANGUAGE', '".realpath(dirname(__FILE__)) ."/catalog/language/');
define('DIR_TEMPLATE', '".realpath(dirname(__FILE__)) ."/catalog/view/theme/');
define('DIR_CONFIG', '".realpath(dirname(__FILE__)) ."/system/config/');
define('DIR_IMAGE', '".realpath(dirname(__FILE__)) ."/image/');
define('DIR_CACHE', '".realpath(dirname(__FILE__)) ."/system/storage/cache/');
define('DIR_DOWNLOAD', '".realpath(dirname(__FILE__)) ."/system/storage/download/');
define('DIR_UPLOAD', '".realpath(dirname(__FILE__)) ."/system/storage/upload/');
define('DIR_MODIFICATION', '".realpath(dirname(__FILE__)) ."/system/storage/modification/');
define('DIR_LOGS', '".realpath(dirname(__FILE__)) ."/system/storage/logs/');

// DB
define('DB_DRIVER', '".$dbdriver."');
define('DB_HOSTNAME', '".$dbhost."');
define('DB_USERNAME', '".$dbuser."');
define('DB_PASSWORD', '".$dbpass."');
define('DB_DATABASE', '".$dbname."');
define('DB_PORT', '".$dbport."');
define('DB_PREFIX', '".$prefix."');
?>";
$success1 = fwrite($file, $content2);
fclose($file);


########## ADMIN ###########
$file = fopen("admin/config.php","w") or exit("NOT FOUND FILE!");
$content3 = "<?php
// HTTP
define('HTTP_SERVER', 'http://" . $_SERVER['HTTP_HOST'] .rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') . "/admin/');
define('HTTP_CATALOG', 'http://" . $_SERVER['HTTP_HOST'] .rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') ."/');

// HTTPS
define('HTTPS_SERVER', 'https://" . $_SERVER['HTTP_HOST'] .rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') . "/admin/');
define('HTTPS_CATALOG', 'http://" . $_SERVER['HTTP_HOST'] .rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') ."/');

// DIR
define('DIR_APPLICATION', '".realpath(dirname(__FILE__)) ."/admin/');
define('DIR_SYSTEM', '".realpath(dirname(__FILE__)) ."/system/');
define('DIR_LANGUAGE', '".realpath(dirname(__FILE__)) ."/admin/language/');
define('DIR_TEMPLATE', '".realpath(dirname(__FILE__)) ."/admin/view/template/');
define('DIR_CONFIG', '".realpath(dirname(__FILE__)) ."/system/config/');
define('DIR_IMAGE', '".realpath(dirname(__FILE__)) ."/image/');
define('DIR_CACHE', '".realpath(dirname(__FILE__)) ."/system/storage/cache/');
define('DIR_DOWNLOAD', '".realpath(dirname(__FILE__)) ."/system/storage/download/');
define('DIR_UPLOAD', '".realpath(dirname(__FILE__)) ."/system/storage/upload/');
define('DIR_LOGS', '".realpath(dirname(__FILE__)) ."/system/storage/logs/');
define('DIR_MODIFICATION', '".realpath(dirname(__FILE__)) ."/system/storage/modification/');
define('DIR_CATALOG', '".realpath(dirname(__FILE__)) ."/catalog/');

// DB
define('DB_DRIVER', '".$dbdriver."');
define('DB_HOSTNAME', '".$dbhost."');
define('DB_USERNAME', '".$dbuser."');
define('DB_PASSWORD', '".$dbpass."');
define('DB_DATABASE', '".$dbname."');
define('DB_PORT', '".$dbport."');
define('DB_PREFIX', '".$prefix."');
?>";
$success2 = fwrite($file, $content3);
fclose($file);


if($success1 && $success2)
{
 echo "<p style='color: brown; text-align: center; margin: 200px auto; font-size: 120%;'>Install Successfully! </br> Please Delete boss_reconfig.php file!</p>";
}else{
 echo "<p style='color: brown; text-align: center; margin: 200px auto; font-size: 120%;'>Install Failed! </br> Please configure boss_reconfig.php file!</p>";
}
?>