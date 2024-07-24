<div id="tab-discount">
  <table id="discount" class="table table-striped table-bordered table-hover">
	<thead>
	  <tr>
		<td class="text-left"><?php echo $entry_customer_group; ?></td>
		<td class="text-right"><?php echo $entry_quantity; ?></td>
		<td class="text-right"><?php echo $entry_priority; ?></td>
		<td class="text-right"><?php echo $entry_price; ?></td>
		<td class="text-left"><?php echo $entry_date_start; ?></td>
		<td class="text-left"><?php echo $entry_date_end; ?></td>
		<td></td>
	  </tr>
	</thead>
	<?php $discount_row = 0; ?>
	<?php if(!empty($product_discounts)){?>
	<?php foreach ($product_discounts as $product_discount) { ?>
	<tbody id="discount-row<?php echo $discount_row; ?>">
	  <tr>
		<td style="width: 15%;" class="left"><select class="form-control" name="product_discount[<?php echo $discount_row; ?>][customer_group_id]">
			<?php foreach ($customer_groups as $customer_group) { ?>
			<?php if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>
			<option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
			<?php } else { ?>
			<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
			<?php } ?>
			<?php } ?>
		  </select></td>
		<td class="right"><input class="form-control" type="text" name="product_discount[<?php echo $discount_row; ?>][quantity]" value="<?php echo $product_discount['quantity']; ?>" size="2" /></td>
		<td class="right"><input class="form-control" type="text" name="product_discount[<?php echo $discount_row; ?>][priority]" value="<?php echo $product_discount['priority']; ?>" size="2" /></td>
		<td style="width: 15%;" class="right"><input class="form-control" type="text" name="product_discount[<?php echo $discount_row; ?>][price]" value="<?php echo $product_discount['price']; ?>" /></td>
		<td class="text-left"><div class="input-group date">
		  <input type="text" name="product_discount[<?php echo $discount_row; ?>][date_start]" value="<?php echo $product_discount['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />		  
		  <span class="input-group-btn">
		  <button style="font-size:12px;" class="btn btn-default"><i class="fa fa-calendar"></i></button>
		  </span></div></td>
		<td class="text-left"><div class="input-group date">
		  <input type="text" size=3 name="product_discount[<?php echo $discount_row; ?>][date_end]" value="<?php echo $product_discount['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
		  <span class="input-group-btn">
		  <button style="font-size:12px;" class="btn btn-default"><i class="fa fa-calendar"></i></button>
		  </span></div></td>
		<td class="left"><a onclick="$('#discount-row<?php echo $discount_row; ?>').remove();" class="btn btn-danger" data-toggle="tooltip" data-original-title="<?php echo $button_remove; ?>"><i class="fa fa-times"></i></a></td>
	  </tr>
	</tbody>
	<?php $discount_row++; ?>
	<?php } ?>
	<?php } ?>
	<tfoot>
	  <tr>
		<td colspan="6"></td>
		<td class="left"><a onclick="addDiscount();" class="btn btn-primary" data-toggle="tooltip" data-original-title="<?php echo $button_add_discount; ?>"><i class="fa fa-pencil"></i></a></td>
	  </tr>
	</tfoot>
  </table>
</div>
<script type="text/javascript"><!--
var discount_row = <?php echo $discount_row; ?>;

function addDiscount() {
	html  = '<tbody id="discount-row' + discount_row + '">';
	html += '  <tr>'; 
    html += '    <td style="width: 15%;" class="left"><select class="form-control" name="product_discount[' + discount_row + '][customer_group_id]">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
    <?php } ?>
    html += '    </select></td>';		
    html += '    <td class="right"><input class="form-control" type="text" name="product_discount[' + discount_row + '][quantity]" value="1" size="2" /></td>';
    html += '    <td class="right"><input class="form-control" type="text" name="product_discount[' + discount_row + '][priority]" value="" size="2" /></td>';
	html += '    <td style="width: 15%;" class="right"><input class="form-control" type="text" name="product_discount[' + discount_row + '][price]" value="" /></td>';
    html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button style="font-size:12px;" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><div class="input-group date"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button style="font-size:12px;" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '    <td class="left"><a onclick="$(\'#discount-row' + discount_row + '\').remove();" class="btn btn-danger" data-toggle="tooltip" data-original-title="<?php echo $button_remove; ?>"><i class="fa fa-times"></i></a></td>';
	html += '  </tr>';	
    html += '</tbody>';
	
	$('#discount tfoot').before(html);
		
	$('.date').datetimepicker({
		pickTime: false
	});
	discount_row++;
}

function saveDiscount(id){
	$.ajax({
		url: 'index.php?route=module/best_discount/saveProductDiscounts&token=<?php echo $token; ?>&product_id=' + id,
		type: 'post',
		data: $('#discount input[type=\'text\'], #discount select'),
		dataType: 'json',
		success: function(json) {
			$( "#dialog_amazon_import" ).dialog("close");
			location = json['redirect'];
			
		}
	});
}
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script> 