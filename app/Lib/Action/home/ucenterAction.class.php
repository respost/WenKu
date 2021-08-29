<?php
class ucenterAction extends userbaseAction{
	 

	public function _initialize() {
		parent::_initialize();
		global $userinfo;
		$userinfo= $this->visitor->info;
		
		
		$this->assign('uid',$userinfo['uid']);
		
		$userroleid=D('user')->where(array('uid'=>$userinfo['uid']))->getField('roleid');
		
        $isadmin=getisadmin($userroleid);
        $this->assign('isadmin',$isadmin);
		//dump(ACTION_NAME);
		$action=$this->_get('action','trim');

		if((ACTION_NAME=='setavatar') or (ACTION_NAME=='setmail') or (ACTION_NAME=='setpassword')){
		$actionname='index';
		}elseif(ACTION_NAME=='guanzhu'){
		$actionname='fensi';
		}elseif(ACTION_NAME=='mailmess'){
		$actionname='usermail';
		}else{
			$actionname=ACTION_NAME;
		}
		
		$this->assign('actionname',$actionname);
		
		$this->_mod1=D('doc_con');
		$hottag=D('tag')->order('count desc')->select();
    	$this->assign('hottag',$hottag);//热门标签
		
		
    	$tjdoc=tjdoc();
    	$this->assign('tjdoc',$tjdoc);//编辑推荐文档
    	


		$this->assign('action',$action);
	}
	public function index(){
		global $userinfo;
		$uid=$userinfo['uid'];
		$mod=D('userinfo');
		if (IS_POST) {
				
			if (false === $data = $mod->create()) {
				$this->ajaxReturn(0, $mod->getError());
				//$this->error($mod->getError());
			}
		 $birthday = $this->_post('birthday', 'trim');
		 if ($birthday) {
		 	$birthday = explode('-', $birthday);
		 	$data['byear'] = $birthday[0];
		 	$data['bmonth'] = $birthday[1];
		 	$data['bday'] = $birthday[2];
		 }
		 $data['uid']=$uid;
		 if($itemid=$mod->save($data)){
				//向user_msgtip中写入数据，用于提醒用户有新消息，数据写入不成功时不会提醒用户，但是消息已经发出

				$this->ajaxReturn(1, L('operation_success'));
				//$this->success(L('operation_success'));

			} else {
				$this->ajaxReturn(0, L('operation_failure'));
				//$this->error(L('operation_failure'));
			}
		} else {
				
				
		 $info=$mod->where(array('uid'=>$uid))->find();
		 //dump($info);
		 $this->assign('info',$info);
		 $this->display();
		}
	}

