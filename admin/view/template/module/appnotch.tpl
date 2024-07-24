<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
          <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
          <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="alert alert-danger" id="error-message" style="display:none;"><i class="fa fa-exclamation-circle"></i>
      <?php echo $email_error; ?>
      <button type="button" class="close" id="btn-error-close">&times;</button>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-cogs" aria-hidden="true"></i><?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-email-id"><?php echo $entry_email_id; ?></label>
                <input type="text" name="email_id" value="<?php echo $email_id; ?>" placeholder="<?php echo $entry_email_id; ?>" id="input-email-id" class="form-control" />
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-site-url"><?php echo $entry_url; ?></label>
                <input disabled="disabled" type="text" name="site_url" value="<?php echo $site_url; ?>" placeholder="<?php echo $entry_url; ?>" id="input-site-url" class="form-control" />
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-12">
              <input type="hidden" id="hdUrl" value="<?php echo $appnotch_url; ?>"/>
              <input type="hidden" id="hdAppName" value="<?php echo $store_name; ?>"/>
              <button type="button" id="button-convert" class="btn btn-primary pull-right"><i class="fa fa-check"></i> <?php echo $button_convert; ?></button>
            </div>
          </div>          
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  $( document ).ready(function() {
    $( "#btn-error-close" ).click(function() {
      $('#error-message').hide();
    });
    $( "#button-convert" ).click(function() {
      if($('#input-email-id').val()!='' &&  validateEmail($('#input-email-id').val())){
        var url = $('#hdUrl').val();
        url = url.replace("<email>", $('#input-email-id').val());
        url = url.replace("<url>", $('#input-site-url').val());
        url = url.replace("<appname>", $('#hdAppName').val());
        window.open(url);
      }
      else{
        $('#error-message').show();
      }
    });
  });
  function validateEmail(sEmail) {
    var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
    if (filter.test(sEmail)) {
      return true;
    }
    else {
      return false;
    }
  }
</script>
<?php echo $footer; ?>