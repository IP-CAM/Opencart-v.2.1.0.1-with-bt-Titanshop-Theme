<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $select_home; ?> Page Layout</h3>
            </div>
            <div class="panel-body">
                <div id="layout_add_edit_form" class="layout_add_edit_form" style="">
                    <div class="row">
                        <div class="productTabs col-lg-3 col-md-3 col-sm-6">
                            <div class="list-group">
                                <a id="top_category" class="list-group-item"><?php echo $entry_tab_top_categories;  ?><i class="icon-plus trash" style="padding-right:5px"></i></a>
                                <a id="banner_square" class="list-group-item"><?php echo $entry_tab_banner_square;  ?><i class="icon-plus trash" style="padding-right:5px"></i></a>
                                <a id="banner_HS" class="list-group-item"><?php echo $entry_tab_banner_sliding;  ?><i class="icon-plus trash" style="padding-right:5px"></i></a>
                                <a id="banner_grid" class="list-group-item"><?php echo $entry_tab_banner_grid;  ?><i class="icon-plus trash" style="padding-right:5px"></i></a>
                                <a id="banner_countdown" class="list-group-item"><?php echo $entry_tab_banner_countdown;  ?><i class="icon-plus trash" style="padding-right:5px"></i></a>
                                <a id="product_square" class="list-group-item"><?php echo $entry_tab_product_square;  ?><i class="icon-plus trash" style="padding-right:5px"></i></a>
                                <a id="product_HS" class="list-group-item"><?php echo $entry_tab_product_horizontal;  ?><i class="icon-plus trash" style="padding-right:5px"></i></a>
                                <a id="product_grid" class="list-group-item"><?php echo $entry_tab_product_grid;  ?><i class="icon-plus trash" style="padding-right:5px"></i></a>
                                <a id="product_LA" class="list-group-item"><?php echo $entry_tab_product_recent;  ?><i class="icon-plus trash" style="padding-right:5px"></i></a>

                            </div>
                        </div>

                        <div class="col-lg-5 col-md-4 col-sm-6">

                            <div class="panel panel-default" style="min-height:400px;">
                                <ul class="slides ui-sortable">
                                    <?php
                                    if (!empty($components)) {
                                        foreach ($components as $component) {
                                            if ($component['component_type'] == 'banner_square') {
                                                ?>
                                                <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                    <span class="slideTitle"><?php echo $entry_tab_banner_square;  ?></span>
                                                    <span class="edit_component" id="edit_<?php echo $component['id_component'] ?>" onclick="editBannerSquareComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                    <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashBannerSquareComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                    <div class="banner_preview layout_div">
                                                        <?php    if(isset($component['data'][0]['id'])) { ?>
                                                        <p id="bannerSquare_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>" class="comp_heading"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></p>
                                                        <?php foreach ($component['data'] as $cd) { ?>
                                                        <div class="bannerSquareList" id="bannerSList_<?php echo $component['id_layout'].'_'.$component['id_component'] ?>">
                                                            <span class="BSSection">
                                                                <img id="bannerSquareBannerimg_<?php echo $component['id_layout'].'_'.$component['id_component'] ?>" class="bannerSquareBannerimg" src="<?php echo HTTPS_CATALOG.'image/'.str_replace(" ","%20",$cd['image_url']) ?>" style="width: 100%"/>
                                                            </span>    
                                                        </div>
                                                        <?php } ?>
                                                        <?php } else { ?>
                                                        <?php if(isset($component['id_component'])) { ?>
                                                        <p id="bannerSquare_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>" class="comp_heading"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></p>
                                                           <div class="bannerSquareList" id="bannerSList_<?php echo $component['id_layout'].'_'.$component['id_component'] ?>">        
                                                        <?php } else  { ?>
                                                            <div class="bannerSquareList" id="bannerSList">
                                                        <?php } ?>
                                                        <div class="bannerSquareList" id="bannerSList">
                                                            <span class="BSSection">
                                                            <img class="banner_preview_image" src="view/image/Layout_Components/square_banner.jpg">
                                                            </span>
                                                        </div>
                                                        <?php } ?>
                                                    </div>
                                                </li>
                                                <input type="hidden" id="component_heading_<?php echo $component['id_component'] ?>" value="<?php echo $component['component_heading'] ?>">    
        <?php } else if ($component['component_type'] == 'top_category') { ?>
                                                <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                    <span class="slideTitle"><?php echo $entry_tab_top_categories;  ?></span>
                                                    <!--span class="settings" onclick="settingFunction(this)"><i class="fa fa-gear"></i></span-->
                                                    <span class="edit_component" id="edit_<?php echo $component['id_component'] ?>" onclick="editTopCategoryComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                    <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashTopcategoryComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                    <div class="banner_preview layout_div">
                                                        <!--Start:changes made by Aayushi Agarwal on 22nd April 2020 to make preview changes-->
                                                            <!--<img class="banner_preview_image" src="view/image/Layout_Components/top_category.jpg">-->
                                                            <div class="topCategories">
                                                                <ul>
                                                                    <?php 
                                                                    if(isset($component['data']) && is_array($component['data'])) { 
                                                                        foreach ($component['data'] as $cd) { ?>
                                                                    <li>
                                                                        <span class="catSection">
                                                                            <img id="top_category_1_<?php echo $component['id_layout'].'_'.$component['id_component'] ?>" src=<?php echo HTTPS_CATALOG.'image/'.str_replace(" ","%20",$cd['image_url']) ?>>
                                                                        </span>    
                                                                    </li>
                                                                    <?php } 
                                                                    } else {
                                                                    ?>
                                                                    <?php if(isset($component['id_component'])) { ?>
                                                                    <li>
                                                                        <span class="catSection">
                                                                            <img id="top_category_1_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>" src="view/image/Layout_Components/cat1.jpg"/>
                                                                        </span>    
                                                                    </li>
                                                                    <li>
                                                                        <span class="catSection">
                                                                            <img id="top_category_2_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>" src="view/image/Layout_Components/cat2.jpg"/>
                                                                        </span>    
                                                                    </li>
                                                                    <li>
                                                                        <span class="catSection">
                                                                            <img id="top_category_3_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>" src="view/image/Layout_Components/cat3.jpg"/>
                                                                         </span>     
                                                                    </li>
                                                                    <li>
                                                                        <span class="catSection">
                                                                            <img id="top_category_4_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>" src="view/image/Layout_Components/cat4.jpg"/>
                                                                        </span>    
                                                                    </li>
                                                                    <?php } else  { ?>
                                                                        <li>
                                                                            <span class="catSection">
                                                                                <img id="top_category_1" src="view/image/Layout_Components/cat1.jpg"/>
                                                                            </span>    
                                                                        </li>
                                                                        <li>
                                                                            <span class="catSection">
                                                                                <img id="top_category_2" src="view/image/Layout_Components/cat2.jpg"/>
                                                                            </span>    
                                                                        </li>
                                                                        <li>
                                                                            <span class="catSection">
                                                                                <img id="top_category_3" src="view/image/Layout_Components/cat3.jpg"/>
                                                                             </span>     
                                                                        </li>
                                                                        <li>
                                                                            <span class="catSection">
                                                                                <img id="top_category_4" src="view/image/Layout_Components/cat4.jpg"/>
                                                                            </span>    
                                                                        </li>
                                                                    <?php } ?>
                                                                    <?php } ?>
                                                                </ul>
                                                            </div>
                                                            <!--end:changes made by Aayushi Agarwal on 22nd April 2020 to make preview changes-->  
                                                    </div>
                                                </li>
        <?php } else if ($component['component_type'] == 'products_horizontal') { ?>
                                                <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>" style="position: relative; top: 0px; left: 0px;">
                                                    <span class="slideTitle"><?php echo $entry_tab_product_horizontal;  ?></span>
                                                    <span class="edit_component" id="edit_<?php echo $component['id_component'] ?>" onclick="editProductHorizontalComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                    <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashProductHorizontalComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                    <div class="banner_preview layout_div">
                                                        <h4 class="comp_heading" id="slidingProducts_comp_heading"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></h4>
                                                        <?php    if(isset($component['id_component'])) { ?>
                                                                    <div class="slidingBannersScroll" id="product_sliding_banner_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                    <?php } else { ?>
                                                                        <div class="slidingBannersScroll" id="product_sliding_banner">
                                                                    <?php } ?>
                                                        <?php    if(isset($component['product_data'][0])) { ?>
                                                            <div class="slidingProducts" id="slidingPRow1">
                                                        <?php foreach ($component['product_data'] as $key=>$cd) { ?>
                                                            	<?php if($key < 3) { ?>						
                                                                <div class="productSlideList" id="productSlideList<?php echo $key; ?>">
                                                                    <img class="slidingProductsimg" id="slidingProductsimg<?php echo $key; ?>" src="<?php echo $cd['src']; ?>"/>
                                                                    <div class="productContent">
                                                                        <div class="productInfo">
                                                                            <h5 id ="productName"><?php echo $cd['name']; ?></h5>
                                                                            <h6 id="productPrice" class="productPPrice"><?php echo $cd['price']; ?></h6>
                                                                        </div>
                                                                        <div class="wishlistProduct">
                                                                            <i class="fa fa-heart-o"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <?php } ?>

                                                        <?php } ?>
                                                                </div>
                                                                <?php }else  { ?>
                                                            
                                                                    <div class="slidingProducts" id="slidingPRow1">							
                                                                        <div class="productSlideList" id="productSlideList1">
                                                                            <img class="slidingProductsimg" id="slidingProductsimg1" src="view/image/Layout_Components/product1.jpg"/>
                                                                            <div class="productContent">
                                                                                <div class="productInfo">
                                                                                    <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                                    <h6 id="productPrice" class="productPPrice">$100</h6>
                                                                                </div>
                                                                                <div class="wishlistProduct">
                                                                                    <i class="fa fa-heart-o"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="productSlideList" id="productSlideList2">
                                                                            <img class="slidingProductsimg" id="slidingProductsimg2" src="view/image/Layout_Components/product2.jpg"/>
                                                                            <div class="productContent">
                                                                                <div class="productInfo">
                                                                                    <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                                    <h6 id="productPrice" class="productPPrice">$100</h6>
                                                                                </div>
                                                                                <div class="wishlistProduct">
                                                                                    <i class="fa fa-heart-o"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="productSlideList" id="productSlideList3">
                                                                            <img class="slidingProductsimg" id="slidingProductsimg3" src="view/image/Layout_Components/product3.jpg"/>
                                                                            <div class="productContent">
                                                                                <div class="productInfo">
                                                                                    <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                                    <h6 id="productPrice" class="productPPrice">$100</h6>
                                                                                </div>
                                                                                <div class="wishlistProduct">
                                                                                    <i class="fa fa-heart-o"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                        <?php } ?>
                                                    </div>
                                                </li>
        <?php } else if ($component['component_type'] == 'products_square') { ?>
                                                <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                    <span class="slideTitle"><?php echo $entry_tab_product_square;  ?></span>
                                                    <span class="edit_component" id="edit_<?php echo $component['id_component'] ?>" onclick="editProductHorizontalComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                    <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashProductHorizontalComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                    <div class="banner_preview layout_div">
                                                        <h4 id="productSquare_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>" class="comp_heading"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></h4>
                                                        <?php    
                                                        if(isset($component['product_data'][0])) { 
                                                            ?>
                                                        <?php foreach ($component['product_data'] as $cd) { ?>
                                                            <div id="product_square_list_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                            <div class="productSquareList" id="productSList">
                                                                    <img id="productSquareimg" class="productSquareimg" src="<?php echo $cd['src'] ?>"/>
                                                                    <div class="productContent">
                                                                            <div class="productInfo">
                                                                                    <h5 id ="productName"><?php echo $cd['name'] ?></h5>
                                                                                    <h6 id="productPrice" class="productPPrice"><?php echo $cd['price'] ?></h6>
                                                                            </div>
                                                                            <div class="wishlistProduct">
                                                                                    <i class="fa fa-heart-o"></i>
                                                                            </div>
                                                                    </div>
                                                            </div>
                                                           
                                                        <?php } }else  { ?>
                                                            <?php    if(isset($component['id_component'])) { ?>
                                                            <div id="product_square_list_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                            <?php } else { ?>
                                                                <div id="product_square_list">
                                                            <?php } ?>    
                                                            <div class="productSquareList" id="productSList">
                                                                    <img id="productSquareimg" class="productSquareimg" src="view/image/Layout_Components/product-square.jpg"/>
                                                                    <div class="productContent">
                                                                            <div class="productInfo">
                                                                                    <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                                    <h6 id="productPrice" class="productPPrice">$100</h6>
                                                                            </div>
                                                                            <div class="wishlistProduct">
                                                                                    <i class="fa fa-heart-o"></i>
                                                                            </div>
                                                                    </div>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                </li>
        <?php } else if ($component['component_type'] == 'products_recent') { ?>
                                                <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                    <span class="slideTitle"><?php echo $entry_tab_product_recent;  ?> </span>
                                                    <span class="edit_component" id="edit_<?php echo $component['id_component'] ?>" onclick="editProductLAFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                    <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashLastAccessComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                    <div class="banner_preview layout_div">
                                                        <h4 class="comp_heading"><?php echo $entry_tab_product_recent;  ?></h4>
                                                        <div class="slidingProducts">
                                                            <?php foreach ($recent_products as $rp) { ?>
                                                            <div class="productSlideList">
                                                                <img class="slidingProductsimg" src="<?php echo $rp['src'];  ?>">
                                                                <div class="productContent">
                                                                    <div class="productInfo">
                                                                        <h5 id ="productName"><?php echo $rp['name'];  ?></h5>
                                                                        <h6 id="productPrice" class="productPPrice"><?php echo $rp['price'];  ?></h6>
                                                                    </div>
                                                                    <div class="wishlistProduct">
                                                                        <i class="fa fa-heart-o"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <?php } ?>
                                                        </div>
                                                    </div>
                                                </li>
        <?php } else if ($component['component_type'] == 'products_grid') { ?>
                                                <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                    <span class="slideTitle"><?php echo $entry_tab_product_grid; ?></span>
                                                    <span class="edit_component" id="edit_<?php echo $component['id_component'] ?>" onclick="editProductHorizontalComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                    <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashProductHorizontalComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                    <div class="banner_preview layout_div">
                                                        <?php    if(isset($component['product_data'][0])) { ?>
                                                            <p class="comp_heading" id="productGrid_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></p>
                                                            <div id="product_grid_list_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">					
                                                                <div class="productGridRow1" id="productGRow1">
                                                        <?php foreach ($component['product_data'] as $key=>$cd) { ?>
                                                            
                                                                    <div class="productGridList" >
                                                                        <img id="productGridimg1"  src="<?php echo $cd['src']; ?>"/>
                                                                        <div class="productContent">
                                                                            <div class="productInfo">
                                                                                <h5 id ="productName"><?php echo $cd['name']; ?></h5>
                                                                                <h6 id="productPrice" class="productPPrice"><?php echo $cd['price']; ?></h6>
                                                                            </div>
                                                                            <div class="wishlistProduct">
                                                                                <i class="fa fa-heart-o"></i>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                
                                                        <?php } ?>
                                                        </div>
                                                            </div>
                                                        <?php } else  { ?>
                                                            <?php    if(isset($component['id_component'])) { ?>
                                                            <p class="comp_heading" id="productGrid_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></p>
                                                            <div id="product_grid_list_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                <?php } else { ?>
                                                                <p class="comp_heading" id="productGrid_comp_heading"></p>
                                                                <div class="productGrid" id="product_grid_list">
                                                                    
                                                            <?php } ?>  
                                                            <div class="productGridRow1" id="productGRow1">
                                                                <div class="productGridList" >
                                                                    <img id="productGridimg1"  src="view/image/Layout_Components/pg1.jpg"/>
                                                                    <div class="productContent">
                                                                        <div class="productInfo">
                                                                            <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                            <h6 id="productPrice" class="productPPrice">$100</h6>
                                                                        </div>
                                                                        <div class="wishlistProduct">
                                                                            <i class="fa fa-heart-o"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="productGridList">
                                                                    <img id="productGridimg1"  src="view/image/Layout_Components/pg2.jpg"/>
                                                                    <div class="productContent">
                                                                        <div class="productInfo">
                                                                            <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                            <h6 id="productPrice" class="productPPrice">$100</h6>
                                                                        </div>
                                                                        <div class="wishlistProduct">
                                                                            <i class="fa fa-heart-o"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="productGridList">
                                                                    <img id="productGridimg1"  src="view/image/Layout_Components/pg3.jpg"/>
                                                                    <div class="productContent">
                                                                        <div class="productInfo">
                                                                            <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                            <h6 id="productPrice" class="productPPrice">$100</h6>
                                                                        </div>
                                                                        <div class="wishlistProduct">
                                                                            <i class="fa fa-heart-o"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="productGridList">
                                                                    <img id="productGridimg1"  src="view/image/Layout_Components/pg4.jpg"/>
                                                                    <div class="productContent">
                                                                        <div class="productInfo">
                                                                            <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                            <h6 id="productPrice" class="productPPrice">$100</h6>
                                                                        </div>
                                                                        <div class="wishlistProduct">
                                                                            <i class="fa fa-heart-o"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <?php } ?>
                                                        
                                                    </div>
                                                </li>
        <?php } else if ($component['component_type'] == 'banners_grid') { ?>
                                               
                                                <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                    <span class="slideTitle"><?php echo $entry_tab_banner_grid;  ?></span>
                                                    <span class="edit_component" id="edit_<?php echo $component['id_component'] ?>" onclick="editBannerSquareComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                    <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashBannerSquareComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                    <div class="banner_preview layout_div">
                                                        <?php    if(isset($component['data'][0]['id'])) { ?>
                                                            <h4 class="comp_heading" id="bannerGrid_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></h4>
                                                            <?php foreach ($component['data'] as $key=>$cd) { ?>
                                                                <?php if($key < 4) { $flag = 1; ?>
                                                                     <div class="bannerGridRow" id="bannerGRow1">
                                                                <?php } else if($key > 3) { $flag = 1; ?>
                                                                     <div class="bannerGridRow" id="bannerGRow2">
                                                                <?php } else { $flag = 0; } ?>    
                                                                    <div class="bannerGridList">
                                                                        <span class="BGSection">
                                                                            <img id="bannerGridimg<?php echo $key; ?>" class="bannerGridimg" src="<?php echo HTTPS_CATALOG.'image/'.str_replace(" ","%20",$cd['image_url']) ?>"/>
                                                                        </span>    
                                                                    </div>
                                                                <?php if($flag) { ?>
                                                                         </div> 
                                                                <?php } ?>
                                                            <?php } ?>
                                                        <?php  }else  { ?>
                                                           <div class="bannerGrid">	
                                                            <?php if(isset($component['data'][0]['heading'])) { ?>
                                                            <h4 class="comp_heading" id="bannerGrid_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></h4>
                                                            <?php } else  { ?>
                                                            <h4 class="comp_heading" id="bannerGrid_comp_heading"></h4>
                                                            <?php } ?>
                                                            <div class="bannerGridRow" id="bannerGRow1">
                                                                    <div class="bannerGridList">
                                                                        <span class="BGSection">
                                                                            <img id="bannerGridimg1" class="bannerGridimg1" src="view/image/Layout_Components/BS1.jpg"/>
                                                                        </span>    
                                                                    </div>
                                                                    <div class="bannerGridList">
                                                                        <span class="BGSection">
                                                                            <img id="bannerGridimg2" class="bannerGridimg2" src="view/image/Layout_Components/BS2.jpg"/>
                                                                        </span>    
                                                                    </div>
                                                                    <div class="bannerGridList">
                                                                        <span class="BGSection">
                                                                            <img id="bannerGridimg3" class="bannerGridimg3" src="view/image/Layout_Components/BS3.jpg"/>
                                                                        </span>    
                                                                    </div>
                                                                    <div class="bannerGridList">
                                                                        <span class="BGSection">
                                                                            <img id="bannerGridimg4" class="bannerGridimg4" src="view/image/Layout_Components/BS4.jpg"/>
                                                                        </span>    
                                                                    </div>
                                                                </div>
                                                                <div class="bannerGridRow1" id="bannerGRow" style="display:none">
                                                                <div class="bannerGridList">
                                                                    <span class="BGSection">
                                                                        <img id="bannerGridimg1" class="bannerGridimg" src="view/image/Layout_Components/product.jpg"/>
                                                                    </span>    
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <?php } ?>
                                                    </div>
                                                </li>
        <?php } else if ($component['component_type'] == 'banner_horizontal_slider') { ?>
                                                <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                    <span class="slideTitle"><?php echo $entry_tab_banner_sliding;  ?></span>
                                                    <span class="edit_component" id="edit_<?php echo $component['id_component'] ?>" onclick="editBannerSquareComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                    <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashBannerSquareComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                    <div class="banner_preview layout_div">
                                                        <div class="bannerHorizontalSlide">
                                                             <?php    if(isset($component['data'][0]['id'])) { ?>
                                                                        <h4 class="comp_heading" id="bannerHorizontalSlide_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></h4>
                                                                    <?php  } else if($component['id_component'])  { ?>
                                                                    <h4 class="comp_heading" id="bannerHorizontalSlide_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></h4>
                                                                    <?php } else  { ?>
                                                                    <h4 class="comp_heading" id="bannerHorizontalSlide_comp_heading"></h4>
                                                                    <?php } ?>
                                                            <div class="slidingBannersScroll">
                                                                <?php if(isset($component['id_component']))  { ?>
                                                                    <div class="slidingBanners" id="slidingBList_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                <?php } else  { ?>        
                                                                    <div class="slidingBanners" id="slidingBList">
                                                                <?php } ?>        
                                                                        <?php    if(isset($component['data'][0]['id'])) { ?>
                                                                            <?php foreach ($component['data'] as $key=>$cd) { ?>
                                                                            <?php if($key < 2) { ?>
                                                                            <div class="bannerHorizontalSlideList" id="bannerHorizontalSlideList1">
                                                                                <span class="BHSSection">    
                                                                                    <img id="bannerHorizontalSlideimg_<?php echo $key; ?>_<?php echo $component['id_layout'].'_'.$component['id_component'] ?>" class="bannerHorizontalSlideimg1" src="<?php echo HTTPS_CATALOG.'image/'.str_replace(" ","%20",$cd['image_url']) ?>"/>
                                                                                </span>
                                                                            </div>
                                                                            <?php } ?>
                                                                        <?php } }else  { ?>
                                                                            <div class="bannerHorizontalSlideList" id="bannerHorizontalSlideList1">
                                                                                <span class="BHSSection">    
                                                                                    <img id="bannerHorizontalSlideimg_1_<?php echo $component['id_layout'].'_'.$component['id_component'] ?>" class="bannerHorizontalSlideimg1" src="view/image/Layout_Components/BHS1.jpg"/>
                                                                                </span>
                                                                            </div>
                                                                            <div class="bannerHorizontalSlideList" id="bannerHorizontalSlideList2">
                                                                                <span class="BHSSection">    
                                                                                    <img id="bannerHorizontalSlideimg_2_" class="bannerHorizontalSlideimg2" src="view/image/Layout_Components/BHS2.jpg"/>
                                                                                </span>    
                                                                            </div>
                                                                        <?php } ?>
                                                                    </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
        <?php } else if ($component['component_type'] == 'banners_countdown') { ?>
                                                <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                    <span class="slideTitle"><?php echo $entry_tab_banner_countdown;  ?></span>
                                                    <span class="edit_component" id="delete_<?php echo $component['id_component'] ?>" onclick="editBannerCountdownComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                    <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashBannerSquareComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                    <div class="banner_preview layout_div">
                                                        <?php    if(isset($component['data'][0]['id'])) { ?>
                                                            <h4 class="comp_heading" id="bannerCountdown_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></h4>
                                                            <div class="countdownlist" id="bannerCountdownList_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                        <?php foreach ($component['data'] as $cd) { ?>
                                                            <div class="countdownlistContent">
                                                                <div class="countdownBackground" id="bannerCountdownimg" style="background:url('<?php echo HTTPS_CATALOG.'image/'.str_replace(" ","%20",$cd['image_url']) ?>');background-size: 300px 220px;">
                                                                        <div id="days"></div>
                                                                        <div class="countDownTimer" <?php if(isset($cd['background_color'])) { ?> style="background:<?php echo $cd['background_color'];  ?>" <?php } else { ?> style="background:transparent;" <?php } ?>>
                                                                                <span class="timer" style="color:<?php echo $cd['text_color'] ?>">23 <?php echo 'Hours'  ?></span>
                                                                                <span class="timer" style="color:<?php echo $cd['text_color'] ?>">21 <?php echo 'Minutes'  ?></span>
                                                                                <span class="timer" style="color:<?php echo $cd['text_color'] ?>">49 <?php echo 'Seconds'  ?></span>
                                                                        </div>
                                                                </div>
                                                            </div>
                                                        <?php }  ?>
                                                         </div>
                                                        <?php }else  { ?>
                                                            <?php if(isset($component['data'][0]['heading'])) { ?>
                                                                <h4 class="comp_heading" id="bannerCountdown_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></h4>
                                                            <?php } else { ?>
                                                                <h4 class="comp_heading" id="bannerCountdown_comp_heading"></h4>
                                                            <?php } ?>
                                                            <div class="countdownlist" id="bannerCountdownList">
                                                                <div class="countdownlistContent">
                                                                <div class="countdownBackground" id="bannerCountdownimg" style="background:url('view/image/Layout_Components/flash-sale.jpg')">
                                                                        <div id="days"></div>
                                                                        <div class="countDownTimer" style="background:transparent;">
                                                                                <span class="timer">23 <?php echo 'Hours'  ?></span>
                                                                                <span class="timer">21 <?php echo 'Minutes'  ?></span>
                                                                                <span class="timer">49 <?php echo 'Seconds'  ?></span>
                                                                        </div>
                                                                </div>
                                                            </div>
                                                                <div class="countdownlistContentContainer1" style="display:none;">
                                                                    <div class="countdownlistContent">
                                                                        <div class="countdownBackground" id="bannerCountdownimg1" style="background:url('view/image/Layout_Components/flash-sale.jpg')">
                                                                                <div id="days"></div>
                                                                                <div class="countDownTimer" style="background:background_color_of_timer_text;">
                                                                                        <span class="timer">23 <?php echo 'Hours'  ?></span>
                                                                                        <span class="timer">21 <?php echo 'Minutes'  ?></span>
                                                                                        <span class="timer">49 <?php echo 'Seconds'  ?></span>
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                </li>
                                            <?php } ?>

                                        <?php
                                        }
                                    }
                                    ?> 
                                </ul>
                            </div>			
                        </div>
                        <div class="col-lg-4 col-md-5 col-sm-12">
                            <div class="front_preview">
                                <div class="layout_gallery">
                                            <!--Start:changes made by Aayushi Agarwal on 27th March 2020 to make preview changes-->
                                            <div class="topHeader" style="background-color: <?php echo $app_theme_color;?>;">
                                                    <div class="leftmenu">
                                                            <span class="toggleMenu"><i class="icon-bars"></i></span>
                                                    </div>
                                                    <div class="logo">
                                                       <?php  if ($logo_status==1){?>
                                                            <img src="../image/<?php echo $image_for_logo;?>" />
                                                        <?php }else{ ?>
                                                            <p><?php echo $entry_home;?></p> 
                                                        <?php } ?>
                                                    </div>
                                                    <div class="cartSection">
                                                            <span class="cartIcon"><i class="icon-shopping-cart"></i></span>
                                                    </div>
                                                    <div class="searchBar">
                                                            <span class="searchicon"><i class="icon-search"></i></span>
                                                    </div>	

                                            </div>
                                             <!--end:changes made by Aayushi Agarwal on 27th March 2020 to make preview changes-->
                                            <div class="iframe_html">
                                                <?php
                                                if (!empty($components)) {
                                                    foreach ($components as $component) {
                                                        if ($component['component_type'] == 'banner_square') {
                                                            ?>
                                                            <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                <span class="slideTitle"><?php echo $entry_tab_banner_square;  ?></span>
                                                                <span class="edit_component" id="edit_<?php echo $component['id_component'] ?>" onclick="editBannerSquareComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                                <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashBannerSquareComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                                <div class="banner_preview layout_div">
                                                               
                                                                    
                                                                    <!--Start:changes made by Aayushi Agarwal on 22nd April 2020 to make preview changes-->
                                                                    <!--<img class="banner_preview_image" src="view/image/Layout_Components/banner_square.jpg">-->
                                                                <div class="bannerSquare">
                                                                    <?php    if(isset($component['data'][0]['id'])) { ?>
                                                                        <p id="bannerSquare_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>" class="comp_heading"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></p>
                                                                    <?php foreach ($component['data'] as $cd) { ?>
                                                                    <div class="bannerSquareList" id="bannerSList_<?php echo $component['id_layout'].'_'.$component['id_component'] ?>">
                                                                        <span class="BSSection">
                                                                            <img id="bannerSquareBannerimg_<?php echo $component['id_layout'].'_'.$component['id_component'] ?>" class="bannerSquareBannerimg" src="<?php echo HTTPS_CATALOG.'image/'.str_replace(" ","%20",$cd['image_url']) ?>" style="width: 100%"/>
                                                                        </span>    
                                                                    </div>
                                                                    <?php } ?>
                                                                    <?php } else { ?>
                                                                        <?php if(isset($component['id_component'])) { 
                                                                            ?>
                                                                        <p id="bannerSquare_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>" class="comp_heading"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></p>
                                                                          <div class="bannerSquareList" id="bannerSList_<?php echo $component['id_layout'].'_'.$component['id_component'] ?>">        
                                                                     <?php } else  { ?>
                                                                         <div class="bannerSquareList" id="bannerSList">
                                                                     <?php } ?>
                                                                     <div class="bannerSquareList" id="bannerSList">
                                                                         <span class="BSSection">
                                                                         <img class="banner_preview_image" src="view/image/Layout_Components/square_banner.jpg">
                                                                         </span>
                                                                     </div>
                                                                    <?php } ?>
                                                                    <!--end:changes made by Aayushi Agarwal on 22nd April 2020 to make preview changes-->
                                                                </div>
                                                                
                                                                </div>
                                                            </li>
        <?php } else if ($component['component_type'] == 'top_category') { ?>    
                                                            <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                <span class="slideTitle"><?php echo $entry_tab_top_categories;  ?></span>
                                                                <!--span class="settings" onclick="settingFunction(this)"><i class="fa fa-gear"></i></span-->
                                                                <span class="edit_component" id="edit_<?php echo $component['id_component'] ?>" onclick="editTopCategoryComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                                <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashTopcategoryComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                                <div class="banner_preview layout_div">
                                                                    <!--Start:changes made by Aayushi Agarwal on 22nd April 2020 to make preview changes-->
                                                                    <!--<img class="banner_preview_image" src="view/image/Layout_Components/top_category.jpg">-->
                                                                    <div class="topCategories">
                                                                        <ul>
                                                                        <?php    if(isset($component['data']) && is_array($component['data'])) { 
                                                                            
                                                                        foreach ($component['data'] as $cd) { ?>
                                                                    <li>
                                                                        <span class="catSection">
                                                                            <img id="top_category_1_<?php echo $component['id_layout'].'_'.$component['id_component'] ?>" src=<?php echo HTTPS_CATALOG.'image/'.str_replace(" ","%20",$cd['image_url']) ?>>
                                                                        </span>    
                                                                    </li>
                                                                    <?php } 
                                                                    } else {
                                                                    ?>
                                                                    <?php if(isset($component['id_component'])) { ?>
                                                                    <li>
                                                                        <span class="catSection">
                                                                            <img id="top_category_1_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>" src="view/image/Layout_Components/cat1.jpg"/>
                                                                        </span>    
                                                                    </li>
                                                                    <li>
                                                                        <span class="catSection">
                                                                            <img id="top_category_2_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>" src="view/image/Layout_Components/cat2.jpg"/>
                                                                        </span>    
                                                                    </li>
                                                                    <li>
                                                                        <span class="catSection">
                                                                            <img id="top_category_3_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>" src="view/image/Layout_Components/cat3.jpg"/>
                                                                         </span>     
                                                                    </li>
                                                                    <li>
                                                                        <span class="catSection">
                                                                            <img id="top_category_4_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>" src="view/image/Layout_Components/cat4.jpg"/>
                                                                        </span>    
                                                                    </li>
                                                                    <?php } else  { ?>
                                                                        <li>
                                                                            <span class="catSection">
                                                                                <img id="top_category_1" src="view/image/Layout_Components/cat1.jpg"/>
                                                                            </span>    
                                                                        </li>
                                                                        <li>
                                                                            <span class="catSection">
                                                                                <img id="top_category_2" src="view/image/Layout_Components/cat2.jpg"/>
                                                                            </span>    
                                                                        </li>
                                                                        <li>
                                                                            <span class="catSection">
                                                                                <img id="top_category_3" src="view/image/Layout_Components/cat3.jpg"/>
                                                                             </span>     
                                                                        </li>
                                                                        <li>
                                                                            <span class="catSection">
                                                                                <img id="top_category_4" src="view/image/Layout_Components/cat4.jpg"/>
                                                                            </span>    
                                                                        </li>
                                                                    <?php } ?>
                                                                    <?php } ?>
                                                                        </ul>
                                                                    </div>
                                                                    <!--end:changes made by Aayushi Agarwal on 22nd April 2020 to make preview changes-->  
                                                                </div>
                                                            </li>
        <?php } else if ($component['component_type'] == 'products_horizontal') { ?>     
                                                            <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>" style="position: relative; top: 0px; left: 0px;">
                                                                <span class="slideTitle"><?php echo $entry_tab_product_horizontal;  ?></span>
                                                                <span class="edit_component" id="edit_<?php echo $component['id_component'] ?>" onclick="editProductHorizontalComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                                <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashProductHorizontalComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                                <div class="banner_preview layout_div">
                                                                    <h4 class="comp_heading" id="slidingProducts_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></h4>
                                                            
                                                                    <?php    if(isset($component['id_component'])) { ?>
                                                                    <div class="slidingBannersScroll" id="product_sliding_banner_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                    <?php } else { ?>
                                                                        <div class="slidingBannersScroll" id="product_sliding_banner">
                                                                    <?php } ?>
                                                                    <?php    if(isset($component['product_data'][0])) { ?>
                                                            <div class="slidingProducts" id="slidingPRow1">		
                                                        <?php foreach ($component['product_data'] as $key=>$cd) { ?>
                                                                <?php if($key < 3) { ?>
                                                            <div class="productSlideList" id="productSlideList<?php echo $key; ?>">			
                                                                
                                                                <img class="slidingProductsimg" id="slidingProductsimg<?php echo $key; ?>" src="<?php echo $cd['src']; ?>"/>
                                                                <div class="productContent">
                                                                    <div class="productInfo">
                                                                        <h5 id ="productName"><?php echo $cd['name']; ?></h5>
                                                                        <h6 id="productPrice" class="productPPrice"><?php echo $cd['price']; ?></h6>
                                                                    </div>
                                                                    <div class="wishlistProduct">
                                                                        <i class="fa fa-heart-o"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                                <?php } ?>
                                                                    
                                                               
                                                            

                                                        <?php } ?>
                                                        </div>
                                                        <?php }else  { ?>
                                                                    <div class="slidingProducts" id="slidingPRow1">							
                                                                        <div class="productSlideList" id="productSlideList1">
                                                                            <img class="slidingProductsimg" id="slidingProductsimg1" src="view/image/Layout_Components/product1.jpg"/>
                                                                            <div class="productContent">
                                                                                <div class="productInfo">
                                                                                    <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                                    <h6 id="productPrice" class="productPPrice">$100</h6>
                                                                                </div>
                                                                                <div class="wishlistProduct">
                                                                                    <i class="fa fa-heart-o"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="productSlideList" id="productSlideList2">
                                                                            <img class="slidingProductsimg" id="slidingProductsimg2" src="view/image/Layout_Components/product2.jpg"/>
                                                                            <div class="productContent">
                                                                                <div class="productInfo">
                                                                                    <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                                    <h6 id="productPrice" class="productPPrice">$100</h6>
                                                                                </div>
                                                                                <div class="wishlistProduct">
                                                                                    <i class="fa fa-heart-o"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="productSlideList" id="productSlideList3">
                                                                            <img class="slidingProductsimg" id="slidingProductsimg3" src="view/image/Layout_Components/product3.jpg"/>
                                                                            <div class="productContent">
                                                                                <div class="productInfo">
                                                                                    <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                                    <h6 id="productPrice" class="productPPrice">$100</h6>
                                                                                </div>
                                                                                <div class="wishlistProduct">
                                                                                    <i class="fa fa-heart-o"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                        <?php } ?>
                                                                </div>
                                                            </li>
        <?php } else if ($component['component_type'] == 'products_square') { ?>
                                                            <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                <span class="slideTitle"><?php echo $entry_tab_product_square;  ?> </span>
                                                                <span class="edit_component" id="edit_<?php echo $component['id_component'] ?>" onclick="editProductHorizontalComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                                <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashProductHorizontalComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                                <div class="banner_preview layout_div">
                                                                    <h4 id="productSquare_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>" class="comp_heading"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></h4>
                                                                    <?php    
                                                                    if(isset($component['product_data'][0])) { ?>
                                                                        
                                                                        <?php foreach ($component['product_data'] as $cd) { ?>
                                                                            <div id="product_square_list_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                            <div class="productSquareList" id="productSList">
                                                                                    <img id="productSquareimg" class="productSquareimg" src="<?php echo $cd['src'] ?>"/>
                                                                                    <div class="productContent">
                                                                                            <div class="productInfo">
                                                                                                    <h5 id ="productName"><?php echo $cd['name'] ?></h5>
                                                                                                    <h6 id="productPrice" class="productPPrice"><?php echo $cd['price'] ?></h6>
                                                                                            </div>
                                                                                            <div class="wishlistProduct">
                                                                                                    <i class="fa fa-heart-o"></i>
                                                                                            </div>
                                                                                    </div>
                                                                            </div>
                                                                        <?php } }else  { ?>
                                                                           <?php    if(isset($component['id_component'])) { ?>
                                                                            <div id="product_square_list_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                            <?php } else { ?>
                                                                                <div id="product_square_list">
                                                                            <?php } ?>  
                                                                            <div class="productSquareList" id="productSList">
                                                                                    <img id="productSquareimg" class="productSquareimg" src="view/image/Layout_Components/product-square.jpg"/>
                                                                                    <div class="productContent">
                                                                                            <div class="productInfo">
                                                                                                    <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                                                    <h6 id="productPrice" class="productPPrice">$100</h6>
                                                                                            </div>
                                                                                            <div class="wishlistProduct">
                                                                                                    <i class="fa fa-heart-o"></i>
                                                                                            </div>
                                                                                    </div>
                                                                            </div>
                                                                        <?php } ?>
                                                                </div>
                                                            </li>
        <?php } else if ($component['component_type'] == 'products_recent') { ?>
                                                            <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                <span class="slideTitle"><?php echo $entry_tab_product_recent;  ?></span>
                                                                <span class="edit_component" id="edit_<?php echo $component['id_component'] ?>" onclick="editProductLAFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                                <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashLastAccessComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                                <div class="banner_preview layout_div">
                                                                    <h4 class="comp_heading"><?php echo $entry_tab_product_recent;  ?></h4>
                                                                    <div class="slidingProducts">
                                                                        <?php foreach ($recent_products as $rp) { ?>
                                                                        <div class="productSlideList">
                                                                            <img class="slidingProductsimg" src="<?php echo $rp['src'];  ?>">
                                                                            <div class="productContent">
                                                                                <div class="productInfo">
                                                                                    <h5 id ="productName"><?php echo $rp['name'];  ?></h5>
                                                                                    <h6 id="productPrice" class="productPPrice"><?php echo $rp['price'];  ?></h6>
                                                                                </div>
                                                                                <div class="wishlistProduct">
                                                                                    <i class="fa fa-heart-o"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <?php } ?>
                                                                    </div>
                                                                </div>
                                                            </li>
        <?php } else if ($component['component_type'] == 'products_grid') { ?>
                                                            <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                <span class="slideTitle"><?php echo $entry_tab_product_grid;  ?></span>
                                                                <span class="edit_component" id="edit_<?php echo $component['id_component'] ?>" onclick="editProductHorizontalComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                                <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashProductHorizontalComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                                <div class="banner_preview layout_div">
                                                                    <?php    if(isset($component['product_data'][0])) { ?>
                                                                <p class="comp_heading" id="productGrid_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></p>
                                                                <div id="product_grid_list_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">				
                                                                <div class="productGridRow1" id="productGRow1">
                                                        <?php foreach ($component['product_data'] as $key=>$cd) { ?>
                                                            
                                                                    <div class="productGridList" >
                                                                        <img id="productGridimg1"  src="<?php echo $cd['src']; ?>"/>
                                                                        <div class="productContent">
                                                                            <div class="productInfo">
                                                                                <h5 id ="productName"><?php echo $cd['name']; ?></h5>
                                                                                <h6 id="productPrice" class="productPPrice"><?php echo $cd['price']; ?></h6>
                                                                            </div>
                                                                            <div class="wishlistProduct">
                                                                                <i class="fa fa-heart-o"></i>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                
                                                        <?php } ?>
                                                        </div>
                                                            </div>
                                                        <?php } else  { ?>
                                                            <?php    if(isset($component['id_component'])) { ?>
                                                                <p class="comp_heading" id="productGrid_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></p>
                                                                <div id="product_grid_list_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                <?php } else { ?>
                                                                <p class="comp_heading" id="productGrid_comp_heading"></p>
                                                                <div class="productGrid" id="product_grid_list">
                                                            <?php } ?> 
                                                            					
                                                            <div class="productGridRow1" id="productGRow1">
                                                                <div class="productGridList" >
                                                                    <img id="productGridimg1"  src="view/image/Layout_Components/pg1.jpg"/>
                                                                    <div class="productContent">
                                                                        <div class="productInfo">
                                                                            <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                            <h6 id="productPrice" class="productPPrice">$100</h6>
                                                                        </div>
                                                                        <div class="wishlistProduct">
                                                                            <i class="fa fa-heart-o"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="productGridList">
                                                                    <img id="productGridimg1"  src="view/image/Layout_Components/pg2.jpg"/>
                                                                    <div class="productContent">
                                                                        <div class="productInfo">
                                                                            <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                            <h6 id="productPrice" class="productPPrice">$100</h6>
                                                                        </div>
                                                                        <div class="wishlistProduct">
                                                                            <i class="fa fa-heart-o"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="productGridList">
                                                                    <img id="productGridimg1"  src="view/image/Layout_Components/pg3.jpg"/>
                                                                    <div class="productContent">
                                                                        <div class="productInfo">
                                                                            <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                            <h6 id="productPrice" class="productPPrice">$100</h6>
                                                                        </div>
                                                                        <div class="wishlistProduct">
                                                                            <i class="fa fa-heart-o"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="productGridList">
                                                                    <img id="productGridimg1"  src="view/image/Layout_Components/pg4.jpg"/>
                                                                    <div class="productContent">
                                                                        <div class="productInfo">
                                                                            <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                            <h6 id="productPrice" class="productPPrice">$100</h6>
                                                                        </div>
                                                                        <div class="wishlistProduct">
                                                                            <i class="fa fa-heart-o"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <?php } ?>
                                                                </div>
                                                            </li>
        <?php } else if ($component['component_type'] == 'banners_grid') { ?>
                                                            <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                 <div class="bannerGrid">						
                                                                    <?php    if(isset($component['data'][0]['id'])) { ?>
                                                                        <h4 class="comp_heading" id="bannerGrid_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></h4>
        
                                                                    <?php foreach ($component['data'] as $key=>$cd) { ?>
                                                                        <?php if($key < 4) { $flag = 1; ?>
                                                                             <div class="bannerGridRow" id="bannerGRow1">
                                                                        <?php } else if($key > 3) { $flag = 1; ?>
                                                                             <div class="bannerGridRow" id="bannerGRow2">
                                                                        <?php } else { $flag = 0; } ?>    
                                                                            <div class="bannerGridList">
                                                                                <span class="BGSection">
                                                                                    <img id="bannerGridimg<?php echo $key; ?>" class="bannerGridimg" src="<?php echo HTTPS_CATALOG.'image/'.str_replace(" ","%20",$cd['image_url']) ?>"/>
                                                                                </span>    
                                                                            </div>
                                                                        <?php if($flag) { ?>
                                                                                 </div> 
                                                                        <?php } ?>
                                                                    <?php } ?>
                                                                    <?php } else { ?>
                                                                    <?php if(isset($component['data'][0]['heading'])) { ?>
                                                                    <h4 class="comp_heading" id="bannerGrid_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></h4>
                                                                    <?php } else  { ?>
                                                                    <h4 class="comp_heading" id="bannerGrid_comp_heading"></h4>
                                                                    <?php } ?>
                                                                    <div class="bannerGridRow" id="bannerGRow1">
                                                                            <div class="bannerGridList">
                                                                                <span class="BGSection">
                                                                                    <img id="bannerGridimg1" class="bannerGridimg1" src="view/image/Layout_Components/BS1.jpg"/>
                                                                                </span>    
                                                                            </div>
                                                                            <div class="bannerGridList">
                                                                                <span class="BGSection">
                                                                                    <img id="bannerGridimg2" class="bannerGridimg2" src="view/image/Layout_Components/BS2.jpg"/>
                                                                                </span>    
                                                                            </div>
                                                                            <div class="bannerGridList">
                                                                                <span class="BGSection">
                                                                                    <img id="bannerGridimg3" class="bannerGridimg3" src="view/image/Layout_Components/BS3.jpg"/>
                                                                                </span>    
                                                                            </div>
                                                                            <div class="bannerGridList">
                                                                                <span class="BGSection">
                                                                                    <img id="bannerGridimg4" class="bannerGridimg4" src="view/image/Layout_Components/BS4.jpg"/>
                                                                                </span>    
                                                                            </div>
                                                                        </div>
                                                                    <?php } ?> 
                                                                </div>
                                                            </li>
        <?php } else if ($component['component_type'] == 'banner_horizontal_slider') { ?>
                                                            <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                <span class="slideTitle"><?php echo $entry_tab_banner_sliding;  ?></span>
                                                                <span class="edit_component" id="edit_<?php echo $component['id_component'] ?>" onclick="editBannerSquareComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                                <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashBannerSquareComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                                <div class="banner_preview layout_div">
                                                                <!--start:changes made by Aayushi Agarwal on 22nd April 2020 to make preview changes-->
                                                                <!--<img class="banner_preview_image" src="view/image/Layout_Components/banner_horizontal_sliding.jpg">-->
                                                                
                                                                <div class="bannerHorizontalSlide">
                                                                        
                                                                    <?php    if(isset($component['data'][0]['id'])) { ?>
                                                                        <h4 class="comp_heading" id="bannerHorizontalSlide_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></h4>
                                                                    <?php  } else if($component['id_component'])  { ?>
                                                                    <h4 class="comp_heading" id="bannerHorizontalSlide_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></h4>
                                                                    <?php } else  { ?>
                                                                    <h4 class="comp_heading" id="bannerHorizontalSlide_comp_heading"></h4>
                                                                    <?php } ?>
                                                                    <div class="slidingBannersScroll">
                                                                                <?php if(isset($component['id_component']))  { ?>
                                                                                        <div class="slidingBanners" id="slidingBList_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                                    <?php } else  { ?>        
                                                                                        <div class="slidingBanners" id="slidingBList">
                                                                                    <?php } ?> 
                                                                                    <?php if(isset($component['data'][0]['id'])) { ?>
                                                                                        <?php foreach ($component['data'] as $key=> $cd) { ?>
                                                                                            <?php if($key < 2) { ?>
                                                                                            <div class="bannerHorizontalSlideList" id="bannerHorizontalSlideList1">
                                                                                                <span class="BHSSection">    
                                                                                                    <img id="bannerHorizontalSlideimg_<?php echo $key; ?>_<?php echo $component['id_layout'].'_'.$component['id_component'] ?>" class="bannerHorizontalSlideimg1" src="<?php echo HTTPS_CATALOG.'image/'.str_replace(" ","%20",$cd['image_url']) ?>"/>
                                                                                                </span>
                                                                                            </div>
                                                                                            <?php } ?>
                                                                                        <?php } }else  { ?>
                                                                                            <div class="bannerHorizontalSlideList" id="bannerHorizontalSlideList1">
                                                                                                <span class="BHSSection">    
                                                                                                    <img id="bannerHorizontalSlideimg_1_<?php echo $component['id_layout'].'_'.$component['id_component'] ?>" class="bannerHorizontalSlideimg1" src="view/image/Layout_Components/BHS1.jpg"/>
                                                                                                </span>
                                                                                            </div>
                                                                                            <div class="bannerHorizontalSlideList" id="bannerHorizontalSlideList2">
                                                                                                <span class="BHSSection">    
                                                                                                    <img id="bannerHorizontalSlideimg_2_<?php echo $component['id_layout'].'_'.$component['id_component'] ?>" class="bannerHorizontalSlideimg2" src="view/image/Layout_Components/BHS2.jpg"/>
                                                                                                </span>    
                                                                                            </div>
                                                                                        <?php } ?>
                                                                                </div>
                                                                        </div>
                                                                    
                                                                </div>
                                                                <!--end:changes made by Aayushi Agarwal on 22nd April 2020 to make preview changes-->                        
                                                                </div>
                                                            </li>
        <?php } else if ($component['component_type'] == 'banners_countdown') { ?>  
                                                            <li class="slide" id="layout_component_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                <span class="edit_component" id="delete_<?php echo $component['id_component'] ?>" onclick="editBannerCountdownComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                                                <span class="trash" id="delete_<?php echo $component['id_component'] ?>" onclick="trashBannerCountdownComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                                                <div class="banner_preview layout_div">
                                                                    <?php    if(isset($component['data'][0]['id'])) { ?>
                                                                    <h4 class="comp_heading" id="bannerCountdown_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></h4>
                                                                    <div id="bannerCountdownList_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                    <?php foreach ($component['data'] as $cd) { 
                                                                       
                                                                        ?>
                                                                        <div class="countdownlistContent">
                                                                            <div class="countdownBackground" id="bannerCountdownimg" style="background:url('<?php echo HTTPS_CATALOG.'image/'.str_replace(" ","%20",$cd['image_url']) ?>');background-size: 300px 220px;">
                                                                                    <div id="days"></div>
                                                                    <div class="countDownTimer" <?php if(isset($cd['background_color'])) { ?> style="background:<?php echo $cd['background_color'];  ?>" <?php } else { ?> style="background:transparent;" <?php } ?>>
                                                                                            <span class="timer" style="color:<?php echo $cd['text_color'] ?>">23 <?php echo 'Hours'  ?></span>
                                                                                            <span class="timer" style="color:<?php echo $cd['text_color'] ?>">21 <?php echo 'Minutes'  ?></span>
                                                                                            <span class="timer" style="color:<?php echo $cd['text_color'] ?>">49 <?php echo 'Seconds'  ?></span>
                                                                                    </div>
                                                                            </div>
                                                                        </div>
                                                                    <?php } ?> 
                                                                    </div>
                                                                    <?php }else  { ?>
                                                                    <?php if(isset($component['data'][0]['heading'])) { ?>
                                                                        <h4 class="comp_heading" id="bannerCountdown_comp_heading_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>"><?php echo $component['data'][0]['heading'][0]['heading'];  ?></h4>
                                                                    <?php } else { ?>
                                                                        <h4 class="comp_heading" id="bannerCountdown_comp_heading"></h4>
                                                                    <?php } ?>
                                                                    <?php if(isset($component['id_component'])) { ?>
                                                                    <div id="bannerCountdownList_<?php echo $component['id_layout'] ?>_<?php echo $component['id_component'] ?>">
                                                                    <?php } else { ?>
                                                                        <div id="bannerCountdownList>
                                                                    <?php } ?>    
                                                                    
                                                                        <div class="countdownlistContent">
                                                                            <div class="countdownBackground" id="bannerCountdownimg" style="background:url('view/image/Layout_Components/flash-sale.jpg')">
                                                                                    <div id="days"></div>
                                                                                    <div class="countDownTimer" style="background:transparent;">
                                                                                            <span class="timer">23 <?php echo 'Hours'  ?></span>
                                                                                            <span class="timer">21 <?php echo 'Minutes'  ?></span>
                                                                                            <span class="timer">49 <?php echo 'Seconds'  ?></span>
                                                                                    </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <?php } ?>
                                                                </div>
                                                            </li>
                                                        <?php } ?>
    <?php
    }
}
?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>			
                        </div>
                        <!--Dynamic HTML structure-->
                        
                        <div class="top_category" style="display:none;">
                            <li class="slide" id="component_position">
                                <span class="slideTitle"><?php echo $entry_tab_top_categories;  ?></span>
                                <!--span class="settings" onclick="settingFunction(this)"><i class="fa fa-gear"></i></span-->
                                <span class="edit_component" id="top_category_edit_component" onclick="editTopCategoryComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                <span class="trash" id="top_category_delete_component" onclick="trashTopcategoryComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                <div class="banner_preview layout_div">
                                    <div class="topCategories">
                                         <ul>
                                            <li>
                                                <span class="catSection">
                                                    <img id="top_category_1" src="view/image/Layout_Components/cat1.jpg"/>
                                                </span>    
                                            </li>
                                            <li>
                                                <span class="catSection">
                                                    <img id="top_category_2" src="view/image/Layout_Components/cat2.jpg"/>
                                                </span>    
                                            </li>
                                            <li>
                                                <span class="catSection">
                                                    <img id="top_category_3" src="view/image/Layout_Components/cat3.jpg"/>
                                                 </span>     
                                            </li>
                                            <li>
                                                <span class="catSection">
                                                    <img id="top_category_4" src="view/image/Layout_Components/cat4.jpg"/>
                                                </span>    
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </div>
                        <div class="banner-slide" id="banner_slider_id" style="display:none;">
                            <li class="slide" id="component_position">
                                <span class="slideTitle"><?php echo $entry_tab_banner_square;  ?></span>
                                <span class="edit_component" id="banner_square_edit_component" onclick="editBannerSquareComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                <span class="trash" id="banner_square_delete_component" onclick="trashBannerSquareComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                <div class="banner_preview layout_div">
                                    <div class="bannerSquare">
                                    <p id="bannerSquare_comp_heading" class="comp_heading"><?php echo $entry_tab_banner_square;  ?></p>
                                    <div class="bannerSquareList" id="bannerSList">
                                        <span class="BSSection">
                                            <img id="bannerSquareBannerimg_1" class="bannerSquareBannerimg" src="view/image/Layout_Components/square_banner.jpg" style="width: 100%"/>
                                        </span>    
                                    </div>
                                </div> 
                                </div>
                            </li>
                        </div>
                        <div class="Hbanner-slide" id="banner_horizontal_id" style="display:none;">
                            <li class="slide" id="component_position">
                                <span class="slideTitle"><?php echo $entry_tab_banner_sliding;  ?></span>
                                <span class="edit_component" id="banner_horizontal_edit_component" onclick="editBannerSquareComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                <span class="trash" id="banner_horizontal_delete_component" onclick="trashBannerSquareComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                <div class="banner_preview layout_div">
                                    <!--start:changes made by Aayushi Agarwal on 22nd April 2020 to make preview changes-->
                                    <!--<img class="banner_preview_image" src="view/image/Layout_Components/banner_horizontal_sliding.jpg">-->
                                    <div class="bannerHorizontalSlide">
                                        <h4 class="comp_heading" id="bannerHorizontalSlide_comp_heading"><?php echo $entry_tab_banner_sliding;  ?></h4>
                                        <div class="slidingBannersScroll">
                                                <div class="slidingBanners" id="slidingBList">
                                                    <div class="bannerHorizontalSlideList" id="bannerHorizontalSlideList_1">
                                                        <span class="BHSSection">    
                                                            <img id="bannerHorizontalSlideimg_1" class="bannerHorizontalSlideimg_1" src="view/image/Layout_Components/BHS1.jpg"/>
                                                        </span>
                                                    </div>
                                                    <div class="bannerHorizontalSlideList" id="bannerHorizontalSlideList_2">
                                                        <span class="BHSSection">    
                                                            <img id="bannerHorizontalSlideim_2" class="bannerHorizontalSlideimg_2" src="view/image/Layout_Components/BHS2.jpg"/>
                                                        </span>    
                                                    </div>
                                                </div>
                                        </div>
                                    </div>
                                    <!--end:changes made by Aayushi Agarwal on 22nd April 2020 to make preview changes-->                        
                                </div>
                            </li>
                        </div>
                        <div class="banner-grid" id="banner_grid_id" style="display:none;">
                            <li class="slide" id="component_position">
                                <span class="slideTitle"><?php echo $entry_tab_banner_grid;  ?></span>
                                <span class="edit_component" id="banner_grid_edit_component" onclick="editBannerSquareComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                <span class="trash" id="banner_grid_delete_component" onclick="trashBannerSquareComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                <div class="banner_preview layout_div">
                                    <!--start:changes made by Aayushi Agarwal on 22nd April 2020 to make preview changes-->
                                    <!--<img class="banner_preview_image" src="view/image/Layout_Components/banner_grid.jpg">-->
                                    <div class="bannerGrid">						
                                        <h4 class="comp_heading" id="bannerGrid_comp_heading"><?php echo $entry_tab_banner_grid;  ?></h4>
                                        <div class="bannerGridRow" id="bannerGRow1">
                                                <div class="bannerGridList">
                                                    <span class="BGSection">
                                                        <img id="bannerGridimg1" class="bannerGridimg1" src="view/image/Layout_Components/BS1.jpg"/>
                                                    </span>    
                                                </div>
                                                <div class="bannerGridList">
                                                    <span class="BGSection">
                                                        <img id="bannerGridimg2" class="bannerGridimg2" src="view/image/Layout_Components/BS2.jpg"/>
                                                    </span>    
                                                </div>
                                                <div class="bannerGridList">
                                                    <span class="BGSection">
                                                        <img id="bannerGridimg3" class="bannerGridimg3" src="view/image/Layout_Components/BS3.jpg"/>
                                                    </span>    
                                                </div>
                                                <div class="bannerGridList">
                                                    <span class="BGSection">
                                                        <img id="bannerGridimg4" class="bannerGridimg4" src="view/image/Layout_Components/BS4.jpg"/>
                                                    </span>    
                                                </div>
                                            </div>
                                            <div class="bannerGridRow1" id="bannerGRow" style="display:none">
                                            <div class="bannerGridList">
                                                <span class="BGSection">
                                                    <img id="bannerGridimg1" class="bannerGridimg" src="view/image/Layout_Components/product.jpg"/>
                                                </span>    
                                            </div>
                                        </div>
                                    </div>
                                    <!--end:changes made by Aayushi Agarwal on 22nd April 2020 to make preview changes-->            
                                </div>
                            </li>
                        </div>
                        <div class="banner-countdown" id="banner_countdown_id" style="display:none;">
                            <li class="slide" id="component_position">
                                <span class="slideTitle"><?php echo $entry_tab_banner_countdown;  ?></span>
                                <span class="edit_component" id="banner_countdown_delete_component" onclick="editBannerCountdownComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                <span class="trash" id="banner_countdown_delete_component" onclick="trashBannerCountdownComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                <div class="banner_preview layout_div">
                                    <h4 class="comp_heading" id="bannerCountdown_comp_heading"><?php echo $entry_tab_banner_countdown;  ?></h4>
                                    <div class="countdownlist" id="bannerCountdownList">
                                        <div class="countdownlistContent">
                                            <div class="countdownBackground" id="bannerCountdownimg" style="background:url('view/image/Layout_Components/flash-sale.jpg')">
                                                    <div id="days"></div>
                                                    <div class="countDownTimer" style="background:transparent;">
                                                            <span class="timer">23 <?php echo 'Hours'  ?></span>
                                                            <span class="timer">21 <?php echo 'Minutes'  ?></span>
                                                            <span class="timer">49 <?php echo 'Seconds'  ?></span>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="countdownlistContentContainer1" style="display:none;">
                                            <div class="countdownlistContent">
                                                <div class="countdownBackground" id="bannerCountdownimg1" style="background:url('view/image/Layout_Components/flash-sale.jpg')">
                                                        <div id="days"></div>
                                                        <div class="countDownTimer" style="background:background_color_of_timer_text;">
                                                                <span class="timer">23 <?php echo 'Hours'  ?></span>
                                                                <span class="timer">21 <?php echo 'Minutes'  ?></span>
                                                                <span class="timer">49 <?php echo 'Seconds'  ?></span>
                                                        </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </div>
                        <div class="product-square" id="product_square_id" style="display:none;">
                            <li class="slide" id="component_position">
                                <span class="slideTitle"><?php echo $entry_tab_product_square;  ?></span>
                                <span class="edit_component" id="product_square_edit_component" onclick="editProductHorizontalComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                <span class="trash" id="product_square_delete_component" onclick="trashProductHorizontalComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                <div class="banner_preview layout_div">
                                    <h4 id="productSquare_comp_heading" class="comp_heading"><?php echo $entry_tab_product_square;  ?></h4>
                                    <div id="product_square_list">
                                        <div class="productSquareList" id="productSList">
                                                <img id="productSquareimg" class="productSquareimg" src="view/image/Layout_Components/product-square.jpg"/>
                                                <div class="productContent">
                                                        <div class="productInfo">
                                                                <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                                <h6 id="productPrice" class="productPPrice">$100</h6>
                                                        </div>
                                                        <div class="wishlistProduct">
                                                                <i class="fa fa-heart-o"></i>
                                                        </div>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </div>
                        <div class="Hproduct-slide" id="product_horizontal_slide_id" style="display:none;">
                            <li class="slide" id="component_position">
                                <span class="slideTitle"><?php echo $entry_tab_product_horizontal;  ?></span>
                                <span class="edit_component" id="product_horizontal_edit_component" onclick="editProductHorizontalComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                <span class="trash" id="product_horizontal_delete_component" onclick="trashProductHorizontalComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                <div class="banner_preview layout_div">
                                    <h4 class="comp_heading" id="slidingProducts_comp_heading"><?php echo $entry_tab_product_horizontal;  ?></h4>
                                    <div class="slidingBannersScroll" id="product_sliding_banner">
                                        <div class="slidingProducts" id="slidingPRow1">							
                                            <div class="productSlideList" id="productSlideList1">
                                                <img class="slidingProductsimg" id="slidingProductsimg1" src="view/image/Layout_Components/product1.jpg"/>
                                                <div class="productContent">
                                                    <div class="productInfo">
                                                        <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                        <h6 id="productPrice" class="productPPrice">$100</h6>
                                                    </div>
                                                    <div class="wishlistProduct">
                                                        <i class="fa fa-heart-o"></i>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="productSlideList" id="productSlideList2">
                                                <img class="slidingProductsimg" id="slidingProductsimg2" src="view/image/Layout_Components/product2.jpg"/>
                                                <div class="productContent">
                                                    <div class="productInfo">
                                                        <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                        <h6 id="productPrice" class="productPPrice">$100</h6>
                                                    </div>
                                                    <div class="wishlistProduct">
                                                        <i class="fa fa-heart-o"></i>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="productSlideList" id="productSlideList3">
                                                <img class="slidingProductsimg" id="slidingProductsimg3" src="view/image/Layout_Components/product3.jpg"/>
                                                <div class="productContent">
                                                    <div class="productInfo">
                                                        <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                        <h6 id="productPrice" class="productPPrice">$100</h6>
                                                    </div>
                                                    <div class="wishlistProduct">
                                                        <i class="fa fa-heart-o"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </li>
                        </div>
                        <div class="product-grid" id="product_grid_id" style="display:none;">
                            <li class="slide" id="component_position">
                                <span class="slideTitle"><?php echo $entry_tab_product_grid;  ?></span>
                                <span class="edit_component" id="product_grid_edit_component" onclick="editProductHorizontalComponentFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                <span class="trash" id="product_grid_delete_component" onclick="trashProductHorizontalComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                <div class="banner_preview layout_div">
                                    <p class="comp_heading" id="productGrid_comp_heading"><?php echo $entry_tab_product_grid;  ?></p>
                                    <div class="productGrid" id="product_grid_list">						
                                        <div class="productGridRow1" id="productGRow1">
                                            <div class="productGridList" >
                                                <img id="productGridimg1"  src="view/image/Layout_Components/pg1.jpg"/>
                                                <div class="productContent">
                                                    <div class="productInfo">
                                                        <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                        <h6 id="productPrice" class="productPPrice">$100</h6>
                                                    </div>
                                                    <div class="wishlistProduct">
                                                        <i class="fa fa-heart-o"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="productGridList">
                                                <img id="productGridimg1"  src="view/image/Layout_Components/pg2.jpg"/>
                                                <div class="productContent">
                                                    <div class="productInfo">
                                                        <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                        <h6 id="productPrice" class="productPPrice">$100</h6>
                                                    </div>
                                                    <div class="wishlistProduct">
                                                        <i class="fa fa-heart-o"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="productGridList">
                                                <img id="productGridimg1"  src="view/image/Layout_Components/pg3.jpg"/>
                                                <div class="productContent">
                                                    <div class="productInfo">
                                                        <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                        <h6 id="productPrice" class="productPPrice">$100</h6>
                                                    </div>
                                                    <div class="wishlistProduct">
                                                        <i class="fa fa-heart-o"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="productGridList">
                                                <img id="productGridimg1"  src="view/image/Layout_Components/pg4.jpg"/>
                                                <div class="productContent">
                                                    <div class="productInfo">
                                                        <h5 id ="productName"><?php echo 'Product Name';  ?></h5>
                                                        <h6 id="productPrice" class="productPPrice">$100</h6>
                                                    </div>
                                                    <div class="wishlistProduct">
                                                        <i class="fa fa-heart-o"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </div>
                        <div class="product-lastAccess" id="product_last_accessed_id" style="display:none;">
                            <li class="slide" id="component_position">
                                <span class="slideTitle"><?php echo $entry_tab_product_recent;  ?></span>
                                <span class="edit_component" id="edit_<?php echo $component['id_component'] ?>" onclick="editProductLAFunction(this)"><i class="icon-pencil" style="padding-right:5px"></i></span>
                                <span class="trash" id="last_access_delete_component" onclick="trashLastAccessComponentFunction(this)"><i class="icon-trash" style="padding-right:5px"></i></span>
                                <div class="banner_preview layout_div">
                                    <h4 class="comp_heading"><?php echo $entry_tab_product_recent;  ?></h4>
                                    <div class="slidingProducts">
                                        <?php foreach ($recent_products as $rp) { ?>
                                        <div class="productSlideList">
                                            <img class="slidingProductsimg" src="<?php echo $rp['src'];  ?>">
                                            <div class="productContent">
                                                <div class="productInfo">
                                                    <h5 id ="productName"><?php echo $rp['name'];  ?></h5>
                                                    <h6 id="productPrice" class="productPPrice"><?php echo $rp['price'];  ?></h6>
                                                </div>
                                                <div class="wishlistProduct">
                                                    <i class="fa fa-heart-o"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </li>
                        </div>
                        <input type="hidden" id="number_of_component" value="<?php echo $number_of_components; ?>">
                        <input type="hidden" id="id_layout" value="<?php echo $id_layout; ?>">
                        <input type="hidden" id="id_component_selected" value="0">
                        <input type="hidden" id="id_layout_name_selected" value="0">
                        <img id="kbsw_show_loader" style="width:50px;height:50px;display:none;" src="view/image/Layout_Components/show_loader.gif">
                    </div>
                    <div class="modal fade" id="topCategoryModal"  tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                        <div class="modal-dialog" role="document" style="width: 800px">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="gridSystemModalLabel"><?php echo $entry_edit_component; ?></h4>
                                </div>
                                <div id="top-category-message">
                                </div>
                                <div class="modal-body">
                                    <div class="row" style="font-size: 14px;">
                                        <div id="sync_message"></div>
                                        <div class="col-sm-12">
                                            <form action="" method="post" enctype="multipart/form-data" id="form-new-notification" class='form-horizontal'>
                                                <div class="form-group required" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-title"><?php echo $entry_image_content_mode; ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="image_content_mode" id="image-content-mode" class="form-control">
                                                            <option value="0"><?php echo $select_scale_aspect_fill; ?></option>
                                                            <option value="1" selected="selected"><?php echo $select_scale_aspect_fit; ?></option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group required" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-title"><?php echo $entry_select_first_category; ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="category_list_1" id="category-list-1" class="form-control">
                                                            <option value="0"><?php echo $entry_select_category; ?></option>
<?php foreach ($categories as $category) { ?>
                                                                <option value="<?php echo $category['category_id'] ?>"><?php echo $category['name'] ?></option>
<?php } ?>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-image"><?php echo $entry_category_image; ?></label>
                                                    <div class="col-sm-9">
                                                        <a href="" id="thumb-image-1" data-toggle="image" class="img-thumbnail"><img src="<?php if (!isset($thumb)) {
    echo HTTPS_SERVER . 'view/image/no_image.png';
} else {
    echo $thumb;
} ?>" id="category-image-src-1" height="100px !important;" width="100px !important;" alt="" title=""/></a>
                                                        <input type="hidden" name="category_image_1" value="" id="input-category-image-1" />
                                                        <div id="image-error-1"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group required" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-title"><?php echo $entry_select_second_category; ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="category_list_2" id="category-list-2" class="form-control">
                                                            <option value="0"><?php echo $entry_select_category; ?></option>
