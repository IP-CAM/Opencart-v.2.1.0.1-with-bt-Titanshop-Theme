<div class="bt-box bt-tagcloud">
    <div class="box-heading">
	   <?php echo $heading_title; ?>
    </div>
		
    <div class="box-content" style="text-align:left;"> 
		<?php if($boss_tagcloud) { ?>
		  <?php echo $boss_tagcloud; ?>
		<?php } else { ?>
		  <?php echo $text_notags; ?>
		<?php } ?>
    </div>
</div>
