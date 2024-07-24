<?php
class ControllerExtensionApptuse extends Controller { 
	private $error = array();
	private $ssl = 'SSL';

	public function __construct( $registry ) {
		parent::__construct( $registry );
		$this->ssl = true;
	}


	public function index() {
		
		$this->install();

		$this->getlist();
	}


	protected function getlist(){

        $this->load->language('extension/apptuse');
        $this->load->model('setting/store');
		$this->load->model('setting/setting');

        $data['heading_title'] = 'Apptuse';//$this->language->get('heading_title')'';



        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');



		$data['stores'] = array();

		$query_default = "select * from `" . DB_PREFIX . "apptuse` where store_id = 0 and status = 1" ;
		$store_status_default = $this->db->query($query_default);

		$status_default = 0 ; 
		$token_default = '';
			
		
		if($store_status_default->num_rows>0){
				$status_default = $store_status_default->row['status'];
				$token_default 	= $store_status_default->row['token'];
		}

		$data['stores'][] = array(
			'store_id' => 0,
			'name'     => $this->config->get('config_name'),
			'owner'	   => $this->config->get('config_owner'),
			'telephone'=> $this->config->get('config_telephone'),
			'logo'	   => $this->config->get('config_image'),
			'email'    => $this->config->get('config_email'),
			'status'   => $status_default,
			'connect_url' =>$this->url->link('extension/apptuse/connect', 'id=0&token=' . $this->session->data['token'], true), 
			'token'	   => $token_default,
 			'url'      => $this->config->get('config_secure') ? HTTPS_CATALOG : HTTP_CATALOG,
			'edit'     => $this->url->link('setting/setting', 'token=' . $this->session->data['token'], true)
		);
        $store_total = $this->model_setting_store->getTotalStores();

		$results = $this->model_setting_store->getStores();

		foreach ($results as $result) {

			$store_config = $this->model_setting_setting->getSetting('config',$result['store_id']);
			$query = "select * from `" . DB_PREFIX . "apptuse` where store_id = " . $result['store_id'] . " and status = 1" ;
			$store_status = $this->db->query($query);
			
			$status = 0 ; 
			$token = '';
			
			
			if($store_status->num_rows>0){
				$status = $store_status->row['status'];
				$token 	= $store_status->row['token'];
			}
			

			$data['stores'][] = array(
				'store_id' => $result['store_id'],				
				'name'     => $result['name'],
				'owner'	   => $store_config['config_owner'],
				'telephone'=> $store_config['config_telephone'],
				'logo'	   => $store_config['config_image'],
				'url'      => $result['url'],
				'status'   => $status,
				'token'	   => $token,
 				'email'    => $this->config->get('config_email'),
 				'connect_url' =>$this->url->link('extension/apptuse/connect', 'id='. $result['store_id'] .'&token=' . $this->session->data['token'], true),
				'edit'     => $this->url->link('setting/store/edit', 'token=' . $this->session->data['token'] . '&store_id=' . $result['store_id'], true)
			);
		}


		$this->response->setOutput($this->load->view('extension/apptuse_store.tpl', $data));
	}

	public function edit(){

	}

	public function connect(){

		$this->load->model('setting/store');
		$this->load->model('setting/setting');

		
		# -- $_GET params ------------------------------
		
		if (isset($this->request->get['id'])) {
			$store_id = $this->request->get['id'];
		}
		# -- End $_GET params --------------------------



		$store_config = $this->model_setting_setting->getSetting('config',$store_id);

		
		//prepare parameters
		$store_url = '';	
		$store_name = "";

		if( $store_id == 0 ){

			$store_url = $this->config->get('config_secure') ? HTTPS_CATALOG : HTTP_CATALOG;
			$store_name = $this->config->get('config_name');

		}else{

			$store_url = $store_config['config_url'];
			$store_name = $store_config['config_name'];
		}


		//token from apptuse database
		$token = "" ;


		$query_default = "select * from `" . DB_PREFIX . "apptuse` where store_id = ".$store_id ;

		$store_status_default = $this->db->query($query_default);
		
		
		if($store_status_default->num_rows>0){
				$token 	= $store_status_default->row['token'];
		}

		$param = array(
			'email'=>$this->config->get('config_email'), 
			'store_url'=>$store_url,
			'telephone'=>$this->config->get('config_telephone'),
			'owner'=>$this->config->get('config_owner'),
			'store_name'=>$store_name,
			'token'=>$token,
			'store_id' => $store_id 
		);


		//curl request 

		$curl = curl_init( 'https://app.apptuse.com/plugin-signup/56');
		curl_setopt( $curl, CURLOPT_POST, true );
		curl_setopt( $curl, CURLOPT_POSTFIELDS, $param );
		curl_setopt( $curl, CURLOPT_RETURNTRANSFER, true );
		

		$response = json_decode(curl_exec( $curl ),true);


		if($response['success']){

			if( $token != $response['token'] ){
				$this->addRow($store_id,$response['token']);	
			}else{
				$this->updateStatus($store_id);
			}
			
		}else{
			$this->response->redirect($this->url->link('extension/apptuse', 'token=' . $this->session->data['token'], true));
			//$this->getlist();
		}	

		curl_close( $curl );


		$this->response->redirect($this->url->link('extension/apptuse', 'token=' . $this->session->data['token'], true));
		//$this->getlist();
	}

