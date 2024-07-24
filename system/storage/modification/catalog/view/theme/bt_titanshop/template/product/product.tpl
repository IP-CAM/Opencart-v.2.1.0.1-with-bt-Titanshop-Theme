<?php echo $header; ?>
<div class="container">
    </div>
<div class="bt-breadcrumb">
<div class="container">



  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
</div>  
</div> 
<div > 
  </div>




<div class="container"> 

  <div class="col-md-20">
   
<div class="ased" style="float: right; margin-left: 50px;" style="display: inline;" ><p class="ber" style="display: inline;">  رقم المنتج: </p> <?php echo (strlen($product_id) > 60 ? utf8_substr(html_entity_decode($product_id),0,60)."..." : $product_id); ?> </div>  <br> <br> 
<div class="ased" style=" margin-left: 50px;" style="display: inline;" ><p class="ber" style="display: inline;">  رقم الموديل :</p> <?php echo (strlen($model) > 60 ? utf8_substr(html_entity_decode($model),0,60)."..." : $model); ?> </div> <br> <br> 

<div class="gery">خصائص المنتج:  </div> 


 <textarea cols="20" rows="5" wrap="hard" readonly="yes" wrap="off" cols="30" rows="5"> <?php echo ($description)?></textarea>


    <div>لطلب المنتج:</div>
<div>1- قم باختيار مواصفات المنتج مثلا القياس واللون ان وجدت.</div>
<div>2- اضغط على "اشتري هنا".</div>
<div>3- اضغط على "اتمام الطلب".</div>
<div>4- قم بتعبئة معلوماتك مثل الاسم والعنوان ورقم الهاتف.</div>
<div>5- اضغط على "تأكيد الطلب".</div>

     
</div>

        
 <!--<br> <div class="ased" style="float: right; margin-left: 50px;" style="display: inline;" ><p class="ber" style="display: inline;">  رقم المنتج: </p> <?php echo (strlen($product_id) > 60 ? utf8_substr(html_entity_decode($product_id),0,60)."..." : $product_id); ?> </div> <br> <br>
 <div class="ased" style=" margin-left: 50px;" style="display: inline;" ><p class="ber" style="display: inline;">  رقم الموديل :</p> <?php echo (strlen($model) > 60 ? utf8_substr(html_entity_decode($model),0,60)."..." : $model); ?> </div> <br> <br> 
<div class="gery">خصائص المنتج:  </div> 



<div > !-->
  <!--</div>
<div>لطلب المنتج:</div>
<div>1- قم باختيار مواصفات المنتج مثلا القياس واللون ان وجدت.</div>
<div>2- اضغط على "اشتري هنا".</div>
<div>3- اضغط على "اتمام الطلب".</div>
<div>4- قم بتعبئة معلوماتك مثل الاسم والعنوان ورقم الهاتف.</div>
<div>5- اضغط على "تأكيد الطلب".</div>!-->


<style>
textarea {
  background: url(images/benice.png) center center no-repeat; /* This ruins default border */
  border: 1px solid #888; 
  color:black;
}
  .ased {margin-top: 20px!important;}
  .ber {color: #323232;
  /*display: inline-block;*/
    margin-bottom: 7px;
    font-weight: bold;
    font-size: 15px;
  }
   .glace {margin: 0 0 8.5px;

  }
  .gery {color: #323232;
  /*display: inline-block;*/
    margin-bottom: 7px;
    font-weight: bold;
    font-size: 15px;

  }
