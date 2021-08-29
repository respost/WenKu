<?php
/*
www.mtceo.net
MTCEO
QQ:176314141
*/

class commonAction extends frontendAction {
	
     public function _initialize() {
        parent::_initialize();
       
        global $userinfo;
        $userinfo=$this->visitor->info;
              
	 }
//验证码结束，收藏等各类点击功能效果操作开始
	public function operate(){
		
		global $userinfo;
		$data['itemid']=$this->_request('id','intval');
		$data['typeid']=$this->_request('typeid','intval');
		$data['type']=$this->_request('type','intval');
		
		$num=D('itemlog')->where($data)->count()+1;
		
		
		
		$data['uid']=$userinfo['uid'];
		
		
		if($data['uid']<=0||$data['uid']==''){
			
			$this->ajaxReturn(0,'您还未登陆或者注册');
		}
		
		
		switch($data['type'])
		{
			case 2:
				$msg='收藏成功';
				$msgerror='收藏失败';
				break;
			case 1:
				$msg='下载成功';
				$msgerror='下载失败';
				break;
			case 3:
				$msg='推荐成功';
				$msgerror='推荐失败';
				break;
			default:
				break;
		}
		
		
		
		if(false === D('itemlog')->add($data))
		{
			$this->ajaxReturn(0,$msgerror);
		}else{
			
			$this->ajaxReturn(1,$msg,$num);
		}
		
		
	}
	
	public function deloperate(){
		
		global $userinfo;
		$data['itemid']=$this->_request('id','intval');
		$data['typeid']=$this->_request('typeid','intval');
		$data['type']=$this->_request('type','intval');
		$data['uid']=$userinfo['uid'];
		if(false === D('itemlog')->delete($data))
		{
			$this->ajaxReturn(0,'删除失败');
		}else{
			
			$this->ajaxReturn(1,'删除成功');
		}
		
		
	}
	
	
	
	public function youyong(){
		
		
		$map['id']=$this->_request('id','intval');
		
		
		
		
		if(cookie('youyong')==1){
			
			
			$data['status']=0;
			$data['msg']='您已经进行过该操作了！';
			
			//$this->ajaxReturn(0,'您已经进行过该操作了！');
			
		}else{
		if(false == D('comment')->where($map)->setInc('youyong',1))
		{
			$data['status']=0;
			$data['msg']='操作失败';
			//$this->ajaxReturn(0,'操作失败');
		}else{
			cookie('youyong','1');
			$data['status']=1;
			$data['msg']='操作成功';
			//$this->ajaxReturn(1,'操作成功');
		}
		}
		
		
		echo json_encode($data);
		
		
		
	}
	
	
         //验证码开始
	public function code(){
	
	$image=new Image();
	
	$height=30;
    $image->buildImageVerify($length=4, $mode=1, $type='png', $width=50,$height=25,$verifyName='captcha');
	
	
	}
/**
     * ajax获取标签
     */
    public function ajax_gettags() {
        $title = $this->_get('title', 'trim');
        if ($title) {
            $tags = D('tag')->get_tags_by_title($title);
            $tags = implode(' ', $tags);
            $this->ajaxReturn(1, L('operation_success'), $tags);
        } else {
            $this->ajaxReturn(0, L('operation_failure'));
        }
    }
	
	  //评论开始
  public  function comment($id,$typeid){
  $mod=D('comment');
  
  $map['itemid']=$id;
  $map['typeid']=$typeid;
  $data=$this->_list(0, $mod, $map, '','','',4);
  $commentlist=$data['list'];
  foreach($commentlist as $key =>$value){
  	
  	if($value['toid']>0){
  		$map['id']=$value['toid'];
  		$sub=$mod->where($map)->find();
  		$commentlist[$key]['subinfo']=$sub['info'];
  		$commentlist[$key]['subid']=$sub['commentid'];
  	}
  	
  }
  
  $data['list']=$commentlist;
  
  return $data;
}
  public function add_comment(){
  	$mod=D('comment');
  	//echo json_encode($data);
  	//$this->ajaxReturn(0, $mod->getError());
  if (false === $data = $mod->create()) {
  		$result['status']=0;
  	    $result['msg']=$mod->getError();
	}else{
		
	     
	      $data['info']=$this->_request('info');
		
		$data['info']=kindcode( $data['info']);
		
		
		
		$data['commentid']=$data['commentid']+1;
		
		if($data['uid'] == null){
		        $result['status']=1;
  	            $result['msg']='您还未登陆';
		
		}elseif($data['info']==null){
			 $result['status']=0;
  	         $result['msg']='评论为空';
			
		}else{
		
		
	if( $mod->add($data) ){
				$result['status']=1;
  	            $result['msg']='感谢您的评论';
			} else {
				$result['status']=1;
  	            $result['msg']='评论失败';
			}
		
		}
		
		
		
		
	}
	
  	 echo json_encode($result);

  }
 public function ajaxadd_comment(){
  	$mod=D('comment');
  	//echo json_encode($data);
  	//$this->ajaxReturn(0, $mod->getError());
  if (false === $data = $mod->create()) {
  		
  	    IS_AJAX && $this->ajaxReturn(0, $mod->getError());
	}else{
		
	      $data['info']=$this->_request('info');
		
		$data['info']=kindcode( $data['info']);
		
		$data['commentid']=$data['commentid']+1;
		
		if($data['uid'] == null){
		      IS_AJAX && $this->ajaxReturn(0, '您还未登陆');
		
		}elseif($data['info']==null){
			IS_AJAX && $this->ajaxReturn(0, '评论内容为空');
			
		}else{
		
		
	if( $mod->add($data) ){
				IS_AJAX && $this->ajaxReturn(1, '感谢您的评论', '', 'mycomment');
			} else {
				
				IS_AJAX && $this->ajaxReturn(0, '添加评论失败');
			}
		
		}
		
		
		
		
	}
	
  	 

  }
	//评论结束,读取表情配置信息
	public function emot($theme){
		
		
		$public_path=C('PUBLIC_PATH');
		$emot_dir = $public_path.'images/emot/';
		
        $info = include_once($emot_dir . $theme . '/info.php');
        return $info ;
		
		
	}
	
   /**
     * ajax检测会员是否存在
     */
    public function ajax_check_name() {
        $name = $this->_get('username', 'trim');
        $id = $this->_get('id', 'intval');
        
        if (D('user')->name_exists($name,  $id)) {
            $this->ajaxReturn(0, '该会员已经存在');
        } else {
            $this->ajaxReturn();
        }
    }

    /**
     * ajax检测邮箱是否存在
     */
    public function ajax_check_email() {
        $name = $this->_get('email', 'trim');
        $id = $this->_get('id', 'intval');
        if (D('user')->email_exists($name,  $id)) {
            $this->ajaxReturn(0, '该邮箱已经存在');
        } else {
            $this->ajaxReturn();
        }
    }
	
   
 public function ajax_check_title() {
        $title = $this->_get('title', 'trim');
        $id = $this->_get('id', 'intval');
        if (D('doc_con')->title_exists($title,  $id)) {
            $this->ajaxReturn(0, '该标题已经存在');
        } else {
            $this->ajaxReturn();
        }
    }
	
	
	
	
	
}
