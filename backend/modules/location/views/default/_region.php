<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\bootstrap\Collapse;
use yii\web\view;
?>
<?php $form = ActiveForm::begin(); ?>
<?php
    $items = ArrayHelper::map($model->find()->all(),'id','name');
//    $item = $model->find()->asArray()->all();
    
    //var_dump($item);
?>
<?php $item =['1'=>'test']; ?>
<?= $form->field($model, 'id')->listbox($item, ['size'=>20,'prompt'=>'เลือก','options'=>['1'=>['disabled'=>true]]])->label('ภูมิภาค');
?>
<!--<div class="form-group">-->
<!--<?= Html::submitButton('Submit', ['class' => 'btn btn-success pull-right show']) ?>-->
<!--</div>-->
<div class="clearfix">

    <button id="btnplus" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#regionArea" aria-expanded="false" aria-controls="regionArea"><span id="regionButton" class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>

</div>

<div class="collapse" id="regionArea">
    <div class="well">
        ...
    </div>
</div>

<?php
$this->registerJs('$(\'#regionArea\').on(\'shown.bs.collapse\', function() {'
        . '$(\'#regionButton\').attr(\'class\',\'glyphicon glyphicon-minus\');});'
        . '$(\'#regionArea\').on(\'hidden.bs.collapse\', function() {'
        . '$(\'#regionButton\').attr(\'class\',\'glyphicon glyphicon-plus\');});', View::POS_READY);
?>
<?php ActiveForm::end(); ?>
<?php print_r($items) ?>
