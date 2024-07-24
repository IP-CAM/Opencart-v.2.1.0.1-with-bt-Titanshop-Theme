<div id="boss_zoom">
<div class="bosszoomtoolbox" >
	<?php if ($thumb || $images) { ?>
	  <ul class="thumbnails">
		<?php if ($thumb) { ?>
		<li><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom" id='zoom1' rel=""><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a></li>
		<?php } ?>
	  </ul>
	  <div class="image-additional">
	  <ul class="thumbnails" id="boss-image-additional">
		<?php if ($images) { ?>
		<?php foreach ($images as $image) { ?>
		<li class="image-additional"><a  href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>' "><img src="<?php echo $image['addition']; ?>"  title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
		<?php } ?>
		<?php } ?>
	  </ul>
	  <a id="prev_image_additional" class="prev nav_thumb" href="javascript:void(0)" style="display:block;" title="prev"><i data-original-title="Previous" title="" class="fa fa-angle-left btooltip">&nbsp;</i></a>
	  <a id="next_image_additional" class="next nav_thumb" href="javascript:void(0)" style="display:block;" title="next"><i data-original-title="Next" title="" class="fa fa-angle-right btooltip">&nbsp;</i></a>
	  </div>
	<?php } ?>
</div>
</div>
<script type="text/javascript"><!--

$(document).ready(function() {
	//if(getWidthBrowser() > 767){
		$(".bosszoomtoolbox").css('display', 'block');
		if (jQuery("#boss_zoom").html()){
			jQuery(".bt-product-zoom").html(jQuery("#boss_zoom").html());
			jQuery("#boss_zoom").remove();
			$.fn.CloudZoom.defaults = {
				adjustX: <?php echo $adjustX; ?>,
				adjustY: <?php echo $adjustY; ?>,
				tint: '<?php echo $tint; ?>',
				tintOpacity: <?php echo $tintOpacity; ?>,
				softFocus: <?php echo $softfocus; ?>,
				lensOpacity: <?php echo $lensOpacity; ?>,
				zoomWidth: '<?php if($zoom_area_width){ echo $zoom_area_width; }else{ echo 'auto';} ?>',
				zoomHeight: '<?php if($zoom_area_heigth){ echo $zoom_area_heigth; }else{ echo 'auto';} ?>',
				position: '<?php echo $position_zoom_area; ?>',
				showTitle: <?php echo $title_image; ?>,
				titleOpacity: <?php echo $title_opacity; ?>,
				smoothMove: '<?php echo $smoothMove; ?>'
			}; 
		}
	//}else{
		//$(".bosszoomtoolbox").css('display', 'none');
	//}
});
//--></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/cloud-zoom/cloud-zoom.1.0.3.js"></script>