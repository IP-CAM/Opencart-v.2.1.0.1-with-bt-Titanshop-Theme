<?php
class ControllerExtensionApptuseCart extends Controller { 
	private $error = array();
	private $ssl = 'SSL';

	# Use print_r($json) instead json_encode($json)
	private $debug = false;
	/**
	 * 
	 */

	public function __construct( $registry ) {
		parent::__construct( $registry );
		$this->ssl = true;
	}

	private function init() {

		$this->response->addHeader('Content-Type: application/json');
	}


	public function index() {
		$this->cart();
    }




	public function cart() {
		

		$this->init();

		$this->load->language('api/cart');
		
		$json = array();
		
		$payload =  $_GET['payload'] ;

		$payload = json_decode( urldecode($payload) ,true );

		foreach( $payload as $key => $one_product ){
		
			$this->load->model('catalog/product');
		
			$product_info = $this->model_catalog_product->getProduct( $one_product['product_id'] );
			
			$quantity = $one_product['quantity'];
			
			if( isset( $one_product['option'] ) && !empty( $one_product['option'] ) ){ 
			
				$option_array = array_filter( $one_product['option'] );
				
				$this->cart->add( $one_product['product_id'] , $quantity , $option_array );
			
			}else{

				$option_array = array();
				
				$this->cart->add( $one_product['product_id'] , $quantity , $option_array );
			}

			$json['success'] = $this->language->get('text_success');
				
		}
		
		$this->response->redirect($this->url->link('checkout/cart	','', true));

		
	}	



	/**
	 * Error message responser
	 *
	 * @param string $message  Error message
	 */
	private function error($code = 0, $message = '') {

		# setOutput() is not called, set headers manually
		header('Content-Type: application/json');

		$json = array(
			'success'       => false,
			'code'          => $code,
			'message'       => $message
		);

		if ($this->debug) {
			echo '<pre>';
			print_r($json);
		} else {
			echo json_encode($json);
		}
		
		exit();
	}
}
?>