<?php foreach ($categories as $category) { ?>
                                                                <option value="<?php echo $category['category_id'] ?>"><?php echo $category['name'] ?></option>
<?php } ?>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-image"><?php echo $entry_category_image; ?></label>
                                                    <div class="col-sm-9">
                                                        <a href="" id="thumb-image-2" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" id="category-image-src-2" height="100px !important;" width="100px !important;" alt="" title="" data-placeholder="" /></a>
                                                        <input type="hidden" name="category_image_2" value="" id="input-category-image-2" />
                                                        <div id="image-error-2"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group required" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-title"><?php echo $entry_select_third_category; ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="category_list_3" id="category-list-3" class="form-control">
                                                            <option value="0"><?php echo $entry_select_category; ?></option>
<?php foreach ($categories as $category) { ?>
                                                                <option value="<?php echo $category['category_id'] ?>"><?php echo $category['name'] ?></option>
<?php } ?>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-image"><?php echo $entry_category_image; ?></label>
                                                    <div class="col-sm-9">
                                                        <a href="" id="thumb-image-3" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" id="category-image-src-3" height="100px !important;" width="100px !important;" alt="" title="" data-placeholder="" /></a>
                                                        <input type="hidden" name="category_image_3" value="" id="input-category-image-3" />
                                                        <div id="image-error-3"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group required" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-title"><?php echo $entry_select_fourth_category; ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="category_list_4" id="category-list-4" class="form-control">
                                                            <option value="0"><?php echo $entry_select_category; ?></option>
