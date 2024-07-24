<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
   <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-boss_staticblock" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
				<div class="col-sm-10">
				  <select name="boss_staticblock_status" id="input-status" class="form-control large">
					<?php if ($boss_staticblock_status) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
				  </select>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="tab-content">						
							<ul class="nav nav-tabs" id="module">
							<li><a href="#BlockContent" data-toggle="tab"> <?php echo $tab_content; ?></a></li>
							<li><a href="#BlockHeader" data-toggle="tab"> <?php echo $tab_header; ?></a></li>
							<li><a href="#BlockFooter" data-toggle="tab"> <?php echo $tab_footer; ?></a></li>							
						  </ul>
					</div>
					
					<div class="tab-content">
						<div class="tab-pane" id="BlockContent"><!-- CUSTOM BLOCK CONTENT -->
							<div class="row">			
								<div class="col-sm-2">
								  <ul class="nav nav-pills nav-stacked" id="module_block">
									<?php $module_row_t = 1; ?>
									<?php foreach ($modules as $key => $module) { ?>
									<li><a href="#tab-module<?php echo $key; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-module<?php echo $key; ?>\']').parent().remove(); $('#tab-module<?php echo $key; ?>').remove(); $('#module a:first').tab('show');"></i> <?php echo $tab_block . ' ' . $module_row_t; ?></a></li>
									<?php $module_row_t++; ?>
									<?php } ?>
									<li id="module-add"><a onclick="addModule();"><i class="fa fa-plus-circle"></i> <?php echo $button_add_new_block; ?></a></li>
								  </ul>
								</div>
								<div class="col-sm-10">
									<div class="tab-content boss_content">
										<?php foreach ($modules as $key => $module) { ?>
										<div class="tab-pane" id="tab-module<?php echo $key; ?>">
										<ul class="nav nav-tabs" id="language<?php echo $key; ?>">
										<?php foreach ($languages as $language) { ?>
										<li><a href="#tab-module<?php echo $key; ?>-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
										<?php } ?>
										</ul>
										<div class="tab-content">
											<?php foreach ($languages as $language) { ?>
											<div class="tab-pane" id="tab-module<?php echo $key; ?>-language<?php echo $language['language_id']; ?>">
											<div class="form-group">
												<label class="col-sm-2 control-label" for="input-description<?php echo $key; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_content; ?></label>
												<div class="col-sm-10">
												  <textarea name="boss_staticblock_module[<?php echo $key; ?>][description][<?php echo $language['language_id']; ?>]" id="input-description<?php echo $key; ?>-language<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($module['description'][$language['language_id']]) ? $module['description'][$language['language_id']] : ''; ?></textarea>
												</div>
											  </div>
											  <div class="form-group">
												<label class="col-sm-2 control-label" for="input-description<?php echo $key; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_store; ?></label>
												<div class="col-sm-10">
												  <div class="well well-sm" style="height: 150px; overflow: auto;">
													<div class="">
													<?php if (isset($module['store_id']) && in_array(0, $module['store_id'])) { ?>
													<input type="checkbox" name="boss_staticblock_module[<?php echo $key; ?>][store_id][]" value="0" checked="checked" />
													<?php } else { ?>
													<input type="checkbox" name="boss_staticblock_module[<?php echo $key; ?>][store_id][]" value="0" />
													<?php } ?>
													<?php echo $text_default; ?>
												  </div>
												  <?php foreach ($stores as $store) { ?>
												  <div class="">
													<?php if (isset($module['store_id']) && in_array($store['store_id'], $module['store_id'])) { ?>
													<input type="checkbox" name="boss_staticblock_module[<?php echo $key; ?>][store_id][]" value="<?php echo $store['store_id']; ?>" checked="checked" />
													<?php echo $store['name']; ?>
													<?php } else { ?>
													<input type="checkbox" name="boss_staticblock_module[<?php echo $key; ?>][store_id][]" value="<?php echo $store['store_id']; ?>" />
													<?php echo $store['name']; ?>
													<?php } ?>
												  </div>
												  <?php } ?>
												</div>
												</div>
											  </div>
											</div>
											<?php } ?>
										  </div>
										</div>
										<?php } ?>
									</div>
								</div>
							</div>
						</div><!-- END CUSTOM BLOCK CONTENT -->
						<div class="tab-pane" id="BlockHeader"><!-- CUSTOM BLOCK HEADER -->
							<div class="row">			
								<div class="col-sm-2">
								  <ul class="nav nav-pills nav-stacked" id="module_block">
									<li><a href="#BlockHeader1" data-toggle="tab"> <?php echo $tab_header_callus; ?></a></li>
									<li><a href="#BlockHeader2" data-toggle="tab"> <?php echo $tab_header_default; ?></a></li>
								  </ul>
								</div>
								<div class="col-sm-10">
									<div class="tab-content">
										<div class="tab-pane" id="BlockHeader1">
										<ul class="nav nav-tabs" id="language-header">
										<?php foreach ($languages as $language) { ?>
										<li><a href="#tab-module-header1-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
										<?php } ?>
										</ul>
										<div class="tab-content">
											<?php foreach ($languages as $language) { ?>
											<div class="tab-pane" id="tab-module-header1-language<?php echo $language['language_id']; ?>">
											<div class="form-group">
												<label class="col-sm-2 control-label" for="input-description-header1-language<?php echo $language['language_id']; ?>"><?php echo $entry_content; ?></label>
												<div class="col-sm-10">
												  <textarea name="boss_staticblock_header[content][<?php echo $language['language_id']; ?>]" id="input-description-header1-language<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($boss_staticblock_header['content'][$language['language_id']]) ? $boss_staticblock_header['content'][$language['language_id']] : ''; ?></textarea>
												  
												</div>
											  </div>
											  <div class="form-group">
												<label class="col-sm-2 control-label" for="input-description-header1-language<?php echo $language['language_id']; ?>"><?php echo $entry_store; ?></label>
												<div class="col-sm-10">
												  <div class="well well-sm" style="height: 150px; overflow: auto;">
													<div class="">
													<?php if (isset($boss_staticblock_header['store_id']) && in_array(0, $boss_staticblock_header['store_id'])) { ?>
													<input type="checkbox" name="boss_staticblock_header[store_id][]" value="0" checked="checked" />
													<?php } else { ?>
													<input type="checkbox" name="boss_staticblock_header[store_id][]" value="0" />
													<?php } ?>
													<?php echo $text_default; ?>
												  </div>
												  <?php foreach ($stores as $store) { ?>
												  <div class="">
													<?php if (isset($boss_staticblock_header['store_id']) && in_array($store['store_id'], $boss_staticblock_header['store_id'])) { ?>
													<input type="checkbox" name="boss_staticblock_header[store_id][]" value="<?php echo $store['store_id']; ?>" checked="checked" />
													<?php echo $store['name']; ?>
													<?php } else { ?>
													<input type="checkbox" name="boss_staticblock_header[store_id][]" value="<?php echo $store['store_id']; ?>" />
													<?php echo $store['name']; ?>
													<?php } ?>
												  </div>
												  <?php } ?>
												</div>
												</div>
											  </div>
											</div>
											<?php } ?>
										  </div>
										</div><!-- End Block 1 Header -->
										
										<!-- Block 2 -->
										<div class="tab-pane" id="BlockHeader2">
											<div class="tab-content">
											<div class="">
											<div class="form-group">
												<label class="col-sm-2 control-label" ><?php echo $tab_header_default_currency; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_header_default[currency]" class="form-control">
														<?php if ($boss_staticblock_header_default['currency']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_header_default_language; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_header_default[language]" class="form-control">
														<?php if ($boss_staticblock_header_default['language']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_header_default_cart; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_header_default[cart]" class="form-control">
														<?php if ($boss_staticblock_header_default['cart']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_header_default_search; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_header_default[search]" class="form-control">
														<?php if ($boss_staticblock_header_default['search']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_header_default_welcome; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_header_default[welcome]" class="form-control">
														<?php if ($boss_staticblock_header_default['welcome']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_header_default_home; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_header_default[home]" class="form-control">
														<?php if ($boss_staticblock_header_default['home']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_header_default_wish_list; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_header_default[wish_list]" class="form-control">
														<?php if ($boss_staticblock_header_default['wish_list']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_header_default_account; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_header_default[account]" class="form-control">
														<?php if ($boss_staticblock_header_default['account']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_header_default_shopping_cart; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_header_default[shopping_cart]" class="form-control">
														<?php if ($boss_staticblock_header_default['shopping_cart']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_header_default_checkout; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_header_default[checkout]" class="form-control">
														<?php if ($boss_staticblock_header_default['checkout']) { ?>
															<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
															<option value="0"><?php echo $text_disabled; ?></option>
														<?php } else { ?>
															<option value="1"><?php echo $text_enabled; ?></option>
															<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
											  
											</div>
											
										  </div>
										</div> <!--END Block Header 2 -->
										
									</div>
								</div>
							</div>
						</div><!-- END CUSTOM BLOCK HEADER -->
						
						<div class="tab-pane" id="BlockFooter"><!-- CUSTOM BLOCK FOOTER -->
							<div class="row">			
								<div class="col-sm-2">
								  <ul class="nav nav-pills nav-stacked" id="module_block">
									<li><a href="#BlockFooter1" data-toggle="tab"> <?php echo $tab_footer_1; ?></a></li>
									<li><a href="#BlockFooter2" data-toggle="tab"> <?php echo $tab_footer_2; ?></a></li>
									<li><a href="#BlockFooter3" data-toggle="tab"> <?php echo $tab_footer_3; ?></a></li>
									<li><a href="#BlockFooter4" data-toggle="tab"> <?php echo $tab_footer_4; ?></a></li>
									<li><a href="#BlockFooterLink" data-toggle="tab"> <?php echo $tab_footer_link; ?></a></li>
									</ul>
								</div>
								<div class="col-sm-10">
									<div class="tab-content">
										<!-- Footer 1 -->
										<div class="tab-pane" id="BlockFooter1">
										<ul class="nav nav-tabs" id="language-footer">
										<?php foreach ($languages as $language) { ?>
										<li><a href="#tab-module-footer1-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
										<?php } ?>
										</ul>
										<div class="tab-content">
											<?php foreach ($languages as $language) { ?>
											<div class="tab-pane" id="tab-module-footer1-language<?php echo $language['language_id']; ?>">
											<div class="form-group">
												<label class="col-sm-2 control-label" for="input-description-footer1-language<?php echo $language['language_id']; ?>"><?php echo $entry_content; ?></label>
												<div class="col-sm-10">
												  <textarea name="boss_staticblock_footer_1[content][<?php echo $language['language_id']; ?>]" id="input-description-footer1-language<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($boss_staticblock_footer_1['content'][$language['language_id']]) ? $boss_staticblock_footer_1['content'][$language['language_id']] : ''; ?></textarea>
												  
												</div>
											  </div>
											  <div class="form-group">
												<label class="col-sm-2 control-label" for="input-description-footer1-language<?php echo $language['language_id']; ?>"><?php echo $entry_store; ?></label>
												<div class="col-sm-10">
												  <div class="well well-sm" style="height: 150px; overflow: auto;">
													<div class="">
													<?php if (isset($boss_staticblock_footer_1['store_id']) && in_array(0, $boss_staticblock_footer_1['store_id'])) { ?>
													<input type="checkbox" name="boss_staticblock_footer_1[store_id][]" value="0" checked="checked" />
													<?php } else { ?>
													<input type="checkbox" name="boss_staticblock_footer_1[store_id][]" value="0" />
													<?php } ?>
													<?php echo $text_default; ?>
												  </div>
												  <?php foreach ($stores as $store) { ?>
												  <div class="">
													<?php if (isset($boss_staticblock_footer_1['store_id']) && in_array($store['store_id'], $boss_staticblock_footer_1['store_id'])) { ?>
													<input type="checkbox" name="boss_staticblock_footer_1[store_id][]" value="<?php echo $store['store_id']; ?>" checked="checked" />
													<?php echo $store['name']; ?>
													<?php } else { ?>
													<input type="checkbox" name="boss_staticblock_footer_1[store_id][]" value="<?php echo $store['store_id']; ?>" />
													<?php echo $store['name']; ?>
													<?php } ?>
												  </div>
												  <?php } ?>
												</div>
												</div>
											  </div>
											</div>
											<?php } ?>
										  </div>
										</div><!-- End Block 1 Footer -->
										
										<!-- Footer 2 -->
										<div class="tab-pane" id="BlockFooter2">
										<ul class="nav nav-tabs" id="language-footer">
										<?php foreach ($languages as $language) { ?>
										<li><a href="#tab-module-footer2-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
										<?php } ?>
										</ul>
										<div class="tab-content">
											<?php foreach ($languages as $language) { ?>
											<div class="tab-pane" id="tab-module-footer2-language<?php echo $language['language_id']; ?>">
											<div class="form-group">
												<label class="col-sm-2 control-label" for="input-description-footer2-language<?php echo $language['language_id']; ?>"><?php echo $entry_content; ?></label>
												<div class="col-sm-10">
												  <textarea name="boss_staticblock_footer_2[content][<?php echo $language['language_id']; ?>]" id="input-description-footer2-language<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($boss_staticblock_footer_2['content'][$language['language_id']]) ? $boss_staticblock_footer_2['content'][$language['language_id']] : ''; ?></textarea>
												  
												</div>
											  </div>
											  <div class="form-group">
												<label class="col-sm-2 control-label" for="input-description-footer2-language<?php echo $language['language_id']; ?>"><?php echo $entry_store; ?></label>
												<div class="col-sm-10">
												  <div class="well well-sm" style="height: 150px; overflow: auto;">
													<div class="">
													<?php if (isset($boss_staticblock_footer_2['store_id']) && in_array(0, $boss_staticblock_footer_2['store_id'])) { ?>
													<input type="checkbox" name="boss_staticblock_footer_2[store_id][]" value="0" checked="checked" />
													<?php } else { ?>
													<input type="checkbox" name="boss_staticblock_footer_2[store_id][]" value="0" />
													<?php } ?>
													<?php echo $text_default; ?>
												  </div>
												  <?php foreach ($stores as $store) { ?>
												  <div class="">
													<?php if (isset($boss_staticblock_footer_2['store_id']) && in_array($store['store_id'], $boss_staticblock_footer_2['store_id'])) { ?>
													<input type="checkbox" name="boss_staticblock_footer_2[store_id][]" value="<?php echo $store['store_id']; ?>" checked="checked" />
													<?php echo $store['name']; ?>
													<?php } else { ?>
													<input type="checkbox" name="boss_staticblock_footer_2[store_id][]" value="<?php echo $store['store_id']; ?>" />
													<?php echo $store['name']; ?>
													<?php } ?>
												  </div>
												  <?php } ?>
												</div>
												</div>
											  </div>
											</div>
											<?php } ?>
										  </div>
										</div><!-- End Block 2 Footer -->
										
										<!-- Footer 3 -->
										<div class="tab-pane" id="BlockFooter3">
										<ul class="nav nav-tabs" id="language-footer">
										<?php foreach ($languages as $language) { ?>
										<li><a href="#tab-module-footer3-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
										<?php } ?>
										</ul>
										<div class="tab-content">
											<?php foreach ($languages as $language) { ?>
											<div class="tab-pane" id="tab-module-footer3-language<?php echo $language['language_id']; ?>">
											<div class="form-group">
												<label class="col-sm-2 control-label" for="input-description-footer3-language<?php echo $language['language_id']; ?>"><?php echo $entry_content; ?></label>
												<div class="col-sm-10">
												  <textarea name="boss_staticblock_footer_3[content][<?php echo $language['language_id']; ?>]" id="input-description-footer3-language<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($boss_staticblock_footer_3['content'][$language['language_id']]) ? $boss_staticblock_footer_3['content'][$language['language_id']] : ''; ?></textarea>
												  
												</div>
											  </div>
											  <div class="form-group">
												<label class="col-sm-2 control-label" for="input-description-footer3-language<?php echo $language['language_id']; ?>"><?php echo $entry_store; ?></label>
												<div class="col-sm-10">
												  <div class="well well-sm" style="height: 150px; overflow: auto;">
													<div class="">
													<?php if (isset($boss_staticblock_footer_3['store_id']) && in_array(0, $boss_staticblock_footer_3['store_id'])) { ?>
													<input type="checkbox" name="boss_staticblock_footer_3[store_id][]" value="0" checked="checked" />
													<?php } else { ?>
													<input type="checkbox" name="boss_staticblock_footer_3[store_id][]" value="0" />
													<?php } ?>
													<?php echo $text_default; ?>
												  </div>
												  <?php foreach ($stores as $store) { ?>
												  <div class="">
													<?php if (isset($boss_staticblock_footer_3['store_id']) && in_array($store['store_id'], $boss_staticblock_footer_3['store_id'])) { ?>
													<input type="checkbox" name="boss_staticblock_footer_3[store_id][]" value="<?php echo $store['store_id']; ?>" checked="checked" />
													<?php echo $store['name']; ?>
													<?php } else { ?>
													<input type="checkbox" name="boss_staticblock_footer_3[store_id][]" value="<?php echo $store['store_id']; ?>" />
													<?php echo $store['name']; ?>
													<?php } ?>
												  </div>
												  <?php } ?>
												</div>
												</div>
											  </div>
											</div>
											<?php } ?>
										  </div>
										</div><!-- End Block 3 Footer -->
										
										<!-- Footer 4 -->
										<div class="tab-pane" id="BlockFooter4">
										<ul class="nav nav-tabs" id="language-footer">
										<?php foreach ($languages as $language) { ?>
										<li><a href="#tab-module-footer4-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
										<?php } ?>
										</ul>
										<div class="tab-content">
											<?php foreach ($languages as $language) { ?>
											<div class="tab-pane" id="tab-module-footer4-language<?php echo $language['language_id']; ?>">
											<div class="form-group">
												<label class="col-sm-2 control-label" for="input-description-footer4-language<?php echo $language['language_id']; ?>"><?php echo $entry_content; ?></label>
												<div class="col-sm-10">
												  <textarea name="boss_staticblock_footer_4[content][<?php echo $language['language_id']; ?>]" id="input-description-footer4-language<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($boss_staticblock_footer_4['content'][$language['language_id']]) ? $boss_staticblock_footer_4['content'][$language['language_id']] : ''; ?></textarea>
												  
												</div>
											  </div>
											  <div class="form-group">
												<label class="col-sm-2 control-label" for="input-description-footer4-language<?php echo $language['language_id']; ?>"><?php echo $entry_store; ?></label>
												<div class="col-sm-10">
												  <div class="well well-sm" style="height: 150px; overflow: auto;">
													<div class="">
													<?php if (isset($boss_staticblock_footer_4['store_id']) && in_array(0, $boss_staticblock_footer_4['store_id'])) { ?>
													<input type="checkbox" name="boss_staticblock_footer_4[store_id][]" value="0" checked="checked" />
													<?php } else { ?>
													<input type="checkbox" name="boss_staticblock_footer_4[store_id][]" value="0" />
													<?php } ?>
													<?php echo $text_default; ?>
												  </div>
												  <?php foreach ($stores as $store) { ?>
												  <div class="">
													<?php if (isset($boss_staticblock_footer_4['store_id']) && in_array($store['store_id'], $boss_staticblock_footer_4['store_id'])) { ?>
													<input type="checkbox" name="boss_staticblock_footer_4[store_id][]" value="<?php echo $store['store_id']; ?>" checked="checked" />
													<?php echo $store['name']; ?>
													<?php } else { ?>
													<input type="checkbox" name="boss_staticblock_footer_4[store_id][]" value="<?php echo $store['store_id']; ?>" />
													<?php echo $store['name']; ?>
													<?php } ?>
												  </div>
												  <?php } ?>
												</div>
												</div>
											  </div>
											</div>
											<?php } ?>
										  </div>
										</div><!-- End Block 4 Footer -->
										
										<!-- Footer Link -->
										<div class="tab-pane" id="BlockFooterLink">
											<div class="tab-content">
											<div class="">
											<div class="form-group">
												<label class="col-sm-2 control-label" ><?php echo $tab_footer_link_info; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_footer_default[info]" class="form-control">
													<?php if ($boss_staticblock_footer_default['info']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_footer_link_account; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_footer_default[account]" class="form-control">
												<?php if ($boss_staticblock_footer_default['account']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_footer_link_order; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_footer_default[order]" class="form-control">
												<?php if ($boss_staticblock_footer_default['order']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_footer_link_wish_list; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_footer_default[wish_list]" class="form-control">
												<?php if ($boss_staticblock_footer_default['wish_list']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_footer_link_newsletter; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_footer_default[newsletter]" class="form-control">
												<?php if ($boss_staticblock_footer_default['newsletter']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_footer_link_brands; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_footer_default[brands]" class="form-control">
												<?php if ($boss_staticblock_footer_default['brands']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_footer_link_gift; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_footer_default[gift]" class="form-control">
												<?php if ($boss_staticblock_footer_default['gift']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_footer_link_affiliates; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_footer_default[affiliates]" class="form-control">
												<?php if ($boss_staticblock_footer_default['affiliates']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_footer_link_specials; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_footer_default[specials]" class="form-control">
												<?php if ($boss_staticblock_footer_default['specials']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_footer_link_contact; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_footer_default[contact]" class="form-control">
												<?php if ($boss_staticblock_footer_default['contact']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_footer_link_returns; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_footer_default[returns]" class="form-control">
												<?php if ($boss_staticblock_footer_default['returns']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_footer_link_site; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_footer_default[site]" class="form-control">
												<?php if ($boss_staticblock_footer_default['site']) { ?>
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
												<label class="col-sm-2 control-label" ><?php echo $tab_footer_link_framework; ?></label>
												<div class="col-sm-10">
												  <select name="boss_staticblock_footer_default[frame]" class="form-control">
													<?php if ($boss_staticblock_footer_default['frame']) { ?>
														<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
														<option value="0"><?php echo $text_disabled; ?></option>
													<?php } else { ?>
														<option value="1"><?php echo $text_enabled; ?></option>
														<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
													<?php } ?>
													</select>
												</div>
											</div>
											  
											</div>
											
										  </div>
										</div>
									</div><!--End Footer Link -->
								</div>
							</div>
						</div><!-- END CUSTOM BLOCK FOOTER -->
					</div>
				</div>		
			<!-- END CUSTOM BLOCK FOOTER -->
			
			</div><!-- END .row -->
		</form>
    </div> <!-- End .content -->
	
  </div> <!-- End .box -->
  </div> <!-- End .container-fluid -->
  
</div> <!-- End #content -->
<script type="text/javascript"><!--
/**********************Content************************/
<?php foreach ($modules as $key => $module) { ?>
<?php foreach ($languages as $language) { ?>
$('#input-description<?php echo $key; ?>-language<?php echo $language['language_id']; ?>').summernote({
	height: 300
});
<?php } ?>
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
/**********************HEAHER************************/
<?php foreach ($languages as $language) { ?>
<?php for($i=1;$i<2;$i++){ ?>
$('#input-description-header<?php echo $i; ?>-language<?php echo $language['language_id']; ?>').summernote({
	height: 300
});
<?php } } ?>
/**********************FOOTER************************/
<?php foreach ($languages as $language) { ?>
<?php for($i=1;$i<5;$i++){ ?>
$('#input-description-footer<?php echo $i; ?>-language<?php echo $language['language_id']; ?>').summernote({
	height: 300
});
<?php } } ?>

//--></script>
<script type="text/javascript"><!--
var row = <?php echo $module_row_t; ?>;
function addModule() {	
	var module_row = Math.random().toString(36).substr(2);
	html = '<div class="tab-pane" id="tab-module' + module_row + '">';
	html += '<ul class="nav nav-tabs" id="language' + module_row + '">';
    <?php foreach ($languages as $language) { ?>    
	html += '<li><a href="#tab-module' + module_row + '-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>';
    <?php } ?>
	html += '  </ul>';

	html += '<div class="tab-content">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="tab-pane" id="tab-module'+ module_row + '-language<?php echo $language['language_id']; ?>">';	
	html += ' <div class="form-group">'; 
	html += ' <label class="col-sm-2 control-label" for="input-description'+ module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_content; ?></label>';
	html += '<div class="col-sm-10">';
	html += '<textarea name="boss_staticblock_module['+ module_row + '][description][<?php echo $language['language_id']; ?>]" id="input-description'+ module_row + '-language<?php echo $language['language_id']; ?>" class="form-control"></textarea>';
	html += '</div>';
	html += '</div>';
	html += '<div class="form-group">';
	html += '<label class="col-sm-2 control-label" for="input-description'+ module_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_store; ?></label>';
	html += '<div class="col-sm-10">';
	html += '<div class="well well-sm" style="height: 150px; overflow: auto;">';
	html += '<div class="">';
	html += '<input type="checkbox" name="boss_staticblock_module['+ module_row + '][store_id][]" value="0" checked="checked" /> ';
	html += '<?php echo $text_default; ?>';
	html += '</div>';
	  <?php foreach ($stores as $store) { ?>
	html += '<div class="">';
	html += '<input type="checkbox" name="boss_staticblock_module['+ module_row + '][store_id][]" value="<?php echo $store['store_id']; ?>" />';
	html += '	<?php echo $store['name']; ?>';
	html += '</div>';
	  <?php } ?>
	html += '</div>';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	<?php } ?>
	html += '</div>';
	html += '</div>';
	html += '</div>';
	
	
	$('.boss_content').append(html);

	<?php foreach ($languages as $language) { ?>
	$('#input-description' + module_row + '-language<?php echo $language['language_id']; ?>').summernote({
		height: 300
	});
	<?php } ?>

	$('#module-add').before('<li><a href="#tab-module' + module_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-module' + module_row + '\\\']\').parent().remove(); $(\'#tab-module' + module_row + '\').remove(); $(\'#module a:first\').tab(\'show\');"></i> <?php echo $tab_block; ?> ' + row + '</a></li>');

	$('#module_block a[href=\'#tab-module' + module_row + '\']').tab('show');

	$('#language' + module_row + ' li:first-child a').tab('show');

	row++;
}
//--></script> 
<script type="text/javascript"><!--
//$('#blockcontenttab .vtabs a').tabs();
$('#module li:first-child a').tab('show');
$('#module_block li:first-child a').tab('show');
<?php foreach ($modules as $key => $module) { ?>
$('#language<?php echo $key; ?> li:first-child a').tab('show');
<?php } ?>
$('#language-header li:first-child a').tab('show');
$('#language-footer li:first-child a').tab('show');
//--></script> 

<?php echo $footer; ?>