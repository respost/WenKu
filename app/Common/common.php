<?php
function getsearchtitle($searchword, $title)
{
    $searcharr = explode(' ', $searchword);
    delete_empty($searcharr);
    foreach ($searcharr as $key => $value) {
        $title = str_replace($value, '<font color=red><b>' . $value . '</b></font>', $title);
    }
    return $title;

}


function delete_empty(& $arr, $trim = true)
{
    foreach ($arr as $key => $value) {
        if (is_array($value)) {
            delete_empty($arr[$key]);
        } else {
            $value = trim($value);
            if ($value == '') {
                unset($arr[$key]);
            } elseif ($trim) {
                $arr[$key] = $value;
            }
        }
    }
}

function kindcode($text)
{
    $text = str_replace('&gt;', '>', $text);
    $text = str_replace('&lt;', '<', $text);
    $text = str_replace('&quot;', '"', $text);
    return $text;
}


function getmodint($id)
{
    $data = $id / 2;
    return $data;
}

function getnavlist($cateid)
{
    $selfname = getcatename('doc', $cateid);
    $spid = D('doc_cate')->where(array('id' => $cateid))->getField('spid');
    if ($spid) {
        $count = substr_count($spid, '|');
        if ($count == 2) {
            $pid = D('doc_cate')->where(array('id' => $cateid))->getField('pid');//得到第二级的分类id
            $data['tname'] = getcatename('doc', $pid);
            $data['tid'] = $pid;
            $data['thname'] = $selfname;
            $data['thid'] = $cateid;
            $firstid = D('doc_cate')->where(array('id' => $pid))->getField('pid');//得到第1级的分类id
            $data['fname'] = getcatename('doc', $firstid);
            $data['fid'] = $firstid;
            $data['count'] = 3;
            $data['furl'] = U('doc/doclist', array('id' => $data['fid']));
            $data['turl'] = U('doc/doclist', array('id' => $data['tid']));
            $data['thurl'] = U('doc/doclist', array('id' => $data['thid']));
            $html = '<a href="' . $data['furl'] . '">' . $data['fname'] . '</a><em class="bgcur"></em><a href="' . $data['turl'] . '">' . $data['tname'] . '</a><em class="bgcur"></em><a href="' . $data['thurl'] . '">' . $data['thname'] . '</a><em class="bgcur"></em>';

        } else {
            $pid = D('doc_cate')->where(array('id' => $cateid))->getField('pid');
            $data['fname'] = getcatename('doc', $pid);
            $data['fid'] = $pid;
            $data['tname'] = $selfname;
            $data['tid'] = $cateid;
            $data['count'] = 2;
            $data['furl'] = U('doc/doclist', array('id' => $data['fid']));
            $data['turl'] = U('doc/doclist', array('id' => $data['tid']));
            $html = '<a href="' . $data['furl'] . '">' . $data['fname'] . '</a><em class="bgcur"></em><a href="' . $data['turl'] . '">' . $data['tname'] . '</a>';
        }
    } else {
        $data['count'] = 1;
        $data['fname'] = $selfname;
        $data['fid'] = $cateid;
        $data['furl'] = U('doc/doclist', array('id' => $data['fid']));
        $html = '<a href="' . $data['furl'] . '">' . $data['fname'] . '</a>';
    }
    return $html;
}

function getcateallid($id)
{
    if ($id == 0) {
        $idarr = D('doc_cate')->getField('id', true);
    } else {
        $spid = $id . '|';
        $map['spid'] = array('like', $spid . '%');
        $idarr = D('doc_cate')->where($map)->getField('id', true);
        if ($idarr == null) {
            $idarr = $id;
        } else {
            array_push($idarr, $id);
        }
    }
    return $idarr;
}


function randstr($len = 6)
{
    $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    // characters to build the password from
    mt_srand((double)microtime() * 1000000 * getmypid());
    // seed the random number generater (must be done)
    $password = '';
    while (strlen($password) < $len)
        $password .= substr($chars, (mt_rand() % strlen($chars)), 1);
    return $password;
}

function jiemi($str)
{
    $aa = chunk_split($str, 8, ';');
    $array = explode(';', $aa);
    array_pop($array);
    $data = '';
    foreach ($array as $key => $value) {
        $data .= substr($value, 0, 6);
    }
    $data = base64_decode($data);
    return $data;
}