<?php foreach ($categories as $category) { ?>
                                                                <option value="<?php echo $category['category_id'] ?>"><?php echo $category['name'] ?></option>
<?php } ?>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-image"><?php echo $entry_category_image; ?></label>
                                                    <div class="col-sm-9">
                                                        <a href="" id="thumb-image-4" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" id="category-image-src-4" height="100px !important;" width="100px !important;" alt="" title="" data-placeholder="" /></a>
                                                        <input type="hidden" name="category_image_4" value="" id="input-category-image-4" />
                                                        <div id="image-error-4"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-title"><?php echo $entry_select_fifth_category ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="category_list_5" id="category-list-5" class="form-control" onchange="showHideCategory(5);">
                                                            <option value="0"><?php echo $entry_select_category; ?></option>
<?php foreach ($categories as $category) { ?>
                                                                <option value="<?php echo $category['category_id'] ?>"><?php echo $category['name'] ?></option>
<?php } ?>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group sh" id="show-hide-category-5" style="margin-bottom: 10px; display: none;">
                                                    <label class="col-sm-3 control-label" for="input-image"><?php echo $entry_category_image; ?></label>
                                                    <div class="col-sm-9">
                                                        <a href="" id="thumb-image-5" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" id="category-image-src-5" height="100px !important;" width="100px !important;" alt="" title="" data-placeholder="" /></a>
                                                        <input type="hidden" name="category_image_5" value="" id="input-category-image-5" />
                                                        <div id="image-error-5"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-title"><?php echo $entry_select_sixth_category ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="category_list_6" id="category-list-6" class="form-control" onchange="showHideCategory(6);">
                                                            <option value="0"><?php echo $entry_select_category; ?></option>
