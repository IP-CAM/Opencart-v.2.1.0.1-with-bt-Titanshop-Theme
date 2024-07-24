<?php if(!empty($product_datas)){ ?>
<div class="bt-featured-pro bt-nprolarge-tabs not-animated" data-animate="fadeInUp" data-delay="300">
<?php $numtab = 0; $numtabtt = 0; $numcolumn = 3; ?>
<?php if($type_display == 'use_tab'){ ?>	
	<div id="tabcontent<?php echo $module; ?>" class="box-heading title htabs">
		<?php foreach ($product_datas as $product_data){ ?>
			<a data-crs="<?php echo $module.$numtabtt; ?>" href="#bt_procate_<?php echo $module.$numtabtt; ?>"><?php echo $product_data['title']; ?></a>
		<?php $numtabtt++;} ?>
	</div>
<?php } ?>
<?php foreach ($product_datas as $product_data){ ?>
<?php if($show_slider){ $row = $num_row; $sliderclass = 'slider'; }else {$row = 1; $sliderclass = 'nslider';} ?>
<?php (!empty($product_data['mainproduct']))? $prolarge = 'prolarge': $prolarge = 'nprolarge'; ?>
<?php (!empty($column))?$class_css = '.bt-column':$class_css = 'bt-'.$prolarge.'-'.$sliderclass; ?>

<div id="bt_procate_<?php echo $module.$numtab; ?>" class="box htabs-content boss-category-pro <?php echo $class_css; ?> <?php echo ($type_display == 'use_column')?'bt-dis-column bt-dis-column-'.$numcolumn:''; ?>">
	
	<?php if($type_display == 'use_accordion'){ ?>	
		<div class="box-heading title"><a href="javascript:void(0)" class="bt-accordion-<?php echo $module.$numtab; ?> bt-accordion"><?php echo $product_data['title']; ?></a></div>
	<?php } ?>
	<?php if(($type_display == 'use_block') || ($type_display == 'use_column')){ ?>	
		<div class="box-heading title"><?php echo $product_data['title']; ?></div>
	<?php } ?>
	
	<div class="box-content bt-product-content">
	<?php if(!empty($product_data['mainproduct'])){ ?>
	<?php $mainproduct = $product_data['mainproduct'];?>
		<div class="bt-product-large">
		<section class="product-thumb bt-item transition">		
			<?php if ($mainproduct['thumb']) { ?>
			<div class="image">
				<a href="<?php echo $mainproduct['href']; ?>">
					<img src="<?php echo $mainproduct['thumb']; ?>" alt="<?php echo $mainproduct['name']; ?>" />
				</a>
			</div>
			<?php } ?>
			<div class="small_detail">
				<div class="caption">
					<div class="name"><a href="<?php echo $mainproduct['href']; ?>"><?php echo $mainproduct['name']; ?></a></div>			
					<?php if ($mainproduct['rating']) { ?>
					<div class="rating">
					  <?php for ($i = 1; $i <= 5; $i++) { ?>
					  <?php if ($mainproduct['rating'] < $i) { ?>
					  <span class="fa fa-stack fa-hidden"><i class="fa fa-star fa-stack-2x"></i></span>
					  <?php } else { ?>
					  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
					  <?php } ?>
					  <?php } ?>
					</div>
					<?php } ?>			
					<?php if ($mainproduct['price']) { ?>
						<p class="price">
						<?php if (!$mainproduct['special']) { ?>
							<?php echo $mainproduct['price']; ?>
						<?php } else { ?>
							<span class="price-old"><?php echo $mainproduct['price']; ?></span> <span class="price-new"><?php echo $mainproduct['special']; ?></span>
						<?php } ?>
						</p>
					<?php } ?>
				</div>	
				<div class="button-group">
					<button type="button" onclick="btadd.cart('<?php echo $mainproduct['product_id']; ?>');" class="btn-cart" /><?php echo $button_cart; ?></button>
					<a class="btn-wishlist" onclick="btadd.wishlist('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a>
					<a class="btn-compare" onclick="btadd.compare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a>
				</div>	
			</div>	
		</section>
		</div>
	<?php } ?>
	
	<?php if(!empty($product_data['products'])){ ?>
	
	<?php $products = $product_data['products'];?>
	<div class="bt-items bt-product-grid">
		<div id="boss_procate_<?php echo $module.$numtab; ?>">
			<?php $i = 0; ?>
			<?php foreach($products as $product){ ?>			
			<?php if(($i%$row)==0){ ?> <div class="bt-item-extra"> <?php } ?>
			<?php $i++; ?>
		<section class="product-thumb bt-item transition">
			<?php if ($product['thumb']) { ?>
			<div class="image">
				<a href="<?php echo $product['href']; ?>">
					<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
				</a>
			</div>
			<?php } ?>
			<div class="small_detail">
				<div class="caption">
					<div class="name">
						<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
					</div>
					<?php if ($product['rating']) { ?>
						<div class="rating">
						  <?php for ($i = 1; $i <= 5; $i++) { ?>
						  <?php if ($product['rating'] < $i) { ?>
						  <span class="fa fa-stack fa-hidden"><i class="fa fa-star fa-stack-2x"></i></span>
						  <?php } else { ?>
						  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
						  <?php } ?>
						  <?php } ?>
						</div>
					<?php } ?>
					<?php if ($product['price']) { ?>
					<p class="price">
						<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
						<?php } else { ?>
							<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
						<?php } ?>
					</p>
					<?php } ?>
				</div>	
				<div class="button-group">
					<button type="button" onclick="btadd.cart('<?php echo $product['product_id']; ?>');" class="btn-cart" /><?php echo $button_cart; ?></button>					
					<a class="btn-wishlist" onclick="btadd.wishlist('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a>
					<a class="btn-compare" onclick="btadd.compare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a>
				</div>
			</div>	
		</section>
			<?php if((($i%$row)==0)||($i==count($products))){ ?> </div> <?php } ?>
			<?php } ?>
		</div>
		<div class="clearfix"></div>
		<?php if($show_slider){ ?>
			<a id="bt_next_pro_<?php echo $module.$numtab; ?>" class="prev nav_thumb" href="javascript:void(0)" title="prev">Prev</a>
			<a id="bt_prev_pro_<?php echo $module.$numtab; ?>" class="next nav_thumb" href="javascript:void(0)" title="next">Next</a>
			<?php if($nav_type){ ?>
			<div id="bt_pag_pro_<?php echo $module.$numtab; ?>" class="bt-pag"></div>
			<?php } ?>
		<?php } ?>
	</div>
	
	<?php } ?>
</div>
	
<?php if($show_slider){ ?>
<script type="text/javascript"><!--
$(window).load(function(){
	loadslider('<?php echo $module.$numtab; ?>');
});
//--></script>
<?php } ?>

<?php if($type_display == 'use_accordion'){ ?>	
<script type="text/javascript"><!--
$(".bt-accordion-<?php echo $module.$numtab; ?>").click(function(){
  $(this).parent().next('.boss-category-pro .bt-product-content').toggleClass('closeAccordion');
});
//--></script>
<?php } ?>

</div>
<?php $numtab++; ?>
<?php } ?>

<script type="text/javascript"><!--

<?php if($type_display == 'use_tab'){ ?>	
$('#tabcontent<?php echo $module; ?> a').bttabs();
<?php } ?>

function loadslider($tabmodule) {
	if ($(window).width() > 768) {
		var image_width = <?php echo $image_width; ?>;
	}else{
		var image_width = 300;
	}
    $('#boss_procate_'+$tabmodule).carouFredSel({
        auto: false,
        responsive: true,
        width: '100%',
		height: 'variable',
        prev: '#bt_next_pro_'+$tabmodule,
        next: '#bt_prev_pro_'+$tabmodule,
		pagination: '#bt_pag_pro_'+$tabmodule,
        swipe: {
        onTouch : true
        },
        items: {
            width: image_width,
			height: 'variable',
            visible: {
				min: 1,
				max: <?php echo $per_row; ?>
            }
        },
        scroll: {
            direction : 'left',    //  The direction of the transition.
            duration  : 1000   //  The duration of the transition.
        }
    });
};
//--></script>
</div>
<?php } ?>
