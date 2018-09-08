<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2 class="text-center"><?php echo $text_my_account; ?></h2>
      <hr>
        <div class="row">
          <div class="col-sm-6">
            <div class="jumbotron-m">
              <a class="btn-m btn-full btn-static" href="<?php echo $edit; ?>"><i class="fa fa-user" aria-hidden="true"></i> <?php echo $text_edit; ?></a></div>
            </div>
          <div class="col-sm-6">
            <div class="jumbotron-m">
              <a class="btn-m btn-full btn-static" href="<?php echo $password; ?>"><i class="fa fa-unlock-alt" aria-hidden="true"></i> <?php echo $text_password; ?></a></div>
            </div>
          <div class="col-sm-6">
            <div class="jumbotron-m">
              <a class="btn-m btn-full btn-static" href="<?php echo $address; ?>"><i class="fa fa-street-view" aria-hidden="true"></i> <?php echo $text_address; ?></a></div>
            </div>
          <div class="col-sm-6">
            <div class="jumbotron-m">
              <a class="btn-m btn-full btn-static" href="<?php echo $wishlist; ?>"><i class="fa fa-star" aria-hidden="true"></i> <?php echo $text_wishlist; ?></a></div>
            </div>
        </div>
      <?php if ($credit_cards) { ?>
      <h2><?php echo $text_credit_card; ?></h2>
      <ul class="list-unstyled">
        <?php foreach ($credit_cards as $credit_card) { ?>
        <li><a href="<?php echo $credit_card['href']; ?>"><?php echo $credit_card['name']; ?></a></li>
        <?php } ?>
      </ul>
      <?php } ?>
      <h2 class="text-center"><?php echo $text_my_orders; ?></h2>
      <hr>
      <div class="row">
        <div class="col-sm-4">
          <div class="jumbotron-m">
            <a class="btn-m btn-full btn-static" href="<?php echo $order; ?>"><i class="fa fa-shopping-cart" aria-hidden="true"></i> <?php echo $text_order; ?></a>
          </div>
        </div>
        <div class="col-sm-4">
          <div class="jumbotron-m">
            <a class="btn-m btn-full btn-static" href="<?php echo $transaction; ?>"><i class="fa fa-university" aria-hidden="true"></i> <?php echo $text_transaction; ?></a>
          </div>
        </div>
        <div class="col-sm-4">
          <div class="jumbotron-m">
            <a class="btn-m btn-full btn-static" href="<?php echo $recurring; ?>"><i class="fa fa-history" aria-hidden="true"></i><?php echo $text_recurring; ?></a>
          </div>
        </div>
        <!--<div class="col-sm-4"><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></div>-->
        <!--<div class="col-sm-4"><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></div>-->
      </div>
      <h2 class="text-center"><?php echo $text_my_newsletter; ?></h2>
      <hr>
      <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
          <div class="jumbotron-m">
            <a class="btn-m btn-full btn-static" href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a>
          </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 