	private function addRow($storeid,$token){

		$query = "INSERT INTO `".DB_PREFIX . "apptuse` (`id`, `store_id`, `email`, `token`, `status`, `date_added`) VALUES (NULL, '". $storeid ."', '". $this->config->get('config_email')."', '". $token ."', '1', '".date("Y-m-d H:i:s") ."')";

		$this->db->query($query);
	}

	private function updateStatus($store_id){
		//UPDATE `oc_apptuse` SET `status` = '0' WHERE `oc_apptuse`.`id` = 2;
		$query = "UPDATE `" . DB_PREFIX. "apptuse` SET status = 1 where store_id = '" .  $store_id . "'";
		$this->db->query($query);
	}

	public function install(){
		

		//query for create apptuse table 
		$query = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "apptuse` ( `id` int(11) NOT NULL AUTO_INCREMENT,
      `store_id` varchar(100) NOT NULL,
      `email` varchar(100) NOT NULL,
      `token` varchar(100) NOT NULL,	
      `status` int(8) NOT NULL,
     `date_added` datetime NOT NULL, 
      PRIMARY KEY (`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=0;";

		//execute query  

    	$this->db->query($query);
	}


	# Use print_r($json) instead json_encode($json)
	private $debug = true;
	/**
	 * 
	 */
	private function init() {

		$this->response->addHeader('Content-Type: application/json');
	}

	private function getAllCategories() {		
		
		$this->load->model('catalog/category');
		$json = array('success' => true);

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");


		$categoryArray= array();

		foreach ($query->rows as $category) {
				
				$each_category = array();
        		$each_category['category_id'] = $category['category_id'];
        		$each_category['parent_id'] =$category['parent_id'];
        		$each_category['name'] = $category['name'];
        		$categoryArray[] = $each_category;
			
		}
				return $categoryArray;
	
	}


	public function storeProductAPI(){


			$this->init();

			$store_data = array();

			$store_data['category'] = $this->getAllCategories();

			$store_data['currency'] = $this->currency();

			$store_data['products'] = $this->products();


			$this->response->setOutput(json_encode($store_data));	

	}
 

	public function add_to_cart() {
		

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
		
		$this->response->setOutput(json_encode($json));		
	}	

	public function currency(){
		
		$this->load->model('localisation/currency');
	
		$currency_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "currency ORDER BY title ASC");

		foreach ($query->rows as $result) {
			
			if($result['status'] && $result['value'] == 1 ){

				return $result['code']; 

			}
		}
	}

	private function products( ) {
		

		$this->init();
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$this->config->set('config_image_product_width', 512); 
		$this->config->set('config_image_product_height',512);

		$json = array();

		/*$start_index = $_GET['start_index'];
		$set_length = $_GET['set_length'];*/

		# -- $_GET params ------------------------------
		
		if (isset($this->request->get['category'])) {
			$category_id = $this->request->get['category'];
		} else {
			$category_id = 0;
		}

		# -- End $_GET params --------------------------

		//fetch all product data
		$products = $this->model_catalog_product->getProducts();
		
		/*
		(array(
				'start' => $start_index,
				'limit' => $set_length
			));*/


		foreach ($products as $product) {
		
		
			//product image 
			if ($product['image']) {
				$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = false;
			}

			//special 
			$special_data = $this->model_catalog_product->getProductSpecials($product['product_id']);
			if(count($special_data) > 0){
				$special  = $this->tax->calculate($special_data[0]['price'], $product['tax_class_id'], $this->config->get('config_tax'));
			}else{
				$special = false;
			}

			$best_price = 0;

			$price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));

			if($special != false){
				$best_price = $special;
			}else{
				$best_price = $price;
				$special = '';
			}


			//has variants
			$has_variants = false;
			$variant_id = 0;

			$options  = $this->model_catalog_product->getProductOptions($product['product_id']); 

			if(count($options) > 0 ){
				$has_variants  =true;

				$variant_id = $this->model_catalog_product->getProductOptions($product['product_id'])[0]['product_option_id'];
			}else{
				$has_variants  =false;
				$variant_id = $product['product_id'];
			}


			$categories = $this->model_catalog_product->getProductCategories($product['product_id']) ;
			$category_id = ':';

			if(count($categories) > 0 ){
				
				foreach ($categories as $key => $value) {
				    $category_id .= $value.":";
				}		
			}else{
				$category_id = ':-1:';
			}
				
			$json[] = array(
				'product_id'            => $product['product_id'],
				'name'                  => $product['name'],
				'image'                 => $image,
				'price'                 => $price,
				'special'               => $special,
				'best_price' 			=> $best_price,
				'quantity'				=> $product['quantity'],

				'category'				=> $category_id,
				'call_for_pricing'		=> 0, 
				'date_added'			=> strtotime($product['date_added']),

				'has_variants'			=> $has_variants,
				'variant_id'			=> $variant_id, 
			);
		}

			return $json ; 
	}



	public function pnumber(){

		$this->init();
		$this->load->model('catalog/product');
		$response['number_of_products'] = $this->model_catalog_product->getTotalProducts();
	    $this->response->setOutput(json_encode($response));
	} 



	public function product( $product_id = 0 ) {

		error_reporting(0);

		$this->init();
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$json = array('success' => true);

		# -- $_GET params ------------------------------
		
		if (isset($this->request->get['id'])) {
			$product_id = $this->request->get['id'];
		} else {
			$product_id = 0;
		}

		# -- End $_GET params --------------------------

		$product = $this->model_catalog_product->getProduct($product_id);

		# product image
		if ($product['image']) {
			$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
		} else {
			$image = '';
		}

		#additional images
		$additional_images = $this->model_catalog_product->getProductImages($product['product_id']);
		$images = array();

		foreach ($additional_images as $additional_image) {
			$images[] = $this->model_tool_image->resize($additional_image, $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height'));
		}

		#special
		if ((float)$product['special']) {
			$special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')));
		} else {
			$special = false;
		}

		#discounts
		$discounts = array();
		$data_discounts =  $this->model_catalog_product->getProductDiscounts($product['product_id']);

		foreach ($data_discounts as $discount) {
			$discounts[] = array(
				'quantity' => $discount['quantity'],
				'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product['tax_class_id'], $this->config->get('config_tax')))
			);
		}

		#options
		$options = array();

		 echo "<pre>";print_r($this->model_catalog_product->getProductOptions($product['product_id']));exit;

		foreach ($this->model_catalog_product->getProductOptions($product['product_id']) as $option) { 
			
			if( isset($option['product_option_value']) && sizeof($option['product_option_value']) > 0 ){
	
				$option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {

					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						
						$price = $this->currency->format($this->tax->calculate($option_value['price'], $product['tax_class_id'], $this->config->get('config_tax')));
						
						$option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
							'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
							'price'                   => $price,
							'price_prefix'            => $option_value['price_prefix']
						);
					}
				}
			
			
				$options[] = array(
					'product_option_id' => $option['product_option_id'],
					'option_id'         => $option['option_id'],
					'name'              => $option['name'],
					'type'              => $option['type'],
					'option_value'      => $option_value_data,
					'required'          => $option['required']
				);
			}					
			
		}

		#minimum
		if ($product['minimum']) {
			$minimum = $product['minimum'];
		} else {
			$minimum = 1;
		}

		$json['product'] = array(
			'id'                            => $product['product_id'],
			'name'                          => $product['name'],
			'manufacturer'                  => $product['manufacturer'],
			'model'                         => $product['model'],
			'reward'                        => $product['reward'],
			'points'                        => $product['points'],
			'quantity'						=> $product['quantity'],
			'minimum'						=> $product['minimum'],
			'image'                         => $image,
			'images'                        => $images,
			'price'                         => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'))),
			'special'                       => $special,
			'discounts'                     => $discounts,
			'options'                       => $options,
			'date_added'  					=> $product['date_added'],
			'date_modified' 				=> $product['date_modified'],
			'minimum'                       => $minimum,
			'rating'                        => (int)$product['rating'],
			'description'                   => html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8'),
			'attribute_groups'              => $this->model_catalog_product->getProductAttributes($product['product_id'])
		);


		if ($this->debug) {
			echo '<pre>';
			print_r($json);
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}


	/**
	 * Generation of category tree
	 * 
	 * @param  int    $parent  Prarent category id
	 * @param  int    $level   Depth level
	 * @return array           Tree
	 */
	private function getCategoriesTree($parent = 0, $level = 1) {
		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		
		$result = array();

		$categories = $this->model_catalog_category->getCategories();

		echo "<pre>";print_r($categories);exit;

		if ($categories && $level > 0) {
			$level--;

			foreach ($categories as $category) {

				if ($category['image']) {
					$image = $this->model_tool_image->resize($category['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
				} else {
					$image = false;
				}

				$result[] = array(
					'category_id'   => $category['category_id'],
					'parent_id'     => $category['parent_id'],
					'name'          => $category['name'],
					'image'         => $image,
					'href'          => $this->url->link('product/category', 'category_id=' . $category['category_id']),
					'categories'    => $this->getCategoriesTree($category['category_id'], $level)
				);
			}

			return $result;
		}
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



	// pre event handler for admin/view/extension/export_import/before
	public function theme(&$view, &$args) {
		// This is only here for compatibility with old templates
		if (substr($view, -3) == 'tpl') {
			$view = substr($view, 0, -3);
		}

		// get the old PHP template engine to work
		if (is_file(DIR_TEMPLATE . $view . '.twig')) {
			$this->config->set('template_engine', 'twig');
		} elseif (is_file(DIR_TEMPLATE . $view . '.tpl')) {
			$this->config->set('template_engine', 'template');
		}
	}
}
?>