<?php

use kartik\widgets\SideNav;

$heading = '<i class="glyphicon glyphicon-cog"></i> เมนู';
$type    = SideNav::TYPE_DEFAULT;
$item    = $this->context->id;
if (strlen($item) == 0) {
    $item = "site/index";
}
//var_dump($item);
$sideNav = SideNav::widget([
        'type'         => $type,
        'encodeLabels' => false,
        'heading'      => $heading,
        'items'        => [
            ['label' => 'ภูมิภาค/จังหวัด/อำเภอ/ตำบล', 'icon'  => 'globe', 'items' => [
                    ['label' => '<span class="pull-right badge">10</span> ภูมิภาค',
                        'url' => ['region/index'], 'active' => ($item == 'region')],
                   
                    
            ]],
        ],
    ]);

echo $sideNav;
?>