<?php foreach ($categories as $category) { ?>
                                                                <option value="<?php echo $category['category_id'] ?>"><?php echo $category['name'] ?></option>
<?php } ?>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group sh" id="show-hide-category-6" style="margin-bottom: 10px; display: none;">
                                                    <label class="col-sm-3 control-label" for="input-image"><?php echo $entry_category_image; ?></label>
                                                    <div class="col-sm-9">
                                                        <a href="" id="thumb-image-6" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" id="category-image-src-6" height="100px !important;" width="100px !important;" alt="" title="" data-placeholder="" /></a>
                                                        <input type="hidden" name="category_image_6" value="" id="input-category-image-6" />
                                                        <div id="image-error"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-title"><?php echo $entry_select_seventh_category ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="category_list_7" id="category-list-7" class="form-control" onchange="showHideCategory(7);">
                                                            <option value="0"><?php echo $entry_select_category; ?></option>
<?php foreach ($categories as $category) { ?>
                                                                <option value="<?php echo $category['category_id'] ?>"><?php echo $category['name'] ?></option>
<?php } ?>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group sh" id="show-hide-category-7" style="margin-bottom: 10px; display:none">
                                                    <label class="col-sm-3 control-label" for="input-image"><?php echo $entry_category_image; ?></label>
                                                    <div class="col-sm-9">
                                                        <a href="" id="thumb-image-7" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" id="category-image-src-7" height="100px !important;" width="100px !important;" alt="" title="" data-placeholder="" /></a>
                                                        <input type="hidden" name="category_image_7" value="" id="input-category-image-7" />
                                                        <div id="image-error"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-title"><?php echo $entry_select_eigth_category ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="category_list_8" id="category-list-8" class="form-control" onchange="showHideCategory(8);">
                                                            <option value="0"><?php echo $entry_select_category; ?></option>
