<?php global $config; global $request; ?>
<?php
	$boss_manager = array(
		'option' => array(
			'bt_scroll_top' => true,
			'animation' 	=> true,
			'quick_view'   	=> false,
			'show_loading'   	=> true
		),
		'other' => array(
			'show_loading'   	=> true
		),
		'layout' => array(
			'mode_css'   => 'wide',
			'box_width' 	=> 1200,
			'h_mode_css'   => 'inherit',
			'h_box_width' 	=> 1200,
			'f_mode_css'   => 'inherit',
			'f_box_width' 	=> 1200
		),
		'status' => 1
	);
?>
<?php if($config->get('boss_manager')){
		$boss_manager = $config->get('boss_manager'); 
	}else{
		$boss_manager = $boss_manager;
} ?>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bossthemes/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bossthemes/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/bossthemes/jquery.jgrowl.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bossthemes/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/stylesheet.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/bossthemes/bt_stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/bossthemes/responsive.css" />
<?php if(isset($boss_manager['option']['animation'])&&($boss_manager['option']['animation'])){ ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/bossthemes/cs.animate.css" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/bossthemes/jquery.jgrowl.css" />

<style>
	.loginInBtn:hover {
		color:#3a5795 !important;
		background-color: transparent !important;
	}

</style>

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/bossthemes/common.js" type="text/javascript"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/cs.bossthemes.js"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.appear.js"></script>
<?php if (isset($analytics) && !empty($analytics)) { ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } } ?>
<?php if(isset($this->request->get['route'])){$route1 = $this->request->get['route'];}else{$route1 ="";}
	if(isset($route1) && ($route1== "common/home" || $route1=="")){ ?>
		<script type="text/javascript"><!--
			window.onload = function() {
				$(".bt-loading").fadeOut("1500", function () {
					$('#bt_loading').css("display", "none");
				});
			};
		//--></script>
	<?php }else{ ?>
		<script type="text/javascript"><!--
		$(document).ready(function() {
		$('#bt_loading').css("display", "none");
		});
		//--></script>
	<?php } ?>

<style>
	#bt_loading{position:fixed; width:100%; height:100%; z-index:999; background:none repeat scroll 0 0 #fff;}
	.bt-loading{
		height: 300px;
		left: 50%;
		margin-left: -200px;
		margin-top: -150px;
		position: absolute;
		top: 50%;
		width: 400px;
		z-index: 9999;
	}
</style>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700,600' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Marcellus' rel='stylesheet' type='text/css'>
<?php 
	$style = '';$h_style = ''; $status=0; $h_mode_css = ''; $h_mode_css = '';
	
	if(isset($boss_manager) && !empty($boss_manager)){
		$layout = $boss_manager['layout'];
		$status = $boss_manager['status']; 
	
		if($layout['mode_css']=='wide'){
			$mode_css = 'bt-wide';
		}else{
			$mode_css = 'bt-boxed';
			$style = (!empty($layout['box_width']))?'style="max-width:'.$layout['box_width'].'px"':'';
		}
		if($layout['h_mode_css']=='hboxed'){
			$h_mode_css = 'bt-hboxed';
			$h_style = (!empty($layout['h_box_width']))?'style="max-width:'.$layout['h_box_width'].'px"':'';
		}else{
			$h_mode_css = '';
		}
	
	}
?>
<?php
if($status){
	include "catalog/view/theme/".$config->get('config_template')."/template/bossthemes/boss_color_font_setting.php";
} ?>
<?php if($direction=='rtl'){ ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/bossthemes/stylertl.css" />
<?php } ?>
</head>

<?php 
	 if(isset($request->get['route'])){
	  $route = $request->get['route'];
	 }else{
	  $route ="";
	 }
	 if(isset($route) && ($route== "common/home" || $route=="")){
	  $home_page='bt-home-page';
	 }else{
	  $home_page="bt-other-page";
	 }
?>
<body class="<?php echo $class.' '.$home_page; ?> <?php if($direction=='rtl') echo 'rtl';?>">
<?php if(isset($boss_manager['other']['show_loading'])&&($boss_manager['other']['show_loading'])){ ?>
<div id="bt_loading"><div class="bt-loading"><img alt="loading" src="image/catalog/<?php echo $config->get('config_template'); ?>/loading.gif" /></div></div>
<?php } ?>
<div id="bt_container" class="<?php  echo $mode_css;?>" <?php echo $style;?>>
<div id="bt_header" class="<?php echo $h_mode_css;?>" <?php echo $h_style;?>>
<nav id="top">
  <div class="container">
    <?php echo $currency; ?>
    <div id="top-links" class="nav pull-left">
    	<a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"><span>
    		<button class="loginInBtn" style="background: #3a5795;color: #fff;font-size: 13px;padding: 5px;padding-top: 0;border: 1px solid #ccc;    padding-bottom: 0;    font-weight: bold;height: 31px;font-size: 1.2em;" >تسجيل الدخول 
      	<?php if($logged && isset($customer_image)){ echo '<img src="' . $customer_image . '" width="30" height="30">'; } else { ?><i class="fa fa-user"></i><?php } ?>
       </button></span></a>
      
    </div>
    <div id="top-links" class="nav pull-right">
    	<a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>">
    		<a href="?route=information/contact">
    			<span style="font-size: 11px">
    				اتصل بنا  <i class="fa fa-phone"></i>
    			</span>
    		</a>
    		
    	</a>
      
    </div>
	
  </div>
</nav>
<header>
  <div class="container">
	<div class="bt-content-menu"></div>
  </div>
  <div class="container">
    <div class="row">
      <div class="left col-sm-3 col-xs-12">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
	  <?php echo isset($btmainmenu)?$btmainmenu:''; ?>	
	  
    </div>
  </div>
</header>
<div class="boss-new-position">
	<div class="boss_header"></div>
	<div class="container">
		<div class="menu_custom">
			<div class="cart-search">				
				<?php echo $search; ?>
				<?php echo $cart; ?>
			</div>
			 <?php echo isset($btheader)?$btheader:''; ?>	
			<?php echo isset($btslideshow)?$btslideshow:''; ?>

		</div>
	</div>
</div> <!-- End #bt_header -->
</div> <!-- End #bt_header -->
<script>
	$(document).ready(function(){
		isMobile=false;
    if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent) 
            || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0,4))) { 
                    isMobile = true;
        }
        if(isMobile){
        	$(".nav-pills").remove();
        	$(".box-category").appendTo(".mega-menu");
        	$(".box-category").attr("style","float:right;line-height:2em");
        	$(".mega-menu").attr("style","background-color: bisque;font-size: 1.6em;height:100%");
        	//$(".close-panel").attr("style","color:red"); 
        	$(".close-panel").attr("style","right:290px;color:#e21414;");  

        }
	})
</script>
 <!-- Start of REVE Chat Script-->
 <script type='text/javascript'>
 window.$_REVECHAT_API || (function(d, w) { var r = $_REVECHAT_API = function(c) {r._.push(c);}; w.__revechat_account='8198936';w.__revechat_version=2;
   r._= []; var rc = d.createElement('script'); rc.type = 'text/javascript'; rc.async = true; rc.setAttribute('charset', 'utf-8');
   rc.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'static.revechat.com/widget/scripts/new-livechat.js?'+new Date().getTime();
   var s = d.getElementsByTagName('script')[0]; s.parentNode.insertBefore(rc, s);
 })(document, window);
</script>
<!-- End of REVE Chat Script -->