<?php
// Single Setting
$_['account_sidebar_status'] 				= '1';
$_['account_sidebar_titlebgcolor'] 			= '#666666';
$_['account_sidebar_titlecolor'] 			= '';
$_['account_sidebar_linkbgcolor'] 			= '';
$_['account_sidebar_linkcolor'] 			= '';
$_['account_sidebar_hoverbgcolor'] 			= '';
$_['account_sidebar_hovercolor'] 			= '';

// Multiple Sections
$_['account_sidebar_title'][0]['status']  	= 1;
$_['account_sidebar_title'][0]['sort_order']= 1;
$_['account_sidebar_title'][0]['description'][1]['title']  = 'DASHBOARD & ORDERS';

$_['account_sidebar_title'][1]['status']  	= 1;
$_['account_sidebar_title'][1]['sort_order']= 2;
$_['account_sidebar_title'][1]['description'][1]['title']  = 'SHOPPING TOOLS';

$_['account_sidebar_title'][2]['status']  	= 1;
$_['account_sidebar_title'][2]['sort_order']= 3;
$_['account_sidebar_title'][2]['description'][1]['title']  = 'LOGOUT';

$_['account_sidebar_title'][0]['link_title'][0]['account_sidebar_link_title_description'][1]['name'] = 'Login';
$_['account_sidebar_title'][0]['link_title'][0]['link'] = 'index.php?route=account/login';
$_['account_sidebar_title'][0]['link_title'][0]['iconclass'] = 'fa-sign-in';
$_['account_sidebar_title'][0]['link_title'][0]['logged'] = '0';
$_['account_sidebar_title'][0]['link_title'][0]['sort_order'] = '1';


$_['account_sidebar_title'][0]['link_title'][1]['account_sidebar_link_title_description'][1]['name'] = 'Register';
$_['account_sidebar_title'][0]['link_title'][1]['link'] = 'index.php?route=account/register';
$_['account_sidebar_title'][0]['link_title'][1]['iconclass'] = 'fa-user-plus';
$_['account_sidebar_title'][0]['link_title'][1]['logged'] = '0';
$_['account_sidebar_title'][0]['link_title'][1]['sort_order'] = 2;

$_['account_sidebar_title'][0]['link_title'][2]['account_sidebar_link_title_description'][1]['name'] = 'Dashboard & Orders';
$_['account_sidebar_title'][0]['link_title'][2]['link'] = 'index.php?route=account/account';
$_['account_sidebar_title'][0]['link_title'][2]['iconclass'] = 'fa-dashboard';
$_['account_sidebar_title'][0]['link_title'][2]['logged'] = '1';
$_['account_sidebar_title'][0]['link_title'][2]['sort_order'] = 3;

$_['account_sidebar_title'][0]['link_title'][3]['account_sidebar_link_title_description'][1]['name'] = 'Edit Account';
$_['account_sidebar_title'][0]['link_title'][3]['link'] = 'index.php?route=account/edit';
$_['account_sidebar_title'][0]['link_title'][3]['iconclass'] = 'fa-pencil';
$_['account_sidebar_title'][0]['link_title'][3]['logged'] = '1';
$_['account_sidebar_title'][0]['link_title'][3]['sort_order'] = 4;

$_['account_sidebar_title'][0]['link_title'][4]['account_sidebar_link_title_description'][1]['name'] = 'Password';
$_['account_sidebar_title'][0]['link_title'][4]['link'] = 'index.php?route=account/password';
$_['account_sidebar_title'][0]['link_title'][4]['iconclass'] = 'fa-key';
$_['account_sidebar_title'][0]['link_title'][4]['logged'] = '1';
$_['account_sidebar_title'][0]['link_title'][4]['sort_order'] = 5;

$_['account_sidebar_title'][0]['link_title'][5]['account_sidebar_link_title_description'][1]['name'] = 'Address Book';
$_['account_sidebar_title'][0]['link_title'][5]['link'] = 'index.php?route=account/address';
$_['account_sidebar_title'][0]['link_title'][5]['iconclass'] = 'fa-book';
$_['account_sidebar_title'][0]['link_title'][5]['logged'] = '2';
$_['account_sidebar_title'][0]['link_title'][5]['sort_order'] = 6;