	public function xhdoclist(){
		global $userinfo;
		$uid=$userinfo['uid'];
	    $this->assign('uid',$uid);
		$this->display();
	}
    public function commentdoclist(){
    	
    	global $userinfo;
		
	    
	    
		
		
		$this->display();
    	
	}
    public function downdoclist(){
    	global $userinfo;
		$uid=$userinfo['uid'];
	    
	    
		
		
		
		$this->assign('uid',$uid);
    	
    	
		$this->display();
	}
    public function mydoclist(){
    	global $userinfo;
		$uid=$userinfo['uid'];
	    
	    
		
		
		
		$this->assign('uid',$uid);
    	$type=$this->_request('type','trim');
    	
    	$status=$type;
    	$this->assign('status',$status);
    	$this->assign('type',$type);
    	
    	
    	
    	
    	
    	
    	
		$this->display();
		
	}	
    public function tongji(){
    	global $userinfo;
		$uid=$userinfo['uid'];
		$info=D('user_scoresum')->where(array('uid'=>$uid))->find();
    	
		
		$info['system']=$info['login']+$info['register'];
		
    	$this->assign('info',$info);
    	$payment = D('Payment');
		$paymentmap['status'] = array('eq',1);
		
		$paymentdata = $payment->where($paymentmap)->select();
		
		
 		$this->assign('paymentdata',$paymentdata);
		$this->display();
	}
	

	
public function fb_topic(){
		global $userinfo;
		$uid=$userinfo['uid'];
		$mod=D('article');
		
		
		if(IS_POST){

		if (false === $data = $mod->create()) {
				IS_AJAX && $this->ajaxReturn(0, $mod->getError());
				$this->error($mod->getError());
			}
			$data['uid']=$uid;
			if( $mod->add($data) ){
				
				IS_AJAX && $this->ajaxReturn(1, L('operation_success'), '', 'add');
				$this->success(L('operation_success'));
			} else {
				IS_AJAX && $this->ajaxReturn(0, L('operation_failure'));
				$this->error(L('operation_failure'));
			}	
			
			
			
			
			
		}else{
		
		
		$this->display();
		}
	}
	public function guanzhu(){
		global $userinfo;
		$mod=D('focus');
		$uid=$userinfo['uid'];
		$map['uid']=$uid;

		$count=$mod->where($map)->count();
		$page=new Page($count,10);
		$show=$page->show();

		$data=$mod->where($map)->limit($page->firstRow.','.$page->listRows)->select();


		foreach($data as $key=>$value){
				
				
			
			$data[$key]['focusstatus']=getfocusstatus($uid,$value['focusuid']);
				
		}



		$this->assign('data',$data);
		$this->assign('page',$show);
		$this->display();
	}
	public function fensi(){
		global $userinfo;
		$mod=D('focus');
		$uid=$userinfo['uid'];
		$map['focusuid']=$uid;

		$count=$mod->where($map)->count();
		$page=new Page($count,10);
		$show=$page->show();

		$data=$mod->where($map)->limit($page->firstRow.','.$page->listRows)->select();
		foreach($data as $key=>$value){
				
				
			
			$data[$key]['focusstatus']=getfocusstatus($uid,$value['uid']);
			
				
		}

		$this->assign('data',$data);
		$this->assign('page',$show);
		$this->display();
	}
	public function addgz(){
	 global $userinfo;
	 $mod=M('focus');
	 $uid=$userinfo['uid'];
	 $focusuid = $this->_post('id','trim');
	 $data['uid']=$uid;
	 $data['focusuid']=$focusuid;

	 if($mod->add($data)){

	 	$this->ajaxReturn(1, L('operation_success'));
	 }else{

	 	$this->ajaxReturn(0, L('operation_failure'));
	 }
	}
	public function delgz(){
	 global $userinfo;
	 $mod=D('focus');
	 $uid=$userinfo['uid'];
	 $focusuid = $this->_post('id','trim');
	 $map['uid']=$uid;
	 $map['focusuid']=$focusuid;


	 if($mod->where($map)->delete()){

	 	$this->ajaxReturn(1, L('operation_success'));
	 }else{

	 	$this->ajaxReturn(0, L('operation_failure'));
	 }



	}

