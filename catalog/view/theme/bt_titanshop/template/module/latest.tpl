<h3><?php echo $heading_title; ?> <img src="image/browse27.png"></h3>  
<div class="row product-layout">
  <?php foreach ($products as $product) { ?>
  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
           <p class="zz"><?php echo $product['product_id'] ?></p>
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <h4 class="est"><a href="<?php echo $product['href']; ?>" style="color: black;font-size: 22px; "><?php echo $product['name']; ?></a></h4>
       <p><?php echo $product['description']; ?></p>
        <?php if ($text['stock']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <p class="price" style="  font-size: 25px; 
    color: red;">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <!-- <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span> -->
          <?php } ?>
        </p>
        <?php } ?>
      </div>
      <!-- <div class="button-group">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      </div>-->
    </div>
  </div>
  <?php } ?>
  <style>
  h3 {
    font-size: 25px;
    //color: #ff8401;
    font-weight: 700;
    00: ;
    */: ;
    margin-top: 0px;
    font-family: Arial;
    text-align: center;
}
.zz{
  text-align: center;
    font-size: 20px;
    color: black;
}
.est{
  text-align: center;
    font-size: 20px;
    
}
.price{

    text-align: center;
  
    
}
.product-thumb {
    
 border: 1px solid #555;
  border-radius: 4px;
  padding: 5px;
  
      background-color: revert;
   margin: 20px 08px;
}
 </style>
</div>