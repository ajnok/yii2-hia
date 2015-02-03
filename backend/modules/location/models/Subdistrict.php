<?php

namespace backend\modules\location\models;

use Yii;

/**
 * This is the model class for table "subdistrict".
 *
 * @property integer $id
 * @property string $bot_code
 * @property string $dopa_code
 * @property string $thaitambon_code
 * @property string $name
 * @property string $note
 * @property string $dt_create
 * @property string $ts_update
 * @property integer $district_id
 *
 * @property District $district
 */
class Subdistrict extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'subdistrict';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['thaitambon_code', 'name', 'district_id'], 'required'],
            [['dt_create', 'ts_update'], 'safe'],
            [['district_id'], 'integer'],
            [['bot_code', 'dopa_code', 'thaitambon_code'], 'string', 'max' => 6],
            [['name'], 'string', 'max' => 20],
            [['note'], 'string', 'max' => 100],
            [['thaitambon_code'], 'unique'],
            [['bot_code', 'name'], 'unique', 'targetAttribute' => ['bot_code', 'name'], 'message' => 'The combination of รหัสตำบลอ้างอิงตามธปท. (ไม่จำเป็น) and ตำบล/แขวง has already been taken.'],
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
            'bot_code' => Yii::t('hia', 'รหัสตำบลอ้างอิงตามธปท. (ไม่จำเป็น)'),
            'dopa_code' => Yii::t('hia', 'รหัสตำบลอ้างอิงตามกรมการปกครอง (ไม่จำเป็น)'),
            'thaitambon_code' => Yii::t('hia', 'รหัสตำบลอ้างอิงตาม Thaitambon.com'),
            'name' => Yii::t('hia', 'ตำบล/แขวง'),
            'note' => Yii::t('hia', 'หมายเหตุ'),
            'dt_create' => Yii::t('hia', 'วันที่สร้าง'),
            'ts_update' => Yii::t('hia', 'วันที่ปรับปรุงล่าสุด'),
            'district_id' => Yii::t('hia', '(อ้างอิง) รหัสอ้างอิงอำเภอ'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDistrict()
    {
        return $this->hasOne(District::className(), ['id' => 'district_id']);
    }
}
