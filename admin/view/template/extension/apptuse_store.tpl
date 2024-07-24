<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">


      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title">Store List</h3>
      </div>
      <div class="panel-body">
        <div class="table-responsive">
          <table class="table table-bordered table-hover" width="100%" style="  border: 1px solid #cecece;     border-collapse: collapse; ">
            <tr>
                <th class="app_th">
                  #id
                </th>
                <th class="app_th">
                  Store Name
                </th>
                <th class="app_th text-right">
                  Action
                </th>
            </tr>
            
            <?php  foreach( $stores as $store ){ ?>
              
              <tr>
                <td class="app_td"><?php echo $store['store_id']; ?></td>
                <td class="app_td align-left"><?php echo $store['name']; ?></td>
                <td class="app_td text-right">

                  <?php  if( empty($store['token']) && $store['status'] == 0 )  { ?>

                      <a href="<?php echo $store['connect_url']; ?>" data-toggle="tooltip" title="Connect to Apptuse service to create your mobile app for '<?php $store['name'] ?>' store" class="btn btn-primary" data-original-title="Connect "><i class="fa fa-plug inline"></i> Connect</a>

                 <?php } else { ?>
                         <a target="_blank" href="https://app.apptuse.com/plugin-login-url?token=<?php echo $store['token']; ?>&email=<?php echo $store['email']; ?>" data-toggle="tooltip" title="Manage your mobile app" class="btn btn-success" data-original-title="Manage "><i class="fa fa-cogs inline"></i> Manage</a>
                 <?php }?>

                </td>
              </tr>
            <?php } ?>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">

window.onload = function(){

   var ths  = document.getElementsByClassName('app_th'); 
   for (var i = 0; i < ths.length; i++) {
     ths[i].style.border = "1px solid #cecece";
     ths[i].style.padding = "10px"; 
     ths[i].style.background = "#828282";
     ths[i].style.color = "white";
   } 



   var tds  = document.getElementsByClassName('app_td'); 
   for (var i = 0; i < tds.length; i++) {
     tds[i].style.border = "1px solid #cecece";
     //tds[i].style.textAlign = "center";
     tds[i].style.padding = "10px";
   } 

}


</script>
<?php echo $footer; ?>