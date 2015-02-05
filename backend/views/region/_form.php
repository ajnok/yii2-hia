<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Region */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="region-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'bot_code')->textInput(['maxlength' => 6]) ?>

    <?= $form->field($model, 'dopa_code')->textInput(['maxlength' => 6]) ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => 20]) ?>

    <?= $form->field($model, 'note')->textInput(['maxlength' => 100]) ?>

    <?= $form->field($model, 'dt_create')->textInput() ?>

    <?= $form->field($model, 'ts_update')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('hia', 'Create') : Yii::t('hia', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
