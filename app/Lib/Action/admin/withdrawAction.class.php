<?php
class withdrawAction extends backendAction {
   public function _initialize()
    {
        parent::_initialize();
        $this->_mod = D('withdraw');
        
    }

    protected function _search() {
        $map = array();
        ($time_start = $this->_request('time_start', 'trim')) && $map['add_time'][] = array('egt', strtotime($time_start));
        ($time_end = $this->_request('time_end', 'trim')) && $map['add_time'][] = array('elt', strtotime($time_end)+(24*60*60-1));
        ($uname = $this->_request('uname', 'trim')) && $map['uname'] = array('like', '%'.$uname.'%');
       
        if( $_GET['status']==null ){
            $status = -1;
        }else{
            $status = intval($_GET['status']);
        }
        $status>=0 && $map['status'] = array('eq',$status);
        
        $this->assign('search', array(
            'time_start' => $time_start,
            'time_end' => $time_end,
            'uname' => $uname,
            'status' =>$status
            
        ));
        return $map;
    }
    
     protected function _before_update($data = '') {
     	//判断备注是否不为空，添加备注之后将代表已经将现金转入用户账户，这时发送提现成功通知，并将withdraw状态变为1
     }
   
}
?>