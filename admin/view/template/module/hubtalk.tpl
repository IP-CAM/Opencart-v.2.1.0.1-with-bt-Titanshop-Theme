<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-hubtalk" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <?php if ($error_warning){ ?>
    <div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-hubtalk" class="form-horizontal">

          <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $info_signup; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
          </div>
          <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $info_create_widget; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
          </div>


          <div style="width:350px; float:left;">
            <iframe src="https://www.hubtalk.com/default.php?page=embed&amp;ep=apphub&amp;key=Opencart" style="border:none; margin:0px; padding:0px; height: 100px; width:100%"></iframe>
          </div>
          <div style="width:350px; float:left;">
            <iframe src="https://www.hubtalk.com/default.php?page=embed&amp;ep=apphub&amp;key=FirstMessage" style="border:none; margin:0px; padding:0px; height: 100px; width:100%"></iframe>
          </div>
          <div style="clear:both;"></div>

          <?php foreach ($stores as $store) { ?>
              <h2><?php echo $store['name']; ?></h2>
              <?php foreach ($languages as $language) { ?>
                  <h4><?php echo $language['name']; ?></h4>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-code"><?php echo $entry_code; ?></label>
                    <div class="col-sm-10">
                      <?php $settingsKey = 'module_hubtalk_code_' . $store['id'] . '_' . $language['id']; ?>
                      <textarea name="module_hubtalk_code_<?php echo $store['id']; ?>_<?php echo $language['id']; ?>" rows="5" placeholder="<?php echo $entry_code; ?>" id="input-code" class="form-control"><?php echo $hubtalk_settings[$settingsKey]; ?></textarea>
                      <?php if ($error_code){ ?>
                      <div class="text-danger"><?php echo $error_code; ?></div>
                      <?php }?>
                    </div>
                  </div>
              <?php } ?>
          <?php } ?>

        </form>
      </div>
    </div>
  </div>
</div>

<?php echo $footer; ?>