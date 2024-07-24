<?php if($logged){ ?>
<style>
.fileUpload {
	position: absolute;
	overflow: hidden;
	margin: 0 auto;
	background: none;
	border:none;
	width:100px;
	padding-top:5px;
	padding-bottom: 5px;
	margin-bottom: 5px;
	border-radius: 4px;
}
.fileUpload input.upload {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity=0);
}
.avimage {
	margin: 10px 0;
}
.imagediv {
	position: relative;
}
.updatepic {
	background-color: black;
	color: white;
	opacity: 0.5;
	width: 120px;
	position: absolute;
	bottom: 0px;
	left: 71px;
	margin: 10px 0;
	font-size: medium;
	cursor: pointer;
	display: none;
}
</style>
<h4 class="text-center"><?php echo $heading_title; ?></h4>
<div class="text-center">
   <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
	<?php if ($extension) { ?>
	<div class="warning"><?php echo $extension; ?></div>
	<?php } ?>
	<div class="fileUpload">
		<input type="file" name="account_picture" class="upload" />
	</div>
	<div class="imagediv">
		<?php if(isset($customer_ext)){ ?>
		<img src="<?php	echo $image; ?>?<?=rand(1,32000)?>" width="<?php echo $width; ?>" height="<?php echo $height; ?>" class="avimage" />
		<?php	
		}else{ ?>
		<img src="image/no_image.png" width="100" height="100" class="avimage" />
		<?php } ?>
		<div class="updatepic"><?php echo $text_change; ?></div>
	</div>
	<input type="submit" name="change" value="Update photo" class="submitpic hide" />
</form>
</div>	

<script type="text/javascript">
	$('.updatepic, .avimage').on('click', function () {
		$('.upload').trigger('click');
	});
	$('.imagediv').on('mouseenter', function () {
		$('.updatepic').fadeIn();
	});
	$('.imagediv').on('mouseleave', function () {
		$('.updatepic').fadeOut();
	});
	$('.upload').on('change', function () {
		$('.submitpic').trigger('click');
	})
</script>
<?php } ?>