	/**
	 * 修改密码
	 */
	public function setpassword() {
		global $userinfo;
		$uid=$userinfo['uid'];
		if( IS_POST ){
			$oldpassword = $this->_post('oldpassword','trim');
			$password   = $this->_post('password','trim');
			$repassword = $this->_post('repassword','trim');

			!$oldpassword && $this->ajaxReturn(0, '必须输入原密码才能修改');
			!$password && $this->ajaxReturn(0, '未输入新密码');
			$password != $repassword && $this->ajaxReturn(0, '两次输入新密码不一致');
			$passlen = strlen($password);
			if ($passlen < 6 || $passlen > 20) {
				$this->ajaxReturn(0, '密码长度请保持在6~20位之间');
				 
			}
			//连接用户中心
			$passport = $this->_user_server();
			$result = $passport->edit($uid, $oldpassword, array('password'=>$password));
			if ($result) {
				 
				$this->ajaxReturn(1, L('edit_password_success'));
			} else {
				 
				$this->ajaxReturn(0, $passport->get_error());
			}

		}

		$this->display();
	}
/**
	 * 验证邮箱
	 */
	public function setmail() {
		global $userinfo;
		$uid=$userinfo['uid'];
		
		
		
		$sn = $this->_request('sn','trim');
		if($sn!=''){
			
			
			$url=U('ucenter/setmail');
			$time=intval(substr($sn, -10));
			$now=time();
			
			if(($now-$time)>60){
				$this->error('邮件已失效，请重新验证邮箱',$url);
			}else{
			
			if (md5($uid).$time==$sn) {
				D('bindmail')->where(array('uid'=>$uid))->setField('bind', 1);
				
				
				
				$this->success('验证成功',$url);
			} else {
				 
				$this->error('邮箱验证失败',$url);
			}
				
			}
			
			
			
			

		}else{
			 $info=D('user')->where(array('uid'=>$uid))->find();
       $bind=D('bindmail')->where(array('uid'=>$uid))->getField('bind');
       
       if($bind==''){
       	$data['uid']=$uid;
       	D('bindmail')->add($data);
       	$bind=0;
       }
       $yzsn=md5($uid).time();
		
		 $this->assign('bind',$bind);
		 $this->assign('yzsn',$yzsn);
       $this->assign('info',$info);
		$this->display();
			
		}
       // $email=D('user')->
      
	}
public function yzmail(){
	$yzsn = $this->_post('yzsn','trim');
	$email = $this->_post('email','trim');
	global $userinfo;
		$uid=$userinfo['uid'];
	
	
	if(D('user')->email_exists($email,$uid)){
		$this->ajaxReturn(0,'该邮箱已经被使用');
		
	}else{
		D('user')->where(array('uid'=>$uid))->setField('email', $email);
		$yzsn = U('ucenter/setmail',array('sn'=>$yzsn));
	
	 $this->_mail_queue($email, C('mtceo_site_name').'邮箱验证', $yzsn,'',$bool=true);
            
     $this->ajaxReturn(1,'邮件发送成功,60秒内有效');
	}
	
    
	
	
	
}
	public function setavatar(){
		global $userinfo;
		$uid=$userinfo['uid'];
		$attsize=byte_format(C('mtceo_attr_allow_size')*1024);
		$this->assign('uid',$uid);
		$this->assign('attsize',$attsize);
		
		
		
		
		
		$passport = $this->_user_server();
        $html = $passport->uc_avatar($uid);
		
		$this->assign('html', $html );
		//dump($html);
		$this->display();
	}
	//上传头像
	public function uploadImg(){
		
		global $userinfo;
		$uid=$userinfo['uid'];
		
		//$uid=$this->_request('uid','trim');
		$md5uid=md5($uid);
        
		
		$upload = new UploadFile();
		$upload = $this->_upload_init($upload);
		$upload->saveRule = 'myuid';
		$upload_path = C('mtceo_attach_path'). '/avatar/'.$uid.'/';
		$upload->savePath = $upload_path;
		$upload->uploadReplace = true;
		//$upload = new UploadFile();						// 实例化上传类
		//$upload->maxSize = 1*1024*1024;					//设置上传图片的大小
		//$upload->allowExts = array('jpg','png','gif');	//设置上传图片的后缀
		//$upload->uploadReplace = true;					//同名则替换
		//$upload->saveRule = 'avatar';					//设置上传头像命名规则(临时图片),修改了UploadFile上传类
		//完整的头像路径
		//$path = './avatar/';
		//$upload->savePath = $path;
		//$result = $this->_upload($_FILES['file'], 'avatar/temp/' );
		//$this->ajaxReturn(0,$_FILES['user-pic'],$result);

		if(!$upload->upload()) {						// 上传错误提示错误信息
			$this->ajaxReturn(0,$upload->savepath);//$upload->getErrorMsg());
		}else{
			// 上传成功 获取上传文件信息
			$info =  $upload->getUploadFileInfo();
				
			$temp_size = getimagesize($upload_path.$md5uid.'.'.$info[0]['extension']);
		if($temp_size[0] < 120 || $temp_size[1] < 120){//判断宽和高是否符合头像要求
				$this->ajaxReturn(0,'图像宽或高小于120px，不适合做头像');
			}
			$this->ajaxReturn(1,$upload_path.$md5uid.'.'.$info[0]['extension']);
		}




	}
	//裁剪并保存用户头像
	public function cropImg(){
		//图片裁剪数据
		//global $userinfo;
		//$userinfo= $this->visitor->info;
		global $userinfo;
		$uid=$userinfo['uid'];
		//$uid=$this->_request('uid','trim');
		$md5uid=md5($uid);
		$params = $this->_post();						//裁剪参数
		if(!isset($params) && empty($params)){
			return;
		}
		$path = C('mtceo_attach_path'). '/avatar/'.$uid.'/';
		//头像目录地址
		//$path = './avatar/';
		//要保存的图片
		$real_path = $path.'avatar.jpg';
		$real_path1 = $path.$md5uid.'_big.jpg';
		//临时图片地址
		$pic_path = $params['src'];//$path.$md5uid.'.jpg';
		import('ORG.ThinkImage.ThinkImage');
		$Think_img = new ThinkImage(THINKIMAGE_GD);
		//裁剪原图
		$Think_img->open($pic_path)->save($real_path1);
		$Think_img->open($pic_path)->crop($params['w'],$params['h'],$params['x'],$params['y'])->save($real_path);
		//生成缩略图
		//$Think_img->open($real_path)->thumb(160,160, 1)->save($path.$md5uid.'_big.jpg');
		$Think_img->open($real_path)->thumb(120,120, 1)->save($path.$md5uid.'_120.jpg');
		$Think_img->open($real_path)->thumb(48,48, 1)->save($path.$md5uid.'_48.jpg');

		@unlink($real_path);
		@unlink($pic_path);
		$this->success('上传头像成功');
	}


