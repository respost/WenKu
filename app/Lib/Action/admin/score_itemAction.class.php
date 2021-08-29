<?php

class score_itemAction extends backendAction
{

    public function _initialize() {
        parent::_initialize();
        $this->_mod = D('score_item');
        $this->_cate_mod =D('score_item_cate');
    }

    public function _before_index() {
        //默认排序
        $this->sort = 'ordid';
        $this->order = 'ASC';

        $res = $this->_cate_mod->field('id,name')->select();
        $cate_list = array();
        foreach ($res as $val) {
            $cate_list[$val['id']] = $val['name'];
        }
        $this->assign('cate_list', $cate_list);
    }

    protected function _search() {
        $map = array();
        ($cate_id = $this->_request('cate_id', 'trim')) && $map['cate_id'] = array('eq', $cate_id);
        ($keyword = $this->_request('keyword', 'trim')) && $map['title'] = array('like', '%'.$keyword.'%');
        $this->assign('search', array(
            'keyword' => $keyword,
            'cate_id' => $cate_id,
        ));
        return $map;
    }

    public function _before_add() {
        $cate_list = $this->_cate_mod->field('id,name')->select();
        $this->assign('cate_list',$cate_list);
    }

    public function _before_edit() {
        $this->_before_add();
    }
   public function edit() {
        $mod = D('score_item');
		$pk = $mod->getPk();
		if (IS_POST) {
			if (false === $data = $mod->create()) {
				
				$this->error($mod->getError());
			}
		    
			$data = $this->_before_update($data);
				
			
			
			if (false !== $mod->save($data)) {
				
				
				
				$this->success(L('operation_success'));
			} else {
				
				$this->error(L('operation_failure'));
			}
		} else {
			$id = $this->_get($pk, 'intval');
			
			$info = $mod->find($id);
			 
			$this->assign('info', $info);
			$this->display();
			
		}
    }


    protected function _before_update($data) {
       
    	
    	$map['id']=$data['id'];
        $old_img = M('score_item')->where($map)->getField('img');
        $paths =C('mtceo_attach_path');
        $oldfile=str_replace('_s', '_b', $old_img);
        
       
        if($data['img']!=$old_img){
          @unlink($paths.'score_item/'.$old_img);
        @unlink($paths.'score_item/'. $oldfile);
    	}
    	
    	return $data;
    }

      public function ajax_upload_img() {
        //上传图片
        $time_dir = date('ym/d');
        if (!empty($_FILES['file']['name'])) {
            $result = $this->_upload($_FILES['file'], 'score_item/'.$time_dir, array(
                'width' => C('mtceo_score_item_img.swidth').','.C('mtceo_score_item_img.bwidth'),
                'height' => C('mtceo_score_item_img.sheight').','.C('mtceo_score_item_img.bheight'),
                'suffix' => '_s,_b',
                'remove_origin' => true
            ));
            if ($result['error']) {
            	$data['status']=0;
        	    $data['info']=$result['info'];
            	
               
            } else {
            	$ext = array_pop(explode('.', $result['info'][0]['savename']));
                $data['info'] = $time_dir .'/'. str_replace('.' . $ext, '_s.' . $ext, $result['info'][0]['savename']);
            	 $data['status']=1;
        	   
               
            }
        } else {
        	$data['status']=0;
        	$data['info']=L('illegal_parameters');
           
        }
        
        
        
        echo json_encode($data);
    }
}