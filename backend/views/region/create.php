<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Region */

$this->title = Yii::t('hia', 'Create {modelClass}', [
    'modelClass' => 'Region',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('hia', 'Regions'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="region-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
