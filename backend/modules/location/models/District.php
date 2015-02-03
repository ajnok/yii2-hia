<?php

namespace backend\modules\location\models;

use Yii;

/**
 * This is the model class for table "district".
 *
 * @property integer $id
 * @property string $bot_code
 * @property string $dopa_code
 * @property string $name
 * @property string $note
 * @property string $dt_create
 * @property string $ts_update
 * @property integer $province_id
 *
 * @property Province $province
 * @property Subdistrict[] $subdistricts
 */
class District extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'district';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bot_code', 'dopa_code', 'name', 'province_id'], 'required'],
            [['dt_create', 'ts_update'], 'safe'],
            [['province_id'], 'integer'],
            [['bot_code', 'dopa_code'], 'string', 'max' => 6],
            [['name'], 'string', 'max' => 20],
            [['note'], 'string', 'max' => 100],
            [['bot_code', 'name'], 'unique', 'targetAttribute' => ['bot_code', 'name'], 'message' => 'The combination of รหัสอำเภออ้างอิงตามธปท. and อำเภอ/เขต has already been taken.'],
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
            'bot_code' => Yii::t('hia', 'รหัสอำเภออ้างอิงตามธปท.'),
            'dopa_code' => Yii::t('hia', 'รหัสอำเภออ้างอิงตามกรมการปกครอง'),
            'name' => Yii::t('hia', 'อำเภอ/เขต'),
            'note' => Yii::t('hia', 'หมายเหตุ'),
            'dt_create' => Yii::t('hia', 'วันที่สร้าง'),
            'ts_update' => Yii::t('hia', 'วันที่ปรับปรุงล่าสุด'),
            'province_id' => Yii::t('hia', '(อ้างอิง) รหัสอ้างอิงจังหวัด'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubdistricts()
    {
        return $this->hasMany(Subdistrict::className(), ['district_id' => 'id']);
    }
}
