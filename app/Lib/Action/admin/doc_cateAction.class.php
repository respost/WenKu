<?php
class doc_cateAction extends backendAction {
    public function _initialize() {
        parent::_initialize();
        $this->_mod = D('doc_cate');
    }

    public function index() {
        $sort = $this->_request("sort", 'trim', 'ordid');
        $order = $this->_request("order", 'trim', 'ASC');
        $tree = new Tree();
        $tree->icon = array('│ ','├─ ','└─ ');
        $tree->nbsp = '&nbsp;&nbsp;&nbsp;';
        $result = $this->_mod->order($sort . ' ' . $order)->select();
        $array = array();
        foreach($result as $r) {
           $r['str_img'] = $r['img'] ? '<div class="img_border"><img src="'.attach($r['img'], 'doc_cate').'" width="26" height="26" class="J_preview" data-bimg="'.attach($r['img'], 'doc_cate').'"/></div>' : '';
            $r['str_status'] = '<img data-tdtype="toggle" data-id="'.$r['id'].'" data-field="status" data-value="'.$r['status'].'" src="__PUBLIC__/images/admin/toggle_' . ($r['status'] == 0 ? 'disabled' : 'enabled') . '.gif" />';
            $r['str_manage'] = '<a href="javascript:;" class="J_showdialog" data-uri="'.U('doc_cate/add',array('pid'=>$r['id'])).'" data-title="添加分类" data-id="add" data-width="500" data-height="360">'.L('add_article_subcate').'</a> |
                                <a href="javascript:;" class="J_showdialog" data-uri="'.U('doc_cate/edit',array('id'=>$r['id'])).'" data-title="'.L('edit').' - '. $r['name'] .'" data-id="edit" data-width="500" data-height="360">'.L('edit').'</a> |
                                <a href="javascript:;" data-acttype="ajax" class="J_confirmurl" data-uri="'.U('doc_cate/delete',array('id'=>$r['id'])).'" data-msg="'.sprintf(L('confirm_delete_one'),$r['name']).'">'.L('delete').'</a>';
            $r['parentid_node'] = ($r['pid'])? ' class="child-of-node-'.$r['pid'].'"' : '';
           
            $array[] = $r;
        }
        $str  = "<tr id='node-\$id' \$parentid_node>
                <td align='center'><input type='checkbox' value='\$id' class='J_checkitem'></td>
                <td>\$spacer<span data-tdtype='edit' data-field='name' data-id='\$id' class='tdedit'>\$name</span></td>
                <td align='center'>\$id</td>
                
                <td align='center'>\$str_img</td>
                <td align='center'><span data-tdtype='edit' data-field='ordid' data-id='\$id' class='tdedit'>\$ordid</span></td>

                <td align='center'>\$str_status</td>
                <td align='center'>\$str_manage</td>
                </tr>";
        $tree->init($array);
        $list = $tree->get_tree(0, $str);
        $this->assign('list', $list);
        //bigmenu (标题，地址，弹窗ID，宽，高)
        $big_menu = array(
            'title' => '添加分类',
            'iframe' => U('doc_cate/add'),
            'id' => 'add',
            'width' => '500',
            'height' => 'auto'
        );
        $this->assign('big_menu', $big_menu);
        $this->assign('list_table', true);
        $this->display();
    }

    /**
     * 添加子菜单上级默认选中本栏目
     */
    public function _before_add() {
        $pid = $this->_get('pid', 'intval', 0);
        if ($pid) {
            $spid = $this->_mod->where(array('id'=>$pid))->getField('spid');
            $spid = $spid ? $spid.$pid : $pid;
            $this->assign('spid', $spid);
        }
        
        
        
        
    }

    /**
     * 入库数据整理
     */
    protected function _before_insert($data = '') {
        //检测分类是否存在
        if($this->_mod->name_exists($data['name'], $data['pid'])){
            $this->ajaxReturn(0, '分类名称已经存在');
        }
        //生成spid
        $data['spid'] = $this->_mod->get_spid($data['pid']);
       if($data['spid']==0){
       	$data['spid']='0|';
       }
       if( substr_count($data['spid'], "|")==3){
       	
       	
       	 $data['spid']='maxcate';
       
       	
       }
        
       	return $data;
       	
      
        
        
        
    }

    /**
     * 修改提交对数据
     */
    protected function _before_update($data = '') {
        if ($this->_mod->name_exists($data['name'], $data['pid'], $data['id'])) {
            $this->ajaxReturn(0, '分类名称已经存在');
        }
        $old_pid = $this->_mod->field('img,pid')->where(array('id'=>$data['id']))->find();
        $paths =C('mtceo_attach_path');
        $oldfile=str_replace('_thumb', '', $old_pid['img']);
        if($data['img']!=$old_pid['img']){
        @unlink($paths.'doc_cate/'.$old_pid['img']);
        @unlink($paths.'doc_cate/'. $oldfile);
    	}
       
        if ($data['pid'] != $old_pid['pid']) {
            //不能把自己放到自己或者自己的子目录们下面
            $wp_spid_arr = $this->_mod->get_child_ids($data['id'], true);
            if (in_array($data['pid'], $wp_spid_arr)) {
                $this->ajaxReturn(0, L('cannot_move_to_child'));
            }
            //重新生成spid
            $data['spid'] = $this->_mod->get_spid($data['pid']);
        }
        return $data;
    }

    public function ajax_upload_img() {
        //上传图片
        if (!empty($_FILES['file']['name'])) {
            $result = $this->_upload($_FILES['file'], 'doc_cate', array('width'=>'80', 'height'=>'80'));
            if ($result['error']) {
            	$data['status']=0;
        	    $data['info']=$result['info'];
            	
               
            } else {
                $ext = array_pop(explode('.', $result['info'][0]['savename']));
                $data['info'] = str_replace('.' . $ext, '_thumb.' . $ext, $result['info'][0]['savename']);
                $data['status']=1;
        	   
               
            }
        } else {
        	$data['status']=0;
        	$data['info']=L('illegal_parameters');
           
        }
        
        
        
        echo json_encode($data);
    }

    public function ajax_getchilds() {
        $id = $this->_get('id', 'intval');
        $return = $this->_mod->field('id,name')->where(array('pid'=>$id))->select();
        if ($return) {
            $this->ajaxReturn(1, L('operation_success'), $return);
        } else {
            $this->ajaxReturn(0, L('operation_failure'));
        }
    }
}