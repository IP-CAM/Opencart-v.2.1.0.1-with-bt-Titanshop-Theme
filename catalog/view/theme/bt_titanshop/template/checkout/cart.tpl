<?php echo $header; ?>
<div class="bt-breadcrumb">
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
</div>  
</div>  
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1>ملخص سلة الشراء 
      </h1>
	  <?php if ($attention) { ?>
	  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	  </div>
	  <?php } ?>
	  <?php if ($success) { ?>
	  <div class="alert alert-success"><i class="fa fa-check"></i> <?php echo $success; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	  </div>
	  <?php } ?>
	  <?php if ($error_warning) { ?>
	  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	  </div>
	  <?php } ?>
	  <div class="content_bg" style="padding-bottom:20px;margin-bottom:40px">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive cart-info">
          <table class="table">
            <thead>
              <tr>
                <td class="image" colspan="2"><?php echo $column_name; ?></td>
                <td class="model"><?php echo $column_model; ?></td>
                <td class="product_price"><?php echo $column_price; ?></td>
                <td class="quantity"><?php echo $column_quantity; ?></td>
                <td class="total"><?php echo $column_total; ?></td>
                <td class="remove"><?php echo $button_remove; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="image"><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="" /></a>
                  <?php } ?></td>
                <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  <?php if (!$product['stock']) { ?>
                  <span class="text-danger">***</span>
                  <?php } ?>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['reward']) { ?>
                  <br />
                  <small><?php echo $product['reward']; ?></small>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <br />
                  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                  <?php } ?></td>
                <td class="model"><?php echo $product['model']; ?></td>
                <td class="quantity"><span class="price"><?php echo $product['price']; ?></span></td>
                <td class="product_price">
                    <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="button_update"></button>
                </td>
                <td class="total"><span class="price"><?php echo $product['total']; ?></span></td>
				<td class="remove">
					<button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="button_remove" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"></button>
				</td>
              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $vouchers) { ?>
              <tr>
                <td></td>
                <td class="name"><?php echo $vouchers['description']; ?></td>
                <td class="model"></td>
                <td class="quantity"><span class="price"><?php echo $vouchers['amount']; ?></span></td>
                <td class="product_price">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                </td>
                <td class="total"><span class="price"><?php echo $vouchers['amount']; ?></span></td>
				<td class="remove">
					<button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="button_remove" onclick="voucher.remove('<?php echo $vouchers['cart_id']; ?>');"></button>
				</td>	
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>
	  </div>
	  <div class="content_bg">
      <?php if ($coupon || $voucher || $reward || $shipping) { ?>
      <!-- <h2 class="text_next_cart"><?php echo $text_next; ?></h2>
         <p><?php echo $text_next_choice; ?></p>
       <div class="panel-group cart-module" id="accordion"><?php echo $coupon; ?><?php echo $voucher; ?><?php echo $reward; ?><?php echo $shipping; ?></div>
      <?php } ?>
      <div class="cart-total">
          <table>
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td class="left <?php echo ($total==end($totals)? ' last': ''); ?>"><b><?php echo $total['title']; ?>:</b></td>
              <td class="right <?php echo ($total==end($totals)? ' last': ''); ?>"><?php echo $total['text']; $somme=$total['text']?></td>
            </tr>
            <?php } ?>
          </table>
      </div>
      <div class="buttons cart-buttons">
        <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn btn-shopping"><?php echo $button_shopping; ?></a></div>
        <div class="pull-right"><a href="<?php echo $checkout; ?>" class="btn btn-checkout"><?php echo $button_checkout; ?></a></div>
      </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div> -->
</div>
 <!--<?php echo $footer; ?>--> 

<script>
  $(document).ready(function(){
    console.log("****************************"+$(".minicart_total > tbody > tr > td").eq(1).text())
        
  })
 $(document).ready(function(){
    isMobile=false;
    if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent) 
            || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0,4))) { 
                    isMobile = true;
        }
        if(isMobile){
      $(".table-responsive").attr("style","border-collapse: collapse;  border-spacing: 0;width: 100%;border: 1px solid #ddd;scroll-behavior: smooth; overflow-y: scroll;");
        }
  })
</script>