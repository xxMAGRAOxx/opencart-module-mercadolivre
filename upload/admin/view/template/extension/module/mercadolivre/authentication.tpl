<?php echo $header; ?> <?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">

            <div class="pull-right">
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>

            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?> "><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>

    <div class="container-fluid">
        <div class="alert alert-warning"><i class="fa fa-check-circle"></i><?php echo $warning_about_notification_uri_redirect; ?></div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
            </div>

            <div class="panel-body">
                <div class="tab-content">
                    <div class="alert alert-info"><i class="fa fa-info-circle"></i><?php echo $warning_about_application_uri_redirect; ?></div>  
                    <?php if ($without_code): ?>
                        <div class="form-group">
                            <div class="col-sm-12 text-center">
                                <button class="btn btn-primary" onclick="openAutheticateML()"><?php echo $btn_authenticate; ?></button>
                            </div>
                        </div>
                    <?php else: ?>
                        <div class="alert alert-success"><i class="fa fa-info-circle"></i><?php echo $text_autheticated; ?></div>
                        <br/>
                        <form action="<?php echo $revoke; ?>" method="post">
                            <div class="text-center">
                                <button type="submit" class="btn btn-danger"><?php echo $button_revoke_authentication; ?></button>
                            </div>
                        </form>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        function openAutheticateML() {
            var url = '<?php echo $authentication_url; ?>';
            var varWindow = window.open(`http://auth.mercadolivre.com.br/authorization?response_type=code&client_id=<?php echo $module_mercadolivre_app_id; ?>&redirect_uri=${encodeURIComponent(url)}`, 'popup');
            varWindow.onbeforeunload = function () {
                window.location.reload()
            };
        }

    </script>
<?php echo $footer; ?>