<?php foreach ($categories as $category) { ?>
                                                                <option value="<?php echo $category['category_id'] ?>"><?php echo $category['name'] ?></option>
<?php } ?>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group sh" id="show-hide-category-8" style="margin-bottom: 10px; display: none">
                                                    <label class="col-sm-3 control-label" for="input-image"><?php echo $entry_category_image; ?></label>
                                                    <div class="col-sm-9">
                                                        <a href="" id="thumb-image-8" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" id="category-image-src-8" height="100px !important;" width="100px !important;" alt="" title="" data-placeholder="" /></a>
                                                        <input type="hidden" name="category_image_8" value="" id="input-category-image-8" />
                                                        <div id="image-error"></div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                   <button type="button" class="btn btn-primary pull-right" name="submitOptionsslider2" id='saveTopCategoryComponent' onclick="return veloValidateTopcategoryForm(this);" >Save</button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                    <div class="modal fade" id="ProductLAModal"  tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                        <div class="modal-dialog" role="document" style="width: 800px">
                            <div class="modal-content" style="height: 400px">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="gridSystemModalLabel"><?php echo $entry_component_heading; ?></h4>
                                </div>
                                <div class="modal-body" style="padding: 40px !important;">
                                    <div class="form-group" style="margin-bottom: 10px;">
                                        <div class="col-sm-8">
                                         <?php foreach ($languages as $language) { ?>
                                            <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                                              <input type="text" name="product_recent[<?php echo $language['language_id']; ?>][title]" id="product-recent-<?php echo $language['language_id']; ?>" value="" placeholder="Enter Element Heading" class="form-control"/>
                                            </div>
                                        <?php } ?>
                                        </div>  
                                        <div class="col-sm-4">
                                            <button type="button" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Save" id="save-heading" onclick="saveProductLAHeading();"><i class="fa fa-save"></i> Save Component heading</button>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                    <div class="modal fade" id="BannerSquareModal"  tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                        <div class="modal-dialog" role="document" style="width: 800px">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="gridSystemModalLabel"><?php echo $entry_component_heading; ?></h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group" style="margin-bottom: 10px;">
                                        <div class="col-sm-8">
                                         <?php foreach ($languages as $language) { ?>
                                            <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                                              <input type="text" name="banner_heading[<?php echo $language['language_id']; ?>][title]" id="banner-heading-<?php echo $language['language_id']; ?>" value="" placeholder="Enter Element Heading" class="form-control"/>
                                            </div>
                                        <?php } ?>
                                        </div>  
                                        <div class="col-sm-4">
                                            <button type="button" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Save" id="save-heading" onclick="saveBannerHeading();"><i class="fa fa-save"></i> Save Component heading</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-body">
                                    <div class="row" style="font-size: 14px;">
                                        <div id="sync_message"></div>
                                        <div class="col-sm-12">
                                            <form action="" method="post" enctype="multipart/form-data" id="form-new-notification" class='form-horizontal'>
                                                <div class="form-group">
                                                    <h4 class="modal-title" id="gridSystemModalLabel">Add Banner</h4>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-image"><?php echo $entry_category_image; ?></label>
                                                    <div class="col-sm-9">
                                                        <a href="" id="bs-thumb-image" data-toggle="image" class="img-thumbnail"><img src="view/image/no_image.png" id="bs-image-src" height="100px !important;" width="100px !important;" alt="" title="" data-placeholder="" /></a>
                                                        <input type="hidden" name="bs_image_upload" value="" id="input-bs-image" />
                                                        <div id="image-error"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group required" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-title"><?php echo $entry_image_content_mode; ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="bs_image_content_mode" id="bs-image-content-mode" class="form-control">
                                                            <option value="0"><?php echo $select_scale_aspect_fill; ?></option>
                                                            <option value="1" selected="selected"><?php echo $select_scale_aspect_fit; ?></option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-bs-redirect_activity"><?php echo $column_redirect; ?></label>
                                                    <div class="col-sm-9">
                                                        <select onchange="selectBSRedirectActivity(this.value);" name="bs_redirect_activity" id="input-bs-redirect_activity" class="form-control">
                                                            <option value=""><?php echo $entry_select_redirect_activity; ?></option>
                                                            <option value="3"><?php echo $select_home; ?></option>
                                                            <option value="1"><?php echo $select_category; ?></option>
                                                            <option value="2"><?php echo $select_product; ?></option>
                                                        </select>
                                                        <div id="activity-error"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;display:none" id='div-bs-activity_link_to'>
                                                    <label class="col-sm-3 control-label" for="input-bs-activity_link_to"><?php echo  $entry_link_to;; ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="bs_activity_link_to" id="input-bs-activity_link_to" class="form-control">
