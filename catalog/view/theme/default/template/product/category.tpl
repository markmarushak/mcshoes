<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
      <?php echo $column_left; ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-9'; ?>
      <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
      <?php } ?>
    <div id="content" class="col-md-9 col-sm-12">
      <?php echo $content_top; ?>
      <div class="hidden-lg hidden-md col-sm-12 text-center mobile-box-filter">
      <button class="mobile-filter"><i class="fa fa-cog" aria-hidden="true"></i> Фильтр</button>
      </div>

      <?php if ($products) { ?>
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid col-lg-4 col-md-4 col-sm-4 col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="caption">

                <h4><a href="<?php echo $product['href']; ?>" id="name"><?php echo substr($product['name'], 0,16); ?></a></h4>
                <!-- <p><?php echo $product['description']; ?></p> -->
                <?php if ($product['price']) { ?>
                <p class="price" id="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>

                <?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <div class="button-group">
                <!--<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>-->
                <button id="buy" data-toggle="modal" data-size="<?= $product['attr'][0]['attribute'][0]['text']; ?>" data-id="<?= $product['product_id']; ?>" data-target="#myModal"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>


<style>

    #order_form {
        display: flex;
        flex-direction: column;
    }
    #order .modal-footer {
        display: flex;
        align-items:center;
    }
    #order .modal-footer > * {
        margin: 0 auto;
    }

</style>

<!-- Modal -->
<div class="modal fade " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content"  id="order">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" ><span id="product">Название модали</span>  </h4>
            </div>
            <div class="modal-body">
                <form class="form-group" id="order_form">
                    <input type="hidden" name="article" id="article" required>
                    <input type="hidden" name="product_id" id="product_id" required>
                    <div class="form-group">
                        <label class="col-sm-12 col-xs-12">
                            Ваше имя :
                            <input type="text" name="customer" id="customer" class="form-control" required>
                        </label>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-12 col-xs-12">
                            Ваш номер :
                            <input type="number" name="phone" id="phone" class="form-control" required>
                        </label>
                    </div>

                    <label class="col-sm-12 col-xs-12">
                        Выберите размер :
                        <select id="model_size_shoes" name="size_shoes" class="form-control" required>
                            <option value=""></option>
                        </select>
                    </label>
                </form>
            </div>
            <div class="modal-footer">
                    <strong id="price_" style="font-size: 1.4rem; "></strong>
                    <button form="order_form" class="btn btn-primary">Заказать</button>
            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {

        $('#buy').click(function () {
            var id = $(this).attr('data-id');
            $article = getArticle(id);
        });

        $('#order_form').submit(function (event) {
            event.preventDefault();
            var data = {
                product_id: $(this).find('#product_id').val(),
                firstname: $(this).find('#customer').val(),
                phone: $(this).find('#phone').val(),
                title: $('#order').find('#product').text(),
                sizes: $(this).find('#model_size_shoes').val(),
                price: $('#order').find('#price_').text(),
                article: $(this).find('#article').val()
            };
            console.log(data);
            $.ajax({
                method: 'POST',
                url: '/index.php?route=ajax/order',
                data: {data:data}
            }).done(function (data) {
               var result = JSON.parse(data);
               console.log(result);
            });
        });

        function getArticle(id) {
            console.log('start ajax');
            $.ajax({
                method: 'POST',
                url: '/index.php?route=ajax/getArticle',
                data: {id:id}
            }).done(function (data) {
               var result = JSON.parse(data);
               console.log(result);
               var cont = $('#order');
               cont.find('#product_id').val(result.product_id);
               cont.find('#product').text(result.name);
               cont.find('#price_').text(result.price + '.грн');
               cont.find('#article').val(result.sku);
               cont.find('#model_size_shoes').html('<option value="">- выберите -</option>');
                $.each(result.size, function (data,val) {
                  cont.find('#model_size_shoes').append('<option value="'+val+'">'+val+'</option>');
               });
            });
        }

    });
</script>

<?php echo $footer; ?>
