<div class="bt-box box-discount not-animated" data-animate="fadeInLeft" data-delay="100">
	<div class="box-heading"><?php echo $heading_title; ?></div>
	<div class="box-content">
		<?php $i = 0;?>
		<div class="list-product">
		<?php foreach ($products as $product) { ?>
			<div class="item">
				<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
				<div class="right">
					<div class="caption">
						<div class="name"><a title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
						<?php// if ($product['rating']) { ?>
							<div class="rating">
							  <?php for ($rat = 1; $rat <= 5; $rat++) { ?>
							  <?php if ($product['rating'] < $rat) { ?>
							  <span class="fa fa-stack fa-hidden"><i class="fa fa-star fa-stack-2x"></i></span>
							  <?php } else { ?>
							  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
							  <?php } ?>
							  <?php } ?>
							</div>
						<?php //} ?>
						<span class="status"><?php echo $product['discount_status']; ?></span>
						<div class="description"><?php //echo $product['description']; ?></div>
						
						<div class="qty">
							<p><?php echo $text_quantity_apply; ?> <span class="qty"> <?php echo $product['discount_qty']; ?></span></p>
						</div>
						<div class="cart">
							<div class="datetime<?php echo $module.$i; ?> remain-time"></div>
							<span class="button">
							<input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn" /></span>
						</div>
						<div class="price">
							<span class="price-old"><?php echo $product['price']; ?></span> <span class="percent-save">(<?php echo $product['percent_save'].'%'; ?>)</span>
							<span class="price-new"><?php echo $product['discount']; ?></span> <span class="money-save">(<?php echo $text_your_save; ?> <?php echo $product['money_save']; ?>)</span>
						</div>
						
					</div>
				</div>
			</div>
		<?php $i++;} ?>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
var myVar=setInterval(function(){Deal<?php echo $module; ?>()},1000);
function Deal<?php echo $module; ?>(){
	var i = 0;
	<?php foreach ($products as $product) { ?>
	
		var today = new Date();
		
		var dateStr = "<?php echo $product['date_end']; ?>";
		
		var date = dateStr.split("-");
		
		var date_end = new Date(date[0],(date[1]-1),date[2]);
		
		var deal = new Date();
		
		deal.setTime(date_end - today);
		
		//alert(deal);
		
		if(date_end >= today){
		
		var month = new Date(deal.getMonth(), deal.getMonth(), 0).getDate();
		
		var h = deal.getHours();
		var d = deal.getDate() + (month*deal.getMonth());
		var m = deal.getMinutes();
		var s = deal.getSeconds();
		m = checkTime(m);
		
		$(".datetime<?php echo $module; ?>"+i).html('<div><span class="number date">'+d+'</span><span><?php echo $text_days; ?></span></div><div class="sep"></div><div><span class="number">'+h+'</span><span><?php echo $text_hours; ?></span></div><div class="sep"></div><div><span class="number">'+m+'</span><span><?php echo $text_minutes; ?></span></div><div class="sep"></div><div><span class="number">'+s+'</span><span><?php echo $text_seconds; ?></span></div>');
		}
		i++;
	<?php } ?>
}
function checkTime(j){
	if (j<10){
	  j="0" + j;
	}
	return j;
}
//--></script>