function jiami($str)
{
    $aa2 = base64_encode($str);
    $aa3 = chunk_split($aa2, 6, ';');
    $array1 = explode(';', $aa3);
    array_pop($array1);
    foreach ($array1 as $key => $value) {
        //$array.=substr($value,0,6);
        if (strlen($value) == 6) {
            $array1[$key] = $value . randstr(2);
        }
    }
    $data = implode($array1);
    return $data;
}


/*增加和减少用户积分
 * $add为1表示增加，0表示减少
 * scoretype表示操作字段
 * 
 * 
 * */

function opuserscore($uid, $add, $scoretype, $score)
{
    if (is_array($uid)) {
        $map['uid'] = array('in', $uid);
        foreach ($uid as $key => $value) {
            $map1['uid'] = $value;
            if (D('user_scoresum')->where($map1)->find() == null) {
                D('user_scoresum')->add($map1);
            }
        }
    } else {
        $map['uid'] = $uid;
        if (D('user_scoresum')->where($map)->find() == null) {
            D('user_scoresum')->add($map);
        }
    }

    if ($add) {
        if (D('user_scoresum')->where($map)->setInc($scoretype, $score)) {
            return 1;
        } else {
            return 0;
        }
    } else {
        if (D('user_scoresum')->where($map)->setDec($scoretype, $score)) {
            return 1;
        } else {
            return 0;
        }
    }

}

function gettagname($tagid)
{
    $map['id'] = $tagid;
    $data = D('tag')->where($map)->getField('name');
    return $data;
}


function myuid()
{
    global $userinfo;
    $uid = $userinfo['uid'];
    return md5($uid);
}

function create_password($pw_length = 8)
{
    $randpwd = '';
    for ($i = 0; $i < $pw_length; $i++) {
        $randpwd .= chr(mt_rand(33, 126));
    }
    return $randpwd;
}


function Char_cv($msg)
{
    if (is_array($msg)) {
        foreach ($msg as $a => $b) {
            $msg[$a] = Char_cv($b);
        }
    }
    $msg = str_replace('%20', '', $msg);
    $msg = str_replace('%27', '', $msg);
    $msg = str_replace('*', '', $msg);
    $msg = str_replace("\"", '', $msg);
    $msg = str_replace("`", '', $msg);
    //$msg = str_replace('//','',$msg);
    $msg = str_replace('&amp;', '&', $msg);
    $msg = str_replace('&nbsp;', ' ', $msg);
    $msg = str_replace(';', '', $msg);
    $msg = str_replace('"', '&quot;', $msg);
    $msg = str_replace("'", '&#039;', $msg);
    $msg = str_replace("<", "&lt;", $msg);
    $msg = str_replace(">", "&gt;", $msg);
    $msg = str_replace('(', '', $msg);
    $msg = str_replace(')', '', $msg);
    $msg = str_replace("{", '', $msg);
    $msg = str_replace('}', '', $msg);
    $msg = str_replace("\t", "   &nbsp;  &nbsp;", $msg);
    $msg = str_replace("\r", "", $msg);
    //$msg = str_replace("\n",'<br/>',$msg);
    $msg = str_replace("   ", " &nbsp; ", $msg);
    $msg = str_replace("，", ",", $msg);

    return $msg;
}

//处理数字类型字符
function GetNum($fnum)
{
    $nums = array("０", "１", "２", "３", "４", "５", "６", "７", "８", "９");
    //$fnums = "0123456789";
    $fnums = array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9");
    $fnum = str_replace($nums, $fnums, $fnum);
    $fnum = ereg_replace("[^0-9\.-]", '', $fnum);
    if ($fnum == '') {
        $fnum = 0;
    }
    return $fnum;
}

function toPrice($val, $decimal = null)
{
    return number_format($val, $decimal, '.', '');
}

/**
 * 批量初始化POST or GET变量,并数组返回
 *
 * @param Array $keys
 * @param string $method
 * @param var $htmcv
 * @return Array
 */
function Init_GP($keys, $method = 'GP', $htmcv = 1)
{
    !is_array($keys) && $keys = array($keys);
    $array = array();
    foreach ($keys as $val) {
        $array[$val] = NULL;
        if ($method != 'P' && isset($_GET[$val])) {
            $array[$val] = $_GET[$val];
        } elseif ($method != 'G' && isset($_POST[$val])) {
            $array[$val] = $_POST[$val];
        }
        $htmcv && $array[$val] = Char_cv($array[$val]);
    }
    return $array;
}


