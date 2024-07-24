<?php
    echo $header;

    if (!empty($column_left))
	{
		echo $column_left;
	}
?>
<div id="content">
    <?php if ($current_tab == "settings"): ?>

    <form id="form-revechat" class="revechat-admin-settings-form form-horizontal" action="<?php echo $action; ?>"
          method="post" enctype="multipart/form-data">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">

                    <?php if($revechat_aid == '' or $revechat_aid == '0') : ?>
                    <a href="#" data-toggle="tooltip" title="<?php echo $rc_button_connect; ?>"
                            class="btn btn-primary rc-submit-button">
                        <i class="fa fa-plug"></i>
                    </a>
                    <?php else: ?>
                    <button type="submit" data-toggle="tooltip" title="<?php echo $rc_button_disconnect; ?>"
                            class="btn btn-link rc-submit-button">
                        <i class="fa fa-times"></i>
                    </button>
                    <?php endif; ?>


                    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $rc_button_cancel; ?>"
                       class="btn btn-default"><i class="fa fa-reply"></i></a>
                </div><!-- pull right -->

                <h1>
                    <?php echo $heading_title; ?>
                </h1>
                <ul class="breadcrumb">
                    <?php foreach($breadcrumbs as $breadcrumb): ?>

                    <li><a href="<?php echo $breadcrumb['href'] ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php endforeach; ?>
                </ul>
            </div> <!-- container fluid -->
        </div><!-- page header -->

        <div class="container-fluid">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="<?php echo $action; ?>">
                        <i class="fa fa-wrench"></i> <?php echo $rc_text_settings; ?>
                    </a>
                </li>

                <li class="">
                    <a href="<?php echo $action; ?>&amp;do=positions">
                        <i class="fa fa-puzzle-piece"></i> <?php echo $rc_text_positions; ?>
                    </a>
                </li>
            </ul>

            <!-- Success -->
            <?php if(!empty($rc_success_message)): ?>

            <div class="alert alert-success">
                <i class="fa fa-cogs"></i> <?php echo $rc_success_message; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <?php endif; ?>

            <!-- Error -->
            <?php if (!empty($rc_error_message)): ?>
            <div class="alert alert-danger">
                <i class="fa fa-exclamation-circle"></i><?php echo $rc_error_message; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <?php endif; ?>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <i class="fa fa-plug"></i>
                        <?php echo $heading_title; ?>
                    </h3>
                </div>

                <div class="panel-body">
                    <div class="rc-alert alert hidden" role="alert">
                    </div>

                    <?php if ($revechat_aid == '' or $revechat_aid == '0') : ?>

                    <div class="form-group" id="revechat_choose_form">
                        <div class="col-sm-offset-2 col-sm-10">
                            <h4><?php echo $revechat_already_have_header; ?></h4>
                            <div class="radio">
                                <label>
                                    <input type="radio" checked="checked" id="has_revechat_account" name="revechat_choose_form">
                                    <?php echo $revechat_already_have; ?>
                                </label>
                            </div><!-- radio -->
                            <div class="radio">
                                <label>
                                    <input type="radio" id="new_revechat_account" name="revechat_choose_form">
                                    <?php echo $revechat_create_new; ?>
                                </label>
                            </div><!-- radio -->
                        </div><!-- col-sm-10 -->
                    </div><!-- revechat choose form -->


                    <div class="already-have" id="revechat_already_have">
                        <div class="form-group rc-email-form">
                            <label class="col-sm-2 control-label" for="revechat_account_email">REVE Chat
                                Login</label>
                            <div class="col-sm-10">
                                <input type="text" name="revechat_account_email" id="revechat_account_email"
                                       value="" size="40" class="form-control" placeholder="example: john@doe.com">
                                <input type="hidden" name="revechat_aid" id="revechat_aid" value="0">
                                <input type="hidden" name="revechat_status" id="input-status" value="1">
                                <span class="help-block rc-error-block hidden"></span>
                            </div>
                        </div><!-- form-group -->



                    </div><!-- already-have -->

                    <div class="new-account" id="revechat_new_account">
                        <div class="form-group first-name">
                            <label for="firstName" class="col-sm-2 control-label"><?php echo $first_name; ?></label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="firstName" name="firstName">
                                <span class="help-block rc-error-block hidden"></span>
                            </div><!-- col-sm-10 -->
                        </div><!-- form-group -->

                        <div class="form-group last-name">
                            <label for="lastName" class="col-sm-2 control-label"><?php echo $last_name; ?></label>
                            <div class="col-sm-10">
                                <input id="lastName" type="text" class="form-control" name="lastName">
                                <span class="help-block rc-error-block hidden"></span>
                            </div><!-- col-sm-10 -->
                        </div><!-- form-group -->


                        <div class="form-group new-email">
                            <label for="newEmail" class="col-sm-2 control-label"><?php echo $email; ?></label>
                            <div class="col-sm-10">
                                <input id="newEmail" type="text" class="form-control" name="newEmail">
                                <span class="help-block rc-error-block hidden"></span>
                            </div><!-- col-sm-10 -->
                        </div><!-- form-group -->


                        <div class="form-group account-password">
                            <label for="accountPassword" class="col-sm-2 control-label"><?php echo $create_password; ?></label>
                            <div class="col-sm-10">
                                <input id="accountPassword" type="password" class="form-control" name="accountPassword">
                                <span class="help-block rc-error-block hidden"></span>
                            </div><!-- col-sm-10 -->
                        </div><!-- form-group -->

                        <div class="form-group retype-password">
                            <label for="retypePassword" class="col-sm-2 control-label"><?php echo $confirm_password; ?></label>
                            <div class="col-sm-10">
                                <input id="retypePassword" type="password" class="form-control" name="retypePassword">
                                <span class="help-block rc-error-block hidden"></span>
                            </div><!-- col-sm-10 -->
                        </div><!-- form-group -->

                    </div><!-- New Account -->

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <a href="#" class="btn btn-primary rc-submit-button"><i class="fa fa-plug"></i> <span>Connect</span></a>
                        </div>
                    </div><!-- form-group -->


                    <?php else: ?>
                    <div>
                        <h3>REVE Chat has been installed.</h3>
                        <p>Sign in to REVE Chat Dashboard and start chatting with your customers.</p>
                        <p><a href="https://dashboard.revechat.com" class="btn btn-warning" target="_blank">Go to Dashboard</a></p>
                        <input type="hidden" name="revechat_aid">
                        <input type="hidden" name="revechat_status" value="0">
                        <p style="color:#99999f">
                            <small>
                                Something went wrong?
                                <span id="edit-actions" class="form-actions">

                                    <button style="color:#999; background:transparent; padding:0; text-decoration:underline" type="submit" form="form-revechat" type="submit" form="form-revechat" class="btn rc-remove-button rc-submit-button"><span><?php echo $rc_button_disconnect; ?></span></button>
                                </span>
                            </small>
                        </p>

                    </div>
                    <?php endif; ?>
                </div><!-- panel body -->
            </div> <!-- panel panel-default -->

        </div><!-- container fluid -->

    </form>
    <?php else: ?>
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $rc_button_cancel; ?>" class="btn btn-default"><i
                            class="fa fa-reply"></i></a>
            </div>

            <h1>
                <?php echo $heading_title; ?>
            </h1>

            <ul class="breadcrumb">
                <?php foreach($breadcrumbs as $breadcrumb): ?>
                <li><a href="<?php echo $breadcrumb['href'] ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php endforeach; ?>
            </ul>
        </div><!-- container-fluid -->
    </div><!-- page-header -->

    <div class="container-fluid">
        <ul class="nav nav-tabs">
            <li><a href="<?php echo $action; ?>"> <i class="fa fa-wrench"></i> <?php echo $rc_text_settings; ?></a></li>
            <li class="active"><a href="<?php echo $action; ?>&amp;do=positions"> <i
                            class="fa fa-puzzle-piece"></i> <?php echo $rc_text_positions; ?></a></li>
        </ul>

        <!-- Success -->
        <?php if(!empty($rc_success_message)): ?>

        <div class="alert alert-success">
            <i class="fa fa-cogs"></i> <?php echo $rc_success_message; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php endif; ?>

        <!-- Error -->
        <?php if (!empty($rc_error_message)): ?>
        <div class="alert alert-danger">
            <i class="fa fa-exclamation-circle"></i><?php echo $rc_error_message; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php endif; ?>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <i class="fa fa-plus-square"></i>
                    <?php echo $rc_text_add_to_a_position; ?>
                </h3>
            </div>
            <div class="panel-body">
                <form id="form-layout" action="<?php echo $action; ?>&amp;do=positions" method="post"
                      enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-sm-12">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <td class="text-center col-sm-3"><?php echo $rc_text_layout; ?></td>
                                    <td class="text-center col-sm-3"><?php echo $rc_text_position; ?></td>
                                    <td class="text-center col-sm-3"><?php echo $rc_text_sort_order; ?></td>
                                    <td class="text-center col-sm-3">&nbsp;</td>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td class="text-center col-sm-3">
                                        <select name="rc_layout_id" class="form-control">
                                            <?php $rc_i = 1 ?>
                                            <?php foreach($rc_layouts as $rc_layout): ?>

                                            <option value="<?php echo $rc_layout['layout_id']; ?>"> <?php echo $rc_layout['name']; ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </td>

                                    <td class="text-center col-sm-3">
                                        <select name="rc_position" class="form-control">
                                            <option value="content_top" selected="selected">Content Top</option>
                                            <option value="content_bottom">Content Bottom</option>
                                            <option value="column_left">Colum Left</option>
                                            <option value="column_right">Colum Right</option>
                                        </select>
                                    </td>

                                    <td class="text-center col-sm-3">
                                        <select name="rc_sort_order" class="form-control">
                                            <?php for($rc_i = 1; $rc_i <=99; $rc_i++): ?>
                                            <option value="<?php echo $rc_i; ?>"
                                            <?php if($rc_i == "1"): ?>selected="selected"<?php endif; ?>><?php echo $rc_i; ?></option>
                                            <?php endfor; ?>
                                        </select>
                                    </td>

                                    <td class="text-center col-sm-3">
                                        <button class="btn btn-info" type="submit">
                                            <i class="fa fa-plus-circle"></i> <?php echo $rc_text_add_position; ?>
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!-- col-sm-12 -->
                    </div><!-- row -->
                </form>
            </div><!-- panel-body -->
        </div> <!-- panel panel-default -->


        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <i class="fa fa-check-square"></i>
                    <?php echo $rc_text_current_positions; ?>
                </h3>
            </div>

            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-12">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <td class="text-center col-sm-3"><?php echo $rc_text_layout; ?></td>
                                <td class="text-center col-sm-3"><?php echo $rc_text_position; ?></td>
                                <td class="text-center col-sm-3"><?php echo $rc_text_sort_order; ?></td>
                                <td class="text-center col-sm-3">&nbsp;</td>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if(!empty($rc_positions) && is_array($rc_positions) && sizeof($rc_positions) > 0): ?>

                            <?php foreach($rc_positions as $rc_position): ?>
                            <tr>
                                <td class="text-center col-sm-3">
                                    <?php echo $rc_position['name']; ?>
                                </td>

                                <td class="text-center col-sm-3">
                                    <?php echo ucwords(str_replace("_", " ", $rc_position['position'])); ?>
                                </td>

                                <td class="text-center col-sm-3">
                                    <?php echo $rc_position['sort_order']; ?>
                                </td>

                                <td class="text-center col-sm-3">
                                    <a href="<?php echo $action; ?>&amp;do=positions&remove=<?php echo $rc_position['layout_module_id']; ?>"
                                       class="btn btn-danger" type="button">
                                        <i class="fa fa-plus-circle"></i> <?php echo $rc_text_remove_position; ?>
                                    </a>
                                </td>
                            </tr>
                            <?php endforeach; ?>

                            <?php endif; ?>
                            </tbody>
                        </table>
                    </div><!-- col-sm-12 -->
                </div><!-- row -->
            </div><!-- panel-body -->
        </div>

    </div><!-- container-fluid -->

    <?php endif; ?>

