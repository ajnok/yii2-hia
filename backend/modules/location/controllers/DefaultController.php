<?php

namespace backend\modules\location\controllers;

use yii\web\Controller;
use backend\modules\location\models\Region;
use backend\modules\location\models\Province;
use backend\modules\location\models\District;
use backend\modules\location\models\Subdistrict;

class DefaultController extends Controller
{
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }
    public function actionIndex()
    {
        $region = new Region(['scenario'=>'list']);
        $province = new Province(['scenario'=>'list']);
        $district = new District(['scenario'=>'list']);
        $subdistrict = new Subdistrict(['scenario'=>'list']);
        
        return $this->render('index',[
            'region' => $region,
            'province' => $province,
            'district' => $district,
            'subdistrict' => $subdistrict,
        ]);
    }
}
