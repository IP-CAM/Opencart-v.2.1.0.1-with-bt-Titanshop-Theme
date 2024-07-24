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
-- Dumping data for table `oc_btslider`
--

INSERT INTO `oc_btslider` (`id`, `setting`) VALUES
(1, '{"slider_type":"custom","slider_width":"900","slider_height":"415","delay":"5000","startWithSlide":"0","stopslider":"on","stopafterloops":"-1","stopatslide":"-1","touchenabled":"on","onhoverstop":"on","timeline":"on","timerlineposition":"top","shadow":"0","navigationtype":"bullet","navigationarrow":"solo","navigationstyle":"preview2","navigationhalign":"center","navigationvalign":"bottom","navigationhoffset":"0","navigationvoffset":"15","soloarrowlefthalign":"left","soloarrowleftvalign":"center","soloarrowlefthoffset":"10","soloarrowleftvoffset":"0","soloarrowrighthalign":"right","soloarrowrightvalign":"center","soloarrowrighthoffset":"10","soloarrowrightvoffset":"0","timehidethumbnail":"200","thumbnailwidth":"100","thumbnailheight":"50","thumbamount":"5","hidecapptionatlimit":"2","hideallcapptionatlimit":"2","hideslideratlimit":"2"}');

--
-- Dumping data for table `oc_btslider_slide`
--

INSERT INTO `oc_btslider_slide` (`id`, `slider_id`, `status`, `sort_order`, `slideset`, `caption`) VALUES
(1, 17, 1, 1, '{"url":"#","enablelink":"1","enablefullvideo":"1","type_background":"image_bg","background":"data/bt_bossnew/citybg.jpg","transitions":"slideup","slotamount":"7","masterspeed":"500","delay":"100","target":"_self"}', '[{"text_caption":{"1":"&lt;a href=&quot;#&quot; class=&quot;largeredbtn&quot;&gt;CONTINUE THE TOUR&lt;/a&gt;","2":"&lt;a href=&quot;#&quot; class=&quot;largeredbtn&quot;&gt;CONTINUE THE TOUR&lt;/a&gt;"},"datax":"100","type_caption":"text","datay":"100","class_css":"big_white","dataspeed":"100","datastart":"100","dataend":"100","dataafterspeed":"100","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"}]'),
(13, 1, 1, 1, '{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/bt_titanshop/banner/slide1.jpg","transitions":"slotzoom-horizontal","slotamount":"11","masterspeed":"500","delay":"5000","target":"_blank","kenburns":"off","enablefullvideo":"1"}', '[{"text_caption":{"1":"penatibus\\u2019z","2":"penatibus\\u2019z"},"datax":"223","type_caption":"text","datay":"160","class_css":"very_large_white_text","dataspeed":"300","datastart":"500","dataend":"5000","dataafterspeed":"300","incom_animation":"sft","outgo_animation":"stb","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"Duis egestas mauris at ipsum auctor elit","2":"Duis egestas mauris at ipsum auctor elit"},"datax":"170","type_caption":"text","datay":"250","class_css":"medium_white","dataspeed":"500","datastart":"1000","dataend":"5000","dataafterspeed":"300","incom_animation":"lfl","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeInCirc"},{"text_caption":{"1":"view lookbook","2":"view lookbook"},"datax":"357","type_caption":"text","datay":"285","class_css":"medium_text","dataspeed":"500","datastart":"1500","dataend":"5000","dataafterspeed":"300","incom_animation":"skewfromleft","outgo_animation":"skewtoright","easing":"easeOutBack","endeasing":"easeOutBack"}]'),
(16, 1, 1, 2, '{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/bt_titanshop/banner/slide2.jpg","transitions":"boxfade","slotamount":"10","masterspeed":"500","delay":"5000","target":"_blank","kenburns":"off","enablefullvideo":"0"}', '[{"text_caption":{"1":"O\\u2019rdipiscing","2":"O\\u2019rdipiscing"},"datax":"215","type_caption":"text","datay":"160","class_css":"very_large_white_text","dataspeed":"500","datastart":"500","dataend":"5000","dataafterspeed":"300","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"Maecenas euismod risus elemen sodales","2":"Maecenas euismod risus elemen sodales"},"datax":"162","type_caption":"text","datay":"250","class_css":"medium_white","dataspeed":"500","datastart":"1000","dataend":"5000","dataafterspeed":"300","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"shop kids 2014","2":"shop kids 2014"},"datax":"357","type_caption":"text","datay":"285","class_css":"medium_text","dataspeed":"500","datastart":"1500","dataend":"5000","dataafterspeed":"500","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"}]'),
(17, 1, 1, 3, '{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/bt_titanshop/banner/slide3.jpg","transitions":"slotzoom-vertical","slotamount":"7","masterspeed":"500","delay":"5000","target":"_blank","kenburns":"off","enablefullvideo":"0"}', '[{"text_caption":{"1":"Vestibulum","2":"Vestibulum"},"datax":"220","type_caption":"text","datay":"160","class_css":"very_large_white_text","dataspeed":"500","datastart":"500","dataend":"5000","dataafterspeed":"300","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"Integer laoreet vel felis ac fermentum sed","2":"Integer laoreet vel felis ac fermentum sed"},"datax":"160","type_caption":"text","datay":"250","class_css":"medium_white","dataspeed":"500","datastart":"1000","dataend":"5000","dataafterspeed":"300","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"view lookbook","2":"view lookbook"},"datax":"357","type_caption":"text","datay":"285","class_css":"medium_text","dataspeed":"500","datastart":"1500","dataend":"5000","dataafterspeed":"300","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"}]');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
