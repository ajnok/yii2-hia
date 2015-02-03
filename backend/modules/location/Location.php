<?php

namespace backend\modules\location;

class Location extends \yii\base\Module
{
    public $controllerNamespace = 'backend\modules\location\controllers';

    public function init()
    {
        parent::init();
        $this->layoutPath='@backend/views/layouts';
        $this->layout='column2';
        // custom initialization code goes here
    }
}
