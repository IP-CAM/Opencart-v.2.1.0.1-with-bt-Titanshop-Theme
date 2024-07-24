<div class="header_category">
<div id="boss-menu-category" class="box">
  <div class="boss_heading"><div class="box-heading"><span><?php echo $heading_title; ?></span></div></div>
  <div class="box-content">
    <ul class="box-category boss-menu-cate">
	<?php if(isset($menus) && !empty($menus)){ ?>
      <?php foreach($menus as $menu){ ?>
		<li>
			<div class="nav_title">
				<img alt="<?php echo $menu['title']; ?>" src="<?php echo $menu['icon']; ?>" />
				<a class="title" href="<?php echo $menu['href']; ?>"><?php echo $menu['title']; ?></a>
			</div><?php if ($menu['categories']){ ?>
			<div class="nav_submenu" style="width:<?php echo $menu['sub_width']; ?>px;">
				<?php if($menu['bgimage']){ ?>
				<a title="<?php echo $menu['title']; ?>" href="<?php echo $menu['href']; ?>">
					<img alt="<?php echo $menu['title']; ?>" src="<?php echo $menu['bgimage']; ?>" class="bg_img_cate">
				</a>
				<?php } ?>
				
				<?php $sub_column = ($menu['sub_width']-22)/$menu['column']; ?>
				<div class="nav_sub_submenu">
					<ul>
						<?php foreach($menu['categories'] as $category){ ?>
						<li <?php if ($category['children']) echo 'class="nav_cat_parent"'; ?> style="width:<?php echo $sub_column; ?>px;">
							<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
							<?php if ($category['children']){ ?>
							<div class="sub_cat_child">
								<ul>
								<?php foreach($category['children'] as $cat_child){ ?>
									<li><a href="<?php echo $cat_child['href']; ?>"><?php echo $cat_child['name']; ?></a></li>
								<?php } ?>
								</ul>
							</div>
							<?php } ?>
						</li>
						<?php } ?>
					</ul>
				</div>
				
			</div><?php } ?>
		</li>
	  <?php } ?>
	  <?php } ?>
    </ul>
  </div>
  <script type="text/javascript"><!--
	jQuery(document).ready(function($) {
		loadtopmenu();
	});
	$("#boss-menu-category .boss_heading").click(function(){
		$('#boss-menu-category').toggleClass('opencate');
		loadtopmenu();
	});
	function loadtopmenu(){
		var menuheight = $('#boss-menu-category .box-content').outerHeight();
		var topcate = $('#boss-menu-category').offset().top;
		$('.boss-menu-cate .nav_title').each(function(index, element) {
			var liheight = $(this).outerHeight();
			var subheight = $(this).next('.nav_submenu').outerHeight();
			var topheight = $(this).offset().top - topcate -55;
			if((subheight < menuheight)&&(subheight < topheight)){
				var bottomh = topheight - subheight + liheight + 14;
				$(this).next('.nav_submenu').css('top', bottomh + 'px');
			}else{
				$(this).next('.nav_submenu').css('top', '0px');
			}
		});
	}
  //--></script>
</div>
</div>