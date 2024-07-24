<div class="account-sidebar">
  <div class="list-group">  
    <?php if($main_links) { ?>
    <?php foreach ($main_links as $main_link) { ?>
    <h3 class="secondary-titles"><?php echo $main_link['title']; ?></h3>
    <ul class="list-unstyled">
        <?php foreach ($main_link['children_links'] as $children_link) { ?> 
              <li><a href="<?php echo $children_link['link']; ?>" class="list-group-item"><i class="fa <?php echo $children_link['iconclass'] ?>" aria-hidden="true"></i>&nbsp;<?php echo $children_link['title']; ?></a> </li>
        <?php } ?>
    </ul>
    <?php } ?>
    <?php } ?>
  </div>
</div>
<style type="text/css">
<?php if($affiliate_sidebar_titlebgcolor) { ?>
.account-sidebar h3{
    background: <?php echo $affiliate_sidebar_titlebgcolor; ?>; 
}
<?php } ?>

<?php if($affiliate_sidebar_titlecolor) { ?>
.account-sidebar h3, .account-sidebar h3{
    color: <?php echo $affiliate_sidebar_titlecolor; ?>;
}
<?php } ?>

.account-sidebar .list-group-item{
    <?php if($affiliate_sidebar_linkbgcolor) { ?>
       background: <?php echo $affiliate_sidebar_linkbgcolor; ?> !important;
    <?php } ?> 
    <?php if($affiliate_sidebar_linkcolor) { ?>
      color: <?php echo $affiliate_sidebar_linkcolor; ?> !important;
    <?php } ?> 
}
.account-sidebar .list-group-item:hover{
    <?php if($affiliate_sidebar_hoverbgcolor) { ?>
      background: <?php echo $affiliate_sidebar_hoverbgcolor; ?> !important;
     <?php } ?> 
    <?php if($affiliate_sidebar_hovercolor) { ?> 
      color: <?php echo $affiliate_sidebar_hovercolor; ?> !important;
    <?php } ?> 
}
</style>