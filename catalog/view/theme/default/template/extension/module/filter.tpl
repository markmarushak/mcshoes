<div class="panel panel-default">
  <div class="panel-heading"><?php echo $heading_title; ?></div>
  <div class="hidden-lg hidden-md col-sm-12 text-center mobile-box-filter close-filter">
    <button class="mobile-filter"><i class="fa fa-times-circle" aria-hidden="true"></i> закрыть</button>
  </div>
  <div class="list-group">
    <div class="list-group-item">
      <div class="form-group input-group input-group-sm">
        <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
        <select id="input-sort" class="form-control" onchange="location = this.value;">
          <?php foreach ($sorts as $sorts) { ?>
          <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
          <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
          <?php } ?>
          <?php } ?>
        </select>
      </div>
    </div>
    <div class="list-group-item">
        <div class="input-group input-group-sm">
          <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
    </div>
    <?php foreach ($name_filter as $name => $value) { ?>
    <a class="list-group-item"><?php echo $name ?></a>

    <div class="list-group-item">
      <?php if($name === 'price'):?>
        <? foreach($value as $name) :?>
            <label class="form-inline price"><?= $name['name'];?> <input class="form-control" type="number"></label>
      <? endforeach;?>
      <?php elseif($name === 'size') :?>
      <select name="<?php echo $name ?>" class="form-control filter" onchange="location = this.value;">
        <?php
         $text = preg_replace('/('. $name .')=\w+.*?&/i','',$url);
        ?>
        <option value="<?= $action.$text?>">Выберите</option>
        <? foreach($value as $name) :?>

            <? if($name['name'] === $_GET['size']):?>
              <option value="<?= $name['val'];?>" selected="true"><?= $name['name'];?></option>
            <? else :?>
              <option value="<?= $name['val'];?>"><?= $name['name'];?></option>
            <? endif;?>

        <? endforeach;?>
      </select>
      <? else :?>

      <select name="<?php echo $name ?>" class="form-control filter" onchange="location = this.value;">
        <?php
         $text = preg_replace('/('. $name .')=\w+.*?&/i','',$url);
        ?>
        <option value="<?= $action.$text?>">Выберите</option>
        <? foreach($value as $name) :?>

            <? if($name['name'] == $_GET['brand']):?>
              <option value="<?= $name['val'];?>" selected="true"><?= $name['name'];?></option>
            <? else :?>
              <option value="<?= $name['val'];?>"><?= $name['name'];?></option>
            <? endif;?>

        <? endforeach;?>
      </select>
      <?php endif;?>
    </div>
    <?php } ?>
  </div>
<script type="text/javascript"><!--
    var url = '<?= $url;?>';
    var min = url.replace(/min=.*?&/, '');
    var max = url.replace(/max=.*?&/, '');
    console.log(min);
    console.log(max);

    if ('<?= $_GET["min"]?>')
        $('.price:first-child input').val('<?= $_GET["min"]?>');

    if ('<?= $_GET["max"]?>')
        $('.price:last-child input').val('<?= $_GET["max"]?>');

    $('.price:first-child input').keyup(function () {
        var val = '<?= $action;?>'+ min +'&min='+$(this).val()+'&';
        setTimeout(function () {
            location = val;
        },1000);
    });

    $('.price:last-child input').keyup(function () {
        var val = '<?= $action;?>'+ max +'&max='+$(this).val()+'&';
        setTimeout(function () {
            location = val;
        },1000);
    });





//--></script>