<?php
echo "<option value=''>".$select_link_type_first."</option>";
?>
                                                        </select>
                                                        <div id="link-to-error"></div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" onclick="addImage();" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Add Image"><i class="fa fa-plus-circle"></i></button>
                                    <br>
                                    <br>
                                    <br>

                                    <table id="bs_images" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <td class="text-left"><?php echo $entry_serial_number; ?></td>
                                                <td class="text-left"><?php echo $column_image; ?></td>
                                                <td class="text-left"><?php echo $column_redirect; ?></td>
                                                <td class="text-left"><?php echo $column_category_id; ?></td>
                                                <td class="text-left"><?php echo $column_product_id; ?></td>
                                                <td class="text-right"><?php echo $column_delete; ?></td>
                                            </tr>
                                        </thead>
                                        <tbody id="bs_body">
                                        </tbody>
                                    </table>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->

                    <div class="modal fade" id="BannerCountdownModal"  tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                        <div class="modal-dialog" role="document" style="width: 800px">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="gridSystemModalLabel"><?php echo $entry_component_heading; ?></h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group" style="margin-bottom: 10px;">
                                        <div class="col-sm-8">
                                         <?php foreach ($languages as $language) { ?>
                                            <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                                              <input type="text" name="banner_countdown_heading[<?php echo $language['language_id']; ?>][title]" id="countdown-heading-<?php echo $language['language_id']; ?>" value="" placeholder="Enter Element Heading" class="form-control" />
                                            </div>
                                        <?php } ?>
                                        </div>  
                                        <div class="col-sm-4">
                                            <button type="button" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Save" id="save-heading" onclick="saveCountdownHeading();"><i class="fa fa-save"> Save Component Heading</i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-body">
                                    <div class="row" style="font-size: 14px;">
                                        <div id="sync_message"></div>
                                        <div class="col-sm-12">
                                            <form action="" method="post" enctype="multipart/form-data" id="form-banner-countdown" class='form-horizontal'>
                                                <div class="form-group">
                                                    <h4 class="modal-title" id="gridSystemModalLabel">Add Countdown Banner</h4>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-image"><?php echo $entry_category_image; ?></label>
                                                    <div class="col-sm-9">
                                                        <a href="" id="bc-thumb-image" data-toggle="image" class="img-thumbnail"><img src="view/image/no_image.png" id="bc-image-src" height="100px !important;" width="100px !important;" alt="" title=""/></a>
                                                        <input type="hidden" name="bc_image_upload" value="" id="input-bc-image" />
                                                        <div id="image-error"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group required" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-title"><?php echo $entry_image_content_mode; ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="bc_image_content_mode" id="bc-image-content-mode" class="form-control">
                                                            <option value="0"><?php echo $select_scale_aspect_fill; ?></option>
                                                            <option value="1" selected="selected"><?php echo $select_scale_aspect_fit; ?></option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-bc-redirect_activity"><?php echo $entry_select_redirect_activity ?></label>
                                                    <div class="col-sm-9">
                                                        <select onchange="selectBCRedirectActivity(this.value);" name="bc_redirect_activity" id="input-bc-redirect_activity" class="form-control">
                                                            <option value=""><?php echo $entry_select_redirect_activity; ?></option>
                                                            <option value="3"><?php echo $select_home; ?></option>
                                                            <option value="1"><?php echo $select_category; ?></option>
                                                            <option value="2"><?php echo $select_product; ?></option>
                                                        </select>
                                                        <div id="activity-error"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;display:none" id='div-bc-activity_link_to'>
                                                    <label class="col-sm-3 control-label" for="input-bc-activity_link_to"><?php echo  $entry_link_to; ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="bc_activity_link_to" id="input-bc-activity_link_to" class="form-control">
