<?php echo $header; ?> <?php echo $column_left; ?>
<div id="content">

    <div class="page-header">
        <div class="container-fluid">

            <div class="pull-right">
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_filter; ?>" onclick="$('#filter-product').toggleClass('hidden-sm hidden-xs');" class="btn btn-default hidden-md hidden-lg"><i class="fa fa-filter"></i></button>
                <a href="javascript:loadModalAddProducts()" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                <a href="javascript:synchronizeStockPrice()" id="btn-synchronize" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_synchronize_stock_price; ?>" class="btn btn-warning"><i class="fa fa-refresh"></i></a>
                <button type="button" form="form-product" data-toggle="tooltip" title="<?php echo $button_disconnect; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-product').submit() : false;"><i class="fa fa-unlink"></i></button>
                <button type="button" form="form-product" data-toggle="tooltip" title="<?php echo $button_pause; ?>" class="btn btn-warning" onclick="pauseProducts()"><i class="fa fa-pause"></i></button>
                <button type="button" form="form-product" data-toggle="tooltip" title="<?php echo $button_active; ?>" class="btn btn-success" onclick="activeProducts()"><i class="fa fa-play"></i></button>
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
        <div class="row">
            <div id="filter-product" class="col-md-3 col-md-push-9 col-sm-12 hidden-sm hidden-xs">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-filter"></i> <?php echo $text_filter; ?></h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label class="control-label" for="input-name"><?php echo $entry_product_name; ?></label>
                            <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_product_name; ?>" id="input-name" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="input-product_connected"><?php echo $entry_product_connected; ?></label>
                            <select name="filter_product_connected" id="input-product_connected" class="form-control">
                                <option value=""></option>
                                <option value="1" <?php echo $filter_product_connected == '1' ? 'selected' : ''; ?>><?php echo $text_enabled; ?></option>
                                <option value="0" <?php echo $filter_product_connected == '0' ? 'selected' : ''; ?>><?php echo $text_disabled; ?></option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
                            <select name="filter_status" id="input-status" class="form-control">
                                <option value=""></option>
                                <option value="1" <?php echo $filter_status == '1' ? 'selected' : ''; ?>><?php echo $text_enabled; ?></option>
                                <option value="0" <?php echo $filter_status == '0' ? 'selected' : ''; ?>><?php echo $text_disabled; ?></option>
                            </select>
                        </div>
                        <div class="form-group text-right">
                            <button type="button" id="button-filter" onclick="filterProducts()" class="btn btn-default"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-9 col-md-pull-3 col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-list"></i></h3>
                    </div>
                    <div class="panel-body">
                        <form action="<?php echo $disconnect; ?>" method="post" enctype="multipart/form-data" id="form-product">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);"/></td>
                                        <td class="text-center"><?php echo $column_image; ?></td>
                                        <td class="text-left"><?php if ($sort == 'pd.name'): ?> <a href="<?php echo $sort_name; ?>" class="{{ order|lower }}"><?php echo $column_name; ?></a> <?php else: ?> <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a> <?php endif; ?></td>
                                        <td class="text-right"><?php if ($sort == 'p.quantity'): ?> <a href="<?php echo $sort_quantity; ?>" class="{{ order|lower }}"><?php echo $column_quantity; ?></a> <?php else: ?> <a href="<?php echo $sort_quantity; ?>"><?php echo $column_quantity; ?></a> <?php endif; ?></td>
                                        <td class="text-left"><?php if ($sort == 'p.status'): ?> <a href="<?php echo $sort_status; ?>" class="{{ order|lower }}"><?php echo $column_status; ?></a> <?php else: ?> <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a> <?php endif; ?></td>
                                        <td class="text-left"><?php if ($sort == 'p.price'): ?> <a href="<?php echo $sort_price; ?>" class="{{ order|lower }}"><?php echo $column_price; ?></a> <?php else: ?> <a href="<?php echo $sort_price; ?>"><?php echo $column_price; ?></a> <?php endif; ?></td>
                                        <td class="text-left"><?php echo $column_mercadolivre_id; ?></td>
                                        <td class="text-left"><?php echo $column_mercadolivre_category; ?></td>
                                        <td class="text-left"><?php echo $column_mercadolivre_status; ?></td>
                                        <td class="text-right"></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php if ($products): ?>
                                        <?php foreach ($products as $product) { ?>
                                            <tr>
                                                <td class="text-center">
                                                    <input type="checkbox" name="selected[]" data-ml-code="<?php echo $product['ml_id']; ?>" value="<?php echo $product['product_id']; ?>" {{ product.product_id in selected ? 'checked' : '' }} />
                                                </td>
                                                <td class="text-center">
                                                    <?php if ($product['image']): ?>
                                                        <img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="img-thumbnail" style="max-width: 60px"/>
                                                    <?php else: ?>
                                                        <span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
                                                    <?php endif; ?>
                                                </td>
                                                <td class="text-left"><?php echo $product['name']; ?></td>
                                                <td class="text-right">
                                                    <span class="label <?php echo $product['quantity'] <= 0 ? 'label-warning' : ($product['quantity'] <= 5 ? 'label-danger' : 'label-success' ) ?>"><?php echo $product['quantity']; ?></span>
                                                </td>
                                                <td class="text-left"><?php echo $product['status']; ?></td>
                                                <td class="text-left"><?php echo $product['price']; ?></td>

                                                <?php if ($product['ml_id']): ?>
                                                    <td class="text-left"><?php echo $product['ml_id']; ?></td>
                                                    <td class="text-left">
                                                        <?php if ($product['ml_category']): ?>
                                                            <span data-ml-category="<?php echo $product['ml_category']; ?>" class="load-categories"></span><br/>
                                                        <?php else: ?>
                                                            <?php echo $text_without_category; ?>
                                                        <?php endif; ?>
                                                    </td>
                                                    <td class="text-left"><?php echo $product['status_ml']; ?> </td>

                                                <?php else: ?>
                                                    <td class="text-left" colspan="3"><?php echo $text_without_product_in_ml; ?></td>
                                                <?php endif; ?>

                                                <td class="text-right"><a href="<?php echo $product['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                                            </tr>
                                        <?php } ?>
                                    <?php else: ?>
                                        <tr>
                                            <td class="text-center" colspan="10"><?php echo $text_no_results; ?></td>
                                        </tr>
                                    <?php endif; ?>
                                    </tbody>
                                </table>
                            </div>
                        </form>
                        <div class="row">
                            <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                            <div class="col-sm-6 text-right"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" tabindex="-1" role="dialog" id="modalAddProductToML">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title"><?php echo $text_add_products_in_ml; ?></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="container-fluid">
                    <div class="alert alert-danger" style="display: none;" id="sendProductsErrorsContainer"></div>
                    <form class="form-horizontal" onsubmit="return false;" id="add_products_in_ml">
                        <div class="row">

                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category_for_ads; ?>"><?php echo $entry_select_category; ?></span></label>
                                <div class="col-sm-9" id="input-category">
                                    <select class="form-control mercadolivre-categories" style="width: auto; display:initial" id="category" onchange="loadCategoriesChildren(this.value, 0)">
                                        <option><?php echo $entry_select; ?></option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-3 control-label" for="input-listing-type"><?php echo $entry_ad_type; ?></label>
                                <div class="col-sm-9">
                                    <select class="form-control" id="input-listing-type" name="ml_listing_type" data-value="<?php echo $listing_type; ?>">
                                        <option><?php echo $entry_select; ?></option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="input-warranty-type"><?php echo $entry_product_warranty_type; ?></label>
                                <div class="col-sm-9">
                                    <select class="form-control" id="input-warranty-type" name="ml_product_warranty_type" onchange="changeWarranty(this.value)">
                                        <option value=""><?php echo $without_warranty; ?></option>
                                        <option value="<?php echo $warranty_of_seller; ?>"><?php echo $warranty_of_seller; ?></option>
                                        <option value="<?php echo $warranty_of_factory; ?>"><?php echo $warranty_of_factory; ?></option>
                                    </select>
                                </div>
                            </div>

                            <div id="warranty_div" style="display: none">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-warranty-unit"><?php echo $entry_product_warranty_unit; ?></label>
                                    <div class="col-sm-9">
                                        <select class="form-control" id="input-warranty-unit" name="ml_product_warranty_unit">
                                            <option value="<?php echo $entry_days; ?>"><?php echo $entry_days; ?></option>
                                            <option value="<?php echo $entry_month; ?>"><?php echo $entry_month; ?></option>
                                            <option value="<?php echo $entry_years; ?>"><?php echo $entry_years; ?></option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-warranty"><?php echo $entry_product_warranty; ?></label>
                                    <div class="col-sm-9">
                                        <input type="number" class="form-control" id="input-warranty" name="ml_product_warranty"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="input-price-adjustment"><span data-toggle="tooltip" title="<?php echo $help_price_adjustment; ?>"><?php echo $entry_price_adjustment; ?></span></label>
                                <div class="col-sm-9">
                                    <input type="text" name="ml_price_adjustment" value="<?php echo $price_adjustment; ?>" placeholder="<?php echo $entry_price_adjustment; ?>" class="form-control" id="input-price-adjustment"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="input-subtract-stock"><?php echo $entry_subtract_product; ?></label>
                                <div class="col-sm-9">
                                    <input type="checkbox" name="subtract_product" value="1" placeholder="<?php echo $entry_subtract_product; ?>" class="form-control" id="input-subtract-stock"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="input-shipping-free"><span data-toggle="tooltip" title="<?php echo $help_shipping_free; ?>"><?php echo $entry_shipping_free; ?></span></label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="checkbox" {{ shipping_free ? 'checked' : '' }} name="shipping_free" value="1" id="input-shipping-free">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="sendProducts(document.forms.add_products_in_ml);" id="btn-add-send" data-loading-text="<?php echo $text_loading; ?>"><?php echo $button_send; ?></button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo $button_cancel; ?></button>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">

    var categoryFinished = false;

    $(document).ready(function () {
        setAutoCompleteProductName();
        loadCategories();
        loadListingsTypes();
        loadCategoriesTexts();
    });

    function pauseProducts() {
        if (validateSelections() && confirm('<?php echo $text_confirm; ?>')) {
            var $form = $('#form-product');
            var server = '<?php echo HTTPS_SERVER; ?>';
            var token = '<?php echo $token; ?>';
            var url = server + "index.php?route=extension/module/mercadolivre/pauseProduct&token=" + token;
            $form.attr('action', url);
            $form.submit();
        }
    }

    function activeProducts() {
        validateSelections();
        if (validateSelections() && confirm('<?php echo $text_confirm; ?>')) {
            var $form =  $('#form-product');
            var server = '<?php echo HTTPS_SERVER; ?>';
            var token = '<?php echo $token; ?>';
            var url = server + "index.php?route=extension/module/mercadolivre/activeProduct&token=" + token;
            $form.attr('action', url);
            $form.submit();
        }
    }

    function validateSelections() {
        var $products = $("input[name='selected[]']:checked");

        if (!$products.length) {
            alert('<?php echo $entry_select_product; ?>');
            return false;
        }

        return true;
    }

    function changeWarranty(value) {
        if (value !== '') {
            $('#warranty_div').show();
        } else {
            $('#warranty_div').hide();
        }
    }

    function loadModalAddProducts() {
        if (validateSelections()) {
            $('#sendProductsErrorsContainer').hide();
            $('#modalAddProductToML').modal('show');
        }
    }

    function sendProducts(form) {
        var body = $(form).serializeArray();
        if (validateForm(body)) {
            var $products = $("input[name='selected[]']:checked");
            body.push({
                name: 'product_ids', value: $products.map(function (v) {
                    return this.value;
                }).get()
            });

            $.ajax({
                url: 'index.php?route=extension/module/mercadolivre/addProducts&token=<?php echo $token; ?>',
                type: 'post',
                dataType: 'json',
                data: body,
                beforeSend: function () {
                    $('#btn-add-send').button('loading');
                },
                complete: function () {
                    $('#btn-add-send').button('reset');
                },
                success: function (json) {
                    if (json['error']) {
                        $('#sendProductsErrorsContainer').html('<p><strong><?php echo $message_send_products_error_title; ?></strong></p>');
                        $('#sendProductsErrorsContainer').show();
                        if (json['error']['errors']) {
                            json['error']['errors'].forEach((error) => {
                                if (error.type === 'error') {
                                    $('#sendProductsErrorsContainer').append('<p>' + error.message + '</p>');
                                }
                            })
                        } else {
                            $('#sendProductsErrorsContainer').append('<p>' + json['error'] + '</p>');
                        }
                    }

                    if (json['success']) {
                        alert(json['success']);
                        window.location.reload();
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        }
    }

    function validateForm(body) {
        var $firstCategory = $('.mercadolivre-categories:first');
        if ($firstCategory.val() && !categoryFinished) {
            alert('<?php echo $message_error_select_category_or_unselect; ?>');
            return false;
        }

        if (body['ml_listing_type'] == '') {
            alert('<?php echo $message_error_listing_type; ?>');
            return false;
        }

        return true;
    }

    function loadCategories() {
        var country = '<?php echo $ml_country; ?>';

        $.getJSON(`https://api.mercadolibre.com/sites/${country}/categories`, function (json) {
                createSelectOptions(json, 'id', 'name', $('.mercadolivre-categories'));
            }
        );
    }

    function loadCategoriesChildren(ml_category_id, indexSelectCall) {
        var $column = $('#input-category');

        $column.find('.mercadolivre-categories').each(function (i, v) {
            if (i > indexSelectCall) {
                $(v).remove();
                $column.find('i').remove();
            }
        });

        if (!ml_category_id) return;

        $.getJSON(`https://api.mercadolibre.com/categories/${ml_category_id}`, function (json) {
            categoryFinished = json['settings']['listing_allowed'];

            if (categoryFinished) {
                var $select = $column.find('.mercadolivre-categories:last');
                $select.attr('name', 'ml_category');
                $column.append('<i class="fa fa-check-circle" style="color: green;font-size: 26px;margin-left: 15px;"></i>');
            } else {
                var $select = $('<select class="form-control mercadolivre-categories" style="width: auto; display: initial;"><option><?php echo $entry_select; ?></option></select>');
                $select.on('change', function () {
                    loadCategoriesChildren(this.value, (indexSelectCall + 1));
                });

                createSelectOptions(json['children_categories'], 'id', 'name', $select);
                $column.append($select);
            }
        });
    }

    function filterProducts() {
        var server = '<?php echo HTTPS_SERVER; ?>';
        var token = '<?php echo $token; ?>';
        url = server + 'index.php?route=extension/module/mercadolivre/products&token=' + token;

        var filter_name = $('input[name=\'filter_name\']').val();
        if (filter_name) {
            url += '&filter_name=' + encodeURIComponent(filter_name);
        }

        var filter_status = $('select[name=\'filter_status\']').val();
        if (filter_status) {
            url += '&filter_status=' + encodeURIComponent(filter_status);
        }

        var filter_product_connected = $('select[name=\'filter_product_connected\']').val();
        if (filter_product_connected) {
            url += '&filter_product_connected=' + encodeURIComponent(filter_product_connected);
        }

        window.location = url;
    }

    function synchronizeStockPrice() {
        var server = '<?php echo HTTPS_SERVER; ?>';
        var token = '<?php echo $token; ?>';
        url = server + 'index.php?route=extension/module/mercadolivre/synchronizeStockPrice&token=' + token;

        var $products = $("input[name='selected[]']:checked");

        var request = { products: $products.map(function (v) { return this.value; }).get() };

        $.ajax({
            url,
            type: 'post',
            dataType: 'json',
            data: request,
            beforeSend: function () {
                $('#btn-synchronize').button('loading');
            },
            complete: function () {
                $('#btn-synchronize').button('reset');
            },
            success: function (json) {
                if (json['error']) {
                    alert(json['error']);
                }

                if (json['success']) {
                    alert(json['success']);
                    window.location.reload();
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }

    function setAutoCompleteProductName() {
        var $input = $('input[name=\'filter_name\']');

        $input.autocomplete({
            'source': function (request, response) {
                $.getJSON(`index.php?route=catalog/product/autocomplete&user_token={{ user_token }}&filter_name=${encodeURIComponent(request)}`,
                    function (json) {
                        response($.map(json, function (item) {
                            return {label: item['name'], value: item['product_id']}
                        }));
                    }
                );
            },
            'select': function (item) {
                $input.val(item['label']);
            }
        });
    }

    function loadListingsTypes() {
        var country = '<?php echo $ml_country; ?>';

        $.getJSON(`https://api.mercadolibre.com/sites/${country}/listing_types`,
            function (json) {
                createSelectOptions(json, 'id', 'name', $('#input-listing-type'));
            }
        );
    }

    function createSelectOptions(options, value, description, $select) {
        $select.html('<option value=""><?php echo $entry_select; ?></option>');
        var valueSelected = $select.data('value');

        $.each(options, function (i, v) {
            $select.append(`<option value="${v[value]}" ${valueSelected == v[value] ? 'selected' : ''}>${v[description]}</option>`);
        });
    }

    function loadCategoriesTexts() {
        $('.load-categories').each(function (i, v) {
            var code = $(v).data('ml-category');

            $.getJSON(`https://api.mercadolibre.com/categories/${code}`, function (json) {
                var path = json['path_from_root'].reduce(function (i1, i2) {
                    return {name: i1['name'] + ' -> ' + i2['name']};
                });
                $(v).text(path['name'] + ' -- ');
            });
        });
    }

</script>
<?php echo $footer; ?>