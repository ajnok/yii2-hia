<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\bootstrap\Collapse;
use yii\web\view;
?>
<?php $form = ActiveForm::begin(); ?>
<?php $item =['1'=>'ตาก']; ?>
<?= $form->field($model, 'id')->listbox([], ['size'=>20,'prompt'=>'เลือก'])->label('จังหวัด');
?>
<!--<div class="form-group">-->
<!--<?= Html::submitButton('Submit', ['class' => 'btn btn-success pull-right show']) ?>-->
<!--</div>-->
<div class="clearfix">

    <button id="btnprovince" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#provinceArea" aria-expanded="false" aria-controls="provinceArea"><span id="provinceButton" class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>

</div>



<?php
$this->registerJs('$(\'#provinceArea\').on(\'shown.bs.collapse\', function() {'
        . '$(\'#provinceButton\').attr(\'class\',\'glyphicon glyphicon-minus\');});'
        . '$(\'#provinceArea\').on(\'hidden.bs.collapse\', function() {'
        . '$(\'#provinceButton\').attr(\'class\',\'glyphicon glyphicon-plus\');});', View::POS_READY);
?>
<?php ActiveForm::end(); ?>
