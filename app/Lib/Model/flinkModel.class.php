<?php
class flinkModel extends RelationModel
{
    protected $_link = array(
        'flink_cate' => array(
            'mapping_type' => BELONGS_TO,
            'class_name' => 'flink_cate',
            'foreign_key' => 'cate_id',
            'mapping_fields'=> 'name',
        )
    );
    protected $_validate = array(
        array('name', 'require', '名称不能为空'), //不能为空
         array('cate_id', 'require', '请选择分类'), //不能为空
        array('name', '', '链接名称已经存在', 1, 'unique', 3), //检测重复
    );
    /**
     * 检测链接名称是否存在
     *
     * @param string $name
     * @param int $pid
     * @return bool
     */
    public function name_exists($name, $id=0)
    {
        $pk = $this->getPk();
        $where = "name='" . $name . "'  AND ". $pk ."<>'" . $id . "'";
        $result = $this->where($where)->count($pk);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }
}