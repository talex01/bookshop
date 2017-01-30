<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "books".
 *
 * @property integer $id
 * @property string $title
 * @property string $description
 * @property double $price
 * @property integer $author_fk_id
 * @property integer $category_fk_id
 * @property string $img_src
 */
class Books extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'books';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'description', 'price', 'author_fk_id', 'category_fk_id'], 'required'],
            [['title', 'description', 'img_src'], 'string'],
            [['price'], 'number'],
            [['author_fk_id', 'category_fk_id'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'description' => 'Description',
            'price' => 'Price',
            'author_fk_id' => 'Author Fk ID',
            'category_fk_id' => 'Category Fk ID',
            'img_src' => 'Img Src',
        ];
    }
}
