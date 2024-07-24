<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-affiliate-sidebar" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-affiliate-sidebar" class="form-horizontal">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-general" data-toggle="tab"><i class="fa fa-cogs"></i> <?php echo $tab_general; ?></a></li>
          <li><a href="#tab-affiliate_sidebar-titles" data-toggle="tab"><i class="fa fa-columns"></i> <?php echo $tab_customer_title; ?></a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-general">
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
              <div class="col-sm-10">
                <select name="affiliate_sidebar_status" id="input-status" class="form-control">
                  <?php if ($affiliate_sidebar_status) { ?>
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
              <label class="col-sm-2 control-label" for="input-affiliate_sidebar-titlebgcolor"><span data-toggle="tooltip" title="<?php echo $help_title_bgcolor; ?>"><?php echo $entry_title_bgcolor; ?></span></label>
              <div class="col-sm-8">
                <input type="text" name="affiliate_sidebar_titlebgcolor" value="<?php echo $affiliate_sidebar_titlebgcolor; ?>" placeholder="<?php echo $entry_title_bgcolor; ?>" id="input-affiliate_sidebar-titlebgcolor" class="form-control color-picker" />
              </div>
              <div class="col-sm-2">
                <div class="preview"></div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-affiliate_sidebar-titlecolor"><span data-toggle="tooltip" title="<?php echo $help_title_color; ?>"><?php echo $entry_title_color; ?></span></label>
              <div class="col-sm-8">
                <input type="text" name="affiliate_sidebar_titlecolor" value="<?php echo $affiliate_sidebar_titlecolor; ?>" placeholder="<?php echo $entry_title_color; ?>" id="input-affiliate_sidebar-titlecolor" class="form-control color-picker" />
              </div>
              <div class="col-sm-2">
                <div class="preview"></div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-affiliate_sidebar-linkbgcolor"><span data-toggle="tooltip" title="<?php echo $help_link_bgcolor; ?>"><?php echo $entry_link_bgcolor; ?></span></label>
              <div class="col-sm-8">
                <input type="text" name="affiliate_sidebar_linkbgcolor" value="<?php echo $affiliate_sidebar_linkbgcolor; ?>" placeholder="<?php echo $entry_link_bgcolor; ?>" id="input-affiliate_sidebar-linkbgcolor" class="form-control color-picker" />
              </div>
              <div class="col-sm-2">
                <div class="preview"></div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-affiliate_sidebar-linkcolor"><span data-toggle="tooltip" title="<?php echo $help_link_color; ?>"><?php echo $entry_link_color; ?></span></label>
              <div class="col-sm-8">
                <input type="text" name="affiliate_sidebar_linkcolor" value="<?php echo $affiliate_sidebar_linkcolor; ?>" placeholder="<?php echo $entry_link_color; ?>" id="input-affiliate_sidebar-linkcolor" class="form-control color-picker" />
              </div>
              <div class="col-sm-2">
                <div class="preview"></div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-affiliate_sidebar-hoverbgcolor"><span data-toggle="tooltip" title="<?php echo $help_hover_bgcolor; ?>"><?php echo $entry_hover_bgcolor; ?></span></label>
              <div class="col-sm-8">
                <input type="text" name="affiliate_sidebar_hoverbgcolor" value="<?php echo $affiliate_sidebar_hoverbgcolor; ?>" placeholder="<?php echo $entry_hover_bgcolor; ?>" id="input-affiliate_sidebar-hoverbgcolor" class="form-control color-picker" />
              </div>
              <div class="col-sm-2">
                <div class="preview"></div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-affiliate_sidebar-hovercolor"><span data-toggle="tooltip" title="<?php echo $help_hover_color; ?>"><?php echo $entry_hover_color; ?></span></label>
              <div class="col-sm-8">
                <input type="text" name="affiliate_sidebar_hovercolor" value="<?php echo $affiliate_sidebar_hovercolor; ?>" placeholder="<?php echo $entry_hover_color; ?>" id="input-affiliate_sidebar-hovercolor" class="form-control color-picker" />
              </div>
              <div class="col-sm-2">
                <div class="preview"></div>
              </div>
            </div>
          </div>
          <div class="tab-pane" id="tab-affiliate_sidebar-titles">
            <div class="row">
              <div class="col-sm-4 col-xs-12 col-md-3">
                <ul class="nav nav-pills nav-stacked" id="titles">
                <?php $title_row = 0; ?>
                  <?php foreach($titles as $title) { ?>
                  <li class="titles-li"><a href="#tab-title<?php echo $title_row; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-title<?php echo $title_row; ?>\']').parent().remove(); $('#tab-title<?php echo $title_row; ?>').remove(); $('#titles a:first').tab('show');"></i> <?php echo (!empty($title['description'][$config_language_id]['title']) ? $title['description'][$config_language_id]['title'] : $tab_title .'-' . ($title_row + (int)1)); ?> <i class="fa fa-arrows pull-right" aria-hidden="true"></i></a></li>
                  <?php $title_row++; ?>
                  <?php } ?>
                </ul>
                <ul class="nav nav-pills nav-stacked addtitlebutton">
                  <li><button type="button" class="btn btn-default btn-block" onclick="addTitle();"><i class="fa fa-plus-circle" aria-hidden="true"></i> <?php echo $button_add_title; ?></button></li>
                </ul>
              </div>
              <div class="col-sm-8 col-xs-12 col-md-9">
                <div class="tab-content" id="tab-content">
                  <?php $title_row = 0; ?>
                  <?php $affiliate_sidebar_link_title_row = 0; ?>
                  <?php foreach($titles as $title_key => $title) { ?>
                  <div class="tab-pane" id="tab-title<?php echo $title_row; ?>">
                    <div class="form-group">
                      <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
                      <div class="col-sm-10">
                        <select name="affiliate_sidebar_title[<?php echo $title_row; ?>][status]" class="form-control title-status" rel="<?php echo $title_row; ?>">
                          <?php if ($title['status']) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                      </div>
                    </div>                     
                    <div class="form-group hide">
                      <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_sort_order; ?>"><?php echo $entry_sort_order; ?></span></label>
                      <div class="col-sm-10">
                        <input type="text" name="affiliate_sidebar_title[<?php echo $title_row; ?>][sort_order]"  value="<?php echo $title['sort_order']; ?>" class="form-control title-sortorder" />
                      </div>
                    </div>
                    <div class="title-group">
                      <ul class="nav nav-tabs" id="title-language<?php echo $title_row; ?>">
                        <?php foreach ($languages as $language) { ?>
                        <li><a href="#title-language<?php echo $title_row; ?>-<?php echo $language['language_id']; ?>" data-toggle="tab">
                        <?php if(VERSION >= '2.2.0.0') { ?>
                        <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
                        <?php } else{ ?>
                        <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                        <?php } ?> <?php echo $language['name']; ?></a></li>
                        <?php } ?>
                      </ul>
                      <div class="tab-content">
                        <?php foreach ($languages as $language) { ?>
                        <div class="tab-pane" id="title-language<?php echo $title_row; ?>-<?php echo $language['language_id']; ?>">
                          <div class="form-group required">
                            <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_title; ?>"><?php echo $entry_title; ?></span></label>
                            <div class="col-sm-10">
                              <input type="text" name="affiliate_sidebar_title[<?php echo $title_row; ?>][description][<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($title['description'][$language['language_id']]['title']) ? $title['description'][$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
                              <?php if (isset($error_title[$title_key][$language['language_id']])) { ?>
                                <div class="text-danger"><?php echo $error_title[$title_key][$language['language_id']]; ?></div>
                              <?php } ?>
                            </div>
                          </div>  
                        </div>  
                        <?php } ?>
                      </div>
                    </div>
                      <fieldset id="link-values<?php echo $title_row;  ?>">
                        <legend><?php echo $text_value_setting; ?></legend>
                        <table id="accountsidebarlink-title<?php echo $title_row; ?>" class="table table-striped table-bordered table-hover">
                          <thead>
                            <tr>
                              <td class="text-left required"><?php echo $entry_link_title; ?></td>
                              <td class="text-left"><?php echo $entry_link; ?></td>
                              <td class="text-left"><?php echo $entry_iconclass; ?></td>
                              <td class="text-left"><?php echo $entry_logged; ?></td>
                              <td class="text-right hide"><?php echo $entry_sort_order; ?></td>
                              <td class="text-right"><?php echo $entry_action; ?></td>
                            </tr>
                          </thead>
                          <tbody class="links-sortable">
                            <?php if(!empty($title['link_title'])) { ?>
                            <?php foreach ($title['link_title'] as $link_key => $affiliate_sidebar_link_title) { ?>
                            <tr id="accountsidebarlink-title-row<?php echo $title_row; ?>-<?php echo $affiliate_sidebar_link_title_row; ?>">
                              <td class="text-left">
                                <?php foreach ($languages as $language) { ?>
                                <div class="input-group"><span class="input-group-addon">
                                <?php if(VERSION >= '2.2.0.0') { ?>
                                  <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
                                  <?php } else{ ?>
                                  <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                                  <?php } ?></span>
                                  <input type="text" name="affiliate_sidebar_title[<?php echo $title_row; ?>][link_title][<?php echo $affiliate_sidebar_link_title_row; ?>][affiliate_sidebar_link_title_description][<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($affiliate_sidebar_link_title['affiliate_sidebar_link_title_description'][$language['language_id']]['name']) ? $affiliate_sidebar_link_title['affiliate_sidebar_link_title_description'][$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_link_title; ?>" class="form-control" />
                                  <?php if (isset($error_link_title[$title_row][$link_key][$language['language_id']])) { ?>
                                  <div class="text-danger"><?php echo $error_link_title[$title_row][$link_key][$language['language_id']]; ?></div>
                                  <?php } ?>
                                </div>
                                <?php } ?></td>
                              <td class="text-left"><input type="text" name="affiliate_sidebar_title[<?php echo $title_row; ?>][link_title][<?php echo $affiliate_sidebar_link_title_row; ?>][link]" value="<?php echo $affiliate_sidebar_link_title['link']; ?>" class="form-control" /></td>
                              <td class="text-left"><input type="text" name="affiliate_sidebar_title[<?php echo $title_row; ?>][link_title][<?php echo $affiliate_sidebar_link_title_row; ?>][iconclass]" value="<?php echo $affiliate_sidebar_link_title['iconclass']; ?>" class="form-control" /></td>
                              <td class="text-left">
                                <select name="affiliate_sidebar_title[<?php echo $title_row; ?>][link_title][<?php echo $affiliate_sidebar_link_title_row; ?>][logged]" id="input-logged" class="form-control">
                                  <option value="2" <?php if ($affiliate_sidebar_link_title['logged'] == '2') { ?> selected="selected" <?php } ?> ><?php echo $text_both; ?></option>
                                  <option value="1" <?php if ($affiliate_sidebar_link_title['logged'] == '1') { ?>  selected="selected" <?php } ?> ><?php echo $text_yes; ?></option>
                                  <option value="0" <?php if ($affiliate_sidebar_link_title['logged'] == '0') { ?> selected="selected" <?php } ?> ><?php echo $text_no; ?></option>
                                </select>
                              </td> 
                              <td class="text-right hide"><input type="text" name="affiliate_sidebar_title[<?php echo $title_row; ?>][link_title][<?php echo $affiliate_sidebar_link_title_row; ?>][sort_order]" value="<?php echo $affiliate_sidebar_link_title['sort_order']; ?>" class="form-control link-sortorder" /></td>
                              <td class="text-right"><button type="button" onclick="$('#accountsidebarlink-title-row<?php echo $title_row; ?>-<?php echo $affiliate_sidebar_link_title_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                            </tr>
                            <?php $affiliate_sidebar_link_title_row++; ?>
                            <?php } ?>
                            <?php } ?>
                          </tbody>
                          <tfoot>
                            <tr>
                              <td colspan="4"></td>
                              <td class="text-right"><button type="button" onclick="addLinkTitle('<?php echo $title_row; ?>');" data-toggle="tooltip" title="<?php echo $button_link_title_add; ?>" class="btn  btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                            </tr>
                          </tfoot>
                        </table>
                      </fieldset>
                  </div>
                  <?php $title_row++; ?>
                <?php } ?>
                </div>
              </div>
            </div> 
          </div>
        </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
  $('#customer-email-language a:first').tab('show');
  $('#admin-email-language a:first').tab('show');
  $('#success-language a:first').tab('show');

  $('#email a:first').tab('show');

  $('#titles li:first-child a').tab('show');
  <?php $j = 0; foreach($titles as $key => $title) { ?>
  $('#title-language<?php echo $j; ?> li:first-child a').tab('show');
  <?php $j++; } ?>
//--></script>
<script type="text/javascript"><!--
$('#titles a:first').tab('show');
var title_row = <?php echo $title_row; ?>;
function addTitle() {
  html = '<div class="tab-pane" id="tab-title' + title_row + '">';                                        
      html += '<div class="form-group hide">';
        html += '<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_sort_order; ?>"><?php echo $entry_sort_order; ?></span></label>';
        html += '<div class="col-sm-10">';
          html += '<input type="text" name="affiliate_sidebar_title[' + title_row + '][sort_order]"  value="' + (title_row + 1) + '" class="form-control title-sortorder" />';
        html += '</div>';
      html += '</div>';
      html += '<div class="title-group">';
        html += '<ul class="nav nav-tabs" id="title-language' + title_row + '">';
          <?php foreach ($languages as $language) { ?>
          html += '<li><a href="#title-language' + title_row + '-<?php echo $language['language_id']; ?>" data-toggle="tab">';
          <?php if(VERSION >= '2.2.0.0') { ?>
          html += '<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />';
          <?php } else{ ?>
          html += '<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />';
          <?php } ?>
         html += ' <?php echo $language['name']; ?></a></li>';
          <?php } ?>
        html += '</ul>';
        html += '<div class="tab-content">';
          <?php foreach ($languages as $language) { ?>
          html += '<div class="tab-pane" id="title-language' + title_row + '-<?php echo $language['language_id']; ?>">';
            html += '<div class="form-group required">';
              html += '<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_title; ?>"><?php echo $entry_title; ?></span></label>';
              html += '<div class="col-sm-10">';
                html += '<input type="text" name="affiliate_sidebar_title[' + title_row + '][description][<?php echo $language['language_id']; ?>][title]" value="" placeholder="<?php echo $entry_title; ?>" class="form-control" />';
              html += '</div>';
            html += '</div>';
           html += '</div>';
          <?php } ?>
        html += '</div>';
      html += '</div>';
    html += '<fieldset>';
      html += '<legend><?php echo $text_type_setting ?></legend>';
          html += '<div class="form-group">';
            html += '<label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>';
            html += '<div class="col-sm-10">';
              html += '<select name="affiliate_sidebar_title[' + title_row + '][status]" class="form-control title-status" rel="' + title_row + '">';
                html += '<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
                html += '<option value="0"><?php echo $text_disabled; ?></option>';
              html += '</select>';
            html += '</div>';
          html += '</div>';
    html += '</fieldset>';
    html += '</fieldset>';
    html += '<fieldset id="link-values' + title_row + '">';
      html += '<legend><?php echo $text_value_setting; ?></legend>';
        html += '<table id="accountsidebarlink-title' + title_row + '" class="table table-striped table-bordered table-hover">';
          html += '<thead>';
            html += '<tr>';
              html += '<td class="text-left required"><?php echo $entry_link_title; ?></td>';
              html += '<td class="text-left"><?php echo $entry_link; ?></td>';
              html += '<td class="text-left"><?php echo $entry_iconclass; ?></td>';
              html += '<td class="text-left"><?php echo $entry_logged; ?></td>';
              html += '<td class="text-right hide"><?php echo $entry_sort_order; ?></td>';
              html += '<td class="text-right"><?php echo $entry_action; ?></td>';
            html += '</tr>';
          html += '</thead>';
          html += '<tbody class="links-sortable">';
          html += '</tbody>';
          html += '<tfoot>';
            html += '<tr>';
              html += '<td colspan="4"></td>';
              html += '<td class="text-right"><button type="button" onclick="addLinkTitle(' + title_row + ');" data-toggle="tooltip" title="<?php echo $button_link_title_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>';
            html += '</tr>';
          html += '</tfoot>';
        html += '</table>';
    html += '</fieldset>';  
  html += '</div>';

  $('#tab-affiliate_sidebar-titles #tab-content').append(html);

  $('#titles').append('<li class="titles-li"><a href="#tab-title' + title_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick=" $(\'#titles a:first\').tab(\'show\');$(\'a[href=\\\'#tab-title' + title_row + '\\\']\').parent().remove(); $(\'#tab-title' + title_row + '\').remove();"></i> <?php echo $tab_title; ?>-'+ (title_row + 1)  +' <i class="fa fa-arrows pull-right" aria-hidden="true"></i></a></li>');

  $('#titles a[href=\'#tab-title' + title_row + '\']').tab('show');
  
  $('#title-language'+ title_row +' a:first').tab('show');

  $('[data-toggle=\'tooltip\']').tooltip({
    container: 'body',
    html: true
  });

  title_row++;

  // $(".links-sortable").sortable();
}
//--></script>
<script type="text/javascript"><!--
var affiliate_sidebar_link_title_row = '<?php echo (isset($affiliate_sidebar_link_title_row) ? $affiliate_sidebar_link_title_row : 0); ?>';

function addLinkTitle(title_row) {
  html  = '<tr id="accountsidebarlink-title-row' + title_row + '-' + affiliate_sidebar_link_title_row + '">'; 
    html += '  <td class="text-left">';
  <?php foreach ($languages as $language) { ?>
  html += '    <div class="input-group">';
  html += '      <span class="input-group-addon">';
  <?php if(VERSION >= '2.2.0.0') { ?>
  html += '<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />';
  <?php } else{ ?>
  html += '<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />';
  <?php } ?>
  html += '</span><input type="text" name="affiliate_sidebar_title[' + title_row + '][link_title][' + affiliate_sidebar_link_title_row + '][affiliate_sidebar_link_title_description][<?php echo $language['language_id']; ?>][name]" value="" placeholder="<?php echo $entry_link_title; ?>" class="form-control" />';
    html += '    </div>';
  <?php } ?>
  html += '  </td>';
  html += '  <td class="text-left"><input type="text" name="affiliate_sidebar_title[' + title_row + '][link_title][' + affiliate_sidebar_link_title_row + '][link]" value="" placeholder="<?php echo $entry_link; ?>" class="form-control" /></td>';
  html += '  <td class="text-left"><input type="text" name="affiliate_sidebar_title[' + title_row + '][link_title][' + affiliate_sidebar_link_title_row + '][iconclass]" value="" placeholder="<?php echo $entry_iconclass; ?>" class="form-control" /></td>';
  html += '  <td class="text-left">';
   html += '  <select name="affiliate_sidebar_title[' + title_row + '][link_title][' + affiliate_sidebar_link_title_row + '][logged]" id="input-logged" class="form-control">';            
     html += ' <option value="2"><?php echo $text_both; ?></option>';
     html += '  <option value="1"><?php echo $text_yes; ?></option>';
      html += '  <option value="0"><?php echo $text_no; ?></option>';
     html += '   </select>';   
   html += '    </td>';
  html += '  <td class="text-right hide"><input type="text" name="affiliate_sidebar_title[' + title_row + '][link_title][' + affiliate_sidebar_link_title_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control link-sortorder" /></td>';
  html += '  <td class="text-right"><button type="button" onclick="$(\'#accountsidebarlink-title-row' + title_row + '-' + affiliate_sidebar_link_title_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
  html += '</tr>';  
  
  $('#accountsidebarlink-title' + title_row + ' tbody').append(html);
  
  affiliate_sidebar_link_title_row++;
}
//--></script>
<script type="text/javascript"><!--
/*$(document).ready(function() {
  $("#titles").sortable({
    cursor: "move",
    stop: function() {
      $('#titles .titles-li').each(function() {
        $($(this).find('a').attr('href')).find('.title-sortorder').val(($(this).index() + 1));
      });
    }
  });

  $(".links-sortable").sortable({
    cursor: "move",
    stop: function() {
      $('.links-sortable tr').each(function() {
        $(this).find('.link-sortorder').val($(this).index() + 1);
      });
    }
  });
});*/
//--></script>
 <script type="text/javascript">
  var element = null;
  $('.color-picker').ColorPicker({
    curr : '',
    onShow: function (colpkr) {
      $(colpkr).fadeIn(500);
      return false;
    },
    onHide: function (colpkr) {
      $(colpkr).fadeOut(500);
    return false;
    },
    onSubmit: function(hsb, hex, rgb, el) {
      $(el).val('#'+hex);
      $(el).ColorPickerHide();
    },
    onBeforeShow: function () {
      $(this).ColorPickerSetColor(this.value);
    },
    onChange: function (hsb, hex, rgb) {
      element.curr.parent().next().find('.preview').css('background', '#' + hex);
      element.curr.val('#'+hex);
    }
  }).bind('keyup', function(){
    $(this).ColorPickerSetColor(this.value);
  }).click(function(){
    element = this;
    element.curr = $(this);
  });

  $.each($('.color-picker'),function(key,value) {
    $(this).parent().next().find('.preview').css({'background': $(this).val()});
  });
</script> 
<style type="text/css">
  .preview { width: 45px; height: 35px; border: 1px solid #ColorPickerSetColorc;  }
</style>
</div>
<?php echo $footer; ?>