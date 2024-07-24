<?php
class ControllerExtensionApptuseProducts extends Controller { 
	private $error = array();
	private $ssl = 'SSL';

		# Use print_r($json) instead json_encode($json)
	private $debug = false;
	/**
	 * 
	 */
	private function init() {

		$this->response->addHeader('Content-Type: application/json');
	}

	public function __construct( $registry ) {
		parent::__construct( $registry );
		$this->ssl = true;
	}


	public function index() {
		$this->init();

		$store_data = array();

		$store_data['products'] = $this->products();

		$this->response->setOutput(json_encode($store_data));	
    }



public function categories() {		
		
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
				$cat = array();
				$cat['category'] = $categoryArray;
				$this->response->setOutput(json_encode($cat));	
	
	
	}

	public function currency(){
		
		$this->load->model('localisation/currency');
	
		$currency_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "currency ORDER BY title ASC");

		foreach ($query->rows as $result) {
			
			if($result['status'] && $result['value'] == 1 ){

				$this->response->setOutput($result['code']); 
				break;

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

		$start_index = $_GET['start_index'];
		$set_length = $_GET['set_length'];

		# -- $_GET params ------------------------------
		
		if (isset($this->request->get['category'])) {
			$category_id = $this->request->get['category'];
		} else {
			$category_id = 0;
		}

		# -- End $_GET params --------------------------

		//fetch all product data
		$products = $this->model_catalog_product->getProducts(array(
				'start' => $start_index,
				'limit' => $set_length
			));

		foreach ($products as $product) {
		
		
			//product image 
			if ($product['image']) {
				$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = "";
			}

			//special 
			if(count($product['special']) > 0){
				$special  = $this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax'));
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

			//categories 
			$categories = $this->model_catalog_product->getCategories($product['product_id']) ;

			$category_id = ':';

			if(count($categories) > 0 ){
				
				foreach ($categories as $key => $value) {
				    $category_id .= $value['category_id'].":";
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



	public function count(){

		$this->init();
		$this->load->model('catalog/product');
		$response['number_of_products'] = $this->model_catalog_product->getTotalProducts();
	    $this->response->setOutput(json_encode($response));
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







	public function getNotifications() {
		sleep(1); // give the data some "feel" that its not in our system
		$this->load->model('extension/export_import');
		$this->load->language( 'extension/export_import' );
		$response = $this->model_extension_export_import->getNotifications();
		$json = array();
		if ($response===false) {
			$json['message'] = '';
			$json['error'] = $this->language->get( 'error_notifications' );
		} else {
			$json['message'] = $response;
			$json['error'] = '';
		}
		$this->response->setOutput(json_encode($json));
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