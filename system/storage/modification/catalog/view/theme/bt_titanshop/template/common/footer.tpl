<?php global $config;?>
<?php
	$boss_manager = array(
		'option' => array(
			'bt_scroll_top' => true,
			'animation' 	=> true,
			'quick_view'   	=> false
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
<?php $footer_about = $config->get('boss_manager_footer_about'); ?>
<?php $footer_social = $config->get('boss_manager_footer_social'); ?>
<?php $footer_payment = $config->get('boss_manager_footer_payment'); ?>
<?php $footer_powered = $config->get('boss_manager_footer_powered'); ?>
<?php $footer_contact = $config->get('boss_manager_footer_contact'); ?>
<?php if($config->get('boss_manager')){
		$boss_manager = $config->get('boss_manager'); 
	}else{
		$boss_manager = $boss_manager;
	} ?>
<?php 
	if(!empty($boss_manager)){
		$layout = $boss_manager['layout']; 
	}
	$f_style = '';
	if($layout['f_mode_css']=='fboxed'){
		$f_mode_css = 'bt-fboxed';
		$f_style = (!empty($layout['f_box_width']))?'style="max-width:'.$layout['f_box_width'].'px"':'';
	}else{
		$f_mode_css = '';
	}
?>
<div id="bt_footer_container" class="<?php echo $f_mode_css;?>" <?php echo $f_style;?>>
<?php echo isset($btfooter)?$btfooter:''; ?>
<footer id="bt_footer">
  <div class="container">
    <div class="footer_column">
    <div class="row">
	<?php if($footer_about['status']){ ?> 
	<div class="footer-about column col-sm-cs5 col-xs-12 not-animated" data-animate="fadeInUp" data-delay="100">
		<h3><?php echo html_entity_decode($footer_about['about_title'][$config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?></h3>
		<?php if($footer_about['image_status']){ ?><a href="#" title="parallax"><img alt="parallax" src="image/<?php echo $footer_about['image_link']; ?>"></a> <?php } ?>
		<?php echo html_entity_decode($footer_about['about_content'][$config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?>
	</div>
	<?php } ?>
  <div class="column col-sm-cs5 col-xs-12 not-animated" data-animate="fadeInUp" data-delay="200">
    <h3>اتصل بنا</h3>
    <ul>
	  <li>  <i class="fa fa-map-marker"> </i> Shaqba, www.shaqba.ps </li>
	  <li>  <i class="fa fa-envelope"> </i> sales@shaqba.ps </li>
    </ul>
  </div>
  
  <div class="column col-sm-cs5 col-xs-12 not-animated" data-animate="fadeInUp" data-delay="300">
    <h3><?php echo $text_service; ?></h3>
    <ul>
      <li><a href="<?php echo $contact; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $return; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_sitemap; ?></a></li>
	  <li><a href="<?php echo $newsletter; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>
  
  <div class="column col-sm-cs5 col-xs-12 not-animated" data-animate="fadeInUp" data-delay="400">
    <h3><?php echo $text_extra; ?></h3>
    <ul>
      <li><a href="<?php echo $manufacturer; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_voucher; ?></a></li>
      <li><a href="<?php echo $affiliate; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $special; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_special; ?></a></li>
    </ul>
  </div>
  
  <div class="column col-sm-cs5 col-xs-12 not-animated" data-animate="fadeInUp" data-delay="500">
    <h3><?php echo $text_account; ?></h3>
    <ul>
      <li><a href="<?php echo $account; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $order; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_wishlist; ?></a></li>
      
    </ul>
	<?php if($footer_social['status']){ ?>
		<div class="footer-social">
		<h3><?php echo html_entity_decode($footer_social['title'][$config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?></h3>
		<ul>
			<li><a href="<?php echo isset($footer_social['face_url'])?$footer_social['face_url']:'#'; ?>" title="Facebook"><i class="fa fa-facebook"></i></a></li>
			<li><a href="<?php echo isset($footer_social['pinterest_url'])?$footer_social['pinterest_url']:'#'; ?>" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
			<li><a href="<?php echo isset($footer_social['twitter_url'])?$footer_social['twitter_url']:'#'; ?>" title="Twitter"><i class="fa fa-twitter"></i></a></li>
			<li><a href="<?php echo isset($footer_social['googleplus_url'])?$footer_social['googleplus_url']:'#'; ?>" title="Googleplus"><i class="fa fa-google-plus"></i></a></li>
			<li><a href="<?php echo isset($footer_social['rss_url'])?$footer_social['rss_url']:'#'; ?>" title="RSS"><i class="fa fa-rss"></i></a></li>
			<li><a href="<?php echo isset($footer_social['youtube_url'])?$footer_social['youtube_url']:'#'; ?>" title="Youtube"><i class="fa fa-youtube-play"></i></a></li>
		</ul>
		</div>
		<?php } ?>
  </div>
  
	<div class="block-footer-top column col-sm-12 col-xs-12 not-animated" data-animate="fadeInUp" data-delay="300">
		<?php if($footer_contact['status']){ ?> 
		<div class="footer-contact">
			<h3><?php echo html_entity_decode($footer_contact['contact_title'][$config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?></h3>
			<?php echo html_entity_decode($footer_contact['contact_content'][$config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?>
		</div>
		<?php } ?>
	</div>
	</div>
	</div>
  </div>
  <div class="powered-payment">
    <div class="container">
	<div class="row">
		<div class="col-md-12 text-center" style="color: #999;font-size:1.2em">
			&nbsp;جميع الحقوق محفوظة لدى شركة شقبا 2019 ©
		</div>s
		</div>
      </div>
  </div>
</footer>
</div>
<?php if(isset($boss_manager['option']['bt_scroll_top'])&&($boss_manager['option']['bt_scroll_top'])){ ?>
<div id="back_top" class="back_top" title="Back To Top"><span><i class="fa fa-angle-up"></i></span></div>
 <script type="text/javascript">
        $(function(){
			$(window).scroll(function(){
				if($(this).scrollTop()>600){
				  $('#back_top').fadeIn();
				}
				else{
				  $('#back_top').fadeOut();
				}
			});
			$("#back_top").click(function (e) {
				e.preventDefault();
				$('body,html').animate({scrollTop:0},800,'swing');
			});
        });
</script> 
<?php } ?>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//--> 

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->
</div> <!-- End #bt_container -->

            <?php echo $_ocm_script; ?>
        
</body></html>