	public function pay(){
		global $userinfo;
		$uid=$userinfo['uid'];
        $payment = D('Payment');
        $data = Init_GP(array('cash','payid'));
        $cash = toPrice(GetNum($data['cash']),0);
	    if($cash <= 0 || $cash != $data['cash']){
			$this->error('请输入有效金额');
		}
        $paymentmap = array(
 				'mark'=>array('eq',$data['payid']),
 				'status'=>array('eq',1),
			);
		$paymentdata = $payment->where($paymentmap)->find();
	    if(empty($paymentdata)){
				$this->error('请选择支付方式');
			}else{
				$import_status = import("@.ORG.{$paymentdata['mark']}");
				if($import_status){
					$pay = new $paymentdata['mark']($paymentdata);
				}else{
					$this->error('支付方式不存在');
				}
				$paytype = $paymentdata['name'];
		}
		
		$recharge = D('Recharge');
 		$rechargedata = array(
 			'sn'=>$recharge->produceSn(),
 			'uid'=>$uid,
 		    'uname'=>getusername($uid),
 			'score'=>$cash*C('mtceo_score_pay.getscore'),
 			'cash'=>$cash,
 			'bank_id'=>$paytype,
 			'add_time'=>time(),
 		);
 		$rid = $recharge->add($rechargedata);
 		if($rid){
 			
 		
 			
 			$html= $pay->_payto($rechargedata,$data['paybank']);
 			//$html_text = $alipaySubmit->buildRequestForm($parameter,"post", "确认");
 			
 			$html=$html."<script>";
 			$html=$html."$(function(){";
 			$html=$html."$('#paysubmit').submit();";
 			
 			$url=U('ucenter/tongji');
 			
 			$html=$html."window.location.href='".$url."';";
 			$html=$html."});";
 			$html=$html."</script>";
 			
 			
 			
 			
 			
 			
 			
 			//dump($html);
 			$this->assign('form',$html); 
 			//echo $html;
 			
 			
 			
 			$this->display();
 			 
 			 
 		}else{
 			$this->error('支付失败');
 		} 		
		
		

		
	}

	 


