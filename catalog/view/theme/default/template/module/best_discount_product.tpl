<div id="countsp">
	<div id="expirycount" class="hasCountdown">
		<div id="specialproductcount"></div>
	</div>
	<div class="status">
		<span><?php echo $text_discount_status; ?> <?php echo $discount_status; ?></span>
	</div>
</div>
<script type="text/javascript"><!--
var myVar=setInterval(function(){Deal()},1000);
function Deal(){
		var today = new Date().getTime();
		
		var dateStr = "<?php echo $date_end; ?>";
		
		var date = dateStr.split("-");
		
		var date_end = new Date(date[0],(date[1]-1),date[2]);
		
		var deal = new Date();
		
		deal.setTime(date_end - today);
		
		if(date_end >= today){
		
		var month = new Date(deal.getMonth(), deal.getMonth(), 0).getDate();
		
		var h = deal.getHours();
		var d = deal.getDate() + (month*deal.getMonth());
		var m = deal.getMinutes();
		var s = deal.getSeconds();
		m = checkTime(m);
		
		$("#specialproductcount").html('<span class="countofferprd"><?php echo $text_expires; ?>  </span><span class="countdate"> <span id="tday">'+d+' <span class="ttext"> <?php echo $text_days; ?> </span> </span> <span id="thour">'+h+'<span class="ttext"> <?php echo $text_hours; ?> </span></span> <span id="tmin">'+m+' <span class="ttext"><?php echo $text_minutes; ?></span> </span> <span id="tsec">'+s+' <span class="ttext"><?php echo $text_seconds; ?></span> </span>');
		}
}
function checkTime(j){
	if (j<10){
	  j="0" + j;
	}
	return j;
}
//--></script>