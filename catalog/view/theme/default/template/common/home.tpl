<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <? if($categories) :?>
      <div class="group_category hidden-sm">
        <? foreach($categories as $category) :?>

        <div class="category">
          <a href="<?= $category['href']?>">
            <img src="<?= $category['img']?>" alt="<?= $category['name']?>">
            <span class="category_name">
                <span>
                    <?= $category['name']?>
                </span>
              </span>
          </a>
        </div>

        <? endforeach;?>
      </div>
      <? endif; ?>
      <?php echo $content_top; ?>



      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>