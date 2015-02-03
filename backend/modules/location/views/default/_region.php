<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\bootstrap\Collapse;
use yii\web\view;
?>
<?php $form = ActiveForm::begin(); ?>

<?= $form->field($model, 'id')->listbox(ArrayHelper::map($model->find()->all(), 'id', 'name'), ['size' => 20])->label('ภูมิภาค');
?>
<!--<div class="form-group">-->
<!--<?= Html::submitButton('Submit', ['class' => 'btn btn-success pull-right show']) ?>-->
<!--</div>-->
<button id="btnplus" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#regionArea" aria-expanded="false" aria-controls="regionArea"><span id="regionButton" class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>

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