</style>

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>

    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="product-info">

      <div class="row">
          
   
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-5'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-5'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-8'; ?>
        <?php } ?>
        <div class="left <?php echo $class; ?>">
    		  <div class="bt-product-zoom">
              <?php if ($thumb || $images) { ?>
                <ul class="thumbnails">
                  <?php if ($thumb) { ?>
                    <li>
                      <a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"> 
                        <img src="<?php echo $thumb; ?>"   title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/>
                      </a>
                    </li>
                  <?php } ?>   
    		        </ul>
                <style>
                 .product-info .left {
                    float: left!important;

                  }
                </style>
              <?php } ?>
    		  </div>
        </div>      
        <p class="nini"><?php echo (strlen($product_id) > 60 ? utf8_substr(html_entity_decode($product_id),0,60)."..." : $product_id); ?></p>
         <style>  
            .nini {
              margin: 0 0 10px;
              top: 40px;
              font-size: 17px;
              font-weight: bold;
              color: #404040;
              float: left!important;
            }
            .product-info{
            margin-top: -320px!important; }
         </style>

        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-7'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-7'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-4'; ?>
        <?php } ?>
        <div class="right <?php echo $class; ?>">
          <h1><?php echo $heading_title; ?></h1>

            <ul class="list-unstyled description">
            <?php if ($manufacturer) { ?>
          <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li> 
            <?php } ?> 
           <!-- <p><?php echo (strlen($sku) > 60 ? utf8_substr(html_entity_decode($sku),0,60)."..." : $sku); ?></p> -->
             <p class="eri">رقم المنتج:<?php echo (strlen($product_id) > 60 ? utf8_substr(html_entity_decode($product_id),0,60)."..." : $product_id); ?></p>


             

 <style>.eri{    font-size: 16px;}</style>
                 <!-- <li><?php echo $text_model; ?> <?php echo $model; ?></li> -->
              <?php if ($reward) { ?>
               <li><?php echo $text_reward; ?> <?php echo $reward; ?></li> 
         
            <?php } ?>
               <li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
              
          </ul>  

    
          <div id="product">
            <?php if ($options) { ?>
            <h2><?php echo $text_option; ?></h2>
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php //echo $option_value['price_prefix']; ?><?php //echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'image') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                 <img  src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                           


                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>

          

            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block btn-upload"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
             <!-- <p>رقم المنتج:<?php echo (strlen($sku) > 60 ? utf8_substr(html_entity_decode($sku),0,60)."..." : $sku); ?></p>-->
          <!-- <p>وصف المنتد<?php echo (strlen($description) > 60 ? utf8_substr(html_entity_decode($description),0,60)."..." : $description); ?></p>-->
                       
                                  <!--   <p>رقم الموديل :<?php echo (strlen($model) > 60 ? utf8_substr(html_entity_decode($model),0,60)."..." : $model); ?> </p>-->
                                   <!--   <p>رse3r:<?php echo (strlen($price) > 60 ? utf8_substr(html_entity_decode($price),0,60)."..." : $price); ?> </p>-->
                                   

            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>
          <?php if ($review_status) { ?>
          <div class="rating">
            <p>
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <!-- <span class="fa fa-stack fa-hidden"><i class="fa fa-star fa-stack-2x"></i></span>-->
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
              <?php } ?>
              <?php } ?> 
               <!--   <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a></p>-->
            <!-- AddThis Button BEGIN -->
             <!-- <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div> -->
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script> 
            <!-- AddThis Button END --> 
          </div>
          <?php } ?>
            <div class="form-group">
			  <?php if ($price&&$price>0) { ?>
			  <div class="price_info">
				<?php if (!$special) { ?>
				 <!-- <span>السعر :<?php echo $price; ?></span>-->
				<?php } else { ?>
			  <!-- 	<span class="price-old"><?php echo $price; ?></span>
				<span class="price-new"><?php echo $special; ?></span> -->
				<?php } ?>
				<?php if ($tax) { ?>
			   	<span class="price-tax"> <!--<?php echo $text_tax; ?>-->   <!-- <?php echo $tax; ?>--></span>
				<?php } ?>
				<?php if ($points) { ?>
				<br/><br/><p><?php echo $text_points; ?> <?php echo $points; ?></p>
				<?php } ?>
				<?php if ($discounts) { ?>
				<?php foreach ($discounts as $discount) { ?>
				<p><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></p>
				<?php } ?>
				<?php } ?>

			  </div>
			  <?php } ?>
				<label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
       <style>
  .control-label{
  font-size: 15px!important;


</style>
				<div class="select_number">                
					<input type="text" class="text form-control" name="quantity" size="2" id="input-quantity" value="<?php echo $minimum; ?>" />
					<button onclick="changeQty(1); return false;" class="increase">+</button>
                    <button onclick="changeQty(0); return false;" class="decrease">-</button>  
				</div>
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
				<?php if ($minimum > 1) { ?>
				<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
				<?php } ?>

       <label class="zaq" style="display: inline"> السعر:</label>   <p class="zaqe" style="display: inline"><?php echo (strlen($price) > 60 ? utf8_substr(html_entity_decode($price),0,60)."..." : $price); ?></p>  <br><br>
    <style>
  .zaq{
  font-size: 20px;
  color:323232 !important;}
  .zaqe{
font-size: 25px !important;
    background: green
    color: white;
    }


</style>
 <img src="image/right_arrow.gif">
			<div class="cart_button">	
              <div class="boss_cover"><span class="cart_icon"></span> </div>
			  <button  type="button" id="button-cart"  data-loading-text="<?php echo $text_loading; ?>" 
          class="btn button_cart"> اشتري هنا  <!--<?php echo $button_cart; ?>--></button> <br> <br>


<style>
  .btn, .btn-cart, .boss_cover, .footer_column .footer-social ul li a:hover {
    background-color:#ff8b0e!important;
}
.cart_icon {
    background-color:#ff8b0e!important;
}
.btn:hover{background-color: white!important;}
table, td, th {
  border: 1px solid black;
  font-size: 15px;
}
table#policies_details:first-child td:first-child {
    font-weight: bold;
}