//保留后两位
function rtwo($float)
{
    return round($float, 2);
}

function getstatus($id, $uid, $typeid, $type)
{
    $logid = D('itemlog')->where(array('itemid' => $id, 'uid' => $uid, 'typeid' => $typeid, 'type' => $type))->getField('id');
    if ($logid > 0) {
        return true;
    } else {
        return false;
    }
}

/*
 * 评分计算
 * 
 * 
 */
function getratyint($num)
{
    //获得评分的整数范围，用于显示评分的星星小图标，文档列表使用
    $data = floor($num);
    return $data;
}

function getitemraty($id, $typeid)
{
    //评分
    $mapraty['itemid'] = $id;
    $mapraty['typeid'] = $typeid;
    $raty = D('raty')->where($mapraty)->find();
    $aver = $raty['total'] / $raty['voter'];
    $raty1 = round($aver, 1);
    return $raty1;
}

function getratynum($id, $typeid)
{
    //评分的人数
    $mapraty['itemid'] = $id;
    $mapraty['typeid'] = $typeid;
    $raty = D('raty')->where($mapraty)->find();
    if ($raty == null) {
        $raty['voter'] = 0;
    }
    return $raty['voter'];
}

function getraty($id, $typeid)
{
    $mapraty['itemid'] = $id;
    $mapraty['typeid'] = $typeid;
    $raty = D('raty')->where($mapraty)->find();
    $aver = $raty['total'] / $raty['voter'];
    $raty1 = round($aver, 1) * 10;
    $str = strval($raty1);
    if (strlen($str) >= 3) {
        $s = 10;
        $g = 0;
    } else if ($str == "0") {
        $s = 0;
        $g = 0;
    } else {
        $s = substr($str, 0, 1);
        $g = substr($str, 1, 1);
    }
    $data['raty'] = $raty1;
    $data['s'] = $s;
    $data['g'] = $g;
    return $data;
}


function addslashes_deep($value)
{
    $value = is_array($value) ? array_map('addslashes_deep', $value) : addslashes($value);
    return $value;
}

function name_hasexists($name, $namefield, $id, $field)
{
    $mod = D($field);
    $pk = $mod->getPk();
    M($field)->where(array($pk => $id))->
    $where = $namefield . "='" . $name . "' AND " . $pk . "<>'" . $id . "'";
    $result = M($field)->where($where)->count($pk);
    if ($result) {
        return true;
    } else {
        return false;
    }
}

/**
 * +----------------------------------------------------------
 * 取得角色名称
 * +----------------------------------------------------------
 * @return string
 * +----------------------------------------------------------
 */
function getrolename($id)
{
    $map['uid'] = $id;
    $dataid = M('user')->where($map)->getField('roleid');
    $map1['id'] = $dataid;
    $data = M('user_role')->where($map1)->getField('name');
    return $data;
}

/**
 * +----------------------------------------------------------
 * 取得状态名称
 * +----------------------------------------------------------
 * @return string
 * +----------------------------------------------------------
 */
function getstatusname($id)
{
    switch ($id) {
        case 0:
            $data = '关闭';
            break;
        case 1:
            $data = '未审核';
            break;
        case 2:
            $data = '已审核';
            break;
        case 3:
            $data = '置顶';
            break;
        case 4:
            $data = '推荐';
            break;
        case 5:
            $data = '首页焦点图';
            break;
        default:
            break;

    }
    return $data;

}

/**
 * +----------------------------------------------------------
 * 取得角色是否管理员
 * +----------------------------------------------------------
 * @return string
 * +----------------------------------------------------------
 */
function getisadmin($roleid)
{
    $map['id'] = $roleid;
    $map['status'] = 1;
    $data = M('user_role')->where($map)->getField('isAdmin');
    if ($data == 1) {
        return true;
    } else {
        return false;
    }
}

/**
 * +----------------------------------------------------------
 * 取得菜单名称
 * +----------------------------------------------------------
 * @return string
 * +----------------------------------------------------------
 */
function getmenuname($menuid)
{
    $map['id'] = $menuid;
    $data = M('menu')->where($map)->getField('name');
    return $data;
}

/**
 * +----------------------------------------------------------
 * 取得用户积分
 * +----------------------------------------------------------
 * @return string
 * +----------------------------------------------------------
 */