$_['account_sidebar_title'][0]['link_title'][6]['account_sidebar_link_title_description'][1]['name'] = 'Wish List';
$_['account_sidebar_title'][0]['link_title'][6]['link'] = 'index.php?route=account/wishlist';
$_['account_sidebar_title'][0]['link_title'][6]['iconclass'] = 'fa-heart';
$_['account_sidebar_title'][0]['link_title'][6]['logged'] = '2';
$_['account_sidebar_title'][0]['link_title'][6]['sort_order'] = 7;

$_['account_sidebar_title'][0]['link_title'][7]['account_sidebar_link_title_description'][1]['name'] = 'Order History';
$_['account_sidebar_title'][0]['link_title'][7]['link'] = 'index.php?route=account/order';
$_['account_sidebar_title'][0]['link_title'][7]['iconclass'] = 'fa-shopping-cart';
$_['account_sidebar_title'][0]['link_title'][7]['logged'] = '2';
$_['account_sidebar_title'][0]['link_title'][7]['sort_order'] = 8;

$_['account_sidebar_title'][0]['link_title'][8]['account_sidebar_link_title_description'][1]['name'] = 'Downloads';
$_['account_sidebar_title'][0]['link_title'][8]['link'] = 'index.php?route=account/download';
$_['account_sidebar_title'][0]['link_title'][8]['iconclass'] = 'fa-download';
$_['account_sidebar_title'][0]['link_title'][8]['logged'] = '2';
$_['account_sidebar_title'][0]['link_title'][8]['sort_order'] = 9;

$_['account_sidebar_title'][0]['link_title'][9]['account_sidebar_link_title_description'][1]['name'] = 'Newsletter';
$_['account_sidebar_title'][0]['link_title'][9]['link'] = 'index.php?route=account/newsletter';
$_['account_sidebar_title'][0]['link_title'][9]['iconclass'] = 'fa-envelope';
$_['account_sidebar_title'][0]['link_title'][9]['logged'] = '2';
$_['account_sidebar_title'][0]['link_title'][9]['sort_order'] = 10;

$_['account_sidebar_title'][1]['link_title'][0]['account_sidebar_link_title_description'][1]['name'] = 'Recurring Payments';
$_['account_sidebar_title'][1]['link_title'][0]['link'] = 'index.php?route=account/recurring';
$_['account_sidebar_title'][1]['link_title'][0]['iconclass'] = 'fa-credit-card';
$_['account_sidebar_title'][1]['link_title'][0]['logged'] = '2';
$_['account_sidebar_title'][1]['link_title'][0]['sort_order'] = 1;

$_['account_sidebar_title'][1]['link_title'][1]['account_sidebar_link_title_description'][1]['name'] = 'Reward Points';
$_['account_sidebar_title'][1]['link_title'][1]['link'] = 'index.php?route=account/reward';
$_['account_sidebar_title'][1]['link_title'][1]['iconclass'] = 'fa-gift';
$_['account_sidebar_title'][1]['link_title'][1]['logged'] = '2';
$_['account_sidebar_title'][1]['link_title'][1]['sort_order'] = 2;

$_['account_sidebar_title'][1]['link_title'][2]['account_sidebar_link_title_description'][1]['name'] = 'Returns';
$_['account_sidebar_title'][1]['link_title'][2]['link'] = 'index.php?route=account/return';
$_['account_sidebar_title'][1]['link_title'][2]['iconclass'] = 'fa-exchange';
$_['account_sidebar_title'][1]['link_title'][2]['logged'] = '2';
$_['account_sidebar_title'][1]['link_title'][2]['sort_order'] = 3;

$_['account_sidebar_title'][1]['link_title'][3]['account_sidebar_link_title_description'][1]['name'] = 'Transactions';
$_['account_sidebar_title'][1]['link_title'][3]['link'] = 'index.php?route=account/transaction';
$_['account_sidebar_title'][1]['link_title'][3]['iconclass'] = 'fa-money';
$_['account_sidebar_title'][1]['link_title'][3]['logged'] = '2';
$_['account_sidebar_title'][1]['link_title'][3]['sort_order'] = 4;

$_['account_sidebar_title'][2]['link_title'][0]['account_sidebar_link_title_description'][1]['name'] = 'LOGOUT';
$_['account_sidebar_title'][2]['link_title'][0]['link'] = 'index.php?route=account/logout';
$_['account_sidebar_title'][2]['link_title'][0]['iconclass'] = 'fa-sign-out';
$_['account_sidebar_title'][2]['link_title'][0]['logged'] = '2';
$_['account_sidebar_title'][2]['link_title'][0]['sort_order'] = 1;