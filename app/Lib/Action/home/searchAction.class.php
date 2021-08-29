<?php
/*
www.mtceo.net
MTCEO
QQ:176314141
*/

class searchAction extends frontendAction {
	
     public function _initialize() {
        parent::_initialize();
       
        global $userinfo;
        $userinfo=$this->visitor->info;
        global $searchword;
        $searchword1=$this->_request('searchword',trim);
        $searchword=urlencode($searchword1);
        $this->assign('searchword',$searchword1);    
        $seoconfig=$this->_config_seo(C('mtceo_seo_config.search'));
        
        $seoconfig['title']=$searchword1.'-'.$seoconfig['title'];
        
		$this->assign('seoconfig',$seoconfig);  
	 }
    protected function _search() {
        
        $lm = $this->_request('lm', 'intval');
        $score = $this->_request('score', 'intval');
        $time = $this->_request('time', 'intval');
         $this->assign('search', array(
           'lm' => $lm,
            'time' => $time,
            'score' => $score,
        ));
        if($lm){
        	
        	
        	switch ($lm){
        		
        		case 1:
        			$ext='doc,docx,wps';
        			break;
        		case 2:
        			$ext='pdf';
        			break;
        		case 3:
        			$ext='ppt,pptx,dpt';
        			break;
        		case 4:
        			$ext='xls,xlsx,et';
        			break;
        		case 5:
        			$ext='txt';
        			break;
        		default:
        			break;
        		
        		
        		
        		
        	}
        	
        	
        	
        	
        }
      
        if($score==1){
        $maxscore=0;
        
        }elseif($score==2){
        $minscore=1;
        
        }
        
       $this->assign('ext',$ext);
        $this->assign('day',$time);
       
        $this->assign('minscore',$minscore);
        $this->assign('maxscore',$maxscore);
        
        return $data;
    
    }
	 
	 
     public function index(){
     
    	$mod1=D('doc_con');
    	$data = $this->_search();
    	
    	
    	global $searchword;
    	
    	
    	if($searchword ==''){
    		
    		$this->error('请输入查询关键字');
    		
    	}
    	$searchword=urldecode($searchword);
     	
       
       
       	
       	
    	//dump($searchword);
    	//$where['title']=array('like','%'.$searchword.'%');
    	//$where['tags']=array('like','%'.$searchword.'%');
    	//$where['_logic']='or';
    	//$map['_complex'] = $where;
    	
    	//dump($map);
       /* $doclist=$this->_list(0, $mod1, $map,'add_time','desc');
    	foreach ($doclist['list'] as $key =>$value){
    			 	
    			 	$doclist['list'][$key]['comcount']=comcount($value['id'],1);
    			 
         }
    	
        
        $this->assign('doclist',$doclist);*/
    	
    	
    	$this->assign('data',$data);
		$this->display();
	
     }
	
}