</div><!-- content -->

<script>
    (function ($) {
        var baseUrl = 'https://dashboard.revechat.com/';
        var ajaxMessage = $('.ajax_message');
        var ReveChat = {
            init: function () {
                this.clearError();
                this.formSubmit();
                this.toggleForm();
            },
            toggleForm: function () {
                var toggleForms = function () {
                    var button = $('.rc-submit-button');


                    if ($('#new_revechat_account').is(':checked')) {
                        $('#revechat_already_have').slideUp();
                        $('#revechat_new_account').slideDown();
                        $('#edit-name').focus();

                        button.find('i').removeClass('fa-plug').addClass('fa-plus');
                        button.find('span').text('');
                        button.find('span').text('Create');
                    }

                    else if ($('#has_revechat_account').is(':checked')) {
                        $('#revechat_new_account').slideUp();
                        $('#revechat_already_have').slideDown();
                        $('#edit-revechat-account-email').focus();

                        button.find('i').removeClass('fa-plus').addClass('fa-plug');
                        button.find('span').text('');
                        button.find('span').text('Connect');
                    }
                };

                toggleForms();
                $('#revechat_choose_form input').click(toggleForms);


            },
            formSubmit: function () {
                var form = $("#form-revechat");
                $('.rc-submit-button').on('click',function (e) {
                    e.preventDefault();

                    // check if disconnect button clicked
                    // if clicked then submit
                    if ($.trim($('.rc-remove-button').text()) == "Disconnect") {
                        form.submit();
                    }


                    if (((parseInt($('#revechat_aid').val()) !== 0) || $('#has_revechat_account').is(':checked'))) {
                        return ReveChat.alreadyHaveAccount();
                    }
                    else {
                        return ReveChat.newLicenseForm();
                    }

                });
            },
            alreadyHaveAccount: function () {
                var form = $("#form-revechat");

                if ((parseInt($('#revechat_aid').val()) == 0 || $('#revechat_aid').val() == "")) {
                    var email = $.trim($('#revechat_account_email').val());
                    if (!email.length || !ReveChat.isValidEmailAddress(email)) {
                        ReveChat.showError($('.rc-email-form'), "Please provide valid email address.");
                        return false;
                    }

                    if ($('select[name=revechat_status]').val() == 0) {
                        $('select[name=revechat_status]').focus();
                        $('.rc_status').addClass('has-error');
                        $('#rc-status-block').removeClass('hidden').html("Please enable the extension");
                        return false;
                    }

                    ReveChat.showProcessingLabel();

                    window.signInCallBack = function (response){
                        //alert(response.data.account_id);
                        if (response.error)
                        {
                            ajaxMessage.removeClass('wait').addClass('message alert').html('Incorrect REVE Chat login.');
                            setTimeout(function () { ajaxMessage.slideUp().removeClass('wait message alert').html(''); }, 3000);
                            $('input[name=revechat_aid]').focus();
                        }
                        else
                        {
                            if( response.data.account_id ) {
                                //alert('signin successfull!');
                                $('input[name=revechat_aid]').val(response.data.account_id);
                                //alert('before form submit.');
                                $("#form-revechat").submit();

                            } else {
                                //alert('signin failed!');
                                console.log('ExistingAccoutVerify Response Error: ',response);
                                ReveChat.showError(response);
                            }
                        }
                    }
                    var signInUrl = baseUrl + 'license/adminId/' + $('#revechat_account_email').val() + '/?callback=window.signInCallBack';

                    $.ajax({
                        type: 'GET',
                        dataType: "text",
                        //dataType: 'jsonp',
                        url: signInUrl,
                        //jsonpCallback: logResults,
                        success: function (response) {
                            //alert('inside success!');
                            eval(response);
                        },
                        error: function(XMLHttpRequest, textStatus, errorThrown) {
                            //alert('inside error');
                            ajaxMessage.removeClass('wait').addClass('message alert').html('Unable to Login. Please check internet connection.');
                            setTimeout(function () { ajaxMessage.slideUp().removeClass('wait message alert').html(''); }, 3000);
                        }
                    });
                }

                return true;
            },

            newLicenseForm: function () {
                var firstName = $.trim($('#firstName').val());
                var lastName = $.trim($('#lastName').val());
                var email = $.trim($('#newEmail').val());
                var password = $.trim($('#accountPassword').val());
                var rePassword = $.trim($('#retypePassword').val());
                ReveChat.showProcessingLabel();
                var form = $("#form-revechat");

                // validate the form
                if (!firstName.length) {
                    ReveChat.showError($('.first-name'), "Please please provide your first name");
                    ReveChat.hideProcessLabel();
                    return false;
                }

                if (!lastName.length) {
                    ReveChat.showError($('.last-name'), "Please please provide your last name");
                    ReveChat.hideProcessLabel();
                    return false;
                }

                if (!email.length || !ReveChat.isValidEmailAddress(email)) {
                    ReveChat.showError($('.new-email'), "Please please provide your email address");
                    ReveChat.hideProcessLabel();
                    return false;
                }

                if (!password.length || password.length < 6) {
                    ReveChat.showError($('.account-password'), "Please please provide your password. The password must be at least 6 characters.");
                    ReveChat.hideProcessLabel();
                    return false;
                }

                if (!rePassword.length || password.length < 6) {
                    ReveChat.showError($('.retype-password'), "Please provide your password again.");
                    ReveChat.hideProcessLabel();
                    return false;
                }

                if (password != rePassword) {
                    ReveChat.showError($('.retype-password'), "Password did not matched.");
                    ReveChat.hideProcessLabel();
                    return false;
                }


                // form validationg done
                // now submit the form

                window.signUpCallBack = function (response){
                    //alert('inside window.signUpCallBack');
                    //alert(response.data.account_id);
                    if (response.error)
                    {
                        ajaxMessage.removeClass('wait').addClass('message alert').html('Incorrect REVE Chat login.');
                        setTimeout(function () { ajaxMessage.slideUp().removeClass('wait message alert').html(''); }, 3000);
                        $('input[name=revechat_aid]').focus();
                    }
                    else
                    {
                        if( response.data.account_id ) {
                            //alert('signin successfull!');
                            $('input[name=revechat_aid]').val(response.data.account_id);
                            //alert('before form submit.');
                            $("#form-revechat").submit();

                        } else {
                            //alert('signin failed!');
                            console.log('ExistingAccoutVerify Response Error: ',response);
                            ReveChat.showError(response);
                        }
                    }
                }
                var signUpUrl = baseUrl + 'revechat/cms/api/signup.do';
                //alert(signUpUrl);
                $.ajax({
                    data: {
                        'firstname': firstName,
                        'lastname': lastName,
                        'mailAddr': email,
                        'password': password,
                        'utm_source':'cms',
                        'utm_content':'opencart',
                        'referrer':'https://www.opencart.com'
                    },
                    type: 'POST',
                    url: signUpUrl,
                    dataType: 'json',
                    cache: false,
                    success: function (response) {
                        if (response.status == 'error') {
                            //alert('signup failed!');
                            $('.rc-alert').removeClass('hidden').removeClass('alert-success').addClass('alert-danger').text(response.message);
                            ReveChat.hideProcessLabel();
                            //alert(response.message);
                        }
                        else if (response.status == 'success') {
                            //$('.rc-alert').removeClass('hidden').removeClass('alert-danger').addClass('alert-success').text(response.message + '. You can now connect with your REVE Chat.');
                            //ReveChat.hideProcessLabel();

                            //alert('signup successfull!');
                            var signInUrl = baseUrl + 'license/adminId/' + email + '/?callback=window.signUpCallBack';
                            //alert('1');
                            //alert(signInUrl);

                            $.ajax({
                                type: 'GET',
                                dataType: "text",
                                //dataType: 'jsonp',
                                url: signInUrl,
                                //jsonpCallback: logResults,
                                success: function (response) {
                                    //alert('inside success!');
                                    eval(response);
                                },
                                error: function(XMLHttpRequest, textStatus, errorThrown) {
                                    //alert('inside error');
                                    ajaxMessage.removeClass('wait').addClass('message alert').html('Unable to Login. Please check internet connection.');
                                    setTimeout(function () { ajaxMessage.slideUp().removeClass('wait message alert').html(''); }, 3000);
                                }
                            });
                        }
                    }
                });

                return true;


            },
            clearError: function () {
                $("#form-revechat input").keyup(function (event) {
                    $('.form-group').removeClass('has-error');
                    $('.rc-error-block').addClass('hidden').html('');
                });
            },

            showError: function (elem, message) {
                var button = $('.rc-submit-button');
                // $('#revechat_account_email').focus();
                elem.addClass('has-error');
                elem.find('.rc-error-block').removeClass('hidden').html(message)

                ReveChat.hideProcessLabel();
            },

            hideProcessLabel: function () {
                var button = $('.rc-submit-button');


                if ($('#new_revechat_account').is(':checked')) {

                    button.find('i').removeClass('fa-spinner').removeClass('fa-spin').addClass('fa-plus');
                    button.find('span').text('');
                    button.find('span').text('Create');
                }
                else {

                    button.find('i').removeClass('fa-spinner').removeClass('fa-spin').addClass('fa-plug');
                    button.find('span').text('');
                    button.find('span').text('Connect');

                }
            },

            showProcessingLabel: function () {
                var button = $('.rc-submit-button');
                // remove text and class
                button.find('i').removeClass('fa-plug').addClass('fa-spinner').addClass('fa-spin');
                button.find('span').text('');
                // add text and cluss

                button.find('span').text(' Please Wait');
            },
            isValidEmailAddress: function (emailAddress) {

                var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
                return pattern.test(emailAddress);
            }

        };

        $(document).ready(function () {
            ReveChat.init();
        });
    })(jQuery);
</script>
<?php echo $footer; ?>