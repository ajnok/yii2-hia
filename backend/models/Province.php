<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "province".
 *
 * @property integer $id
 * @property string $bot_code
 * @property string $dopa_code
 * @property string $name
 * @property string $note
 * @property string $dt_create
 * @property string $ts_update
 * @property integer $region_id
 *
 * @property District[] $districts
 * @property Region $region
 */
class Province extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'province';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bot_code', 'dopa_code', 'name', 'region_id'], 'required'],
            [['dt_create', 'ts_update'], 'safe'],
            [['region_id'], 'integer'],
            [['bot_code', 'dopa_code'], 'string', 'max' => 6],
            [['name'], 'string', 'max' => 20],
            [['note'], 'string', 'max' => 100],
            [['bot_code', 'name'], 'unique', 'targetAttribute' => ['bot_code', 'name'], 'message' => 'The combination of รหัสจังหวัดอ้างอิงตามธปท. and จังหวัด has already been taken.'],
            [['name'], 'unique'],
            [['dopa_code'], 'unique'],
            [['bot_code'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('hia', 'รหัสอ้างอิง'),
            'bot_code' => Yii::t('hia', 'รหัสจังหวัดอ้างอิงตามธปท.'),
            'dopa_code' => Yii::t('hia', 'รหัสจังหวัดอ้างอิงตามกรมการปกครอง'),
            'name' => Yii::t('hia', 'จังหวัด'),
            'note' => Yii::t('hia', 'หมายเหตุ'),
            'dt_create' => Yii::t('hia', 'วันที่สร้าง'),
            'ts_update' => Yii::t('hia', 'วันที่ปรับปรุงล่าสุด'),
            'region_id' => Yii::t('hia', '(อ้างอิง) รหัสอ้างอิงภูมิภาค'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDistricts()
    {
        return $this->hasMany(District::className(), ['province_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRegion()
    {
        return $this->hasOne(Region::className(), ['id' => 'region_id']);
    }
}