	public function usermail(){
		global $userinfo;
		$mod = D('user_mail');
		// $map['pb']=0;//不显示已屏蔽消息但是必须toid为自己
		// $map2['toid']=$userinfo['uid'];
		// $map2['pb']=0;
		$map['_string']='(pb=0 AND re_id=0) OR (pb=1 AND re_id=0 AND fromid='.$userinfo['uid'].')';
		//$map['re_id']=0;//回复的信息不单独显示
		$data=$this->_list(1,$mod, $map);
		 
		$map1['new']=1;
		$map1['toid']= $userinfo['uid'];
		$idlist=$mod->where($map1)->getField('re_id',true);

		foreach($data['list'] as $key1=>$value1)
		{
			foreach($idlist as $key =>$value){
				if($value==$value1['id']){
					$data['list'][$key]['renew']=1;
				}

			}
		}
		//  dump($data);




		$this->assign('data',$data);
		$this->assign('uid',$userinfo['uid']);

		$this->display();
	}
	public function pbitem(){//屏蔽别人的消息
		global $userinfo;
		$mod = D('user_mail');
		$id=$this->_request('id','trim');
		$map['id']=$id;
		if($mod->where($map)->setField('pb',1)>0){
			$this->ajaxReturn(1, L('operation_success'));
		}else{
			IS_AJAX && $this->ajaxReturn(0, L('operation_failure'));
		}
		 
	}
	public function mailmess(){//消息内容
		global $userinfo;
		$id=$this->_request('id','trim');
		 
		 

		$mod=D('user_mail');
		 
		$map['id']=$id;
		$data1=$mod->where($map)->find();
		 
		$map1['re_id']=$id;
		$map1['toid']=$userinfo['uid'];
		$mod->where($map1)->setField('new',0); //点击进入消息内容，则删除相关的信息提示，去掉new这个标志
		$map2['id']=$id;
		$map2['toid']=$userinfo['uid'];
		$mod->where($map2)->setField('new',0); //点击进入消息内容，则删除相关的信息提示，去掉new这个标志
		 
		 
		$map['re_id']=$id;
		$map['_logic']='OR';
		 
		 
		 
		//$count=$mod->where($map)->count();
		//$page=new Page($count,10);
		//$show=$page->show();
		//$data=$mod->where($map)->order('add_time desc')->limit($page->firstRow.','.$page->listRows)->select();
		 
		$list=$this->_list(0,$mod, $map, 'add_time', 'desc');
		 
		// $data=$mod->where($map)->order('add_time desc')->select();
		 
		 
		 
		if($userinfo['uid']==$data1['toid']){$toid=$data1['fromid'];}else{$toid=$data1['toid'];}
		//dump($list);
		$this->assign('data',$list['list']);
		$this->assign('page',$list['page']);
		$this->assign('data1',$data1);
		$this->assign('uid',$userinfo['uid']);
		$this->assign('toid',$toid);
		$this->display();
	}
	public function mail_del(){//删除消息
		global $userinfo;
		$mod=D('user_mail');
		 
		//删除消息的同时 根据itemid删除屏蔽数据库中的数据
		 
		$ids = trim($this->_request('id'), ',');
		if ($ids){
			 

			$idarr=split(',',$ids);
			//找到所有id和re_id等于id的数据，然后删除
			 
			$map['re_id']=array('in',$idarr);
			$map['id']=array('in',$idarr);
			$map['_logic']='OR';
			if(false !== $mod->where($map)->delete())
			{





				IS_AJAX && $this->ajaxReturn(1, L('operation_success'));
			}else{
				IS_AJAX && $this->ajaxReturn(0, L('operation_failure'));
			}
		}
		 
		 

	}
	public function mail_send(){
		 
		$mod=D('user_mail');
		global $userinfo;

		$uid=$this->_request('uid', 'trim');
		$reid=$this->_request('reid', 'trim');

		$this->assign('uid',$uid);

		$this->assign('reid',$reid);
		$this->assign('fromid',$userinfo['uid']);
		//前台全部是私信，后台才能发布公共信息所以user_msgtip的type都为1，is_sys取默认值0，即为私信
		if (IS_POST) {
				
			if (false === $data = $mod->create()) {
				IS_AJAX && $this->ajaxReturn(0, $mod->getError());
				$this->error($mod->getError());
			}
			 
			if($itemid=$mod->add($data)){
				//向user_msgtip中写入数据，用于提醒用户有新消息，数据写入不成功时不会提醒用户，但是消息已经发出

				IS_AJAX && $this->ajaxReturn(1, L('operation_success'), '', 'add');
				$this->success(L('operation_success'));

			} else {
				//L('operation_failure');
				IS_AJAX && $this->ajaxReturn(0, L('operation_failure'));
				$this->error(L('operation_failure'));
			}
		} else {
			if (IS_AJAX) {
				$response = $this->fetch();

				$this->ajaxReturn(1, $type, $response);
			} else {
					
				$this->display();
			}
		}
	}

}