#policies_details td {
    min-width: 107px;
    text-align: right;
    border: 1px solid #444;
    padding-left: 2px;
    padding-right: 5px;
}
}
table td, table th {
    padding: 9px 10px;
    text-align: left;
}
caption, th, td {
    text-align: left;
    font-weight: normal;
    vertical-align: middle;
}
.red {
    color: red;
}
.policies_link {
    color: blue;
    cursor: pointer;
}
</style>





          <div class="btn-group">
            <!-- <button type="button" data-toggle="tooltip" class="btn-wishlist" title="<?php echo $button_wishlist; ?>" onclick="btadd.wishlist('<?php echo $product_id; ?>');"></button>
            <button type="button" data-toggle="tooltip" class="btn-compare" title="<?php echo $button_compare; ?>" onclick="btadd.compare('<?php echo $product_id; ?>');"></button> -->
          </div>


    </div>  

<div class="policies_block">
    <table id="policies_details">
      <tbody>
        <tr>
          <td id="payment_methods">طرق الدفع</td>
          <td>نقدا عند الاستلام</td>
        </tr>
        <tr>
          <td id="shipping_fees"> رسوم التوصيل</td>
          <td><span class="red">الضفة الغربية:</span> <b>10</b> شيكل اذا كان مجموع كامل طلباتك اقل من <b>150</b> شيكل ويكون التوصيل <b>مجاني</b> للطلبات بقيمة <b>150</b> شيكل واكثر <br><br> <span class="red">داخل القدس:</span> <b>20</b> شيكل</td>
        </tr>
        <tr>
          <td id="shipping_time"> مدة التوصيل</td><td> 2-5 ايام</td>
        </tr>
        <tr>
          <td id="exchange_terms">سياسة التبديل</td>
            <td><span class="policies_link" onclick="window.open('/content/12-exchange_terms','_blank')">اقرا سياسة التبديل من هنا</span></td>
          </tr>
          <tr>
            <td id="refund_terms">سياسة الارجاع</td>
            <td><span class="policies_link" onclick="window.open('/content/14-refund_terms','_blank')">اقرا سياسة الارجاع من هنا</span></td></tr>
          </tbody>
    </table>
   </div>

            </div>
          </div>
                
        </div>

      </div>	

      </div>

 

	  <div class="htabs">
	  <ul class="nav nav-tabs">
		<!--<li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li> -->
		<?php if ($attribute_groups) { ?>
	<li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
		<?php } ?>
		<?php if ($review_status) { ?>
		<!--<li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li> -->
		<?php } ?>
	  </ul>
	  </div>
	  <div class="tab-content">
	<!--	<div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>-->
		<?php if ($attribute_groups) { ?>
		<div class="tab-pane" id="tab-specification">
		  <table class="table table-bordered">
			<?php foreach ($attribute_groups as $attribute_group) { ?>
			<thead>
			  <tr>
				<td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
			  </tr>
			</thead>
			<tbody>
			  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
			  <tr>
				<td><?php echo $attribute['name']; ?></td>
				<td><?php echo $attribute['text']; ?></td>
			  </tr>
			  <?php } ?>
			</tbody>
			<?php } ?>
		  </table>
		</div>

		<?php } ?>
		<?php if ($review_status) { ?>
		<div class="tab-pane" id="tab-review">
		  <form class="form-horizontal">
			<div id="review"></div>
			<h2><?php echo $text_write; ?></h2>
			<div class="form-group required">
			  <div class="col-sm-12">
				<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
				<input type="text" name="name" value="" id="input-name" class="form-control" />
			  </div>
			</div> -->
			<div class="form-group required">
			  <div class="col-sm-12">
				<label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
				<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
				<div class="help-block"><?php echo $text_note; ?></div>
			  </div>
			</div>
			<div class="form-group required">
			  <div class="col-sm-12">
				<label class="control-label"><?php echo $entry_rating; ?></label>
				&nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
				<input type="radio" name="rating" value="1" />
				&nbsp;
				<input type="radio" name="rating" value="2" />
				&nbsp;
				<input type="radio" name="rating" value="3" />
				&nbsp;
				<input type="radio" name="rating" value="4" />
				&nbsp;
				<input type="radio" name="rating" value="5" />
				&nbsp;<?php echo $entry_good; ?></div>
			</div>
			<?php echo $captcha; ?>
			<div class="buttons">
			  <div class="pull-left">
				<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
			  </div>
			</div>
		  </form>
		</div>
		<?php } ?>
	  </div>
      <?php if ($products) { ?>
	  <div class="product-related">
		<h2><?php echo $text_related; ?></h2>
		<div class="carousel-button">
			<a id="prev_related" class="prev nav_thumb" href="javascript:void(0)" style="display:block;" title="prev"><i data-original-title="Previous" title="" class="fa fa-angle-left btooltip">&nbsp;</i></a>
			<a id="next_related" class="next nav_thumb" href="javascript:void(0)" style="display:block;" title="next"><i data-original-title="Next" title="" class="fa fa-angle-right btooltip">&nbsp;</i></a>
		</div>
		<div class="list_carousel responsive" >
			<ul id="product_related" class="content-products"><?php foreach ($products as $product) { ?><li>				
			<div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
             

            <div class="small_detail">
            <div class="caption">
              <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
              <p class="description"><?php echo $product['description']; ?></p>
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
              <?php if ($product['price']&&$product['price']>0) { ?>
              <p class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
            <div class="button-group">
              <button type="button" class="btn-cart" onclick="addToCartModal();btadd.cart('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"></span></button>
              <button type="button" class="btn-wishlist" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="btadd.wishlist('<?php echo $product['product_id']; ?>');"></button>
              <button type="button" class="btn-compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="btadd.compare('<?php echo $product['product_id']; ?>');"></button>
            </div>
          </div>
          </div>
        </li><?php } ?></ul>    
      </div>
      </div>
      <?php } ?>
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>


<script type="text/javascript" src="catalog/view/javascript/bossthemes/carouFredSel-6.2.0.js"></script>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
function changeQty(increase) {
    var qty = parseInt($('.select_number').find("input").val());
    if ( !isNaN(qty) ) {
        qty = increase ? qty+1 : (qty > <?php echo $minimum; ?> ? qty-1 : <?php echo $minimum; ?>);
        $('.select_number').find("input").val(qty);
    }else{
		$('.select_number').find("input").val(1);
	}
}
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=bossthemes/boss_add/cart',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			//$('#button-cart').button('loading');
		},
		complete: function() {
			//$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}
			
			/*if (json['success']) {
				//addProductNotice(json['title'], json['thumb'], json['success'], 'success');
        

				
				$('#cart-total').html(json['total']);
				
				$('#cart > ul').load('index.php?route=common/cart/info ul li');
        setTimeout(function(){
          $("#sommeProd").text($(".minicart_total > tbody > tr > td").eq(3).text())
          $("#sommeTotal").text($(".minicart_total > tbody > tr > td").eq(1).text() )
          $("#ship").text('مجاني');
          var carttotal= $("#cart-total").text();
          var i=carttotal.indexOf(" item");
          var total=$(".minicart_total > tbody > tr > td").eq(3).text();
          total=total.substr(1,total.length-1)
         if(parseFloat(total)<150)
         { 
          $("#ship").text("₪15.00");

            total=((parseFloat(total)+15).toFixed(2)).toString();
            $("#sommeTotal").text("₪"+total)
         }
          var qte=carttotal.substr(0,i);
          //console.log("******************"+carttotal)
          $("#qteProd").text(qte)
        
          $("#addToCartModal").modal("show")
        },1000)
        
			}*/



    if (json['success']) {
        //addProductNotice(json['title'], json['thumb'], json['success'], 'success');
        

        
        $('#cart-total').html(json['total']);
        
        $('#cart > ul').load('index.php?route=common/cart/info ul li');
        setTimeout(function(){
          $("#sommeProd").text($(".minicart_total > tbody > tr > td").eq(3).text())
          $("#sommeTotal").text($(".minicart_total > tbody > tr > td").eq(3).text() )
          $("#ship").text('مجاني');
          var carttotal= $("#cart-total").text();
          var i=carttotal.indexOf(" item");
          var total=$(".minicart_total > tbody > tr > td").eq(3).text();
          total=total.substr(1,total.length-1)
           var prix=$(".minicart_total > tbody > tr > td").eq(3).text();
               prix=prix.substr(1,total.length-1)
               if(parseFloat(prix)<150)
              { prix=((parseFloat(prix)-10).toFixed(2)).toString();
               $("#sommeProd").text("₪"+prix)
             }
         if(parseFloat(total)<150)
         { 
          $("#ship").text("₪10.00");

            //total=((parseFloat(total)+15).toFixed(2)).toString();
            //$("#sommeTotal").text("₪"+total)
         }
          var qte=carttotal.substr(0,i);
          //console.log("******************"+carttotal)
          $("#qteProd").text(qte)
        
          $("#addToCartModal").modal("show")
        },1000)
        
      }






		}

	});
});
//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script> 
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : ''),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});
   
