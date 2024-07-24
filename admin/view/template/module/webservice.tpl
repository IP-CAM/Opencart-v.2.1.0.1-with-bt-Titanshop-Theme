<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button id='show_preview' data-toggle="tooltip" onclick='showPreview();' title="<?php echo 'Hide Preview'; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></button>  
        <button type="button" form="form-webservice" id='save-webservice' data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-webservice" class="form-horizontal">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $entry_tab_general_settings; ?></a></li>
              <li><a href="#tab-home-page-layout" data-toggle="tab"><?php echo $entry_tab_homepage_layout; ?></a></li>
              <li><a href="#tab-pns" data-toggle="tab"><?php echo $entry_tab_pns; ?></a></li>
              <li><a href="#tab-pnh" data-toggle="tab"><?php echo $entry_tab_pnh; ?></a></li>
<!--              <li><a href="#tab-slideshow" data-toggle="tab">Slideshow Settings</a></li>
              <li><a href="#tab-banner" data-toggle="tab">Banners Settings</a></li>  
-->              <li><a href="#tab-payment" data-toggle="tab"><?php echo $entry_tab_payment; ?></a></li><!--
              <li><a href="#tab-featured" data-toggle="tab">Featured</a></li>
              <li><a href="#tab-specials" data-toggle="tab">Specials</a></li>
              <li><a href="#tab-best-sellers" data-toggle="tab">Best Sellers</a></li>
              <li><a href="#tab-latest" data-toggle="tab">Latest</a></li>-->
              <li><a href="#tab-cms" data-toggle="tab"><?php echo $entry_tab_cms; ?></a></li>
            </ul>
            <div class="tab-content">
                <!--------------------Tab General---------------------------->
                <div class="tab-pane active" id="tab-general">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                      <div class="col-sm-3">
                        <select name="webservice[webservice_status]" id="input-status" class="form-control">
                          <?php if ($webservice_status) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                        <div style="font-size: 10px;"><?php echo $entry_status_descp; ?></div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-whatspapp-chat-status"><?php echo $entry_enable_spin_win; ?></label>
                      <div class="col-sm-3">
                        <select name="webservice[mobile_app_spin_win]" id="input-mobile_app_spin_win" class="form-control">
                          <?php if ($mobile_app_spin_win && $spin_win_enable == '1') { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else if($spin_win_enable == '0'){ ?>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php }else{ ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                        <div style="font-size: 10px;"><?php echo $mobile_app_spin_win_hint; ?></div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-log-status"><?php echo $entry_log_status; ?></label>
                      <div class="col-sm-3">
                        <select name="webservice[webservice_log_status]" id="input-log-status" class="form-control">
                          <?php if ($webservice_log_status) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                        <div style="font-size: 10px;"><?php echo $entry_errorlog_descp; ?></div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-chat-status"><?php echo $entry_chat_status; ?></label>
                      <div class="col-sm-3">
                        <select name="webservice[webservice_chat_status]" id="input-chat-status" class="form-control">
                          <?php if ($webservice_chat_status) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                        <div style="font-size: 10px;"><?php echo $entry_livechat_descp; ?></div>
                      </div>
                    </div>
                    <div class="form-group chat_options">
                      <label class="col-sm-2 control-label" for="input-chat-key"><?php echo $entry_chat_key; ?></label>
                      <div class="col-sm-3">
                        <input type="text" name="webservice[chat_key]" value="<?php echo $chat_key; ?>" placeholder="<?php echo $entry_chat_key; ?>" id="input-chat-key" class="form-control" />
                        <div style="font-size: 10px;"><?php echo $entry_apikey_descp; ?></div>
                        <?php if ($error_chat_key) { ?>
                        <div class="text-danger"><?php echo $error_chat_key; ?></div>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-home-page_layout"><?php echo $entry_select_layout ?></label>
                    <div class="col-sm-3">
                        <select name="webservice[homepage_layout]" id="input-homepage-layout" class="form-control">
                        <option value="0">Please select a layout</option>
                        <?php foreach($layouts as $layout) { ?>
                            <option value="<?php echo $layout['layout_id'] ?>" <?php if($layout['layout_id'] == $homepage_layout ) { ?> selected="selected" <?php } ?>><?php echo $layout['layout_name']; ?></option>
                        <?php } ?>
                        </select>
                        <?php if ($error_homepage_layout) { ?>
                        <div class="text-danger"><?php echo $error_homepage_layout; ?></div>
                        <?php } ?>
                    </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-whatspapp-chat-status"><?php echo $entry_tab_bar_enabled; ?></label>
                      <div class="col-sm-3">
                        <select name="webservice[tab_bar_enabled]" id="input-tab-bar-enabled" class="form-control">
                          <?php if ($tab_bar_enabled) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-whatspapp-chat-status"><?php echo $entry_whatsapp_chat_status; ?></label>
                      <div class="col-sm-3">
                        <select name="webservice[whatsapp_chat_status]" id="input-whatsapp-chat-status" class="form-control">
                          <?php if ($whatsapp_chat_status) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                        <div style="font-size: 10px;"><?php echo $descp_whatsapp_chat_status; ?></div>
                      </div>
                    </div>
                    <div class="form-group whatsapp_options">
                      <label class="col-sm-2 control-label" for="whatsapp-chat-key"><?php echo $entry_whatsapp_contact; ?></label>
                      <div class="col-sm-3">
                        <input type="text" name="webservice[whatsapp_phone_number]" value="<?php echo $whatsapp_phone_number; ?>" placeholder="Enter Phone Number" id="whatsapp-chat-key" class="form-control" />
                        <div style="font-size: 10px;"><?php echo $descp_whatsapp_contact; ?></div>
                        <?php if ($error_whatsapp_number) { ?>
                        <div class="text-danger"><?php echo $error_whatsapp_number; ?></div>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="form-group">
                          <label class="col-sm-2 control-label">
                          <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="<?php echo $descp_app_button_color ?>" data-original-title="<?php echo $descp_app_button_color ?>">
                            <?php echo $entry_app_button_color ?>
                        </span>
                          </label>
                          <div class="col-lg-9">
                             <div class="col-lg-2">
                                <div class="row">
                                   <div class="input-group">
                                      <input type="text" data-hex="true" value="<?php echo $app_button_color;?>" class="mColorPicker form-control" name="webservice[app_button_color]"  id="color_0" style="background-color: <?php echo $app_button_color;?>; color: white;"><span style="cursor:pointer;" id="icp_color_0" class="mColorPickerTrigger input-group-addon" data-mcolorpicker="true"><img src="view/image/color.png" style="border:0;margin:0 0 0 3px" align="absmiddle"></span>
                                   </div>
                                </div>
                             </div>
                            <?php if ($error_app_button_color) { ?>
                                 <div class="text-danger"><?php echo $error_app_button_color; ?></div>
                             <?php } ?>
                          </div>
                       </div>
                       <div class="form-group">
                          <label class="col-sm-2 control-label">
                         <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="<?php echo $descp_app_theme_color ?>" data-original-title="<?php echo $descp_app_theme_color ?>">
                            <?php echo $entry_app_theme_color ?>
                        </span>
                          </label>
                          <div class="col-lg-9">
                             <div class="col-lg-2">
                                <div class="row">
                                   <div class="input-group">
                                      <input type="text" data-hex="true" class="mColorPicker form-control" name="webservice[app_theme_color]" value="<?php echo $app_theme_color;?>" id="color_1" style="background-color: <?php echo $app_theme_color;?>; color: white;"><span style="cursor:pointer;" id="icp_color_1" class="mColorPickerTrigger input-group-addon" data-mcolorpicker="true"><img src="view/image/color.png" style="border:0;margin:0 0 0 3px" align="absmiddle"></span>
                                   </div>
                                </div>
                             </div>
                            <?php if ($error_app_theme_color) { ?>
                                 <div class="text-danger"><?php echo $error_app_theme_color; ?></div>
                             <?php } ?>
                          </div>
                       </div>
                    <div class="form-group">
                          <label class="col-sm-2 control-label">
                         <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="<?php echo $descp_app_theme_color ?>" data-original-title="<?php echo $descp_app_theme_color ?>">
                            <?php echo $entry_buttontext_color; ?>
                        </span>
                          </label>
                          <div class="col-lg-9">
                             <div class="col-lg-2">
                                <div class="row">
                                   <div class="input-group">
                                      <input type="text" data-hex="true" class="mColorPicker form-control" name="webservice[app_button_text_color]" value="<?php echo $app_button_text_color;?>" id="color_3" style="background-color: <?php echo $app_button_text_color;?>; color: white;"><span style="cursor:pointer;" id="icp_color_3" class="mColorPickerTrigger input-group-addon" data-mcolorpicker="true"><img src="view/image/color.png" style="border:0;margin:0 0 0 3px" align="absmiddle"></span>
                                   </div>
                                </div>
                             </div>
                               <?php if ($error_app_button_text_color) { ?>
                                    <div class="text-danger"><?php echo $error_app_button_text_color; ?></div>
                                <?php } ?>
                          </div>
                       </div>
                    <div class="form-group">
                          <label class="col-sm-2 control-label">
                         <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="<?php echo $descp_app_theme_color ?>" data-original-title="<?php echo $descp_app_theme_color ?>">
                           <?php echo $entry_appbackground_color; ?>
                        </span>
                          </label>
                          <div class="col-lg-9">
                             <div class="col-lg-2">
                                <div class="row">
                                   <div class="input-group">
                                      <input type="text" data-hex="true" class="mColorPicker form-control" name="webservice[app_background_color]" value="<?php echo $app_background_color;?>" id="color_4" style="background-color: <?php echo $app_background_color;?>; color: white;"><span style="cursor:pointer;" id="icp_color_4" class="mColorPickerTrigger input-group-addon" data-mcolorpicker="true"><img src="view/image/color.png" style="border:0;margin:0 0 0 3px" align="absmiddle"></span>
                                   </div>
                                </div>
                             </div>
                               <?php if ($error_app_background_color) { ?>
                                    <div class="text-danger"><?php echo $error_app_background_color; ?></div>
                                <?php } ?>
                          </div>
                       </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">
                           <?php echo $entry_enable_logo;?>
                        </label>        
                        <div class="col-sm-3">
                           <select name="webservice[logo_status]" id="webservices_store_logo" class="form-control" onchange="return enable_logo(this.value);">
                              <option value="1"<?php  if ($logo_status==1) { ?> selected="selected"<?php } ?>><?php echo $text_enabled; ?></option>
                              <option value="0"<?php  if ($logo_status==0) { ?> selected="selected"<?php } ?>><?php echo $text_disabled; ?></option>
                           </select>
                        </div>
                     </div>
                     <div class="form-group required" id="enable_logo">
                        <label class="col-sm-2 control-label">
                            <?php echo $entry_image_for_logo;?>
                        </label>        
                        <div class="col-sm-6">
                           <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php if($image_for_logo==''){?>view/image/no_image.png<?php }else{?>../image/<?php echo $image_for_logo; ?><?php } ?>" style="width:200px;" alt="" title="" data-placeholder="view/image/no_image.png"></a>
                           <input type="hidden" name="webservice[image_for_logo]" value="<?php echo $image_for_logo; ?>" id="image_for_logo" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-log-status"><?php echo $entry_fingerprint_login;?></label>
                      <div class="col-sm-3">
                        <select name="webservice[fingerprint_login_status]" id="input-fingerprint-login-status" class="form-control">
                          <?php if ($fingerprint_login_status) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                        <div style="font-size: 10px;"><?php echo $descp_fingerprint_login;?></div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-log-status"><?php echo $entry_phone_registration;?></label>
                      <div class="col-sm-3">
                        <select name="webservice[phone_registration_status]" class="form-control">
                          <?php if ($phone_registration_status) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                        <div style="font-size: 10px;"><?php  echo $descp_phone_registration ?></div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-log-status"><?php echo $entry_mandatory_phone_registration; ?></label>
                      <div class="col-sm-3">
                        <select name="webservice[mandatory_phone_registration_status]" class="form-control">
                          <?php if ($mandatory_phone_registration_status) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                        <div style="font-size: 10px;"><?php echo $descp_mandatory_phone_registration; ?></div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-log-status"><?php echo $entry_redirect_cart ?></label>
                      <div class="col-sm-3">
                        <select name="webservice[redirect_cart_status]" id="input-redirect-cart-status" class="form-control">
                          <?php if ($redirect_cart_status) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                        <div style="font-size: 10px;"><?php echo $descp_redirect_cart; ?></div>
                      </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-shipping-method"><span class="label-tooltip" data-toggle="tooltip" data-html="true" title="<?php echo $descp_disabled_shipping; ?>" data-original-title="<?php echo $entry_disabled_shipping; ?>">
                            <?php echo $entry_disabled_shipping; ?>
                        </span></label>
                        <div class="col-sm-3">
                          <input type="text" name="shipping_method_field" value="" placeholder="Disabled Shipping Methods" id="input-shipping-method" class="form-control" />
                          <div id="shipping-method" class="well well-sm" style="height: 150px; overflow: auto;">
                            <?php foreach ($shipping_methods as $method) { ?>
                            <div id="shipping-method-<?php echo $method['code']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $method['code']; ?>
                              <input type="hidden" value="<?php echo $method['code']; ?>" />
                            </div>
                            <?php } ?>
                          </div>
                          <input type="hidden" name="webservice[shipping_method]" value="<?php echo $shipping_method; ?>" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group" style="display:none">
                      <label class="col-sm-2 control-label" for="input-url-encoding-status"><?php echo $entry_url_encoding; ?></label>
                      <div class="col-sm-3">
                        <select name="webservice[url_encoding_status]" id="input-url-encoding-status" class="form-control">
                          <?php if ($url_encoding_status) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                        <div style="font-size: 10px;"><?php echo $descp_url_encoding; ?></div>
                      </div>
                    </div>
                    <div class="form-group required" >
                        <label class="col-sm-2 control-label" for="input-width"><?php echo $category_entry_width; ?></label>
                      <div class="col-sm-3">
                        <input type="text" name="webservice[category_image_width]" value="<?php echo $category_image_width; ?>" placeholder="<?php echo $category_entry_width; ?>" id="input-category-width" class="form-control" />
                        <div style="font-size: 10px;"><?php echo $error_range; ?></div>
                        <?php if ($error_category_width) { ?>
                        <div class="text-danger"><?php echo $error_category_width; ?></div>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-height"><?php echo $category_entry_height; ?></label>
                      <div class="col-sm-3">
                        <input type="text" name="webservice[category_image_height]" value="<?php echo $category_image_height; ?>" placeholder="<?php echo $category_entry_height; ?>" id="input-category-height" class="form-control" />
                        <div style="font-size: 10px;"><?php echo $error_range; ?></div>
                        <?php if ($error_category_height) { ?>
                        <div class="text-danger"><?php echo $error_category_height; ?></div>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-width"><?php echo $product_entry_width; ?></label>
                      <div class="col-sm-3">
                        <input type="text" name="webservice[product_image_width]" value="<?php echo $product_image_width; ?>" placeholder="<?php echo $product_entry_width; ?>" id="input-product-width" class="form-control" />
                        <div style="font-size: 10px;"><?php echo $error_range; ?></div>
                        <?php if ($error_product_width) { ?>
                        <div class="text-danger"><?php echo $error_product_width; ?></div>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-height"><?php echo $product_entry_height; ?></label>
                      <div class="col-sm-3">
                        <input type="text" name="webservice[product_image_height]" value="<?php echo $product_image_height; ?>" placeholder="<?php echo $product_entry_height; ?>" id="input-product-height" class="form-control" />
                        <div style="font-size: 10px;"><?php echo $error_range; ?></div>
                        <?php if ($error_product_height) { ?>
                        <div class="text-danger"><?php echo $error_product_height; ?></div>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"  for="input-new_product_start_date"><?php echo $entry_new_product_date; ?></label>
                        <div class="col-sm-3">
                            <div class="input-group date">
                                <input type="text" name="webservice[new_product_start_date]" value="<?php echo $new_product_start_date ?>"  data-date-format="YYYY-MM-DD HH:MM:SS" id="input-new_product_start_date" class="form-control" />
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                </span></div>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-new-product-limit"><?php echo $entry_new_product_limit; ?></label>
                      <div class="col-sm-3">
                        <input type="number" name="webservice[new_product_limit]" value="<?php echo $new_product_limit; ?>" placeholder="<?php echo $new_product_limit; ?>" id="input-height" class="form-control" />
                        <div style="font-size: 10px;"><?php echo $error_range; ?></div>
                        <?php if ($error_new_product_limit) { ?>
                        <div class="text-danger"><?php echo $error_new_product_limit; ?></div>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-phone_field"><?php echo "Phone field"; ?></label>
                        <div class="col-sm-3">
                            <select name="webservice[phone_field]" id="input-phone_field" class="form-control">
                                <?php foreach($custom_fields as $custom_field){
                                    if($phone_field == $custom_field['custom_field_id']){ ?>
                                        <option value="<?php echo $custom_field['custom_field_id']; ?>" selected="selected"><?php echo $custom_field['name']; ?></option>
                                    <?php  }
                                    else{ ?>
                                        <option value="<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></option>
                                    <?php  }
                                  } ?>
                            </select>
                        </div>
                    </div>
<!--                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-title_field"><?php echo "Title field"; ?></label>
                        <div class="col-sm-10">
                            <select name="webservice[title_field]" id="input-title_field" class="form-control">
                                <?php foreach($custom_fields as $custom_field){
                                    if($title_field == $custom_field['custom_field_id']){ ?>
                                        <option value="<?php echo $custom_field['custom_field_id']; ?>" selected="selected"><?php echo $custom_field['name']; ?></option>
                                    <?php  }
                                    else{ ?>
                                        <option value="<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></option>
                                    <?php  }
                                  } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-gender_field"><?php echo "Gender field"; ?></label>
                        <div class="col-sm-10">
                            <select name="webservice[gender_field]" id="input-gender_field" class="form-control">
                                <?php foreach($custom_fields as $custom_field){
                                    if($gender_field == $custom_field['custom_field_id']){ ?>
                                        <option value="<?php echo $custom_field['custom_field_id']; ?>" selected="selected"><?php echo $custom_field['name']; ?></option>
                                    <?php  }
                                    else{ ?>
                                        <option value="<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></option>
                                    <?php  }
                                  } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-dob_field"><?php echo "DOB field"; ?></label>
                        <div class="col-sm-10">
                            <select name="webservice[dob_field]" id="input-dob_field" class="form-control">
                                <?php foreach($custom_fields as $custom_field){
                                    if($dob_field == $custom_field['custom_field_id']){ ?>
                                        <option value="<?php echo $custom_field['custom_field_id']; ?>" selected="selected"><?php echo $custom_field['name']; ?></option>
                                    <?php  }
                                    else{ ?>
                                        <option value="<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></option>
                                    <?php  }
                                  } ?>
                            </select>
                        </div>
                    </div>-->
                </div>
                <!--------------------Tab Slideshow------------------------->
                <div class="tab-pane" id="tab-slideshow">
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-slideshow-name"><?php echo $entry_slideshow_name; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="slideshow_name" value="<?php echo $slideshow_name; ?>" placeholder="<?php echo $entry_slideshow_name; ?>" id="input-slideshow-name" class="form-control" />
                          <input type="hidden" name="slideshow_id" value="<?php echo $slideshow_id; ?>" />
                          <?php if ($error_slideshow_name) { ?>
                          <div class="text-danger"><?php echo $error_slideshow_name; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-slideshow-status"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
                            <select name="slideshow_status" id="input-slideshow-status" class="form-control">
                              <?php if ($slideshow_status) { ?>
                              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                              <option value="0"><?php echo $text_disabled; ?></option>
                              <?php } else { ?>
                              <option value="1"><?php echo $text_enabled; ?></option>
                              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                              <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-slideshow-limit"><?php echo $entry_slideshow_limit; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="slideshow_limit" value="<?php echo $slideshow_limit; ?>" placeholder="<?php echo $entry_slideshow_limit; ?>" id="input-slideshow-limit" class="form-control" />
                          <div style="font-size: 10px;">Maximum limit is 5</div>
                          <?php if ($error_slideshow_limit) { ?>
                          <div class="text-danger"><?php echo $error_slideshow_limit; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-slideshow-image"><?php echo $entry_slideshow_image_size; ?></label>
                        <div class="col-sm-10">                          
                            <span data-toggle="tooltip" title="Minimum limit: 600<br>Maximum limit:9999"><input type="text" name="webservice[slideshow_width]" value="<?php echo $slideshow_width; ?>" placeholder="<?php echo $entry_slideshow_width; ?>" id="input-slideshow-width" class="form-control" /></span>
                            <span data-toggle="tooltip" title="Minimum limit: 200<br>Maximum limit:999"><input type="text" name="webservice[slideshow_height]" value="<?php echo $slideshow_height; ?>" placeholder="<?php echo $entry_slideshow_height; ?>" id="input-slideshow-height" class="form-control" /></span>
                          <div style="font-size: 10px;">Width and Height should be in ratio 3:1 for better results.</div>
                          <?php if ($error_slideshow_image_size) { ?>
                          <div class="text-danger"><?php echo $error_slideshow_image_size; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                    <table id="images" class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                              <td class="text-left"><?php echo $entry_slideshow_title; ?></td>
                              <td class="text-left"><?php echo $entry_slideshow_link_type; ?></td>
                              <td class="text-left"><?php echo $entry_slideshow_link_to; ?></td>
                              <td class="text-left"><?php echo $entry_slideshow_image; ?></td>
                              <td class="text-right"><?php echo $entry_slideshow_sort_order; ?></td>
                              <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $image_row = 0; ?>
                            <?php foreach ($slideshow_images as $slideshow_image) { ?>
                                    <tr id="image-row<?php echo $image_row; ?>">
                                      <td class="text-left"><?php foreach ($languages as $language) { ?>
                                        <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                                          <input type="text" name="slideshow_image[<?php echo $image_row; ?>][slideshow_image_description][<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($slideshow_image['slideshow_image_description'][$language['language_id']]) ? $slideshow_image['slideshow_image_description'][$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_slideshow_title; ?>" class="form-control" />
                                        </div>
                                        <?php if (isset($error_slideshow_image[$image_row][$language['language_id']])) { ?>
                                        <div class="text-danger"><?php echo $error_slideshow_image[$image_row][$language['language_id']]; ?></div>
                                        <?php } ?>
                                        <?php } ?></td>
                                      <td class="text-left">
                                        <select onchange="selectLinkTo(<?php echo $image_row; ?>, this.value);" name="slideshow_image[<?php echo $image_row; ?>][link_type]" id="slideshow_image[<?php echo $image_row; ?>][link_type]" class="form-control">
                                            <option value="">Select Link Type</option>
                                            <option value="0" <?php if($slideshow_image['linktype'] == '0'){ echo "selected='selected'";} ?>>Category</option>
                                            <option value="1" <?php if($slideshow_image['linktype'] == '1'){ echo "selected='selected'";} ?>>Product</option>
                                        </select>
                                      </td>
                                      <td class="text-left">
                                          <div id="slideshow_image_<?php echo $image_row; ?>_link_to">
                                                <select name="slideshow_image[<?php echo $image_row; ?>][link_to]" class="form-control">
                                                    <?php if($slideshow_image['linktype'] == '0'){
                                                            foreach($category_array as $key => $category){
                                                                if($category['category_id'] == $slideshow_image['linkto']){
                                                                    echo "<option value='" . $category['category_id'] . "' selected='selected'>" . $category['name'] . "</option>";
                                                                }
                                                                else{
                                                                    echo "<option value='" . $category['category_id'] . "'>" . $category['name'] . "</option>";
                                                                }
                                                            }
                                                        }
                                                        else if($slideshow_image['linktype'] == '1'){
                                                            foreach($product_array as $key => $product){
                                                                if($product['product_id'] == $slideshow_image['linkto']){
                                                                    echo "<option value='" . $product['product_id'] . "' selected='selected'>" . $product['name'] . "</option>";
                                                                }
                                                                else{
                                                                    echo "<option value='" . $product['product_id'] . "'>" . $product['name'] . "</option>";
                                                                }
                                                            }
                                                        }
                                                        else{
                                                            echo "<option value=''>Select Link Type First</option>";
                                                        }
                                                        ?>
    <?php ?>
                                                    </select>
                                                </div>
                                            </td>                                      

                                            <td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $slideshow_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                                <input type="hidden" name="slideshow_image[<?php echo $image_row; ?>][image]" value="<?php echo $slideshow_image['image']; ?>" id="input-image<?php echo $image_row; ?>" /></td>

                                            <td class="text-right"><input type="text" name="slideshow_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $slideshow_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>

                                            <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_slideshow_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                                        </tr>
    <?php $image_row++; ?>
<?php } ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="5"></td>
                                        <td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_slideshow_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!--------------------Tab Banner----------------------------->
                        <div class="tab-pane" id="tab-banner">
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-banner-name"><?php echo $entry_banner_name; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="banner_name" value="<?php echo $banner_name; ?>" placeholder="<?php echo $entry_banner_name; ?>" id="input-banner-name" class="form-control" />
                                    <input type="hidden" name="banner_id" value="<?php echo $banner_id; ?>" />
                                        <?php if ($error_banner_name) { ?>
                                        <div class="text-danger"><?php echo $error_banner_name; ?></div>
                                        <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-banner-status"><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="banner_status" id="input-banner-status" class="form-control">
<?php if ($banner_status) { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0"><?php echo $text_disabled; ?></option>
<?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-banner-limit"><?php echo $entry_banner_limit; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="banner_limit" value="<?php echo $banner_limit; ?>" placeholder="<?php echo $entry_banner_limit; ?>" id="input-banner-limit" class="form-control" />
                                    <div style="font-size: 10px;">Maximum limit is 5</div>
<?php if ($error_banner_limit) { ?>
                                        <div class="text-danger"><?php echo $error_banner_limit; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-banner-image"><?php echo $entry_banner_image_size; ?></label>
                                <div class="col-sm-10">                          
                                    <span data-toggle="tooltip" title="Minimum limit: 600<br>Maximum limit:9999"><input type="text" name="webservice[banner_width]" value="<?php echo $banner_width; ?>" placeholder="<?php echo $entry_banner_width; ?>" id="input-banner-width" class="form-control" /></span>
                                    <span data-toggle="tooltip" title="Minimum limit: 200<br>Maximum limit:999"><input type="text" name="webservice[banner_height]" value="<?php echo $banner_height; ?>" placeholder="<?php echo $entry_banner_height; ?>" id="input-banner-height" class="form-control" /></span>
                                    <div style="font-size: 10px;">Width and Height should be in ratio 3:1 for better results.</div>
<?php if ($error_banner_image_size) { ?>
                                        <div class="text-danger"><?php echo $error_banner_image_size; ?></div>
<?php } ?>
                                </div>
                            </div>
                            <table id="banner_images" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <td class="text-left"><?php echo $entry_banner_title; ?></td>
                                        <td class="text-left"><?php echo $entry_banner_link_type; ?></td>
                                        <td class="text-left"><?php echo $entry_banner_link_to; ?></td>
                                        <td class="text-left"><?php echo $entry_banner_image; ?></td>
                                        <td class="text-right"><?php echo $entry_banner_sort_order; ?></td>
                                        <td></td>
                                    </tr>
                                </thead>
                                <tbody>
                                            <?php $banner_image_row = 0; ?>
                                            <?php foreach ($banner_images as $banner_image) { ?>
                                        <tr id="banner-image-row<?php echo $banner_image_row; ?>">
                                            <td class="text-left"><?php foreach ($languages as $language) { ?>
                                                    <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                                                        <input type="text" name="banner_image[<?php echo $banner_image_row; ?>][banner_image_description][<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($banner_image['banner_image_description'][$language['language_id']]) ? $banner_image['banner_image_description'][$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_banner_title; ?>" class="form-control" />
                                                    </div>
        <?php if (isset($error_banner_image[$banner_image_row][$language['language_id']])) { ?>
                                                        <div class="text-danger"><?php echo $error_banner_image[$banner_image_row][$language['language_id']]; ?></div>
        <?php } ?>
    <?php } ?></td>
                                            <td class="text-left">
                                                <select onchange="selectBannerLinkTo(<?php echo $banner_image_row; ?>, this.value);" name="banner_image[<?php echo $banner_image_row; ?>][link_type]" id="banner_image[<?php echo $banner_image_row; ?>][link_type]" class="form-control">
                                                    <option value="">Select Link Type</option>
                                                    <option value="0" <?php if ($banner_image['linktype'] == '0') {
                                                        echo "selected='selected'";
                                                    } ?>>Category</option>
                                                    <option value="1" <?php if ($banner_image['linktype'] == '1') {
                                                        echo "selected='selected'";
                                                    } ?>>Product</option>
                                                </select>
                                            </td>
                                            <td class="text-left">
                                                <div id="banner_image_<?php echo $banner_image_row; ?>_link_to">
                                                    <select name="banner_image[<?php echo $banner_image_row; ?>][link_to]" class="form-control">
                                                        <?php
                                                        if ($banner_image['linktype'] == '0') {
                                                            foreach ($banner_category_array as $key => $category) {
                                                                if ($category['category_id'] == $banner_image['linkto']) {
                                                                    echo "<option value='" . $category['category_id'] . "' selected='selected'>" . $category['name'] . "</option>";
                                                                } else {
                                                                    echo "<option value='" . $category['category_id'] . "'>" . $category['name'] . "</option>";
                                                                }
                                                            }
                                                        } else if ($banner_image['linktype'] == '1') {
                                                            foreach ($banner_product_array as $key => $product) {
                                                                if ($product['product_id'] == $banner_image['linkto']) {
                                                                    echo "<option value='" . $product['product_id'] . "' selected='selected'>" . $product['name'] . "</option>";
                                                                } else {
                                                                    echo "<option value='" . $product['product_id'] . "'>" . $product['name'] . "</option>";
                                                                }
                                                            }
                                                        } else {
                                                            echo "<option value=''>Select Link Type First</option>";
                                                        }
                                                        ?>
    <?php ?>
                                                    </select>
                                                </div>
                                            </td>                                      

                                            <td class="text-left"><a href="" id="thumb-banner-image<?php echo $banner_image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $banner_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                                <input type="hidden" name="banner_image[<?php echo $banner_image_row; ?>][image]" value="<?php echo $banner_image['image']; ?>" id="input-banner-image<?php echo $banner_image_row; ?>" /></td>

                                            <td class="text-right"><input type="text" name="banner_image[<?php echo $banner_image_row; ?>][sort_order]" value="<?php echo $banner_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>

                                            <td class="text-left"><button type="button" onclick="$('#banner-image-row<?php echo $banner_image_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_banner_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                                        </tr>
    <?php $banner_image_row++; ?>
<?php } ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="5"></td>
                                        <td class="text-left"><button type="button" onclick="addBannerImage();" data-toggle="tooltip" title="<?php echo $button_banner_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!----------------------Push Notification Settings------------------------->
                        <div class="tab-pane" id="tab-pns">
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-firebase-server-key"><?php echo $entry_firebase_server_key; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="webservice[firebase_server_key]" value="<?php echo $firebase_server_key; ?>" placeholder="" id="input-firebase-server-key" class="form-control" />
                                    <div style="font-size: 10px;">Enter Server Key of Firebase</div>
                                        <?php if ($error_firebase_server_key) { ?>
                                        <div class="text-danger"><?php echo $error_firebase_server_key; ?></div>
                                        <?php } ?>
                                </div>
                            </div>
                            <h3>Order Success Notification</h3>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-order-success-status"><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="webservice[order_success_status]" id="input-order-success-status" class="form-control">
<?php if (isset($order_success_status) && $order_success_status == '1') { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0"><?php echo $text_disabled; ?></option>
<?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                    </select>
                                    <div style="font-size: 10px;">This setting will enable/disable order success push notification functionality.</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-order-success-title"><?php echo $entry_notification_title; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="webservice[order_success_title]" value="<?php echo $order_success_title; ?>" id="input-order-success-title" class="form-control" />
                                    <div style="font-size: 10px;">Enter Title for Order Success Notification</div>
                                    <?php if ($error_order_success_title) { ?>
                                        <div class="text-danger"><?php echo $error_order_success_title; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-order-success-message"><?php echo $entry_notification_message; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="webservice[order_success_message]" value="<?php echo $order_success_message; ?>" id="input-order-success-message" class="form-control" />
                                    <div style="font-size: 10px;">Enter message for Order Success Notification</div>
                                        <?php if ($error_order_success_message) { ?>
                                        <div class="text-danger"><?php echo $error_order_success_message; ?></div>
                                        <?php } ?>
                                </div>
                            </div>
                            <h3>Order Status Update Notification</h3>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-status-change-status"><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="webservice[status_change_status]" id="input-status-change-status" class="form-control">
<?php if (isset($status_change_status) && $status_change_status == '1') { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0"><?php echo $text_disabled; ?></option>
<?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                    </select>
                                    <div style="font-size: 10px;">This setting will enable/disable Order status change push notification functionality.</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status-change-title"><?php echo $entry_notification_title; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="webservice[status_change_title]" value="<?php echo $status_change_title; ?>" id="input-status-change-title" class="form-control" />
                                    <div style="font-size: 10px;">Enter message for Order status change Notification</div>
                                    <?php if ($error_status_change_title) { ?>
                                        <div class="text-danger"><?php echo $error_status_change_title; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status-change-message"><?php echo $entry_notification_message; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="webservice[status_change_message]" value="<?php echo $status_change_message; ?>" id="input-status-change-message" class="form-control" />
                                    <div style="font-size: 10px;">Enter message for Status Change Notification</div>
                                        <?php if ($error_status_change_message) { ?>
                                        <div class="text-danger"><?php echo $error_status_change_message; ?></div>
                                        <?php } ?>
                                </div>
                            </div>
                            <h3>Abandoned Cart Notification</h3>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-abandoned-cart-notification-status"><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="webservice[abandoned_cart_notification_status]" id="input-abandoned-cart-notification-status" class="form-control">
<?php if (isset($abandoned_cart_notification_status) && $abandoned_cart_notification_status == '1') { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0"><?php echo $text_disabled; ?></option>
<?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                    </select>
                                    <div style="font-size: 10px;"><?php echo $descp_firebase_key; ?></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-abandoned_cart_notification-title"><?php echo $entry_notification_title; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="webservice[abandoned_cart_notification_title]" value="<?php echo $entry_notification_title; ?>" id="input-abandoned_cart_notification-title" class="form-control" />
                                    <div style="font-size: 10px;"><?php echo $descp_sc_message; ?></div>
                                    <?php if ($error_abandoned_cart_notification_title) { ?>
                                        <div class="text-danger"><?php echo $error_abandoned_cart_notification_title; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-abandoned_cart_notification-message"><?php echo $entry_notification_message; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="webservice[abandoned_cart_notification_message]" value="<?php echo $abandoned_cart_notification_message; ?>" id="input-abandoned_cart_notification-message" class="form-control" />
                                    <div style="font-size: 10px;"><?php echo $descp_status_change_notification; ?></div>
                                    <?php if ($error_abandoned_cart_notification_message) { ?>
                                        <div class="text-danger"><?php echo $error_abandoned_cart_notification_message; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-abandoned_cart_notification-interval"><?php echo $entry_abandoned_cart_notification_interval; ?></label>
                                <div class="col-sm-10">
                                    <input type="number" name="webservice[abandoned_cart_notification_interval]" value="<?php echo $abandoned_cart_notification_interval; ?>" id="input-abandoned_cart_notification-interval" class="form-control" />
                                    <div style="font-size: 10px;"><?php echo $entry_in_hours; ?></div>
<?php if ($error_abandoned_cart_notification_interval) { ?>
                                        <div class="text-danger"><?php echo $error_abandoned_cart_notification_interval; ?></div>
<?php } ?>
                                </div>
                            </div>
                            <div class="well"><b>Cron Instructions</b><br>
                                Add the cron to your store via control panel/putty to create complete database backup and download it to server and google drive automatically according to your serial reminder settings. Find below the Instruction to add the cron. 
                                <br>
                                <b>Cron setup via SSH</b><br>
                                0/30 * * * * wget -O /dev/null http://your.store.com/index.php?route=webservices/firebase/AppCheckAbandonedCart
                            </div>
                        </div>
			    <!----------------------Home Page Layout------------------------->
                <div class="tab-pane" id="tab-home-page-layout">
                    <div class="page-header container-fluid">
                        <div id='message'></div>
                        <div class="pull-right">
                            <button type="button" data-name="Add Layout"  data-target="#addLayoutModal" data-toggle="modal" title="Add Layout" class="btn btn-primary">&nbsp;Add Layout</button>
                        </div>
                    </div>
                    <div class="tab-pane <?php if(isset($tab) && $tab == 'log'){ echo 'active'; } ?>" id="tab-log">
                        
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover">
                              <thead>
                                <tr>
                                  <td class="text-left"><?php echo $entry_serial_number; ?></td>
                                  <td class="text-left"><?php echo $entry_layout_id; ?></td>
                                  <td class="text-left"><?php echo $entry_layout_name; ?></td>
                                  <td class="text-left" width="200px;"><?php echo $entry_action; ?></td>
                                </tr>
                              </thead>
                              <?php if(isset($layouts) && count($layouts) > 0) { ?>
                              <tbody>
                                <?php foreach ($layouts as $layout) {
                                    $i = 1;
                                    ?>
                                <tr id="layout-<?php echo $i; ?>">
                                    <td><?php echo $i; ?></td>  
                                    <td><?php echo $layout['layout_id']; ?></td>                                                                                           
                                    <td><?php echo $layout['layout_name']; ?></td>                                                                                           
                                    <td class="text-left">
                                        <div class="btn-group pull-right">
                                            <a href="index.php?route=module/webservice/layout&token=<?php echo $token; ?>&layout_id=<?php echo $layout['layout_id']; ?>" title="Edit" class="edit btn btn-default">
                                                <i class="icon-pencil"></i> Edit                                    </a>
                                            <a onclick="confirm('Are you sure?') ? location.href = 'index.php?route=module/webservice/deleteLayout&token=<?php echo $token; ?>&layout_id=<?php echo $layout['layout_id']; ?>' : false;" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="Delete Layout" aria-describedby="tooltip544895"><i class="fa fa-minus-circle"></i></a>
                                        </div>
                                </tr>
                                <?php $i++; } ?>
                              </tbody>
                              <?php }else{ ?>
                              <tbody>
                                  <tr style="height: 200px;">
                                      <td colspan="7"><center><?php echo $text_no_history; ?></center></td>
                                  </tr>
                              </tbody>
                              <?php } ?>
                            </table>
                        </div>
                    </div>
                </div>
                        <!----------------------Tab Push Notification History------------------------->
                        <div class="tab-pane" id="tab-pnh">
                            <div class="page-header container-fluid">
                                <div id='message'></div>
                                <div class="pull-right">
                                    <button type="button" data-name="Send Notification" data-target="#syncDataModal" data-toggle="modal" title="<?php echo $text_send_notification; ?>" class="btn btn-primary">&nbsp;<?php echo $text_send_notification; ?></button>
                                </div>
                            </div>
                            <div class="tab-pane <?php if (isset($tab) && $tab == 'log') {
    echo 'active';
} ?>" id="tab-log">
                                <div class="well" style="display:none;">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="control-label" for="input-title"><?php echo $entry_title; ?></label>
                                                <input type="text" name="filter_title" value="<?php echo $filter_title; ?>" placeholder="<?php echo $entry_title; ?>" id="input-filter-title" class="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label" for="input-redirect_activity"><?php echo $entry_redirect_activity; ?></label>
                                                <select name="filter_redirect_activity" id="input-pn-redirect_activity" class="form-control">
                                                    <option value=""><?php echo $text_select; ?></option>
<?php foreach ($filter_redirect_types as $key => $value) { ?>
    <?php if ($key == $filter_redirect_type) { ?>
                                                            <option value="<?php echo $key; ?>" selected="selected"><?php echo $value; ?></option>
    <?php } else { ?>
                                                            <option value="<?php echo $key; ?>"><?php echo $value; ?></option>
    <?php }
} ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="control-label" for="input_from_date"><?php echo $entry_from_date; ?></label>
                                                <div class="input-group date">
                                                    <input type="text" name="filter_from_date" value="<?php echo $filter_from_date; ?>" placeholder="<?php echo $entry_from_date; ?>" data-format="YYYY-MM-DD" id="input_from_date" class="form-control" />
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label" for="input_to_date"><?php echo $entry_to_date; ?></label>
                                                <div class="input-group date">
                                                    <input type="text" name="filter_to_date" value="<?php echo $filter_to_date; ?>" placeholder="<?php echo $entry_to_date; ?>" data-format="YYYY-MM-DD" id="input_to_date" class="form-control" />
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>
                                            </div>
                                            <button type="button" id="button-job-filter" class="btn btn-primary pull-right" ><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
                                            &nbsp;<button type="button" id="button-job-refresh" class="btn btn-default pull-right" style="margin-right: 2px;"><i class="fa fa-refresh"></i> <?php echo $button_refresh; ?></button>
                                        </div>
                                    </div>
                                </div>

                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <td class="text-left"><?php echo $entry_notification_id; ?></td>
                                                <td class="text-left"><?php echo $entry_title; ?></td>
                                                <td class="text-left"><?php echo $entry_redirect_activity; ?></td>
                                                <td class="text-left"><?php echo $entry_category; ?></td>
                                                <td class="text-left"><?php echo $entry_product; ?></td>
                                                <td class="text-left"><?php echo $entry_sent_date; ?></td>
                                                <td class="text-left"><?php echo $entry_details; ?></td>
                                            </tr>
                                        </thead>
                                            <?php if (isset($notification_histories) && count($notification_histories) > 0) { ?>
                                            <tbody>
                                            <?php foreach ($notification_histories as $notification_history) { ?>
                                                    <tr id="notification-<?php echo $notification_history['notification_id']; ?>">
                                                        <td><?php echo $notification_history['notification_id']; ?></td>                                                                                           
                                                        <td><?php echo $notification_history['title']; ?></td>                                                                                           
                                                        <td><?php echo $notification_history['redirect_activity']; ?></td>                                                                                           
                                                        <td><?php echo $notification_history['category']; ?></td>                                                                                           
                                                        <td><?php echo $notification_history['product']; ?></td>                                                                                           
                                                        <td><?php echo $notification_history['date_added']; ?></td>                                                                                          
                                                        <td class="text-left">
                                                            <button type="button" data-name="View Notification" data-id="<?php echo $notification_history['notification_id']; ?>" data-title="<?php echo $notification_history['title']; ?>" data-message="<?php echo $notification_history['message']; ?>" data-image="<?php echo $notification_history['image']; ?>" data-redirect_activity="<?php echo $notification_history['redirect_activity']; ?>" data-category="<?php echo $notification_history['category']; ?>" data-product="<?php echo $notification_history['product']; ?>" data-date_added="<?php echo $notification_history['date_added']; ?>" data-target="#showDetailsModal" data-toggle="modal" title="<?php echo $entry_details; ?>" class="btn btn-default"><i class="fa fa-eye"></i></button>
                                                    </tr>
    <?php } ?>
                                            </tbody>
<?php } else { ?>
                                            <tbody>
                                                <tr style="height: 200px;">
                                                    <td colspan="7"><center><?php echo $text_no_history; ?></center></td>
                                            </tr>
                                            </tbody>
<?php } ?>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!----------------------Tab Payment Methods------------------------->
                        <div class="tab-pane" id="tab-payment">
                            <h3><?php echo $entry_paypal; ?></h3>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-paypal_status"><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="webservice[paypal_status]" id="input-paypal_status" class="form-control">
<?php if (isset($paypal_status) && $paypal_status == '1') { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
<?php } ?>
                                    </select>
                                    <div style="font-size: 10px;"><?php echo $descp_paypal_status ?></div>
                                </div>
                            </div>
                            <div class="form-group required paypal_options">
                                <label class="col-sm-2 control-label" for="input-paypal-name"><?php echo $entry_payment_method_name; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="webservice[paypal_name]" value="<?php echo $paypal_name; ?>" id="input-paypal-name" class="form-control" />
                                    <div style="font-size: 10px;"><?php echo $descp_payment_name; ?></div>
                                    <?php if ($error_paypal_name) { ?>
                                        <div class="text-danger"><?php echo $error_paypal_name; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group required paypal_options">
                                <label class="col-sm-2 control-label" for="input-paypal-code"><?php echo $entry_payment_method_code; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="webservice[paypal_code]" value="paypal" id="input-paypal-code" class="form-control" readonly />
                                 </div>   
                            </div>
                            <div class="form-group  required paypal_options">
                                <label class="col-sm-2 control-label" for="input-mode"><?php echo $entry_mode; ?></label>
                                <div class="col-sm-10">
                                    <select name="webservice[paypal_mode]" id="input-mode" class="form-control">
<?php if (isset($paypal_mode) && $paypal_mode == '1') { ?>
                                            <option value="1" selected="selected"><?php echo $text_live; ?></option>
                                            <option value="0"><?php echo $text_sandbox; ?></option>
<?php } else { ?>
                                            <option value="1"><?php echo $text_live; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_sandbox; ?></option>
<?php } ?>
                                    </select>
                                    <div style="font-size: 10px;"><?php echo $descp_paypal_sandbox; ?></div>
                                </div>
                            </div>
                            <div class="form-group required paypal_options">
                                <label class="col-sm-2 control-label" for="input-paypal-clientid"><?php echo $entry_payment_method_clientid; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="webservice[paypal_clientid]" value="<?php echo $paypal_clientid; ?>" id="input-paypal-clientid" class="form-control" />
                                </div>
                                 <?php if ($error_paypal_clientid) { ?>
                                    <div class="text-danger"><?php echo $error_paypal_clientid; ?></div>
                                <?php } ?>
                            </div>   
                    <h3><?php echo $entry_cod ?></h3>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-cod_status"><?php echo $entry_status; ?></label>
                            <div class="col-sm-10">
                              <select name="webservice[cod_status]" id="input-cod_status" class="form-control">
                                <?php if (isset($cod_status) && $cod_status=='1') { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                              </select>
                              <div style="font-size: 10px;">This setting will enable/disable cod on App.</div>
                            </div>
                          </div>
                          <div class="form-group required cod_options">
                              <label class="col-sm-2 control-label" for="input-paypal-name"><?php echo $entry_payment_method_name; ?></label>
                              <div class="col-sm-10">
                                <input type="text" name="webservice[cod_name]" value="<?php echo $cod_name; ?>" id="input-cod-name" class="form-control" />
                                <div style="font-size: 10px;"><?php echo $descp_payment_name; ?></div>
                                <?php if ($error_cod_name) { ?>
                                <div class="text-danger"><?php echo $error_cod_name; ?></div>
                                <?php } ?>
                              </div>
                          </div> 
                          <div class="form-group required cod_options">
                              <label class="col-sm-2 control-label" for="input-paypal-code"><?php echo $entry_payment_method_code; ?></label>
                              <div class="col-sm-10">
                                <input type="text" name="webservice[cod_code]" value="cod" id="input-cod-code" class="form-control" readonly/>
                              </div>
                          </div> 
                </div>
                <!----------------------Tab Featured------------------------->
                <div class="tab-pane" id="tab-featured">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-featured-status"><?php echo $entry_status; ?></label>
                      <div class="col-sm-10">
                        <select name="webservice[featured_status]" id="input-featured-status" class="form-control">
                          <?php if (isset($featured_status) && $featured_status=='1') { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-featured-product"><?php echo $entry_featured_product; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="featured_product_field" value="" placeholder="<?php echo $entry_featured_product; ?>" id="input-featured-product" class="form-control" />
                          <div id="featured-product" class="well well-sm" style="height: 150px; overflow: auto;">
                            <?php foreach ($featured_products as $product) { ?>
                            <div id="featured-product<?php echo $product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                              <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                            </div>
                            <?php } ?>
                          </div>
                          <input type="hidden" name="webservice[featured_product]" value="<?php echo $featured_product; ?>" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-featured-limit"><?php echo $entry_featured_limit; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="webservice[featured_limit]" value="<?php echo $featured_limit; ?>" placeholder="<?php echo $entry_featured_limit; ?>" id="input-featured-limit" class="form-control" />
                          <div style="font-size: 10px;">Maximum limit is 20</div>
                          <?php if ($error_featured_limit) { ?>
                          <div class="text-danger"><?php echo $error_featured_limit; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-featured-image"><?php echo $entry_featured_image; ?></label>
                        <div class="col-sm-10">                          
                          <input type="text" name="webservice[featured_width]" value="<?php echo $featured_width; ?>" placeholder="<?php echo $entry_featured_width; ?>" id="input-featured-width" class="form-control" />
                          <input type="text" name="webservice[featured_height]" value="<?php echo $featured_height; ?>" placeholder="<?php echo $entry_featured_height; ?>" id="input-featured-height" class="form-control" />
                          <?php if ($error_featured_image) { ?>
                          <div class="text-danger"><?php echo $error_featured_image; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                </div>
                <!----------------------Tab Specials------------------------->
                <div class="tab-pane" id="tab-specials">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-special-status"><?php echo $entry_status; ?></label>
                      <div class="col-sm-10">
                        <select name="webservice[special_status]" id="input-special-status" class="form-control">
                          <?php if (isset($special_status) && $special_status=='1') { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                      </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-special-limit"><?php echo $entry_special_limit; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="webservice[special_limit]" value="<?php echo $special_limit; ?>" placeholder="<?php echo $entry_special_limit; ?>" id="input-special-limit" class="form-control" />
                          <div style="font-size: 10px;">Maximum limit is 40</div>
                          <?php if ($error_special_limit) { ?>
                          <div class="text-danger"><?php echo $error_special_limit; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-special-image"><?php echo $entry_special_image; ?></label>
                        <div class="col-sm-10">                          
                          <input type="text" name="webservice[special_width]" value="<?php echo $special_width; ?>" placeholder="<?php echo $entry_special_width; ?>" id="input-special-width" class="form-control" />
                          <input type="text" name="webservice[special_height]" value="<?php echo $special_height; ?>" placeholder="<?php echo $entry_special_height; ?>" id="input-special-height" class="form-control" />
                          <?php if ($error_special_image) { ?>
                          <div class="text-danger"><?php echo $error_special_image; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                </div>
                <!----------------------Tab BestSeller------------------------->
                <div class="tab-pane" id="tab-best-sellers">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-bestseller-status"><?php echo $entry_status; ?></label>
                      <div class="col-sm-10">
                        <select name="webservice[bestseller_status]" id="input-bestseller-status" class="form-control">
                          <?php if (isset($bestseller_status) && $bestseller_status==1) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                      </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-bestseller-limit"><?php echo $entry_bestseller_limit; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="webservice[bestseller_limit]" value="<?php echo $bestseller_limit; ?>" placeholder="<?php echo $entry_bestseller_limit; ?>" id="input-bestseller-limit" class="form-control" />
                          <div style="font-size: 10px;">Maximum limit is 40</div>
                          <?php if ($error_bestseller_limit) { ?>
                          <div class="text-danger"><?php echo $error_bestseller_limit; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-bestseller-image"><?php echo $entry_bestseller_image; ?></label>
                        <div class="col-sm-10">                          
                          <input type="text" name="webservice[bestseller_width]" value="<?php echo $bestseller_width; ?>" placeholder="<?php echo $entry_bestseller_width; ?>" id="input-bestseller-width" class="form-control" />
                          <input type="text" name="webservice[bestseller_height]" value="<?php echo $bestseller_height; ?>" placeholder="<?php echo $entry_bestseller_height; ?>" id="input-bestseller-height" class="form-control" />
                          <?php if ($error_bestseller_image) { ?>
                          <div class="text-danger"><?php echo $error_bestseller_image; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                </div>
                <!----------------------Tab Latest------------------------->
                <div class="tab-pane" id="tab-latest">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-latest-status"><?php echo $entry_status; ?></label>
                      <div class="col-sm-10">
                        <select name="webservice[latest_status]" id="input-latest-status" class="form-control">
                          <?php if (isset($latest_status) && $latest_status=='1') { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                      </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-latest-limit"><?php echo $entry_latest_limit; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="webservice[latest_limit]" value="<?php echo $latest_limit; ?>" placeholder="<?php echo $entry_latest_limit; ?>" id="input-latest-limit" class="form-control" />
                          <div style="font-size: 10px;">Maximum limit is 40</div>
                          <?php if ($error_latest_limit) { ?>
                          <div class="text-danger"><?php echo $error_latest_limit; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-latest-image"><?php echo $entry_latest_image; ?></label>
                        <div class="col-sm-10">                          
                          <input type="text" name="webservice[latest_width]" value="<?php echo $latest_width; ?>" placeholder="<?php echo $entry_latest_width; ?>" id="input-latest-width" class="form-control" />
                          <input type="text" name="webservice[latest_height]" value="<?php echo $latest_height; ?>" placeholder="<?php echo $entry_latest_height; ?>" id="input-latest-height" class="form-control" />
                          <?php if ($error_latest_image) { ?>
                          <div class="text-danger"><?php echo $error_latest_image; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                </div>
                <!----------------------Tab CMS pages------------------------->
                <div class="tab-pane" id="tab-cms">
                    <div id="cms-panel" class="panel panel-default">
                        <div id="cms-panel-heading" class="panel-heading">
                          <h3 class="panel-title" style="float:left"><i class="fa fa-list"></i>CMS Pages</h3>
                          <div class="text-right"><a href="<?php echo $information; ?>"><i class="fa fa-plus-circle"></i>&nbsp;&nbsp;Add New Information Page</a></div>
                          <div style="clear: both"></div>
                        </div>
                        <div id="cms-panel-body" class="panel-body">
                            <table id="cms-table" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                      <td class="text-left"><?php echo $entry_cms_title; ?></td>
                                      <td class="text-left"><?php echo $entry_cms_link_to; ?></td>
                                      <td class="text-left"><?php echo $entry_cms_status; ?></td>
                                      <td class="text-right"><?php echo $entry_cms_sort_order; ?></td>                                      
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <?php foreach ($informations as $information) { $cms_row=$information['information_id']; ?>
                                        <tr id="cms-row<?php echo $cms_row; ?>">
                                            <input type='hidden' name="cms[<?php echo $cms_row; ?>][unique_info_id]" value="<?php echo $information['information_id']; ?>"/>
                                            <td class="text-left"><?php foreach ($languages as $language) { ?>
                                                    <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                                                        <?php if (!empty($cms[$cms_row]['cms_title'][$language['language_id']]['title'])) { ?>  
                                                            <input type="text" name="cms[<?php echo $cms_row; ?>][cms_title][<?php echo $language['language_id']; ?>][title]" value="<?php echo $cms[$cms_row]['cms_title'][$language['language_id']]['title']; ?>" placeholder="<?php echo $entry_cms_title; ?>" class="form-control" />
                                                        <?php } else { ?>
                                                            <input type="text" name="cms[<?php echo $cms_row; ?>][cms_title][<?php echo $language['language_id']; ?>][title]" value="<?php echo $information['title']; ?> " placeholder="<?php echo $entry_cms_title; ?>" class="form-control" />
                                                        <?php } ?>
                                                    </div>
                                                        <?php if (isset($error_cms_title[$cms_row][$language['language_id']])) { ?>
                                                        <div class="text-danger"><?php echo $error_cms_title[$cms_row][$language['language_id']]; ?></div>
                                                        <?php } ?>
    <?php } ?></td>
                                            <td class="text-left">
                                                <select  name="cms[<?php echo $cms_row; ?>][link_to]" id="cms[<?php echo $cms_row; ?>][link_to]" class="form-control">                                                  
    <?php foreach ($informations as $information2) {
        $cms_row2 = $information2['information_id'] ?>
                                                            <?php if (isset($cms[$cms_row]['link_to'])) {
                                                                if ($cms[$cms_row]['link_to'] == $information2['information_id']) {
                                                                    ?>
                                                                <option value="<?php echo $information2['information_id'] ?>" selected="selected"><?php echo $information2['title']; ?></option>
            <?php } else { ?>
                                                                <option value="<?php echo $information2['information_id'] ?>"><?php echo $information2['title']; ?></option>
                                                                <?php } ?>
        <?php } else { ?>                                                  
                                                            <option <?php echo ($cms_row == $cms_row2) ? 'selected="selected"' : ''; ?> value="<?php echo $information2['information_id']; ?>"><?php echo $information2['title']; ?></option>
                                                <?php } ?>
                                                <?php $cms_row2++;
                                            } ?>
                                                </select>
                                            </td>
                                            <td class="text-left">
                                                <div id="cms_status_<?php echo $cms_row; ?>">
                                                    <select name="cms[<?php echo $cms_row; ?>][status]" class="form-control">
    <?php if (isset($cms[$cms_row]['status']) && !empty($cms[$cms_row]['status'])) { ?>
                                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                            <option value="0"><?php echo $text_disabled; ?></option>
                                                    <?php } else { ?>
                                                            <option value="1"><?php echo $text_enabled; ?></option>
                                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                    <?php } ?>
                                                    </select>
                                                </div>
                                            </td>                                            
                                                <?php if (isset($cms[$cms_row]['sort_order'])) { ?>
                                                <td class="text-right"><input type="text" name="cms[<?php echo $cms_row; ?>][sort_order]" value="<?php echo $cms[$cms_row]['sort_order']; ?>" placeholder="<?php echo $entry_cms_sort_order; ?>" class="form-control" /></td>
                                                <?php } else { ?>
                                                <td class="text-right"><input type="text" name="cms[<?php echo $cms_row; ?>][sort_order]" value="" placeholder="<?php echo $entry_cms_sort_order; ?>" class="form-control" /></td>
    <?php } ?>
                                            </tr>                                    
<?php } $cms_row = 0; ?>
                                        <tr id="cms-row<?php echo $cms_row; ?>">
                                        <input type='hidden' name="cms[<?php echo $cms_row; ?>][unique_info_id]" value="0"/>
                                        <td class="text-left"><?php foreach ($languages as $language) { ?>
                                                <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                                                        <?php if (!empty($cms[$cms_row]['cms_title'][$language['language_id']]['title'])) { ?>  
                                                        <input type="text" name="cms[<?php echo $cms_row; ?>][cms_title][<?php echo $language['language_id']; ?>][title]" value="<?php echo $cms[$cms_row]['cms_title'][$language['language_id']]['title']; ?>" placeholder="<?php echo $entry_cms_title; ?>" class="form-control" />
                                                        <?php } else { ?>
                                                        <input type="text" name="cms[<?php echo $cms_row; ?>][cms_title][<?php echo $language['language_id']; ?>][title]" value="Contact Us" placeholder="<?php echo $entry_cms_title; ?>" class="form-control" />
    <?php } ?>
                                                </div>
    <?php if (isset($error_cms_title[$cms_row][$language['language_id']])) { ?>
                                                    <div class="text-danger"><?php echo $error_cms_title[$cms_row][$language['language_id']]; ?></div>
                                            <?php } ?>
                                        <?php } ?></td>
                                        <td class="text-left"></td>
                                        <td class="text-left">
                                            <div id="cms_status_<?php echo $cms_row; ?>">
                                                <select name="cms[<?php echo $cms_row; ?>][status]" class="form-control">
<?php if (isset($cms[$cms_row]['status']) && !empty($cms[$cms_row]['status'])) { ?>
                                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                        <option value="0"><?php echo $text_disabled; ?></option>
<?php } else { ?>
                                                        <option value="1"><?php echo $text_enabled; ?></option>
                                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
<?php } ?>
                                                </select>
                                            </div>
                                        </td>

<?php if (isset($cms[$cms_row]['sort_order'])) { ?>
                                            <td class="text-right"><input type="text" name="cms[<?php echo $cms_row; ?>][sort_order]" value="<?php echo $cms[$cms_row]['sort_order']; ?>" placeholder="<?php echo $entry_cms_sort_order; ?>" class="form-control" /></td>
<?php } else { ?>
                                            <td class="text-right"><input type="text" name="cms[<?php echo $cms_row; ?>][sort_order]" value="" placeholder="<?php echo $entry_cms_sort_order; ?>" class="form-control" /></td>
<?php } ?>
                                        </tr>
                                        </tbody>
                                    </table>    
                                </div>
                            </div>                        
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="modal fade" id="syncDataModal"  tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="font-size: 14px;">
                        <div id="sync_message"></div>
                        <div class="col-sm-12">
                            <form action="" method="post" enctype="multipart/form-data" id="form-new-notification" class='form-horizontal'>
                                <div class="form-group required" style="margin-bottom: 10px;">
                                    <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="title" value="" placeholder="<?php echo $entry_title; ?>" id="input-title" class="form-control" />
                                        <div id="title-error"></div>
                                    </div>
                                </div>
                                <div class="form-group required" style="margin-bottom: 10px;">
                                    <label class="col-sm-2 control-label" for="input-title"><?php echo "Message"; ?></label>
                                    <div class="col-sm-10">
                                        <textarea name="message" placeholder="Message" id="input-message" class="form-control"></textarea>
                                        <div id="message-error"></div>
                                    </div>
                                </div>
                                <div class="form-group" style="margin-bottom: 10px;">
                                    <label class="col-sm-2 control-label" for="input-image"><?php echo "Image"; ?></label>
                                    <div class="col-sm-10">
                                        <a href="" id="thumb-image-1111" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                        <input type="hidden" name="image" value="" id="input-image" />
                                        <div id="image-error"></div>
                                    </div>
                                </div>
								<div class="form-group" style="margin-bottom: 10px;">
                                    <label class="col-sm-2 control-label" for="input-redirect_activity"><?php echo $text_select_device; ?>: </label>
                                    <div class="col-sm-10">
                                        <select name="select_device" id="input-select_device" class="form-control">
                                            <option value=""><?php echo $text_no_device; ?></option>
											<option value="Android"><?php echo $text_android; ?></option>
											<option value="iOS"><?php echo $text_ios; ?></option>
											<option value="Both"><?php echo $text_both;?></option>
                                        </select>
                                        <div id="activity-error2"></div>
                                    </div>
                                </div>
                                <div class="form-group" style="margin-bottom: 10px;">
                                    <label class="col-sm-2 control-label" for="input-redirect_activity"><?php echo "Redirect Activity"; ?></label>
                                    <div class="col-sm-10">
                                        <select onchange="selectRedirectActivity(this.value);" name="redirect_activity" id="input-redirect_activity" class="form-control">
                                            <option value="">Select Redirect Activity</option>
                                            <option value="0">Home</option>
                                            <option value="1">Category</option>
                                            <option value="2">Product</option>
                                        </select>
                                        <div id="activity-error"></div>
                                    </div>
                                </div>
                                <div class="form-group" style="margin-bottom: 10px;display:none" id='div-activity_link_to'>
                                    <label class="col-sm-2 control-label" for="input-activity_link_to"><?php echo "Link To"; ?></label>
                                    <div class="col-sm-10">
                                        <select name="activity_link_to" id="input-activity_link_to" class="form-control">
<?php
echo "<option value=''>Select Link Type First</option>";
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
                    <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_cancel; ?></button>
                    <button type="button" class="btn btn-primary" id='send_notification' ><?php echo $button_submit; ?></button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <div class="modal fade" id="showDetailsModal"  tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="font-size: 14px;">
                        <div id="sync_message"></div>
                        <div class="col-sm-12">
                            <table class="table table-striped table-bordered table-hover">
                                <tbody>
                                    <tr>
                                        <td><?php echo $entry_title; ?></td>
                                        <td><div id="title"></div></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo "Message"; ?></td>
                                        <td><div id="message"></div></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo "Image"; ?></td>
                                        <td><div id="image"></div></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo "Redirect Activity"; ?></td>
                                        <td><div style="text-transform: capitalize;" id="redirect_activity"></div></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo "Category"; ?></td>
                                        <td><div id="category"></div></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo "Product"; ?></td>
                                        <td><div id="product"></div></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo "Sent On"; ?></td>
                                        <td><div id="date_added"></div></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo "Close"; ?></button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
<div class="modal fade" id="addLayoutModal"  tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="gridSystemModalLabel"><?php echo $entry_add_layout; ?></h4>
        </div>
          <div id="add-layout-message"></div>
          <form action="" method="post" enctype="multipart/form-data" id="save-new-layout" class='form-horizontal'>
          <div class="modal-body">
              <div class="row" style="font-size: 14px;">
                <div class="form-group required" style="margin-bottom: 10px;">
                      <label class="col-sm-4 control-label" for="input-title"><?php echo $entry_add_layout_name; ?></label>
                    <div class="col-sm-8">
                      <input type="text" name="layout_title" value="" placeholder="<?php echo $entry_add_layout_name; ?>" id="layout-title" class="form-control" />
                      <div id="layout-title-error"></div>
                    </div>
                  </div>
           
          </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_cancel;?></button>
          <button type="button" class="btn btn-primary" id='save-layout' ><?php echo $button_submit;?></button>
        </div>
      </div><!-- /.modal-content -->
       </form>
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>
<!---- script for slideshow and banner module------>   

<script src="view/javascript/colorpicker/jquery.colorpicker.js"></script>

<script type="text/javascript"><!--
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
   $('.mColorPicker').each(function() {
       var rgb = $(this).css('backgroundColor');
        rgb=rgb.replace(/[^\d,]/g, '').split(",");
        var y = 2.99 * rgb[0] + 5.87 * rgb[1] + 1.14 * rgb[2];
        if (y >= 1275) {
         $(this).css('color','black');
        } else {
         $(this).css('color','white');
        }
        
    }); 
    
    $("#save-webservice").click(function(){        
        $("#form-webservice").submit(); // Submit the form
    });
    
var image_row = <?php echo $image_row; ?>;
var banner_image_row = <?php echo $banner_image_row; ?>;

        function addImage() {
            html = '<tr id="image-row' + image_row + '">';
            html += '  <td class="text-left">';
<?php foreach ($languages as $language) { ?>
                html += '    <div class="input-group">';
                html += '      <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><input type="text" name="slideshow_image[' + image_row + '][slideshow_image_description][<?php echo $language['language_id']; ?>][title]" value="" placeholder="<?php echo $entry_slideshow_title; ?>" class="form-control" />';
                html += '    </div>';
<?php } ?>
            html += '  </td>';
            html += '<td class"text-left"><select onchange="selectLinkTo(' + image_row + ', this.value);" name="slideshow_image[' + image_row + '][link_type]" id="slideshow_image[' + image_row + '][link_type]" class="form-control">';
            html += '<option value="">Select Link Type</option>';
            html += '<option value="0">Category</option>';
            html += '<option value="1">Product</option>';
            html += '</select></td>';

            html += '<td class"text-left"><div id="slideshow_image_' + image_row + '_link_to"><select name="slideshow_image[' + image_row + '][link_to]" class="form-control">';
            html += '<option value="">Select Link Type First</option>';
            html += '</select></div></td>';

            html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="slideshow_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';

            html += '  <td class="text-right"><input type="text" name="slideshow_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
            html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_slideshow_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
            html += '</tr>';

            $('#images tbody').append(html);

            image_row++;
        }
        function selectLinkTo(row_no, value) {
            if (parseInt(value) == 0) { // For category
                $.ajax({
                    url: 'index.php?route=module/webservice/selectCategory&token=<?php echo $token; ?>',
                    dataType: 'json',
                    success: function (json) {
                        html = '<select name="slideshow_image[' + row_no + '][link_to]" class="form-control" style="width: 100%">';
                        $.each(json, function (i, item) {
                            html += '<option value="' + item.category_id + '">' + item.name + '</option>';
                        });
                        html += '</select>';
                        $("#slideshow_image_" + row_no + "_link_to").html(html);
                    }
                });
            }
            else if (parseInt(value) == 1) { // For product
                $.ajax({
                    url: 'index.php?route=module/webservice/selectProduct&token=<?php echo $token; ?>',
                    dataType: 'json',
                    success: function (json) {
                        html = '<select name="slideshow_image[' + row_no + '][link_to]" class="form-control"> style="width: 100%"';
                        $.each(json, function (i, item) {
                            html += '<option value="' + item.product_id + '">' + item.name + '</option>';
                        });
                        html += '</select>';
                        $("#slideshow_image_" + row_no + "_link_to").html(html);
                    }
                });
            }
            else {
                html = '<select name="slideshow_image[' + row_no + '][link_to]" class="form-control"> style="width: 100%"';
                html += '<option value="">Select Link Type First</option>';
                html += '</select>';

                $("#slideshow_image_" + row_no + "_link_to").html(html);
            }

        }
        function selectRedirectActivity(value) {
            $("#div-activity_link_to").hide('slow');
            if (parseInt(value) == 1) { // For category
                $.ajax({
                    url: 'index.php?route=module/webservice/selectCategory&token=<?php echo $token; ?>',
                    dataType: 'json',
                    success: function (json) {
                        html = '';
                        $.each(json, function (i, item) {
                            html += '<option value="' + item.category_id + '">' + item.name + '</option>';
                        });
                        $("#input-activity_link_to").html(html);
                        $("#div-activity_link_to").show('slow');
                    }
                });
            }
            else if (parseInt(value) == 2) { // For product
                $.ajax({
                    url: 'index.php?route=module/webservice/selectProduct&token=<?php echo $token; ?>',
                    dataType: 'json',
                    success: function (json) {
                        html = '';
                        $.each(json, function (i, item) {
                            html += '<option value="' + item.product_id + '">' + item.name + '</option>';
                        });
                        $("#input-activity_link_to").html(html);
                        $("#div-activity_link_to").show('slow');
                    }
                });
            }
            else {
                html = '<option value="">Select Redirect Activity Type First</option>';

                $("#input-activity_link_to").html(html);
            }

        }
        function addBannerImage() {
            html = '<tr id="banner-image-row' + banner_image_row + '">';
            html += '  <td class="text-left">';
<?php foreach ($languages as $language) { ?>
                html += '    <div class="input-group">';
                html += '      <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><input type="text" name="banner_image[' + banner_image_row + '][banner_image_description][<?php echo $language['language_id']; ?>][title]" value="" placeholder="<?php echo $entry_banner_title; ?>" class="form-control" />';
                html += '    </div>';
<?php } ?>
            html += '  </td>';
            html += '<td class"text-left"><select onchange="selectBannerLinkTo(' + banner_image_row + ', this.value);" name="banner_image[' + banner_image_row + '][link_type]" id="banner_image[' + banner_image_row + '][link_type]" class="form-control">';
            html += '<option value="">Select Link Type</option>';
            html += '<option value="0">Category</option>';
            html += '<option value="1">Product</option>';
            html += '</select></td>';

            html += '<td class"text-left"><div id="banner_image_' + banner_image_row + '_link_to"><select name="banner_image[' + banner_image_row + '][link_to]" class="form-control">';
            html += '<option value="">Select Link Type First</option>';
            html += '</select></div></td>';

            html += '  <td class="text-left"><a href="" id="thumb-banner-image' + banner_image_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="banner_image[' + banner_image_row + '][image]" value="" id="input-banner-image' + banner_image_row + '" /></td>';

            html += '  <td class="text-right"><input type="text" name="banner_image[' + banner_image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
            html += '  <td class="text-left"><button type="button" onclick="$(\'#banner-image-row' + banner_image_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_banner_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
            html += '</tr>';

            $('#banner_images tbody').append(html);

            banner_image_row++;
        }
        function selectBannerLinkTo(row_no, value) {
            if (parseInt(value) == 0) { // For category
                $.ajax({
                    url: 'index.php?route=module/webservice/selectCategory&token=<?php echo $token; ?>',
                    dataType: 'json',
                    success: function (json) {
                        html = '<select name="banner_image[' + row_no + '][link_to]" class="form-control" style="width: 100%">';
                        $.each(json, function (i, item) {
                            html += '<option value="' + item.category_id + '">' + item.name + '</option>';
                        });
                        html += '</select>';
                        $("#banner_image_" + row_no + "_link_to").html(html);
                    }
                });
            }
            else if (parseInt(value) == 1) { // For product
                $.ajax({
                    url: 'index.php?route=module/webservice/selectProduct&token=<?php echo $token; ?>',
                    dataType: 'json',
                    success: function (json) {
                        html = '<select name="banner_image[' + row_no + '][link_to]" class="form-control"> style="width: 100%"';
                        $.each(json, function (i, item) {
                            html += '<option value="' + item.product_id + '">' + item.name + '</option>';
                        });
                        html += '</select>';
                        $("#banner_image_" + row_no + "_link_to").html(html);
                    }
                });
            }
            else {
                html = '<select name="banner_image[' + row_no + '][link_to]" class="form-control"> style="width: 100%"';
                html += '<option value="">Select Link Type First</option>';
                html += '</select>';

                $("#banner_image_" + row_no + "_link_to").html(html);
            }

        }
    //-->
    </script>

    <!-------------------script for featured module------------->
    <script type="text/javascript"><!--
        $('input[name=\'featured_product_field\']').autocomplete({
            'source': function (request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
                    dataType: 'json',
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                label: item['name'],
                                value: item['product_id']
                            }
                        }));
                    }
                });
            },
            'select': function (item) {
                $('#featured-product' + item['value']).remove();

                $('#featured-product').append('<div id="featured-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" value="' + item['value'] + '" /></div>');

                data = $.map($('#featured-product input'), function (element) {
                    return $(element).attr('value');
                });

                $('input[name=\'webservice[featured_product]\']').attr('value', data.join());
            }
        });

        $('#featured-product').delegate('.fa-minus-circle', 'click', function () {
            $(this).parent().remove();

            data = $.map($('#featured-product input'), function (element) {
                return $(element).attr('value');
            });

            $('input[name=\'webservice[featured_product]\']').attr('value', data.join());
        });
$('input[name=\'shipping_method_field\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=module/webservice/shipping_autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
                                                label: item['code'],
						value: item['code']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('#shipping-method-' + item['value']).remove();
		
		$('#shipping-method').append('<div id="shipping-method-' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['value'] + '<input type="hidden" value="' + item['value'] + '" /></div>');	
	
		data = $.map($('#shipping-method input'), function(element) {
			return $(element).attr('value');
		});
						
		$('input[name=\'webservice[shipping_method]\']').attr('value', data.join());	
	}	
});

$('#shipping-method').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();

	data = $.map($('#shipping_method input'), function(element) {
		return $(element).attr('shipping_method');
	});
					
	$('input[name=\'webservice[shipping_method]\']').attr('value', data.join());	
});
        function add_new_store_click(e) {

            $('.add_store_form').show();
        }

        $('#input-paypal_status').change(function () {
            if (this.value == '0') {
                $('.paypal_options').hide('slow');
            } else if (this.value == '1') {
                $('.paypal_options').show('slow');
            }
        });
        $('#input-chat-status').change(function () {
            if (this.value == '0') {
                $('.chat_options').hide('slow');
            } else if (this.value == '1') {
                $('.chat_options').show('slow');
            }
        });
	$('#input-whatsapp-chat-status').change(function() {
    if(this.value == '0') {  
        $('.whatsapp_options').hide('slow');
        $('.chatBoxIcon').hide();
    }else if(this.value == '1') {
        $('.whatsapp_options').show('slow');
        $('.chatBoxIcon').show();
    }
});
        $('#input-cod_status').change(function () {
            if (this.value == '0') {
                $('.cod_options').hide('slow');
            } else if (this.value == '1') {
                $('.cod_options').show('slow');
            }
        });

        $('#button-job-save').click(function () {
            $('.text-danger').remove();
            var status = true;
            if ($('#input-payment_method').val() == '0') {
                $('#input-payment_method').after('<div class="text-danger">Please select a Payment Method</div>');
                status = false;
            }
            if ($('#input-payment-method-name').val() == '') {
                $('#input-payment-method-name').after('<div class="text-danger">Please enter Payment Method Name</div>');
                status = false;
            }
            if ($('#input-payment-method-clientid').val() == '' && $('#input-payment_method').val() == 'paypal') {
                $('#input-payment-method-clientid').after('<div class="text-danger">Please enter Paypal Client id</div>');
                status = false;
            }
            if (status == true) {
                $.ajax({
                    url: 'index.php?route=module/webservice/addStore&token=<?php echo $token; ?>',
                    method: 'post',
                    dataType: 'json',
                    data: 'payment_method=' + $('#input-payment_method').val() + '&payment_method_name=' + $('#input-payment-method-name').val() + '&payment_mode=' + $('#input-mode').val() + '&payment_method_clientid=' + $('#input-payment-method-clientid').val(),
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                label: item['name'],
                                value: item['product_id']
                            }
                        }));
                    }
                });
            }

        });
        $('#button-job-cancel').click(function () {
            $('.add_store_form').reset();
            $('.add_store_form').hide();
        })
$(document).ready(function() {
    enable_logo();
});
    //--></script>
    <style>
<?php if (isset($webservice_chat_status) && $webservice_chat_status == '1') { ?>
            .chat_options{
                display:block;
            }                                                      
    .chatBoxIcon{
       display:block;
    }  
<?php } else { ?>
            .chat_options{
                display:none;
            }   
    .chatBoxIcon{
       display:none;
    } 
<?php } ?>
<?php if (isset($whatsapp_chat_status) && $whatsapp_chat_status=='1') { ?>
    .whatsapp_options{
       display:block;
    }                                                      
    .chatBoxIcon{
       display:block;
    } 
    <?php } else { ?>
    .whatsapp_options{
       display:none;
    }   
    .chat_options{
       display:none;
    }   
    <?php } ?>
<?php if (isset($paypal_status) && $paypal_status == '1') { ?>
            .paypal_options{
                display:block;
            }                                                      
<?php } else { ?>
            .paypal_options{
                display:none;
            }   
<?php } ?>
<?php if (isset($cod_status) && $cod_status == '1') { ?>
            .cod_options{
                display:block;
            }                                                      
<?php } else { ?>
            .cod_options{
                display:none;
            }   
<?php } ?>
 
    </style>
    <script>
        $('#syncDataModal').on('show.bs.modal', function (event) {
            $('#sync_message').html('');
            $("#form-sync-data input[type=\'text\']").val('');
            $("#form-sync-data input[type=\'checkbox\']").removeAttr('checked');
            var button = $(event.relatedTarget)
            var name = button.data('name')
            var id = button.data('id')
            var modal = $(this)
            modal.find('.modal-title').text(name);
            modal.find('#form-sync-data input[name=\'mca_store_id\']').val(id)
        });
        $('#showDetailsModal').on('show.bs.modal', function (event) {
            $('#sync_message').html('');
            $("#form-sync-data input[type=\'text\']").val('');
            $("#form-sync-data input[type=\'checkbox\']").removeAttr('checked');
            var button = $(event.relatedTarget)
            var name = button.data('title')
            var title = button.data('title')
            var modal = $(this)
            modal.find('.modal-title').text(name);
            modal.find('#title').text(title);
            modal.find('#message').text(button.data('message'));
            modal.find('#image').html("<img src='" + button.data('image') + "'>");
            modal.find('#redirect_activity').text(button.data('redirect_activity'));
            modal.find('#category').text(button.data('category'));
            modal.find('#product').text(button.data('product'));
            modal.find('#date_added').text(button.data('date_added'));
        });
$('#save-layout').click(function(e){
    e.preventDefault();
    var status = true;
    if($('#layout-title').val() == ''){
        $('#layout-title-error').html('<div class="text-danger"><?php echo $error_layout_title; ?></div>');
        status = false;
    }
    if(status) {
        layout_name = $('#layout-title').val()
        $.ajax({
                url: 'index.php?route=module/webservice/saveLayout&token=<?php echo $token; ?>',
                method: 'post',
                data: 'name='+layout_name,
            }).done(function(response) {
                    var url = 'index.php?route=module/webservice/layout&token=<?php echo $token; ?>&layout_id='+response;
                    setTimeout(function() { window.location = url }, 3400);
                    $.growl.notice({ title: "", message: '<?php echo $success_layout_message; ?>'});
            });
    }
});

        $('#send_notification').click(function (e) {
            $('#sync_message').html('');
            $('#syncemail-error').html('');
            $('.text-danger').remove();
            e.preventDefault();
            var status = true;
            if ($('#form-new-notification input[name=\'title\']').val() == '') {
                $('#title-error').html('<div class="text-danger">Title can not be blank!</div>');
                status = false;
            }
            if ($('#form-new-notification textarea[name=\'message\']').val() == '') {
                $('#message-error').html('<div class="text-danger">Message can not be blank!</div>');
                status = false;
            }
            if ($('#form-new-notification select[name=\'redirect_activity\']').val() == '') {
                $('#activity-error').html('<div class="text-danger">Please select an option from dropdown!</div>');
                status = false;
            }
	    if ($('#form-new-notification select[name=\'select_device\']').val() == '') {
                $('#activity-error2').html('<div class="text-danger">Please select an option from dropdown!</div>');
                status = false;
            }
            if ($('#form-new-notification #input-image').val() == '') {
                $('#image-error').html('<div class="text-danger">Please select image!</div>');
                status = false;
            }

            if ($('#form-new-notification select[name=\'redirect_activity\']').val() != '' && $('#form-new-notification select[name=\'redirect_activity\']').val() != '0' && $('#form-new-notification select[name=\'activity_link_to\']').val() == '') {
                $('#link-to-error').html('<div class="text-danger">Please select an option from dropdown!</div>');
                status = false;
            }
            if (status) {

                $.ajax({
                    url: '<?php echo $sendNotificationUrl; ?>',
                    method: 'post',
                    data: $('#form-new-notification').serialize() + '&image=' + $('#input-image').val()
                }).done(function (response) {
                    $('#message').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo "Notification sent successfully"; ?>     <button type="button" class="close" data-dismiss="alert">&times;</button>    </div>');
                    $('#syncDataModal').modal('hide');
                    $.growl.notice({ title: "", message: '<?php echo "Notification sent successfully"; ?>'});
                    setTimeout(location.reload(true),3000);
            });
        }
    });
    function enable_logo(data){
        if(!data){
          data=$('#webservices_store_logo').val().trim();  
        }
        if(data==0){
            $('#enable_logo').addClass('hide');
            $('#image_for_logo').removeAttr('required');
        }else{
            $('#enable_logo').removeClass('hide');
            $('#image_for_logo').attr('required','true');
        }
    }
    /*start:changes made by Aayushi Agarwal on 1st May 2020 to make preview changes*/  
    /* 
     * Function to hide and show preview device from general settings on the click of "show preview" and "hide preview" button
     */
    function showPreview() {
        if ($('#general_settings_mobile_preview').find('.front_preview').is(":visible"))
        {   
            $('#general_settings_mobile_preview').find('.front_preview').hide();
            //$('#rightText').text(show_preview);
        } else {
            $('#general_settings_mobile_preview').find('.front_preview').show();
            //$('#rightText').text(hide_preview);
        }
    }
    $(".nav-tabs").on("click", 'li', function() {
        
        if ($('a', this).attr('href') == "#tab-general") {
            $('#general_settings_mobile_preview').find('.front_preview').show();
        } else {
            $('#general_settings_mobile_preview').css('display', 'none');
            $('#general_settings_mobile_preview').find('.front_preview').hide();
        }
    });
    
    
    $("input[name='webservice[app_theme_color]'").change(function()  {
        var color = $(this).val();
        $('.topHeader').css('background', color);
        $('.chatBoxIcon').css('background', color);
    });
    /*end:changes made by Aayushi Agarwal on 1st May 2020 to make preview changes*/ 
    </script>

</div>
<?php echo $footer; ?>