function getuserscore($uid)
{
    $map['uid'] = $uid;
    $data = M('user_scoresum')->where($map)->getField('score');
    if ($data == '') {
        $data1['uid'] = $uid;
        D('user_scoresum')->add($data1);
        $data = 0;
    }
    return $data;
}

/*获得该用户升级所需要的总积分*/
function getusersjscore($uid)
{
    $map['uid'] = $uid;
    $userroleid = M('user')->where($map)->getField('roleid');
    if (getisadmin($userroleid)) {
        $totalscore = 0;
    } else {
        $map1['id'] = $userroleid;
        $totalscore = D('user_role')->where($map1)->getField('score');
    }
    return $totalscore;
}

/*获得该用户升级所需要的积分百分比*/
function getusersjper($uid)
{
    $map['uid'] = $uid;
    $userroleid = M('user')->where($map)->getField('roleid');
    if (getisadmin($userroleid)) {
        $per = 0;
    } else {
        $map1['id'] = $userroleid;
        $totalscore = D('user_role')->where($map1)->getField('score');
        $score = M('user_scoresum')->where($map)->getField('score');
        if ($score == '') {
            $data2['uid'] = $uid;
            D('user_scoresum')->add($data2);
            $score = 0;
        }
        $per = round($score / $totalscore, 2) * 100;
    }
    return $per;
}

function comcount($id, $typeid)
{
	//评论数
    $map['typeid'] = $typeid;
    $map['status'] = 1;
    $map['itemid'] = $id;
    $data = D('comment')->where($map)->count();
    return $data;
}

function downcount($id, $typeid)
{
	//下载数
    $map['typeid'] = $typeid;
    $map['type'] = 1;
    $map['itemid'] = $id;
    $data = D('itemlog')->where($map)->count('itemid');
    return $data;
}

function wysccount($id, $typeid)
{
	//收藏数
    $map['typeid'] = $typeid;
    $map['type'] = 2;
    $map['itemid'] = $id;
    $data = D('itemlog')->where($map)->count('itemid');
    return $data;
}

function wytjcount($id, $typeid)
{
	//推荐数
    $map['typeid'] = $typeid;
    $map['type'] = 3;
    $map['itemid'] = $id;
    $data = D('itemlog')->where($map)->count('itemid');
    return $data;
}

function usercomcount($uid, $typeid)
{
	//用户评论数
    $map['typeid'] = $typeid;
    $map['status'] = 1;
    $map['uid'] = $uid;
    $data = D('comment')->where($map)->count();
    return $data;
}

function userdowncount($uid, $typeid)
{
	//用户下载数
    $map['typeid'] = $typeid;
    $map['type'] = 1;
    $map['uid'] = $uid;
    $data = D('itemlog')->where($map)->count('itemid');
    return $data;
}

function userwysccount($uid, $typeid)
{
	//用户收藏数
    $map['typeid'] = $typeid;
    $map['type'] = 2;
    $map['uid'] = $uid;
    $data = D('itemlog')->where($map)->count('itemid');
    return $data;
}

function userwytjcount($uid, $typeid)
{
	//用户推荐数
    $map['typeid'] = $typeid;
    $map['type'] = 3;
    $map['uid'] = $uid;
    $data = D('itemlog')->where($map)->count('itemid');
    return $data;
}

function usercomitemid($uid, $typeid)
{
	//用户评论的id集合
    $map['typeid'] = $typeid;
    $map['status'] = 1;
    $map['uid'] = $uid;
    $data = D('comment')->where($map)->getField('itemid', true);
    $data = array_unique($data);
    return $data;
}

function userdownitemid($uid, $typeid)
{
	//用户下载的id集合
    $map['typeid'] = $typeid;
    $map['type'] = 1;
    $map['uid'] = $uid;
    $data = D('itemlog')->where($map)->getField('itemid', true);
    $data = array_unique($data);
    return $data;
}

function userwyscitemid($uid, $typeid)
{
	//用户收藏的id集合
    $map['typeid'] = $typeid;
    $map['type'] = 2;
    $map['uid'] = $uid;
    $data = D('itemlog')->where($map)->getField('itemid', true);
    $data = array_unique($data);
    return $data;
}

function userwytjitemid($uid, $typeid)
{
	//用户推荐的id集合
    $map['typeid'] = $typeid;
    $map['type'] = 3;
    $map['uid'] = $uid;
    $data = D('itemlog')->where($map)->getField('itemid', true);
    $data = array_unique($data);
    return $data;
}

