-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2014 at 04:50 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `oc_titanshop_v2`
--

--
-- Dumping data for table `oc_megamenu`
--

INSERT INTO `oc_megamenu` (`menu_id`, `status`, `sort_order`, `url`, `icon`, `label_color`, `num_column`, `icon_class`, `icon_class_status`, `module_id`) VALUES
(24, 1, 1, '#', '', '', 1, '', 0, 18),
(25, 1, 8, 'index.php?route=bossblog/bossblog', '', '', 1, '', 0, 18),
(26, 1, 3, 'index.php?route=product/category&amp;path=20', '', '', 3, '', 0, 18),
(27, 1, 5, '#', '', '', 1, '', 0, 18),
(28, 1, 6, '#', '', '', 2, '', 0, 18),
(29, 1, 4, '#', '', '', 6, '', 0, 18),
(30, 1, 7, '#', '', '', 6, '', 0, 18),
(31, 1, 2, 'index.php?route=product/category&amp;path=20', '', '', 1, '', 0, 18);

--
-- Dumping data for table `oc_megamenu_column`
--

INSERT INTO `oc_megamenu_column` (`column_id`, `row_id`, `sort_order`, `status`, `num_column`, `type`, `params`) VALUES
(31, 16, 0, 1, 1, 'category', '{"category_id":"25","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"","2":""}}'),
(32, 16, 0, 1, 1, 'category', '{"category_id":"20","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"","2":""}}'),
(33, 17, 1, 1, 3, 'html', '{"category_id":"0","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"&lt;div class=&quot;main-menu-block&quot;&gt;&lt;strong&gt;Quisque porta felis est ut malesuada lorem dignissim quis. &lt;/strong&gt;\\n&lt;p&gt;Cras bibendum nisl eget lorem aliquet lobortis. Quisque quam odio, facilisis at lacus nec, pulvinar iaculis arcu. Vestibulum sollicitudin nec felis eget porta. Morbi eu pharetra justo.&lt;/p&gt;\\n&lt;strong&gt;Quisque porta felis est ut malesuada lorem dignissim quis. &lt;/strong&gt;\\n\\n&lt;p&gt;Cras bibendum nisl eget lorem aliquet lobortis. Quisque quam odio, facilisis at lacus nec, pulvinar iaculis arcu. Vestibulum sollicitudin nec felis eget porta. Morbi eu pharetra justo.&lt;/p&gt;\\n&lt;/div&gt;","2":""}}'),
(34, 18, 1, 1, 1, 'category', '{"category_id":"24","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"","2":""}}'),
(35, 19, 1, 1, 2, 'product', '{"category_id":"0","product_img_w":"150","product_img_h":"150","product_ids":["41","40","48","36"],"manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"","2":""}}'),
(36, 20, 1, 1, 1, 'html', '{"category_id":"0","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"&lt;div class=&quot;sub-menu-block&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;TitianShop&quot;&gt;&lt;img alt=&quot;menu-logo&quot; src=&quot;http:\\/\\/demo.bossthemes.com\\/titanshop_v2\\/image\\/catalog\\/bt_titanshop\\/brand.png&quot;&gt;&lt;\\/a&gt;&lt;p&gt;Quisque interdum sem eu urna facilisis, sit amet feugiat tortor iaculis. Sed tortor veliQuisque interdum sem eu urna facilisis, sit amet feugiat tortor iaculis. Sed tortor velit, pellentesque vel egestas&lt;\\/p&gt;&lt;p&gt;Vitae, accumsan sit amet ligula. Nullam nec diam vitae tellus rhoncus sollicitudin. Morbi malesuada&lt;\\/p&gt;&lt;\\/div&gt;","2":"&lt;div class=&quot;sub-menu-block&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;TitianShop&quot;&gt;&lt;img alt=&quot;menu-logo&quot; src=&quot;http:\\/\\/demo.bossthemes.com\\/titanshop_v2\\/image\\/catalog\\/bt_titanshop\\/brand.png&quot;&gt;&lt;\\/a&gt;&lt;p&gt;Quisque interdum sem eu urna facilisis, sit amet feugiat tortor iaculis. Sed tortor veliQuisque interdum sem eu urna facilisis, sit amet feugiat tortor iaculis. Sed tortor velit, pellentesque vel egestas&lt;\\/p&gt;\\n\\n\\n&lt;p&gt;Vitae, accumsan sit amet ligula. Nullam nec diam vitae tellus rhoncus sollicitudin. Morbi malesuada&lt;\\/p&gt;\\n\\n\\n&lt;\\/div&gt;"}}'),
(37, 20, 2, 1, 2, 'product', '{"category_id":"0","product_img_w":"150","product_img_h":"150","product_ids":["34","36"],"manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"","2":""}}'),
(38, 20, 3, 1, 1, 'category', '{"category_id":"75","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"","2":""}}'),
(39, 20, 4, 1, 1, 'category', '{"category_id":"20","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"","2":""}}'),
(40, 20, 5, 1, 1, 'category', '{"category_id":"18","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"","2":""}}'),
(41, 21, 1, 1, 6, 'manufacturer', '{"category_id":"0","product_img_w":"","product_img_h":"","manufacturer_img_w":"150","manufacturer_img_h":"81","manufacturer_name":"0","manufacturer_id":["8","9","7","5","6","10"],"content_text":{"1":"","2":""}}');

--
-- Dumping data for table `oc_megamenu_description`
--

INSERT INTO `oc_megamenu_description` (`menu_id`, `language_id`, `title`, `label`) VALUES
(24, 1, 'Home', ''),
(24, 2, 'Home', ''),
(25, 1, 'Blog', ''),
(25, 2, 'Blog', ''),
(26, 1, 'Clothes', ''),
(26, 2, 'Clothes', ''),
(27, 1, 'Watch', ''),
(27, 2, 'Watch', ''),
(28, 1, 'Shoes', ''),
(28, 2, 'Shoes', ''),
(29, 1, 'Digital', ''),
(29, 2, 'Digital', ''),
(30, 1, 'Cellphone', ''),
(30, 2, 'Cellphone', ''),
(31, 1, 'Leather', ''),
(31, 2, 'Leather', '');

--
-- Dumping data for table `oc_megamenu_row`
--

INSERT INTO `oc_megamenu_row` (`row_id`, `menu_id`, `sort_order`, `status`, `height`, `bg_color`, `bg_image`) VALUES
(16, 31, 1, 1, '0', '', ''),
(17, 26, 0, 1, '0', '', ''),
(18, 27, 0, 1, '0', '', ''),
(19, 28, 0, 1, '0', '', ''),
(20, 29, 0, 1, '0', '', ''),
(21, 30, 0, 1, '0', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
