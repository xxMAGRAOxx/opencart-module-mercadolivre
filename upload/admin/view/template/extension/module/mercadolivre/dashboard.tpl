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
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
            </div>

            <div class="panel-body">
                <div class="tab-content">
                    <div class="col-lg-5 col-md-12 col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-calendar"></i><a href="<?php echo $question; ?>"><?php echo $text_last_questions; ?></a></h3>
                            </div>
                            <ul class="list-group" id="questions">
                                <li class="list-group-item"><?php echo $text_empty; ?></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-7 col-md-12 col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-calendar"></i><a href="<?php echo $order; ?>"><?php echo $text_last_orders; ?></a></h3>
                            </div>
                            <ul class="list-group" id="orders">
                                <li class="list-group-item"><?php echo $text_empty; ?></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        $(document).ready(function () {
            getLastOrders();
            getLastQuestions();

            setInterval(getLastOrders, 20000);
            setInterval(getLastQuestions, 20000);
        });

        function getLastOrders() {
            $.getJSON('{{ constant('HTTPS_SERVER') }}index.php?route=extension/module/mercadolivre/apiOrders&user_token=<?php echo $user_token; ?>', function (json) {
                if (json && json.length) {
                    $('#orders').html('');
                    $.each(json, function (i, v) {
                        $('#orders').append(`<li class="list-group-item">
                                    ${v['buyer']} <?php echo $text_perform_purchase; ?> ${v['total']} - <a href="https://www.mercadolivre.com.br/vendas/${v['ml_id']}/detalhe" target="_blank">${v['ml_id']}</a><br>
                                    <small class="text-muted"><i class="fa fa-clock-o"></i> ${v['date_created']}</small>
                                </li>`);
                    });
                }
            });
        }


        function getLastQuestions() {
            $.getJSON('{{ constant('HTTPS_SERVER') }}index.php?route=extension/module/mercadolivre/apiQuestions&user_token=<?php echo $user_token; ?>', function (json) {
                if (json && json.length) {
                    $('#questions').html('');
                    $.each(json, function (i, v) {
                        $('#questions').append(`<li class="list-group-item">
                                    ${v['question']} - <?php echo $column_name; ?>: ${v['product_name']}<br>
                                    <small class="text-muted"><i class="fa fa-clock-o"></i> ${v['created_at']}</small>
                                </li>`);
                    });
                }
            });
        }
    </script>
<?php echo $footer; ?>