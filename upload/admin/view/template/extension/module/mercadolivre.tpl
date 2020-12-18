<?php echo $header; ?> <?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">

            <div class="pull-right">
                <button type="submit" form="form-module" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal" id="form-mercadolivre-config">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                        <li><a href="#tab-product-settings" data-toggle="tab"><?php echo $tab_product_settings; ?></a></li>
                        <li><a href="#tab-categories" data-toggle="tab"><?php echo $tab_categories; ?></a></li>
                        <li><a href="#tab-feedback" data-toggle="tab"><?php echo $tab_feedback; ?></a></li>
                        <li><a href="#tab-shipping" data-toggle="tab"><?php echo $tab_shipping; ?></a></li>
                        <li><a href="#tab-template" data-toggle="tab"><?php echo $tab_template; ?></a></li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-general">

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-app-id"><?php echo $entry_app_id; ?></label>
                                <div class="col-sm-10">
                                    <input type="number" name="module_mercadolivre_app_id" value="<?php echo $module_mercadolivre_app_id; ?>" placeholder="<?php echo $entry_app_id; ?>" class="form-control" id="input-app-id" maxlength="30" required/>
                                    <?php if ($error_app_id): ?>
                                        <div class="text-danger"><?php echo $error_app_id; ?></div>
                                    <?php endif; ?>
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-app-secret"><span data-toggle="tooltip" title="<?php echo $help_app_secret; ?>"><?php echo $entry_app_secret; ?></span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="module_mercadolivre_app_secret" value="<?php echo $module_mercadolivre_app_secret; ?>" placeholder="<?php echo $entry_app_secret; ?>" class="form-control" id="input-app-secret" maxlength="40" required/>
                                    <?php if ($error_app_secret): ?>
                                        <div class="text-danger"><?php echo $error_app_secret; ?></div>
                                    <?php endif; ?>
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
                                <div class="col-sm-10">
                                    <select name="module_mercadolivre_country" class="form-control" data-value="<?php echo $module_mercadolivre_country; ?>" id="input-country" onchange="loadListingsTypes(); loadCategories();"></select>
                                    <?php if ($error_app_country): ?>
                                        <div class="text-danger"><?php echo $error_app_country; ?></div>
                                    <?php endif; ?>
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="module_mercadolivre_status" id="input-status" class="form-control">
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <option value="1" <?php if ($module_mercadolivre_status): ?> selected="selected" <?php endif; ?>><?php echo $text_enabled; ?></option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane" id="tab-product-settings">
                            <div class="alert alert-info"><i class="fa fa-info-circle"></i>Configurações a ser aplicadas em produtos que não tenham nenhuma configuração selecionada personalizada no produto.</div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-listing-type"><?php echo $entry_ad_type; ?></label>
                                <div class="col-sm-10">
                                    <select name="module_mercadolivre_listing_type" class="form-control" data-value="<?php echo $module_mercadolivre_listing_type; ?>" id="input-listing-type">
                                        <option value=""><?php echo $entry_select_country; ?></option>
                                    </select>
                                    <?php if ($error_listing_type): ?>
                                        <div class="text-danger"><?php echo $error_listing_type; ?></div>
                                    <?php endif; ?>
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-currency"><?php echo $entry_currency; ?></label>
                                <div class="col-sm-10">
                                    <select name="module_mercadolivre_currency" data-value="<?php echo $module_mercadolivre_currency; ?>" class="form-control" id="input-currency"></select>
                                    <?php if ($error_currency): ?>
                                        <div class="text-danger"><?php echo $error_currency; ?></div>
                                    <?php endif; ?>
                                </div>
                            </div>


                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-buying-mode"><?php echo $entry_buying_mode; ?></label>
                                <div class="col-sm-10">
                                    <select name="module_mercadolivre_buying_mode" class="form-control" id="input-buying-mode">
                                        <option value=""><?php echo $entry_select; ?></option>
                                        <option value="buy_it_now" <?php if ($module_mercadolivre_buying_mode == 'buy_it_now'): ?> selected <?php endif; ?>><?php echo $entry_buy_it_now; ?></option>
                                        <option value="classified" <?php if ($module_mercadolivre_buying_mode == 'classified'): ?> selected <?php endif; ?>><?php echo $entry_classified; ?></option>
{#                                        <option value="auction" <?php if ($module_mercadolivre_buying_mode == 'auction'): ?> selected <?php endif; ?>><?php echo $entry_auction; ?></option>
A modalidade de arremate ("buying_mode"="auction") ainda aparecerá nas APIs de algumas categorias, mas não poderá ser utilizada
#}
                                    </select>
                                    <?php if ($error_buying_mode): ?>
                                        <div class="text-danger"><?php echo $error_buying_mode; ?></div>
                                    <?php endif; ?>
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-condition"><?php echo $entry_condition; ?></label>
                                <div class="col-sm-10">
                                    <select name="module_mercadolivre_condition" class="form-control" id="input-condition">
                                        <option value=""><?php echo $entry_select; ?></option>
                                        <option value="new" <?php if ($module_mercadolivre_condition == 'new'): ?> selected <?php endif; ?>><?php echo $entry_new; ?></option>
                                        <option value="used" <?php if ($module_mercadolivre_condition == 'used'): ?> selected <?php endif; ?>><?php echo $entry_used; ?></option>
                                        <option value="not_specified" <?php if ($module_mercadolivre_condition == 'not_specified'): ?> selected <?php endif; ?>><?php echo $entry_not_specified; ?></option>
                                    </select>
                                    <?php if ($error_condition): ?>
                                        <div class="text-danger"><?php echo $error_condition; ?></div>
                                    <?php endif; ?>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-condition"><span data-toggle="tooltip" title="<?php echo $help_auto_detect_category; ?>"><?php echo $entry_auto_detect_category; ?></span></label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="checkbox" {{ module_mercadolivre_auto_detect_category ? 'checked' : '' }} name="module_mercadolivre_auto_detect_category" value="1">
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-price-adjustment"><span data-toggle="tooltip" title="<?php echo $help_price_adjustment; ?>"><?php echo $entry_price_adjustment; ?></span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="module_mercadolivre_price_adjustment" value="<?php echo $module_mercadolivre_price_adjustment; ?>"
                                           placeholder="<?php echo $entry_price_adjustment; ?>" class="form-control" id="input-price-adjustment" />
                                    <?php if ($error_price_adjustment): ?>
                                        <div class="text-danger"><?php echo $error_price_adjustment; ?></div>
                                    <?php endif; ?>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-condition"><?php echo $entry_consider_special_price; ?></label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="checkbox" {{ module_mercadolivre_consider_special_price ? 'checked' : '' }} name="module_mercadolivre_consider_special_price" value="1">
                                </div>
                            </div>

                        </div>

                        <div class="tab-pane" id="tab-categories">
                            <div class="alert alert-info"><i class="fa fa-info-circle"></i>Categorias a ser aplicada em caso de falha ou desativação da auto associação do Mercado Livre em cima dos produtos. <b>Caso um produto use duas categorias, será utilizado apenas uma categoria.</b></div>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th class="col-sm-4"><?php echo $column_opecart_category; ?></th>
                                    <th class="col-sm-8"><?php echo $column_mercadolivre_category; ?></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($categories as $category) { ?>
                                    <tr>
                                        <td><?php echo $category['name']; ?></td>
                                        <td class="col-sm-8">
                                            <?php if ($category['ml_category']): ?>
                                                <span class="category-ml-<?php echo $category['category_id']; ?>">
                                                    <input type="hidden" name="categories[<?php echo $category['category_id']; ?>]" value="<?php echo $category['ml_category']; ?>"/>
                                                    <span data-ml-category="<?php echo $category['ml_category']; ?>" class="load-categories"></span>
                                                    <a href="javascript:changeCategory(<?php echo $category['category_id']; ?>)"><?php echo $btn_change_category; ?></a>
                                                </span>
                                            <?php endif; ?>

                                            <span id="col-ml-category<?php echo $category['category_id']; ?>">
                                                <select class="form-control mercadolivre-categories" style="width: auto; display: <?php echo $category['ml_categ'] or $y ? 'none' : 'initial'; ?>;" onchange="loadCategoriesChildren(this.value, '<?php echo $category['category_id']; ?>', 0)">
                                                    <option><?php echo $entry_select_country; ?></option>
                                                </select>
                                            </span>
                                        </td>
                                    </tr>
                                <?php } ?>
                                </tbody>
                            </table>
                        </div>

                        <div class="tab-pane" id="tab-feedback">
                            <div class="alert alert-info"><i class="fa fa-info-circle"></i>Você pode configurar uma mensagem após receber o pedido.</div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-feedback-enabled"><?php echo $entry_feedback_enabled; ?></label>
                                <div class="col-sm-10">
                                    <select name="module_mercadolivre_feedback_enabled" class="form-control" id="input-feedback-enabled">
                                        <option value="n"><?php echo $text_no; ?></option>
                                        <option value="y" <?php echo $module_mercadolivre_feedback_enabled == 'y' ? 'selected' : ''; ?>><?php echo $text_yes; ?></option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-feedback-message"><?php echo $entry_feedback_message; ?></label>
                                <div class="col-sm-10">
                                    <textarea name="module_mercadolivre_feedback_message" class="form-control" id="input-feedback-message"><?php echo $module_mercadolivre_feedback_message; ?></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane" id="tab-shipping">

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-shipping-type"><?php echo $entry_shipping_type; ?></label>
                                <div class="col-sm-10">
                                    <select name="module_mercadolivre_shipping_type" class="form-control" id="input-shipping-type">
                                        <option value="me1">ME1</option>
                                        <option value="me2" <?php echo $module_mercadolivre_shipping_type == 'me2' ? 'selected' : ''; ?>>ME2</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-shipping-with-local-pick-up"><?php echo $entry_with_local_pick_up; ?></label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="checkbox" {{ module_mercadolivre_shipping_with_local_pick_up ? 'checked' : '' }} name="module_mercadolivre_shipping_with_local_pick_up" value="1" id="input-shipping-with-local-pick-up">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-shipping-free"><span data-toggle="tooltip" title="<?php echo $help_shipping_free; ?>"><?php echo $entry_shipping_free; ?></span></label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="checkbox" {{ module_mercadolivre_shipping_free ? 'checked' : '' }} name="module_mercadolivre_shipping_free" value="1" id="input-shipping-free">
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane" id="tab-template">

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-template-title"><?php echo $entry_template_title; ?></label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" id="input-template-title" name="module_mercadolivre_template_title" cols="40" rows="8"><?php echo $module_mercadolivre_template_title; ?></textarea>
                                    <br><?php echo $help_template_title; ?>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-template-description"><?php echo $entry_template_description; ?></label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" id="input-template-description" name="module_mercadolivre_template_description" cols="40" rows="12"><?php echo $module_mercadolivre_template_description; ?></textarea>
                                    <br><?php echo $help_template_description; ?>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-image"><span data-toggle="tooltip" title="<?php echo $help_image_additional; ?>"><?php echo $entry_template_image_additional; ?></span></label>
                                <div class="col-sm-10">
                                    <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail">
                                        <img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>"/>
                                    </a>
                                    <input type="hidden" name="module_mercadolivre_template_image_aditional" value="<?php echo $module_mercadolivre_template_image_aditional; ?>" id="input-image"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var categories = [];
        $(document).ready(function () {
            loadCountriesAvailable();

            if ($('#input-country').data('value')) {
                loadListingsTypes();
                loadCategories();
            }

            loadCurrencies();
            loadCategoriesTexts();
        });

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

        function loadCountriesAvailable() {
            $.getJSON(`https://api.mercadolibre.com/sites`,
                function (data) {
                    var optionsAvailabre = ['MLA', 'MLB', 'MCO', 'MCR', 'MEC', 'MLC', 'MLM', 'MLU', 'MLV', 'MPA', 'MPE', 'MPT', 'MRD'];
                    var newOptions = data.filter(function (item) {
                        return optionsAvailabre.includes(item['id']);
                    });

                    createSelectOptions(newOptions, 'id', 'name',  $('#input-country'));
                }
            );
        }

        function loadListingsTypes() {
            var country = $('#input-country option:selected').val() || $('#input-country').data('value');

            if (country) {
                $.getJSON(`https://api.mercadolibre.com/sites/${country}/listing_types`,
                    function (json) {
                        createSelectOptions(json, 'id', 'name', $('#input-listing-type'));
                    }
                );
            }
        }

        function loadCurrencies() {
            $.getJSON('https://api.mercadolibre.com/currencies/',
                function (json) {
                    createSelectOptions(json, 'id', 'description', $('#input-currency'));
                }
            );
        }

        function changeCategory(index) {
            $('.category-ml-' + index).remove();
            $('#col-ml-category' + index).find('.mercadolivre-categories').show();
        }

        function loadCategoriesChildren(ml_category_id, category_index, indexSelectCall) {
            var $column = $('#col-ml-category' + category_index);

            $column.find('.mercadolivre-categories').each(function (i, v) {
                if (i > indexSelectCall) {
                    $(v).remove();
                    $column.find('i').remove();
                }
            });

            if (!ml_category_id) return;

            $.getJSON(`https://api.mercadolibre.com/categories/${ml_category_id}`, function (json) {

                if (json['settings']['listing_allowed']) {
                    var $select = $column.find('.mercadolivre-categories:last');
                    $select.attr('name', `categories[${category_index}]`);
                    $column.append('<i class="fa fa-check-circle" style="color: green;font-size: 26px;margin-left: 15px;"></i>');
                } else {
                    var $select = $('<select class="form-control mercadolivre-categories" style="width: auto; display: initial;"><option><?php echo $entry_select_left; ?></option></select>');
                    $select.on('change', function () {
                        loadCategoriesChildren(this.value, category_index, (indexSelectCall + 1));
                    });

                    createSelectOptions(json['children_categories'], 'id', 'name', $select);
                    $column.append($select);
                }
            });
        }

        function loadCategories() {
            if (categories.length) {
                createSelectOptions(categories, 'id', 'name', $('.mercadolivre-categories'));
                return;
            }

            var country = $('#input-country option:selected').val() || $('#input-country').data('value');
            if (!country) return;

            $.getJSON(`https://api.mercadolibre.com/sites/${country}/categories`, function (json) {
                    categories = json;
                    createSelectOptions(json, 'id', 'name', $('.mercadolivre-categories'));
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
    </script>

<?php echo $footer; ?>