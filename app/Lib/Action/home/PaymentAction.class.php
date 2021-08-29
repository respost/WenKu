<?php
// 本文档自动生成，仅供测试运行
class PaymentAction extends frontendAction
{
	//private $return_page = U('/ucenter/tongji');

	protected function _getClass($mark){
		$payment = D('Payment');
		$paymentmap = array(
			'mark'=>array('eq',$mark),
			'status'=>array('eq',1),
		);
		$paymentdata = $payment->where($paymentmap)->find();
		if(empty($paymentdata)){
			return false;
		}else{
			$import_status = import("@.ORG.{$paymentdata['mark']}");
			if($import_status){
				$pay = new $paymentdata['mark']($paymentdata);
				return $pay;
			}else{
				return false;
			}
		}
	}

	protected function _returnVerify($pay){
		$this->assign("jumpUrl",U('ucenter/tongji'));
		if($pay){
			$info = $pay->_return_url();
			
			
			
			
			if ($info){
				//成功执行需要操作的方法
				$this->succ($info);
				$this->success(L('pay_success'));
			}else{
				$this->error(L('pay_error'));
			}
		}else{
			$this->error(L('pay_error'));
		}
	}

	protected function _notifyVerify($pay){
		if($pay){
			$info = $pay->_notify_url();
			if ($info){
				//成功执行需要操作的方法
				$this->succ($info);
			}else{
				//失败方法
			}
		}
	}

    public function alipay_double_notify_url()
    {
        $pay = $this->_getClass('Alipay_double');
        $this->_notifyVerify($pay);
    }

    public function alipay_double_return_url()
    {
        $pay = $this->_getClass('Alipay_double');
        $this->_returnVerify($pay);
    }

    public function alipay_notify_url()
    {
    	$pay = $this->_getClass('Alipay');
		$this->_notifyVerify($pay);
    }
    
 	public function alipay_return_url()
    {
    	$pay = $this->_getClass('Alipay');
		$this->_returnVerify($pay);
    }

	public function yeepay_return_url()
    {
		$pay = $this->_getClass('Yeepay');
		$this->_returnVerify($pay);
    }
    
	public function chinabank_return_url()
    {
		$pay = $this->_getClass('Chinabank');
		$this->_returnVerify($pay);
    }
    
	public function tenpay_return_url()
    {
		$pay = $this->_getClass('Tenpay');
		$this->_returnVerify($pay);
    }

	public function chinapnr_notify_url()
    {
		$pay = $this->_getClass('Chinapnr');
    	$this->_notifyVerify($pay);
    }
    
 	public function chinapnr_return_url()
    {
		$pay = $this->_getClass('Chinapnr');
		$this->_returnVerify($pay);
    }
    
	protected function succ($info){
		$pre = substr($info['sn'],0,2);
		if($pre == 'PA'){
    		$order = D('Order');
    		$order->succPay($info);
		}elseif ($pre == 'RE'){
			$recharge = D('Recharge');
    		$recharge->succPay($info);
		}
    }
}
?>