<?php
echo "<option value=''>".$select_link_type_first."</option>";
?>
                                                        </select>
                                                        <div id="link-to-error"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group" id='div-bc-activity_link_to'>
                                                    <label class="col-sm-3 control-label" for="input-bc-activity_link_to"><?php echo "Countdown Time Validity"; ?></label>
                                                    <div class="col-sm-9">
                                                        <div class="input-group date">
                                                            <input type="text" name="bc_countdown_validity" value="" placeholder="Date Start" data-date-format="YYYY-MM-DD HH:MM:SS" class="form-control">
                                                            <span class="input-group-btn">
                                                                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group required" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-title"><?php echo $entry_back_color ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="bc_background_color_status" id="bc-background-color-status" class="form-control">
                                                            <option value="0"><?php echo $entry_disabled ?></option>
                                                            <option value="1" selected="selected"><?php echo $entry_enabled ?></option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="<?php echo $entry_timer_back_color ?>" data-original-title="<?php echo $entry_timer_back_color ?>">
                                                           <?php echo $entry_timer_back_color ?>
                                                        </span>
                                                    </label>
                                                    <div class="col-lg-9">
                                                        <div class="col-lg-4">
                                                            <div class="row">
                                                                <div class="input-group">
                                                                    <input type="text" data-hex="true" class="mColorPicker form-control" name="bc_timer_background_color" value="" id="color_9" style="color: white"><span style="cursor:pointer;" id="icp_color_9" class="mColorPickerTrigger input-group-addon" data-mcolorpicker="true"><img src="view/image/color.png" style="border:0;margin:0 0 0 3px" align="absmiddle"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="<?php echo $entry_time_text_color ?>" data-original-title="<?php echo $entry_time_text_color ?>">
                                                            <?php echo $entry_time_text_color ?>
                                                        </span>
                                                    </label>
                                                    <div class="col-lg-9">
                                                        <div class="col-lg-4">
                                                            <div class="row">
                                                                <div class="input-group">
                                                                    <input type="text" data-hex="true" class="mColorPicker form-control" name="bc_timer_text_color" value="" id="color_10" style="color: white;"><span style="cursor:pointer;" id="icp_color_10" class="mColorPickerTrigger input-group-addon" data-mcolorpicker="true"><img src="view/image/color.png" style="border:0;margin:0 0 0 3px" align="absmiddle"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" onclick="addBCImage();" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Add Image"><i class="fa fa-plus-circle"></i></button>
                                    <br>
                                    <br>
                                    <br>

                                    <table id="bc_images" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <td class="text-left"><?php echo $entry_serial_number; ?></td>
                                                <td class="text-left"><?php echo $column_image; ?></td>
                                                <td class="text-left">Upto Time</td>
                                                <td class="text-left">Back. color</td>
                                                <td class="text-left">Text color</td>
                                                <td class="text-left"><?php echo $column_redirect; ?></td>
                                                <td class="text-left"><?php echo $column_category_id; ?></td>
                                                <td class="text-left"><?php echo $column_product_id; ?></td>
                                                <td class="text-right"><?php echo $column_delete; ?></td>
                                            </tr>
                                        </thead>
                                        <tbody id="bc_body">
                                        </tbody>
                                    </table>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><script src="view/javascript/colorpicker/jquery.colorpicker.js"></script>

                    <div class="modal fade" id="ProductHotizontalModal"  tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                        <div class="modal-dialog" role="document" style="width: 800px">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="gridSystemModalLabel"><?php echo $entry_component_heading; ?></h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group" style="margin-bottom: 10px;">
                                        <div class="col-sm-8">
                                         <?php foreach ($languages as $language) { ?>
                                            <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                                              <input type="text" name="product_banner_heading[<?php echo $language['language_id']; ?>][title]" id="product-heading-<?php echo $language['language_id']; ?>" value="" placeholder="Enter Element Heading" class="form-control"/>
                                            </div>
                                        <?php } ?>
                                        </div>  
                                        <div class="col-sm-4">
                                            <button type="button" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Save" id="save-product-heading" onclick="saveProductHeading();"><i class="fa fa-save"> Save Component Heading</i></button>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="modal-body">
                                    <div class="row" style="font-size: 14px;">
                                        <div id="sync_message"></div>
                                        <div class="col-sm-12">
                                            <form action="" method="post" enctype="multipart/form-data" id="form-new-notification" class='form-horizontal'>
                                                <div class="form-group">
                                                    <h4 class="modal-title" id="gridSystemModalLabel"><?php echo $entry_edit_component; ?></h4>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-ps-redirect_activity"><?php echo "Select Product Type"; ?></label>
                                                    <div class="col-sm-9">
                                                        <select onchange="selectProductRedirectActivity(this.value);" name="ps_redirect_activity" id="input-ps-redirect_activity" class="form-control">
                                                            <option value="best_seller"><?php echo $select_best_seller_product; ?></option>
                                                            <option value="featured_products"><?php echo $select_featured_product; ?></option>
                                                            <option value="new_products"><?php echo $select_new_products; ?></option>
                                                            <option value="from_category"><?php echo $select_from_category; ?></option>
                                                            <option value="custom_product"><?php echo $select_custom_product; ?></option>
                                                        </select>
                                                        <div id="activity-error"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;display:none" id='div-custom-product'>
                                                    <label class="col-sm-3 control-label" for="input-custom-product"><?php echo $select_custom_product; ?></label>
                                                    <div class="col-sm-9">
                                                       <select name="custom_product[]" id="custom_product" value="" class="form-control" multiple>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;display:none" id='div-ps-activity_link_to'>
                                                    <label class="col-sm-3 control-label" for="input-ps-activity_link_to"><?php echo $select_category; ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="ps_activity_link_to" onchange="selectProductCategoryRedirectActivity(this.value);" id="input-ps-activity_link_to" class="form-control">