$(document).ready(function() {
   $(".box-content").hide();

	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
$(window).load(function(){
	$('#product_related').carouFredSel({
        auto: false,
        responsive: true,
        width: '100%',
        prev: '#prev_related',
        next: '#next_related',
        swipe: {
        onTouch : true
        },
        items: {
            width: 280,
			height: 'auto',
            visible: {
            min: 1,
            max: 4
            }
        },
        scroll: {
            direction : 'left',    //  The direction of the transition.
            duration  : 1000   //  The duration of the transition.
        }
	});
	$('#boss-image-additional').carouFredSel({
        auto: false,
        responsive: true,
        width: '100%',
        prev: '#prev_image_additional',
        next: '#next_image_additional',
        swipe: {
        onTouch : true
        },
        items: {
            width: 100,
            height: 'auto',
            visible: {
            min: 1,
            max:3
            }
        },
        scroll: {
            direction : 'left',    //  The direction of the transition.
            duration  : 1000   //  The duration of the transition.
        }
    });
});  


//--></script> 





				<script type="text/javascript"><!--
				$('#additional-carousel').owlCarousel({
				  items: 5,
				  autoPlay: false,
				  navigation: true,
				  navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
				  pagination: false
				});
				//--></script>
				<style type="text/css">
					#additional-carousel{
					  overflow: hidden;
					}
					#additional-carousel .owl-wrapper-outer{
					  border-radius: 0;
					  border:none;
					  margin-left: 20px;
					  box-shadow: none;
					}
					#additional-carousel .image-additional{
					  width: 100%;
					  max-width: 100%;
					  margin: 0;
					}
					</style>
			
