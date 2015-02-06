<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\RegionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title                   = Yii::t('hia', 'Regions');
$this->params['breadcrumbs'][] = $this->title;
?>
<?php $this->beginBlock('content'); ?>
<div class="region-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?=
        Html::a(Yii::t('hia', 'Create {modelClass}',
                [
                'modelClass' => 'Region',
            ]), ['create'], ['class' => 'btn btn-success'])
        ?>
    </p>
    <?php // var_dump($dataProvider->getModels()); ?>
    <?=
    GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel'  => $searchModel,
        'columns' => [
            [
                'class'         => 'yii\grid\SerialColumn',
                'header'        => 'ที่',
                'headerOptions' => ['style' => 'text-align: center; vertical-align: middle;'],
            ],
//            [
//                'class' => 'yii\grid\DataColumn',
//                'attribute' => 'name',
////                'value' => $dataProvider->getModels(),
////                'value' => function($model) {
////                    return $model->name . $model->bot_code;
////                },
//
//            ],
            [
                'class'          => 'yii\grid\DataColumn',
                'attribute'      => 'bot_code',
                'encodeLabel'    => false,
                'label'          => 'รหัสอ้างอิง<br />(ธปท.)',
                'contentOptions' => ['style' => 'width: 150px;'],
                'headerOptions'  => [
                    'style' => 'text-align: center; vertical-align: middle;'
                ],
            ],
            [
                'class'          => 'yii\grid\DataColumn',
                'attribute'      => 'dopa_code',
                'encodeLabel'    => false,
                'label'          => 'รหัสอ้างอิง<br />(กรมการปกครอง)',
                'contentOptions' => ['style' => 'width: 150px;'],
                'headerOptions'  => ['style' => 'text-align: center; vertical-align: middle;'],
            ],
//            'dopa_code',
            [
                'class'          => 'yii\grid\DataColumn',
                'attribute'      => 'name',
                'encodeLabel'    => false,
                'contentOptions' => ['style' => 'width: 150px;'],
                'headerOptions'  => ['style' => 'text-align: center; vertical-align: middle;'],
            ],
            [
                'class'          => 'yii\grid\DataColumn',
                'attribute'      => 'name',
                'encodeLabel'    => false,
                'contentOptions' => ['style' => 'width: 150px;'],
                'headerOptions'  => ['style' => 'text-align: center; vertical-align: middle;'],
            ],
            // 'dt_create',
            // 'ts_update',
//
            [
                'class'          => 'yii\grid\ActionColumn',
                'contentOptions' => ['style' => 'width: 70px;'],
            ],
        ],
//        'options'=>['style'=>'max-width: 100px;']
    ]);
    ?>

</div>
<?php $this->endBlock(); ?>
<?php $this->beginBlock('sidebar'); ?>
<?= $this->render('@app/views/site/_sidebar') ?>
<?php $this->endBlock(); ?>