<?php echo $header; ?>
<?php $column_left  = trim($column_left);$column_right  = trim($column_right); ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
   <!-- <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?></div> -->
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
 <!--<script type="text/javascript">
	 $(document).ready(function(){  

$(".bt-featured-pro bt-nprolarge-tabs fadeInUp animated").hide();
	 })
</script> -->