function similardoc($id, $num)
{
    $map1['id'] = $id;
    $tags = D('doc_con')->where($map1)->getField('tags');
    $tagarr = explode(',', $tags);
    foreach ($tagarr as $key => $value) {
        $tagarr[$key] = '%' . $value . '%';
    }
    $map['title'] = array('like', $tagarr, 'OR');
    $map['id'] = array('neq', $id);
    $data = D('doc_con')->where($map)->limit($num)->select();
    return $data;
}

//同分类热门文档
function samecatedoc($id)
{
    $map['id'] = $id;
    $map1['cateid'] = D('doc_con')->where($map)->getField('cateid');
    $map1['id'] = array('neq', $id);
    $data = D('doc_con')->where($map1)->order('hits desc')->select();
    return $data;
}

//相关标签
function similartag($tagid)
{
    $map1['id'] = $tagid;
    $word = D('tag')->where($map1)->getField('name');
    $map['name'] = array('like', '%' . $word . '%');
    $data = D('tag')->where($map)->order('count desc')->select();
    return $data;
}

//编辑推荐文档
function tjdoc()
{
    //$map['id']=$id;
    //$map1['cateid']=$this->_mod->where($map)->getField('cateid');
    $map['status'] = 4;
    $data = D('doc_con')->where($map)->select();
    return $data;
}

function cmpcomcount($a, $b)
{
    if ($a['comcount'] == $b['comcount']) {
        return 0;
    }
    return ($a['comcount'] > $b['comcount']) ? -1 : 1;
}

function cmpcomcountc($a, $b)
{
    if ($a['comcount'] == $b['comcount']) {
        return 0;
    }
    return ($a['comcount'] < $b['comcount']) ? -1 : 1;
}

/**
 * +----------------------------------------------------------
 * 取得用户资料
 * +----------------------------------------------------------
 * @return string
 * +----------------------------------------------------------
 */
function getuserinfo($uid)
{
    $map['uid'] = $uid;
    $data = M('userinfo')->where($map)->find();

    if ($data == '') {
        $data1['uid'] = $uid;
        D('userinfo')->add($data1);
    }
    return $data;
}

/**
 * +----------------------------------------------------------
 * 取得友情链接分类名称
 * +----------------------------------------------------------
 * @return string
 * +----------------------------------------------------------
 */
function getflinkcate($id)
{
    $data = D('flink_cate')->where(array('id' => $id))->getField('name');
    return $data;
}

/*
 * 获得相关分类的友情链接
 *
 * */
function getflink($id = '1', $img = false)
{
    $map['cate_id'] = $id;
    $map['status'] = 1;
    if ($img) {
        $map['img'] = array('neq', '');
    } else {
        $map['img'] = '';
    }
    $data = D('flink')->where($map)->order('ordid')->select();
    return $data;
}

function getcatename($type, $id)
{
    $mod = D($type . '_cate');
    $map['id'] = $id;
    $map['status'] = 1;
    $data = $mod->where($map)->getField('name');
    if ($data == '') {
        $data = '待定分类';
    }
    return $data;
}

function getcatespid($type, $id)
{
    $mod = D($type . '_cate');
    $map['id'] = $id;
    $data = $mod->where($map)->getField('spid');
    return $data;
}

/*
 * 获得分类类型名称，如文档、活动、小组
 *
 * */
function gettypename($id)
{
    switch ($id) {
        case 1:
            $data = '文档';
            break;
        case 2:
            $data = '活动';
            break;
        case 3:
            $data = '小组';
            break;
        default:
            $data = '文档';
            break;
    }
    return $data;
}


/**
 * +----------------------------------------------------------
 * 通过uid取得用户名
 * +----------------------------------------------------------
 * @return string
 * +----------------------------------------------------------
 */
function getusername($uid)
{
    $data = D('user')->where(array('uid' => $uid))->getField('username');
    return $data;
}

function getuserintro($uid)
{
    $data = D('userinfo')->where(array('uid' => $uid))->getField('intro');
    return $data;
}

function getfensi($uid)
{
    $data = D('focus')->where(array('focusuid' => $uid))->count();
    return $data;
}

function getguanzhu($uid)
{
    $data = D('focus')->where(array('uid' => $uid))->count();
    return $data;
}

