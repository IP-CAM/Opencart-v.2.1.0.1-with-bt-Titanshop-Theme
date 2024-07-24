<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
		<div class="container-fluid">
		  <div class="pull-right">
			<button type="submit" form="form-discount" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
  <div class="loading" style="position:fixed;top:50%;left:50%"></div>
  <div class="panel panel-default">
	<div class="panel-heading">  		
		<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
	</div>
	<div class="panel-body">
	  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-discount" class="form-horizontal">	
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#tab_product_setting"><?php echo $tab_product_setting; ?></a></li>
			<li><a data-toggle="tab" href="#tab_module_setting"><?php echo $tab_module_setting; ?></a></li>
			<li><a data-toggle="tab" href="#tab_general_setting"><?php echo $tab_general_setting; ?></a></li>
		</ul>
		<div class="tab-content">
		<div id="tab_product_setting" class="tab-pane active">
			<table class="table table-striped table-bordered table-hover">
			  <thead>
				<tr>
				  <td class="center"><?php echo $column_image; ?></td>
				  <td class="left"><?php if ($sort == 'pd.name') { ?>
					<a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
					<?php } ?></td>
				  <td class="left"><?php if ($sort == 'p.model') { ?>
					<a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_model; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_model; ?>"><?php echo $column_model; ?></a>
					<?php } ?></td>
				  <td class="left"><?php if ($sort == 'p.price') { ?>
					<a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_price; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_price; ?>"><?php echo $column_price; ?></a>
					<?php } ?></td>
				  <td class="center"><?php echo $column_date_start; ?></td>
				  <td class="center"><?php echo $column_date_end; ?></td>
				  <td class="center"><?php echo $column_discount_status; ?></td>
				  <td class="right"><?php if ($sort == 'p.quantity') { ?>
					<a href="<?php echo $sort_quantity; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_quantity; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_quantity; ?>"><?php echo $column_quantity; ?></a>
					<?php } ?></td>
				  <td class="left"><?php if ($sort == 'p.status') { ?>
					<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
					<?php } ?></td>
				  <td class="right"><?php echo $column_action; ?></td>
				</tr>
			  </thead>
			  <tbody>
				<tr class="filter">
				  <td></td>
				  <td><input class="form-control" type="text" name="filter_name" value="<?php echo $filter_name; ?>" /></td>
				  <td><input class="form-control" type="text" name="filter_model" value="<?php echo $filter_model; ?>" /></td>
				  <td align="left"><input class="form-control" type="text" name="filter_price" value="<?php echo $filter_price; ?>" size="8"/></td>
				  <td></td>
				  <td></td>
				  <td></td>
				  <td align="right"><input class="form-control" type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" style="text-align: right;" /></td>
				  <td><select class="form-control" name="filter_status">
					  <option value="*"></option>
					  <?php if ($filter_status) { ?>
					  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					  <?php } else { ?>
					  <option value="1"><?php echo $text_enabled; ?></option>
					  <?php } ?>
					  <?php if (!is_null($filter_status) && !$filter_status) { ?>
					  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					  <?php } else { ?>
					  <option value="0"><?php echo $text_disabled; ?></option>
					  <?php } ?>
					</select></td>
				  <td align="right"><a onclick="filter();" class="btn btn-primary"><?php echo $button_filter; ?></a></td>
				</tr>
				<?php if ($products) { ?>
				<?php foreach ($products as $product) { ?>
				<tr>
				  <td class="center"><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" style="padding: 1px; border: 1px solid #DDDDDD;" /></td>
				  <td class="left"><?php echo $product['name']; ?></td>
				  <td class="left"><?php echo $product['model']; ?></td>
				  <td class="left"><?php if ($product['discount']) { ?>
					<span style="text-decoration: line-through;"><?php echo $product['price']; ?></span><br/>
					<span style="color: #b00;"><?php echo $product['discount']; ?></span>
					<?php } else { ?>
					<?php echo $product['price']; ?>
					<?php } ?></td>
				  <td class="left"><?php echo $product['date_start']; ?></td>
				  <td class="left"><?php echo $product['date_end']; ?></td>
				  <td class="left">
					<?php if($product['discount_status']=='Upcoming'){?>
						<span style="color: green;"><?php echo $product['discount_status']; ?></span>
					<?php }elseif($product['discount_status']=='Closed'){ ?>
						<span style="color: red;"><?php echo $product['discount_status']; ?></span>
					<?php }else{ ?>
						 <span style="color: blue;"><?php echo $product['discount_status']; ?></span>
					<?php } ?>
				  </td>
				  <td class="right"><?php if ($product['quantity'] <= 0) { ?>
					<span style="color: #FF0000;"><?php echo $product['quantity']; ?></span>
					<?php } elseif ($product['quantity'] <= 5) { ?>
					<span style="color: #FFA500;"><?php echo $product['quantity']; ?></span>
					<?php } else { ?>
					<span style="color: #008000;"><?php echo $product['quantity']; ?></span>
					<?php } ?></td>
				  <td class="left"><?php echo $product['status']; ?></td>
				  <td class="right"><?php foreach ($product['action'] as $action) { ?>
					<a onclick="editDiscount(<?php echo $product['product_id']; ?>)" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="<?php echo $action['text']; ?>"><i class="fa fa-pencil"></i></a>
					<?php } ?></td>
				</tr>
				<?php } ?>
				<?php } else { ?>
				<tr>
				  <td class="center" colspan="9"><?php echo $text_no_results; ?></td>
				</tr>
				<?php } ?>
			  </tbody>
			</table>
				
			<div class="pagination"><?php echo $pagination; ?></div>
			<div id="dialog_amazon_import" title="<?php echo $entry_product_special; ?>">
			</div>
		</div>
		
		<div id="tab_module_setting" class="tab-pane">
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
				  <?php if ($error_name) { ?>
				  <div class="text-danger"><?php echo $error_name; ?></div>
				  <?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
				<div class="col-sm-10">
				  <select name="status" id="input-status" class="form-control large">
					<?php if ($status) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
				  </select>
				</div>
			</div>
			<table class="table table-striped table-bordered table-hover">
			  <tr>
				<td class="col-sm-2"><label class="control-label"><span data-toggle="tooltip" title="" data-original-title="Only show products that have discount price"><?php echo $entry_product; ?></span></label></td>
				<td class="col-sm-10"><input type="text" name="product" value="" placeholder="<?php echo $entry_product; ?>" id="input-related" class="form-control" />
                  <div id="discount-product" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($discount_products as $product) { ?>
                    <div id="discount-product<?php echo $product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                      <input type="hidden" name="best_discount_product[]" value="<?php echo $product['product_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div></td>
			  </tr>
			</table>
			<table id="module" class="table table-striped table-bordered table-hover">
			  <thead>
				<tr>
				  <td class="left"><?php echo $entry_title; ?></td>	
				  <td class="left"><?php echo $entry_limit; ?></td>
				  <td class="left"><?php echo $entry_image; ?></td>
				</tr>
			  </thead>
			  <tbody id="module-row">
				<tr>
				  <td class="left"><table class="table table-striped table-bordered table-hover"><?php foreach ($languages as $language) { ?>
					<tr><td><input class="form-control" name="title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($title[$language['language_id']]) ? $title[$language['language_id']] : ''; ?>" /></td><td>
					<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></td></tr>
				  <?php } ?></table></td>
				  <td class="right"><input class="form-control" type="text" name="limit" value="<?php echo $limit; ?>" size="3" /></td>
				  <td class="left"><input class="form-control" type="text" name="image_width" value="<?php echo $image_width; ?>" size="3" />
					<input class="form-control" type="text" name="image_height" value="<?php echo $image_height; ?>" size="3" /></td>
				</tr>
			  </tbody>
			</table>
		</div>
		
		<div id="tab_general_setting" class="tab-pane">
			
			<div id="tab_label_setting">
				<table class="table table-striped table-bordered table-hover">
					<tr>
						<td><?php echo $entry_discount_closed; ?></td>
						<td class="left"><select class="form-control" name="label_setting[show_closed]">
						  <?php if ($label_setting['show_closed']) { ?>
						  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						  <option value="0"><?php echo $text_disabled; ?></option>
						  <?php } else { ?>
						  <option value="1"><?php echo $text_enabled; ?></option>
						  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						  <?php } ?>
						</select></td>
					</tr>
					<tr>
						<td><?php echo $label_opening; ?></td>
						<td><table class="table table-striped table-bordered table-hover"><?php foreach ($languages as $language) { ?>
							<tr><td><input class="form-control" name="label_setting[opening][<?php echo $language['language_id']; ?>]" value="<?php echo isset($label_setting['opening'][$language['language_id']]) ? $label_setting['opening'][$language['language_id']] : 'Opening'; ?>" /></td>
							<td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></td></tr>
						  <?php } ?></table></td>
					</tr>
					<tr>
						<td><?php echo $label_upcoming; ?></td>
						<td><table class="table table-striped table-bordered table-hover"><?php foreach ($languages as $language) { ?>
							<tr><td><input class="form-control" name="label_setting[upcoming][<?php echo $language['language_id']; ?>]" value="<?php echo isset($label_setting['upcoming'][$language['language_id']]) ? $label_setting['upcoming'][$language['language_id']] : 'Upcoming'; ?>" /></td>
							<td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></td></tr>
						  <?php } ?></table></td>
					</tr>
					<tr>
						<td><?php echo $label_closed; ?></td>
						<td><table class="table table-striped table-bordered table-hover"><?php foreach ($languages as $language) { ?>
							<tr><td><input class="form-control" name="label_setting[closed][<?php echo $language['language_id']; ?>]" value="<?php echo isset($label_setting['closed'][$language['language_id']]) ? $label_setting['closed'][$language['language_id']] : 'Closed'; ?>" /></td><td>
							<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></td></tr>
						  <?php } ?></table></td>
					</tr>
				</table>
			</div>
		</div></div>
      </form>
    </div>
  </div></div>
</div>

<script type="text/javascript"><!--
function editDiscount(id){
	$.ajax({
		url: 'index.php?route=module/best_discount/getProductDiscounts&token=<?php echo $token; ?>&product_id=' + id,
		dataType: 'json',
		beforeSend: function() {
			$('.loading').html('<span class="wait">&nbsp;<img src="../admin/view/image/loading.gif" alt="" /></span>');
		},		
		complete: function() {
			$('.wait').remove();
		},
		success: function(json) {
			if (json['output']) {		
				$( "#dialog_amazon_import" ).html(json['output']);
				$( "#dialog_amazon_import" ).dialog({ 
					width: 800 , 
					buttons:[{ text: "Save",
								click: function() {saveDiscount(id);}
							 },
							 {  text: "Cancel",
								click: function() { $(this).dialog("close");}
							}]
				});	
			}
		}
	});
}
$('input[name=\'product\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=module/best_discount/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
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
		$('input[name=\'product\']').val('');
		
		$('#discount-product' + item['value']).remove();
		
		$('#discount-product').append('<div id="discount-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="best_discount_product[]" value="' + item['value'] + '" /></div>');	
	}	
});

$('#discount-product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script> 
<?php echo $footer; ?>