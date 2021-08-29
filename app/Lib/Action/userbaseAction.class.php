<?php
/**
 * 用户控制器基类
 *
 * @author andery
 */
class userbaseAction extends frontendAction {

    public function _initialize(){
        parent::_initialize();
        //访问者控制
        $seoconfig=$this->_config_seo(C('mtceo_seo_config.ucenter'));
        $this->assign('seoconfig',$seoconfig);
        
        
        if(MODULE_NAME == 'doc'){
       if (!$this->visitor->is_login && !in_array(ACTION_NAME, array('index', 'cont')))
       {
       	    IS_AJAX && $this->ajaxReturn(0, L('login_please'));
            $this->redirect('user/login');
       }
        }else{
        if (!$this->visitor->is_login && !in_array(ACTION_NAME, array('login', 'register', 'binding','uploadImg'))) {
            IS_AJAX && $this->ajaxReturn(0, L('login_please'));
            $this->redirect('user/login');
        }
        }
        
    }


    
}