function getfocusstatus($uid, $focusuid)
{
    $map['uid'] = $uid;
    $map['focusuid'] = $focusuid;
    $one = D('focus')->where($map)->getField('uid');
    $map1['focusuid'] = $uid;
    $map1['uid'] = $focusuid;
    $two = D('focus')->where($map1)->getField('uid');
    if ($uid == $focusuid) {

        return 5;//自己
    }

    if ($one > 0 && $two > 0) {

        $data = 3;
    } elseif ($one > 0) {
        $data = 1;
    } elseif ($two > 0) {
        $data = 2;
    } else {
        $data = 0;
    }
    return $data;
}


function getbxh($uid)
{
    $map['uid'] = $uid;
    $idarr = D('article')->where($map)->getField('id');
    $map1['itemid'] = array('in', $idarr);
    $map1['type'] = 1;
    $data = D('topiclog')->where($map1)->count();
    if ($data == '') {
        $data = 0;
    }
    return $data;

}

function getxhcount($uid)
{
    $map['uid'] = $uid;
    $map['type'] = 1;
    $data = D('topiclog')->where($map)->count();
    return $data;
}

function getzjcount($uid)
{
    $map['uid'] = $uid;
    $data = D('zj')->where($map)->count();
    return $data;
}

function gettopiccount($uid)
{
    $map['uid'] = $uid;
    $data = D('article')->where($map)->count();
    return $data;
}

function getmydoccount($uid)
{
    $map['uid'] = $uid;
    $data = D('article')->where($map)->count();
    return $data;

}


function stripslashes_deep($value)
{
    if (is_array($value)) {
        $value = array_map('stripslashes_deep', $value);
    } elseif (is_object($value)) {
        $vars = get_object_vars($value);
        foreach ($vars as $key => $data) {
            $value->{$key} = stripslashes_deep($data);
        }
    } else {
        $value = stripslashes($value);
    }
    return $value;
}

function webmd5($string)
{
    $md5 = C('WEB_MD5');
    $data = md5($string . $md5);
    return $data;
}

/*
 * 获得相关分类的文章
 *
 * */
function getcateart($id = '0', $ord)
{
    $map['pid'] = $id;
    $mapid = D('article_cate')->where($map)->getField('id', true);
    array_unshift($mapid, $id);
    $artmap['cate_id'] = array('in', $mapid);
    $artmap['status'] = 1;
    $data = D('article')->where($artmap)->order($ord)->select();
    return $data;
}

function todaytime()
{
    return mktime(0, 0, 0, date('m'), date('d'), date('Y'));
}

/**
 * 友好时间
 */
function fdate($time)
{
    if (!$time)
        return false;
    $fdate = '';
    $d = time() - intval($time);
    $ld = $time - mktime(0, 0, 0, 0, 0, date('Y')); //年
    $md = $time - mktime(0, 0, 0, date('m'), 0, date('Y')); //月
    $byd = $time - mktime(0, 0, 0, date('m'), date('d') - 2, date('Y')); //前天
    $yd = $time - mktime(0, 0, 0, date('m'), date('d') - 1, date('Y')); //昨天
    $dd = $time - mktime(0, 0, 0, date('m'), date('d'), date('Y')); //今天
    $td = $time - mktime(0, 0, 0, date('m'), date('d') + 1, date('Y')); //明天
    $atd = $time - mktime(0, 0, 0, date('m'), date('d') + 2, date('Y')); //后天
    if ($d == 0) {
        $fdate = '刚刚';
    } else {
        switch ($d) {
            case $d < $atd:
                $fdate = date('Y年m月d日', $time);
                break;
            case $d < $td:
                $fdate = '后天' . date('H:i', $time);
                break;
            case $d < 0:
                $fdate = '明天' . date('H:i', $time);
                break;
            case $d < 60:
                $fdate = $d . '秒前';
                break;
            case $d < 3600:
                $fdate = floor($d / 60) . '分钟前';
                break;
            case $d < $dd:
                $fdate = floor($d / 3600) . '小时前';
                break;
            case $d < $yd:
                $fdate = '昨天' . date('H:i', $time);
                break;
            case $d < $byd:
                $fdate = '前天' . date('H:i', $time);
                break;
            case $d < $md:
                $fdate = date('m月d H:i', $time);
                break;
            case $d < $ld:
                $fdate = date('m月d', $time);
                break;
            default:
                $fdate = date('Y年m月d日', $time);
                break;
        }
    }
    return $fdate;
}

