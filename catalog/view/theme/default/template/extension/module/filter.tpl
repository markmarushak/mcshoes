<div class="panel panel-default">
  <div class="panel-heading"><?php echo $heading_title; ?></div>
  <div class="list-group">
    <?php foreach ($name_filter as $name => $value) { ?>
    <a class="list-group-item"><?php echo $name ?></a>

    <div class="list-group-item">
      <?php if($name === 'price'):?>
        <? foreach($value as $name) :?>

          <label class="form-inline price" for=""><?= $name['name'];?> <input class="form-control" type="number"></label>

        <? endforeach;?>
      <?php else :?>
      <select name="<?php echo $name ?>" class="form-control filter">
        <option value="">Выберите</option>
        <? foreach($value as $name) :?>

          <option value="<?= $name['name'];?>"><?= $name['name'];?></option>

        <? endforeach;?>
      </select>
      <?php endif;?>
    </div>
    <?php } ?>
  </div>
  <div class="panel-footer text-right">
    <button type="button" id="button-filter" class="btn btn-primary"><?php echo $button_filter; ?></button>
  </div>
</div>
<script type="text/javascript"><!--
    if('<?= $get["brand"];?>'){
       $('select.filter[name="brand"]').find('option[value="<?= $get["brand"];?>"]').attr('selected','selected');
    }
    if('<?= $get["size"];?>'){
        $('select.filter[name="size"]').find('option[value="<?= $get["size"];?>"]').attr('selected','selected');
    }
    if('<?= $get["min"];?>'){
        $('.price:first-child input').val('<?= $get["min"];?>');
    }
    if('<?= $get["max"];?>'){
        $('.price:last-child input').val('<?= $get["max"];?>');
    }

    filter = ['','','',''];


    $('select.filter').change(function (event) {
        event.preventDefault();
        var n = $(this).attr('name');
        if (n === 'size'){
            filter.splice(1,1,n+'='+$(this).val());
        }else {
            filter.splice(0,1,n+'='+$(this).val());
        }
    });

    $('.price:first-child input').keyup(function () {
        filter.splice(2,1,'min='+$(this).val());
    });

    $('.price:last-child input').keyup(function () {
        filter.splice(3,1,'max='+$(this).val());
    });


    $('#button-filter').on('click', function() {
        location = '<?php echo $action; ?> &' + filter.join('&');
    });

    if($(window).width > 640) {
        $('#column-left').addClass('modal');
    }


//--></script>
