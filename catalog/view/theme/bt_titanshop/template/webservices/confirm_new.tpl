<?php if (!isset($redirect)) { ?>

<style>
    body{
	background:#E8E8E8;
    }
    #button-confirm{
	width:96%;
	position:absolute;
	left:2%;
	padding:10px;
	margin-bottom:20px;
	background:#F6846A;
	border:none;
    }
    div.pull-right{
	width:96%;
	position:absolute;
	left:2%;
	margin-bottom:20px;
	background:#F6846A;
	border:none;
    }
    input.btn.btn-primary{
	width:96%;
	position:absolute;
	left:2%;
	padding:10px;
	margin-bottom:20px;
	background:#F6846A;
	border:none;
    }
    .confirm-total-block{
	float:left;
	width:92%;
	background:white;
	padding:10px;
	margin:4%;
	border-radius:3px;
	box-shadow:0px 1px 2px 1px rgba(0, 0, 0, 0.1);
	margin-bottom:0px !important;
    }
    .confirm-outer-div{
	float:left;
	width:92%;
	background:white;
	padding:10px;
	margin:4%;
	border-radius:3px;
	box-shadow:0px 1px 2px 1px rgba(0, 0, 0, 0.1);
	margin-bottom:0px !important;
    }
    .confirm-product-image-div{
	float:left;
	padding-right:10px;
    }
    .confirm-product-name{
	float:left;
	text-align: center;
//	margin-bottom: 5px;
    }
    .confirm-product-price{
	float:right;
	color:#598525;
        font-size: 16px;
        vertical-align: bottom;
    }
    .confirm-outer-div td{
	padding-right:25px;
	padding-bottom:10px;
	font-size:12px;
	color:#737171;
    }
    .confirm-total-block .td-title{
    text-align:right;
    padding-right:50px;
    padding-bottom:10px;
    font-size:16px;
    color:#737171;
    }
    .confirm-total-block .td-text{
    text-align:right;
    font-size:16px;
    padding-bottom:10px;    
    color:#222;
    }
    .confirm-total-block .td-price{
	color:#598525;
    }
    .confirm-total-block table{
    float:right;
    }
    .payment-info h2{
    text-align: center !important;
    }
    
</style>

    <?php foreach ($products as $product) { ?>
     <div class="confirm-outer-div">
<!--	<div class="confirm-product-image-div">
	    <img src="<?php echo HTTPS_SERVER.'/image/'.$product['image']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"  />
	</div>-->
	<div class="confirm-product-name">
	    <?php echo '<b>'.substr($product['name'],0,23).'...</br>'; ?>
	</div>
         <br/>
	<div class="confirm-product-options-qty" style="float: left; margin-top: 5px;">
	    <table style="font-size: 20px !important;"><tbody>
	<?php foreach ($product['option'] as $option) { ?>
          <tr><td><?php echo substr($option['name'],0,10); ?>:</td> <td><?php echo $option['value']; ?></td></tr>
          <?php } ?>
          <?php if($product['recurring']) { ?>
          <br />
          <span class="label label-info"><?php echo $text_recurring_item; ?></span><?php echo $product['recurring']; ?>
          <?php } ?>
	  <tr><td><?php echo "Qty: ";?> </td><td><?php echo $product['quantity']; ?></td></tr> 
	  </tbody></table>
	</div>
	<div class="confirm-product-price">
	    <?php  echo $product['total']; ?>
	</div>
    </div>
    <?php } ?>
    
    
    <?php foreach ($vouchers as $voucher) { ?>
    <div class="confirm-outer-div">
	<div class="confirm-product-image-div">
	No Image
	</div>
	
	<div class="confirm-product-name">
	    <?php echo '<b>'.$voucher['description'].'<b>'; ?>
	</div>
	<div class="confirm-product-options-qty">
	    <table><tbody>
	  <tr><td><?php echo "Qty: ";?> </td><td><?php echo "1"; ?></td></tr> 
	  </tbody></table>
	</div>
	<div class="confirm-product-price">
	    <?php  echo $voucher['amount']; ?>
	</div>
    </div>
    <?php } ?>
    
    
     <div class="confirm-total-block">
	    <table><tbody>
	<?php 
	$length=0;
	$i=1;
	$length=sizeof($totals);
	foreach ($totals as $total) { ?>
	<tr><td class='td-title'><small> <?php echo $total['title']; ?>:</td> <td <?php if($i==$length) echo 'class="td-price td-text"'; else echo 'class="td-text"'; ?> ><b><?php echo $total['text']; ?><b></small></td></tr>
          <?php 
	  $i=$i+1;
	  } ?>
	  </tbody></table>
	</div>

    <!-- Don't remove below div, its absense mess up whole webview in our mobile app -->
<div class="table-responsive">
  <table class="table table-bordered table-hover">
    
  </table>
</div>


    <!-- Don't remove below div, its absense mess up whole webview in our mobile app -->
<div class="table-responsive">
  <table class="table table-bordered table-hover">
    
  </table>
</div>
    <!--Don't remove above div -->
    
    
    <div class="payment-info" style="padding:4%">
<?php echo $payment; ?>
<br><br>
    </div>
<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } ?>
