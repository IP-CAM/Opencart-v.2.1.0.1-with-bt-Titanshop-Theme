<link type="text/css" href="view/stylesheet/mab_layout/admin-theme.css" rel="stylesheet" media="screen">
<link href="view/stylesheet/bootstrap.css" type="text/css" rel="stylesheet">
<div id="general_settings_mobile_preview" class="general_settings_mobile_preview" style="display:block;">
    <div>
        <div class="front_preview" >
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
                                            <p><?php echo $entry_home; ?></p> 
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
                            <img src="view/image/Layout_Components/General_Settings_GIF.gif">
                            <?php if (isset($whatsapp_chat_status) && $whatsapp_chat_status=='1') { ?>
                            
                            <div class="chatBoxIcon" style="display:block;background:<?php echo $app_theme_color;?>;">
                            <?php }else{ ?>
                            <div class="chatBoxIcon" style="display:none;background:<?php echo $app_theme_color;?>;">
                            <?php } ?>    
                                <img src="view/image/Layout_Components/chat_icon.png">
                            </div>
                    </div>
            </div>			
    </div>
</div>
<style>
    .topHeader {
        background: #ff8a80;
        color: #fff;
        font-size: 18px;
        padding: 5px 10px;
        float: left;
        width: 100%;
        width: 100%;
        box-sizing: border-box;
        margin-top: 0px;
    }
.topHeader .leftmenu {
    width: 20px;
    float: left;
    margin-top: 6px;
}
.searchBar, .cartSection {
    float: right;
    padding: 6px 10px 0;
}
{* .cartSection {
    float: right;
    padding: 6px 0 0 10px;
}*}
#general_settings_mobile_preview .front_preview {
    padding: 46px 0 55px;
   min-height: 200px;
   overflow: hidden;
   clear: both;
    background: url(view/image/Layout_Components/general_Settings_Mobile.png);
}
#general_settings_mobile_preview {
    position: fixed;
    width: 262px;
    height: 420px;
    z-index: 9;
    right: 40px;
    text-align: right;
    margin-top: 7px;
    bottom: 40px;
}
.chatBoxIcon {
    position: absolute;
    bottom: 10px;
    width: 40px;
    height: 40px;
    background: #00aff0;
    right: 10px;
    border-radius: 50%;
    line-height: 33px;
    padding-top: 3px;
}
.chatBoxIcon img {
   max-width: 22px;
   line-height: 3;
   margin-right: 8px;
}
#general_settings_mobile_preview .front_preview .layout_gallery {
   min-height: 355px;
   position: relative;
   overflow: hidden;
   max-height: 202px;
   max-width: 249px;
   margin: 0 auto;
}
{*#general_settings_mobile_preview .front_preview .layout_gallery img {
   width: 100%;
}*}
#general_settings_mobile_preview .topHeader{
   padding: 1px 10px;
}
.cartSection {
   padding: 6px 0 0 0px;
}
#general_settings_mobile_preview.itsBottom {
   position: absolute;
}
.logo {
    display: inline-block;
    vertical-align: middle;
    margin-right: 2em;
}

.logo img {
    max-width: 90px;
    display: inline-block;
    max-height: 36px;
    object-fit: contain;
}
.logo p {
    margin: 8px 0 5px;
    font-size: 15px;
    margin-right: 70px;
}    
</style>