<?php echo $footer; ?>

<script>
  $(document).ready(function(){
    isMobile=false;
    if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent) 
            || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0,4))) { 
                    isMobile = true;
        }
        if(isMobile){
      $(".modal-dialog").attr("style"," position: fixed;top: 3%;right: 3%;left: 3%;width: auto; margin: 0;");
$(".modal-body").attr("style","height: 60%;");
$(".nini").hide();
        }
  })
</script>


<div id="addToCartModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"> &#10003; تم اضافة المنتج بنجاح اللى سلة التسوق الخاصة بك    </h4>
      </div>
      <div class="modal-body">
       
      

            <!-- <p id="sommeProd"></p>
             <p id="sommeTotal"></p>-->
             
              
        
        <div class="sir">
           <p style="margin:0;display:inline;float:right;">يوجد </p>
            <p  style="margin:0; color: black; display:inline;float:right" id="qteProd"> <strong></strong></p>
              <p style="margin:0;display:inline;float:right"> منتجات في سلة المشتريات  .</p>
               </div>   <br>  <br>
        
    <div > 
    <p class="dark" style="margin:0;display:inline;float:right;">  اجمالي المنتجات    </p>
    <p style=" margin:0;font-size: 20px; display:inline;float:left; color: #ff8b0e;" id="sommeProd" ></p>
   </div>
   <br> <br>
        
         <div>
         <p class="dark" style="margin:0;display:inline;float:right;">اجمالي الشحن  </p>

                   <p style=" margin:0;font-size: 20px; display:inline;float:left; color: #ff8b0e;" id="ship"></p>
                    </div><br><br>


     <div > 
    <p class="dark" style="margin:0;display:inline;float:right;"> المجموع  </p>
    <p style=" margin:0;font-size: 20px; display:inline;float:left; color: #ff8b0e;" id="sommeTotal" ></p>
   </div> <br><br>



     <style>
          .sir {font-size: 25px;}
          .dark{
    color:  #000;
        font-size: 25px;}

            </style>
      </div>
      <div class="modal-footer">
        <button  style="float: left " type="button" class="btn btn-default" data-dismiss="modal" ><i class="fa fa-chevron-right" aria-hidden="true"></i>شراء منتجات اخرى</button>
        <a href="?route=checkout/checkout">
          <button type="button" class="btn btn-default" >ادخل معلوماتك   <i class="fa fa-chevron-left" aria-hidden="true"></i></button>
        </a>
         <img src="image/right_arrow.gif">
      </div>

    </div>
  </div>
</div>
<style>
 .modal-dialog {
  display: block;
  top: 232px;
  position: absolute;
  z-index: 9999;
  width: 50%;
  margin-right: 25%;
  margin-left: 25%;
  padding: 18px;
  background-color: #fff,
 } 
.modal-title{
  color:#ff8b0e;
  padding-right: 0;
  padding-left: 50px;
  margin-bottom: 30px;
  font-weight: 300;
  font-size: 24px;
  line-height: 1.1;
}
.close{
    
     background:transparent;
  border: 0;
  left: 7px;
  color:black;
  float: left;

}
.close:hover{color: #ff8b0e;
  cursor: pointer;

}



</style>
