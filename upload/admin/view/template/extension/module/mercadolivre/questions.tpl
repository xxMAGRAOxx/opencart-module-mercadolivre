<?php echo $header; ?> <?php echo $column_left; ?>
<div id="content">

    <div class="page-header">
        <div class="container-fluid">

            <div class="pull-right">
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_filter; ?>" onclick="$('#filter-order').toggleClass('hidden-sm hidden-xs');" class="btn btn-default hidden-md hidden-lg"><i class="fa fa-filter"></i></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-order').submit() : false;"><i class="fa fa-trash"></i></button>
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
        <?php if ($error_warning): ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times</button>
            </div>
        <?php endif; ?>

        <?php if ($success): ?>
            <div class="alert alert-success alert-dismissible"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php endif; ?>

        <div class="row">

            <div id="filter-order" class="col-md-3 col-md-push-9 col-sm-12 hidden-sm hidden-xs">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-filter"></i> <?php echo $text_filter; ?></h3>
                    </div>

                    <div class="panel-body">

                        <div class="form-group">
                            <label class="control-label" for="input-expiration-date"><?php echo $entry_expiration_date; ?></label>
                            <div class="input-group date">
                                <input type="text" name="filter_expiration_date" value="<?php echo $filter_expiration_date; ?>" placeholder="<?php echo $entry_expiration_date; ?>" data-date-format="YYYY-MM-DD" id="input-expiration-date" class="form-control"/>
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                 </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="input-creation-date"><?php echo $entry_creation_date; ?></label>
                            <div class="input-group date">
                                <input type="text" name="filter_creation_date" value="<?php echo $filter_creation_date; ?>" placeholder="<?php echo $entry_creation_date; ?>" data-date-format="YYYY-MM-DD" id="input-creation-date" class="form-control"/>
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                 </span>
                            </div>
                        </div>

                        <div class="form-group text-right">
                            <button type="button" id="button-filter" onclick="filterOrder()" class="btn btn-default"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-9 col-md-pull-3 col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
                    </div>
                    <div class="panel-body">
                        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-order">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);"/></td>
                                        <td class="text-left"><?php echo $column_mercadolivre_order_id; ?></td>
                                        <td class="text-left"><?php echo $column_customer_name; ?></td>
                                        <td class="text-left"><?php echo $column_customer_document; ?></td>
                                        <td class="text-left"><?php echo $entry_creation_date; ?></td>
                                        <td class="text-left"><?php echo $entry_expiration_date; ?></td>
                                        <td class="text-left"><?php echo $column_mercadolivre_status; ?></td>
                                        <td class="text-left"><?php echo $column_mercadolivre_order_total; ?></td>
                                        <td class="text-right"><?php echo $column_action; ?></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php if ($orders): ?>
                                        <?php foreach ($orders as $order) { ?>
                                            <tr>
                                                <td class="text-center">
                                                    <input type="checkbox" name="selected[]" value="<?php echo $order['mercadolivre_order_id']; ?>" {{ order.mercadolivre_order_id in selected ? 'checked' : '' }} />
                                                </td>
                                                <td class="text-left"><a href="https://www.mercadolivre.com.br/vendas/<?php echo $order['ml_id']; ?>/detalhe" target="_blank"><?php echo $order['ml_id']; ?></a></td>
                                                <td class="text-left"><?php echo $order['buyer']; ?></td>
                                                <td class="text-left"><?php echo $order['buyer_document']; ?></td>
                                                <td class="text-left"><?php echo $order['date_created']; ?></td>
                                                <td class="text-left"><?php echo $order['expiration_date']; ?></td>
                                                <td class="text-left"><?php echo $order['status']; ?></td>
                                                <td class="text-left"><?php echo $order['total']; ?></td>
                                                <td class="text-right"><a href="javascript:viewProducts('<?php echo $order['mercadolivre_order_id']; ?>')" data-toggle="tooltip" title="<?php echo $button_order_products; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a></td>
                                            </tr>
                                        <?php } ?>
                                    <?php else: ?>
                                        <tr>
                                            <td class="text-center" colspan="9"><?php echo $text_no_results; ?></td>
                                        </tr>
                                    <?php endif; ?>
                                    </tbody>
                                </table>
                            </div>
                        </form>
                        <div class="row">
                            <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                            <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" tabindex="-1" role="dialog" id="modalShowProducts">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title"><?php echo $text_order_products; ?></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="container-fluid" id="products-body">

                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo $button_cancel; ?></button>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function () {
        $('.date').datetimepicker({
            language: '<?php echo $datepicker; ?>',
            pickTime: false
        });
    });

    var orders_products = {{ orders_products|json_encode|raw }};

    function filterOrder() {
        url = '{{ constant('HTTPS_SERVER') }}index.php?route=extension/module/mercadolivre/orders&user_token=<?php echo $user_token; ?>';

        var filter_expiration_date = $('input[name=\'filter_expiration_date\']').val();
        if (filter_expiration_date) {
            url += '&filter_expiration_date=' + encodeURIComponent(filter_expiration_date);
        }
        var filter_creation_date = $('select[name=\'filter_creation_date\']').val();
        if (filter_creation_date) {
            url += '&filter_creation_date=' + encodeURIComponent(filter_creation_date);
        }

        window.location = url;
    }

    function viewProducts(mercadolivre_order_id) {
        var products = orders_products[mercadolivre_order_id];
        var $bodyModal = $('#products-body');
        var html = '';
        var count = 1;

        $.each(products, function(i, v) {
            html += `<p><b>${count++} - ${v['name']}</b><span style="padding-left: 20px; display:block;"><?php echo $entry_variations; ?>: ${v['variation']}</span></p>`
        });

        $bodyModal.html(html);
        $('#modalShowProducts').modal('show');
    }

</script>
<?php echo $footer; ?>