<?php
echo "<option value=''>".$select_link_type_first."</option>";
?>
                                                        </select>
                                                        <div id="link-to-error"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 10px;display:none" id='div-ps-product_link_to'>
                                                    <label class="col-sm-3 control-label" for="ps-product-category"><?php echo $select_product; ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="ps_product_category" id="ps-product-category" multiple="multiple" class="form-control">
<?php
echo "<option value=''>".$select_link_type_first."</option>";
?>
                                                        </select>
                                                        <div id="link-to-error"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group required" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-title"><?php echo $entry_number_of_products ?></label>
                                                    <div class="col-sm-9">
                                                        <input type="text" name="ps_product_count" value="" placeholder="Enter Number" id="number_of_products" class="form-control" />
                                                    </div>
                                                </div>

                                                <div class="form-group required" style="margin-bottom: 10px;">
                                                    <label class="col-sm-3 control-label" for="input-title"><?php echo $entry_image_content_mode; ?></label>
                                                    <div class="col-sm-9">
                                                        <select name="bs_image_content_mode" id="ps_image_content_mode" class="form-control">
                                                            <option value="0"><?php echo $select_scale_aspect_fill; ?></option>
                                                            <option value="1" selected><?php echo $select_scale_aspect_fit; ?></option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" name="submitOptionsproduct" onclick="return veloValidateProductForm(this);">Save</button>
                                    <br>
                                    <br>
                                    <br>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->

                </div>
            </div>
        </div>
    </div>
</div>
<script src="view/javascript/colorpicker/jquery.colorpicker.js"></script>
<style type="text/css">
    .kb_error_message{
        color:red;
    }
    .kb_error_field {
        border-color: red;
    }
</style>
<script type="text/javascript">
    
    $(document).ready(function() {
        scrollToBottom();
       $("#topCategoryModal, #BannerCountdownModal, #BannerSquareModal, #ProductHotizontalModal").click(function() {
           $("body").addClass("modal-open");
       });
    });
    var token = '<?php echo $token; ?>';

    var success_message = "<?php echo $success_message_js?>";
    var min_category_limit = "<?php echo $min_category_limit_js; ?>";
    var error_check_message = "<?php echo $error_check_message_js; ?>";
    var component_add = "<?php echo $component_add_js; ?>";
    var component_delete = "<?php echo $component_delete; ?>";
    var limit_reached = "<?php echo $limit_reached; ?>";
    var position_update = "<?php echo $position_update; ?>";
    var banner_delete_message = "<?php echo $banner_delete_message; ?>";
    var banner_success_message = "<?php echo $banner_success_message; ?>";
    var select_category_error = "<?php echo $select_category_error; ?>";
    var active_languages = <?php echo json_encode($active_languages); ?>; 
    var error_empty_heading = "<?php echo $empty_heading_error; ?>";
    var success_heading_message = "<?php echo $success_heading_message; ?>";
    
    var error_text_color = "<?php echo $error_text_color; ?>";
    var error_background_color = "<?php echo $error_background_color; ?>";
    var error_countdown = "<?php echo $error_countdown; ?>";
    var select_redirect_activity_error = "<?php echo $select_redirect_activity_error; ?>";
    
    $(document).ready(function(){
        
        $(".slides").sortable({
        placeholder: 'slide-placeholder',
        axis: "y",
        revert: 150,
        start: function (e, ui) {

            placeholderHeight = ui.item.outerHeight();
            ui.placeholder.height(placeholderHeight + 15);
            $('<div class="slide-placeholder-animator" data-height="' + placeholderHeight + '"></div>').insertAfter(ui.placeholder);

        },
        change: function (event, ui) {

            ui.placeholder.stop().height(0).animate({
                height: ui.item.outerHeight() + 15
            }, 300);

            placeholderAnimatorHeight = parseInt($(".slide-placeholder-animator").attr("data-height"));

            $(".slide-placeholder-animator").stop().height(placeholderAnimatorHeight + 15).animate({
                height: 0
            }, 300, function () {
                $(this).remove();
                placeholderHeight = ui.item.outerHeight();
                $('<div class="slide-placeholder-animator" data-height="' + placeholderHeight + '"></div>').insertAfter(ui.placeholder);
            });

        },
        stop: function (e, ui) {

            // set position of components
            var order_component = $(".slides").sortable('toArray');
            var id_layout = $('#id_layout').val();
            
            $.ajax({
                url: "index.php?route=module/webservice/savePosition&token="+token,
                data: 'id_layout=' + id_layout + '&position_array=' + order_component,
                type: "post",
                success: function (data)
                {
                    var b = JSON.parse(data);
                    
                }
            });
            // changes over
            $(".slide-placeholder-animator").remove();
            showSuccessMessage(position_update);
            preview_content();

        },
    });
     });
function showHideCategory(value) {
    is_error = false;
    for(i=1;i<value;i++){
        if($('#category-list-'+i).val() == '0') {
            is_error = true;
        }
    }
    if(is_error){
        alert('Please complete above categories data');
        $('#category-list-'+value).val('0');
    } else {
        if($('#category-list-'+value).val() > 0) {
            $('#show-hide-category-'+value).attr('style','display:block');
        } else {
            $('#show-hide-category-'+value).attr('style','display:none');
        }
    }
}
function selectBSRedirectActivity(value) {    
    $("#div-bs-activity_link_to").hide('slow');
    if(parseInt(value) == 1){ // For category
        $.ajax({
            url: 'index.php?route=module/webservice/selectCategory&token=<?php echo $token; ?>',
            dataType: 'json',
            success: function(json) {
                html = '';
                $.each(json, function(i, item) {
                    html += '<option value="' + item.category_id + '">' + item.name + '</option>';                   
                });
                $("#input-bs-activity_link_to").html(html);
                $("#div-bs-activity_link_to").show('slow');
            }
        });
    }    
    else if(parseInt(value) == 2){ // For product
        $.ajax({
            url: 'index.php?route=module/webservice/selectProduct&token=<?php echo $token; ?>',
            dataType: 'json',
            success: function(json) {
                html = '';
                $.each(json, function(i, item) {
                    html += '<option value="' + item.product_id + '">' + item.name + '</option>';                   
                });
                $("#input-bs-activity_link_to").html(html);
                $("#div-bs-activity_link_to").show('slow');
            }
        });
    }
    else{
        html = '<option value=""><?php echo $entry_select_redirect_activity; ?> Type First</option>';
        
        $("#input-bs-activity_link_to").html(html);
    }
    
}

function selectBCRedirectActivity(value) {    
    $("#div-bc-activity_link_to").hide('slow');
    if(parseInt(value) == 1){ // For category
        $.ajax({
            url: 'index.php?route=module/webservice/selectCategory&token=<?php echo $token; ?>',
            dataType: 'json',
            success: function(json) {
                html = '';
                $.each(json, function(i, item) {
                    html += '<option value="' + item.category_id + '">' + item.name + '</option>';                   
                });
                $("#input-bc-activity_link_to").html(html);
                $("#div-bc-activity_link_to").show('slow');
            }
        });
    }    
    else if(parseInt(value) == 2){ // For product
        $.ajax({
            url: 'index.php?route=module/webservice/selectProduct&token=<?php echo $token; ?>',
            dataType: 'json',
            success: function(json) {
                html = '';
                $.each(json, function(i, item) {
                    html += '<option value="' + item.product_id + '">' + item.name + '</option>';                   
                });
                $("#input-bc-activity_link_to").html(html);
                $("#div-bc-activity_link_to").show('slow');
            }
        });
    }
    else{
        html = '<option value=""><?php echo $entry_select_redirect_activity; ?> Type First</option>';
        
        $("#input-bc-activity_link_to").html(html);
    }
    
}

function selectProductRedirectActivity(value,id_category=0) {
    $("#div-ps-activity_link_to").hide('slow');
    $("#div-custom-product").hide('slow');
    if(value == 'from_category'){ // For category
        $.ajax({
            url: 'index.php?route=module/webservice/selectCategory&token=<?php echo $token; ?>',
            dataType: 'json',
            success: function(json) {
                html = '';
                html += '<option value="0">Select a category</option>'; 
                $.each(json, function(i, item) {
                    if(id_category==item.category_id) {
                        html += '<option selected="selected" value="' + item.category_id + '">' + item.name + '</option>';  
                    } else {
                        html += '<option value="' + item.category_id + '">' + item.name + '</option>';
                    }
                });
                $("#input-ps-activity_link_to").html(html);
                $("#div-ps-activity_link_to").show('slow');
            }
        });
    }  else if(value == 'custom_product') {
        getCustomProduct(id_category);
        $("#div-ps-product_link_to").hide('slow');
        $("#div-custom-product").show('slow');
    } else {
    
     $("#div-ps-product_link_to").hide('slow');
     $("#div-custom-product").hide('slow');
    }
}

function selectProductCategoryRedirectActivity(value,products) {

    $("#div-ps-product_link_to").hide('slow');
    if(parseInt(value) > 0){ // For category
        $.ajax({
            url: 'index.php?route=module/webservice/selectCategoryProduct&token=<?php echo $token; ?>&category_id='+value,
            dataType: 'json',
            success: function(json) {
                html = '';
                $.each(json, function(i, item) {
                    if($.inArray(item.product_id,products)!='-1') {
                        html += '<option selected="selected" value="' + item.product_id + '">' + item.name + '</option>';
                    } else {
                        html += '<option value="' + item.product_id + '">' + item.name + '</option>';
                    }
                });
                $("#ps-product-category").html(html);
                $("#div-ps-product_link_to").show('slow');
            }
        });
    }    
}
$('input[name=\'custom_product_field\']').autocomplete({
	'source': function(request, response) {
                var filter_name = $('input[name=\'custom_product_field\']').val();
                $.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(filter_name),
			dataType: 'json',			
			success: function(json) {
                                response($.map(json, function(item) {
                                        return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('#custom-product' + item['value']).remove();
		
		$('#custom-product').append('<div id="custom-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" value="' + item['value'] + '" /></div>');	
	
		data = $.map($('#custom-product input'), function(element) {
			return $(element).attr('value');
		});
						
		$('input[name=\'custom_product\']').attr('value', data.join());	
	}	
});

$('#custom-product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();

	data = $.map($('#custom-product input'), function(element) {
		return $(element).attr('value');
	});
					
	$('input[name=\'custom_product\']').attr('value', data.join());	
});

$('.date').datetimepicker({
	pickDate: true,pickTime: true,dateFormat: 'yy-mm-dd h:i:s',timeFormat: "HH:mm:ss",
        icons: {
            time: 'fa fa-clock-o',
            date: 'fa fa-calendar',
            up: 'fa fa-chevron-up',
            down: 'fa fa-chevron-down',
            previous: 'fa fa-chevron-left',
            next: 'fa fa-chevron-right',
            today: 'fa fa-calendar-o',
            clear: 'fa fa-trash',
            close: 'fa fa-times'
        }
});


</script>
<script type="text/javascript" src="view/javascript/mab_layout/layout.js"></script>

<?php echo $footer; ?>
