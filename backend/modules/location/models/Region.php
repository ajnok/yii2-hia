<?php

namespace backend\modules\location\models;

use Yii;

/**
 * This is the model class for table "region".
 *
 * @property integer $id
 * @property string $bot_code
 * @property string $dopa_code
 * @property string $name
 * @property string $note
 * @property string $dt_create
 * @property string $ts_update
 *
 * @property Province[] $provinces
 */
class Region extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'region';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bot_code', 'name'], 'required'],
            [['dt_create', 'ts_update'], 'safe'],
            [['bot_code', 'dopa_code'], 'string', 'max' => 6],
            [['name'], 'string', 'max' => 20],
            [['note'], 'string', 'max' => 100],
            [['bot_code', 'name'], 'unique', 'targetAttribute' => ['bot_code', 'name'], 'message' => 'The combination of รหัสภูมิภาคอ้างอิงตามธปท. and ภาค has already been taken.'],
            [['name'], 'unique'],
            [['bot_code'], 'unique'],
            [['dopa_code'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('hia', 'รหัสอ้างอิง'),
            'bot_code' => Yii::t('hia', 'รหัสภูมิภาคอ้างอิงตามธปท.'),
            'dopa_code' => Yii::t('hia', 'รหัสภูมิภาคอ้างอิงตามกรมการปกครอง (ไม่จำเป็น)'),
            'name' => Yii::t('hia', 'ภาค'),
            'note' => Yii::t('hia', 'หมายเหตุ'),
            'dt_create' => Yii::t('hia', 'วันที่สร้าง'),
            'ts_update' => Yii::t('hia', 'วันที่ปรับปรุงล่าสุด'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProvinces()
    {
        return $this->hasMany(Province::className(), ['region_id' => 'id']);
    }
}
