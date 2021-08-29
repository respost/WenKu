<?php
/**
 * 升级程序
 */
class updateAction extends backendAction {

	public function _initialize() {
		 parent::_initialize();
	}
function httpcopy($url, $file="", $timeout=60) {
    $file = empty($file) ? pathinfo($url,PATHINFO_BASENAME) : $file;
    $dir = pathinfo($file,PATHINFO_DIRNAME);
    !is_dir($dir) && @mkdir($dir,0755,true);
    $url = str_replace(" ","%20",$url);

    if(function_exists('curl_init')) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        $temp = curl_exec($ch);
        if(@file_put_contents($file, $temp) && !curl_error($ch)) {
            return $file;
        } else {
            return false;
        }
    } else {
        $opts = array(
            "http"=>array(
            "method"=>"GET",
            "header"=>"",
            "timeout"=>$timeout)
        );
        $context = stream_context_create($opts);
        if(@copy($url, $file, $context)) {
            //$http_response_header
            return $file;
        } else {
            return false;
        }
    }
}
	/**
	 * 安装协议
	 */
	public function index(){
		
		$url="http://www.mtceo.net/Public/update/upfile.zip";
		$down=new Http();
		$srcfile=MT_DATA_PATH.'/update/upfile.zip';
		
		//dump($srcfile);
	if (IS_POST) {
			$accept = $this->_post('accept');
			$verinfodata=$this->_post('verinfodata');
			F('verinfodata',$verinfodata);
			
			if ($accept) {
			$this->httpcopy($url,$srcfile);
				
				while(is_file($srcfile)){
			
			       
			        $this->redirect(U('update/stepindex'));
			
		    }
				
		}
		
		
		
		} else {
			$this->display();
		}
	}
    public function stepindex() {
		
		$this->display();
	}
    
  
    public function install() {
		
		$this->display();
	}
	

	/**
	 * 执行安装
	 */
	public function finish_done() {
		
		
		$dir_obj = new Dir;
		$srcfile=MT_DATA_PATH.'/update/upfile.zip';
		$archive = new PclZip($srcfile);
		
		
		
		
		//$dir_obj->copyDir($src,$dst);
		
		
		
		
		
		
		
		
		if(is_file($srcfile)){
			$list = $archive->extract(PCLZIP_OPT_SET_CHMOD, 0777,PCLZIP_OPT_PATH,MT_DATA_PATH.'/update/'); 
			
			
			if ($list != 0){
				
				
				$dir_obj->copyDir(MT_DATA_PATH.'/update/upfile/','./');
				$this->_show_process('文件覆盖成功');
				
			}
			
		}
		
		
		
		
		
		
		
		
		
		$charset = C('DEFAULT_CHARSET');
		header('Content-type:text/html;charset=' . $charset);
		$temp_info['db_host']=C('DB_HOST');
		$temp_info['db_port']=C('DB_PORT');
		
		$temp_info['db_user']=C('DB_USER');
		$temp_info['db_pass']=C('DB_PWD');
		$temp_info['db_prefix']=C('DB_PREFIX');
		$temp_info['db_name']=C('DB_NAME');
		
		
		
		$conn = mysql_connect($temp_info['db_host'] . ':' . $temp_info['db_port'], $temp_info['db_user'], $temp_info['db_pass']);
		$version = mysql_get_server_info();
		$charset = str_replace('-', '', $charset);
		if ($version > '4.1') {
			if ($charset != 'latin1') {
				mysql_query("SET character_set_connection={$charset}, character_set_results={$charset}, character_set_client=binary", $conn);
			}if ($version > '5.0.1') {
				mysql_query("SET sql_mode=''", $conn);
			}
		}
		$selected_db = mysql_select_db($temp_info['db_name'], $conn);
		//开始创建数据表
		$this->_show_process('开始增加数据表');
		$sqls = $this->_get_sql(MT_DATA_PATH.'/update/sql_data/create_table.sql');
		foreach ($sqls as $sql) {
			//替换前缀
			$sql = str_replace('`mt_', '`' . $temp_info['db_prefix'], $sql);
			//获得表名
			$run = mysql_query($sql, $conn);
			if (substr($sql, 0, 12) == 'CREATE TABLE') {
				$table_name = $temp_info['db_prefix'] . preg_replace("/CREATE TABLE `" . $temp_info['db_prefix'] . "([a-z0-9_]+)` .*/is", "\\1", $sql);
				$this->_show_process(sprintf('增加数据表成功', $table_name));
			}
		}
		
	//开始增加数据表的字段
		$this->_show_process('开始增加数据表的字段');
		$sqls = $this->_get_sql(MT_DATA_PATH.'/update/sql_data/alertdata.sql');
		foreach ($sqls as $sql) {
			//替换前缀
			$sql = str_replace('`mt_', '`' . $temp_info['db_prefix'], $sql);
			//获得表名
			$run = mysql_query($sql, $conn);
			if (substr($sql, 0, 11) == 'ALTER TABLE') {
				$table_name = $temp_info['db_prefix'] . preg_replace("/ALTER TABLE `" . $temp_info['db_prefix'] . "([a-z0-9_]+)` .*/is", "\\1", $sql);
				$this->_show_process(sprintf('插入字段成功', $table_name));
			}
		}
		
		
		
		
		
		//开始导入数据
		$this->_show_process('插入数据');
		$sqls = $this->_get_sql(MT_DATA_PATH.'/update/sql_data/initdata.sql');
	
		$weburl= $_SERVER["HTTP_HOST"];
		foreach ($sqls as $sql) {
			//替换前缀
			$sql = str_replace('`mt_', '`' . $temp_info['db_prefix'], $sql);
			$sql = str_replace('127.0.0.1', $weburl, $sql);
			//获得表名
			if (substr($sql, 0, 11) == 'INSERT INTO') {
				$table_name = $temp_info['db_prefix'] . preg_replace("/INSERT INTO `" . $temp_info['db_prefix'] . "([a-z0-9_]+)` .*/is", "\\1", $sql);
				$run = mysql_query($sql, $conn);
			}
		}
		$this->_show_process('数据表导入成功');
		//修改配置文件
		
	
		//安装完毕
		$this->_show_process('升级成功', 'parent.install_successed();');
		return false;
	}

	public function finish() {
		
		D('global')->where(array('name'=>'verinfo'))->setField('data',F('verinfodata'));
		
		$dir= new Dir();
		
		
		
		$dir->delDir(MT_DATA_PATH.'/update/');
		
		if(!is_dir(MT_DATA_PATH.'/update/')){
			
			mkdir(MT_DATA_PATH.'/update/');
			
		}
		
		
		
		//锁定程序
		//touch('./data/update.lock');
		$this->display();
	}

	/**
	 * 显示安装进程
	 */
	private function _show_process($msg, $script = '') {
		echo '<script type="text/javascript">parent.show_process(\'<p><span>' . $msg . '</span></p>\');' . $script . '</script>';
		/*flush();
		ob_flush();*/
	}

	

	private function _get_sql($sql_file) {
		$contents = file_get_contents($sql_file);
		$contents = str_replace("\r\n", "\n", $contents);
		$contents = trim(str_replace("\r", "\n", $contents));
		$return_items = $items = array();
		$items = explode(";\n", $contents);

		foreach ($items as $item) {
			$return_item = '';
			$item = trim($item);
			$lines = explode("\n", $item);
			foreach ($lines as $line) {
				if (isset($line[1]) && $line[0] . $line[1] == '--') {
					continue;
				}
				$return_item .= $line;
			}
			if ($return_item) {
				$return_items[] = $return_item; //.";";
			}
		}
		return $return_items;
	}

}