/**
 * 获取用户头像
 */
function avatar($uid, $size)
{
    if (C('mtceo_integrate_code') == 'ucenter') {
        if ($size == '120') {
            $size = 'middle';
        } elseif ($size == '48') {
            $size = 'small';
        }
        $str = C('mtceo_integrate_config.uc_config');
        $ucapiarr = explode("'", $str);
        $ucapi = $ucapiarr[39];
        $avastr = $ucapi . '/avatar.php?uid=' . $uid . '&type=virtual&size=' . $size;
        return $avastr;
    } else {
        $avatar_size = explode(',', C('mtceo_avatar_size'));
        $size = in_array($size, $avatar_size) ? $size : '160';
        $avatar_dir = avatar_dir($uid);
        $avatar_file = $avatar_dir . md5($uid) . "_{$size}.jpg";
        if (!is_file(C('mtceo_attach_path') . 'avatar/' . $avatar_file)) {
            $avatar_file = "default_{$size}.jpg";
        }
        return __ROOT__ . '/' . C('mtceo_attach_path') . 'avatar/' . $avatar_file;
    }
}

function avatar_dir($uid)
{
    $uid = abs(intval($uid));
    //$suid = sprintf("%09d", $uid);
    //$dir1 = substr($suid, 0, 3);
    //$dir2 = substr($suid, 3, 2);
    //$dir3 = substr($suid, 5, 2);
    return $uid . '/';
}

function attach($attach, $type)
{
    if (false === strpos($attach, 'http://')) {
        //本地附件
        return __ROOT__ . '/' . C('mtceo_attach_path') . $type . '/' . $attach;
        //远程附件
        //todo...
    } else {
        //URL链接
        return $attach;
    }
}

function docimg($model, $id)
{
    $map['id'] = $id;
    $info = D('doc_con')->where($map)->find();
    if ($info['imgurl'] == '') {
        return __ROOT__ . '/' . C('mtceo_attach_path') . 'preview/default.png';
    } else {
        return __ROOT__ . '/' . C('mtceo_attach_path') . 'doc_img/' . $info['imgurl'];
    }
}

/*
 * 获取缩略图
 */

function get_thumb($img, $suffix = '_thumb')
{
    if (false === strpos($img, 'http://')) {
        $ext = array_pop(explode('.', $img));
        $thumb = str_replace('.' . $ext, $suffix . '.' . $ext, $img);
    } else {
        if (false !== strpos($img, 'taobaocdn.com') || false !== strpos($img, 'taobao.com')) {
            //淘宝图片 _s _m _b
            switch ($suffix) {
                case '_s':
                    $thumb = $img . '_100x100.jpg';
                    break;
                case '_m':
                    $thumb = $img . '_210x1000.jpg';
                    break;
                case '_b':
                    $thumb = $img . '_480x480.jpg';
                    break;
            }
        }
    }
    return $thumb;
}

/**
 * 获取网站配置数据
 */
function getdata()
{

    $setdata = D('setting')->select();
    foreach ($setdata as $key => $val) {

        $string = $val['name'];
        $data[$string]['data'] = $val['data'];
        $data[$string]['remark'] = $val['remark'];

    }
    return $data;

}


/**
 * 对象转换成数组
 */
function object_to_array($obj)
{
    $_arr = is_object($obj) ? get_object_vars($obj) : $obj;
    foreach ($_arr as $key => $val) {
        $val = (is_array($val) || is_object($val)) ? object_to_array($val) : $val;
        $arr[$key] = $val;
    }
    return $arr;
}


function str_from_unicode($name)
{

    $pattern = '/%u[0-9A-Z]{4}%.{2}[0-9a-zA-z.+-_]+/';
    preg_match_all($pattern, $name, $matches);
    if (!empty($matches)) {

        $name = '';
        for ($j = 0; $j < count($matches[0]); $j++) {

            $str = $matches[0][$j];
            if (strpos($str, '/%u') === 0) {
                $code = base_convert(substr($str, 2, 2), 16, 10);
                $code2 = base_convert(substr($str, 4), 16, 10);
                $c = chr($code) . chr($code2);
                $c = iconv("usc-2be", "utf-8", $c);

                $name .= $c;
            } else {
                $name .= $str;
            }
        }


    }

    return $name;

}
