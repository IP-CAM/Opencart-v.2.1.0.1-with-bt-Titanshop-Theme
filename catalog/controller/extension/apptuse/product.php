<?php
class ControllerExtensionApptuseProduct extends Controller { 
	private $error = array();
	private $ssl = 'SSL';

	public function __construct( $registry ) {
		parent::__construct( $registry );
		$this->ssl = true;
	}

	# Use print_r($json) instead json_encode($json)
	private $debug = true;
	/**
	 * 
	 */
	private function init() {

		$this->response->addHeader('Content-Type: application/json');
	}



	public function index() {

		$this->product();
    }


	public function pnumber(){

		$this->init();
		$this->load->model('catalog/product');
		$response['number_of_products'] = $this->model_catalog_product->getTotalProducts();
	    $this->response->setOutput(json_encode($response));
	} 



	public function product( $product_id = 0 ) {

		$this->init();
		$this->load->model('catalog/product');
		$this->load->model('tool/image');

		$this->config->set('config_image_product_width', 512); 
		$this->config->set('config_image_product_height',512);

		$json = array();

		# -- $_GET params ------------------------------
		
		if (isset($this->request->get['id'])) {
			$product_id = $this->request->get['id'];
		} else {
			$product_id = 0;
		}

		# -- End $_GET params --------------------------

		$product = $this->model_catalog_product->getProduct($product_id);
		
		
		//product image 
		if ($product['image']) {
			$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
		} else {
			$image = '';
		}


		#additional images
		$additional_images = $this->model_catalog_product->getProductImages($product['product_id']);
		
		$images = array();
		
		$images[] = $image;

		foreach ($additional_images as $additional_image) {
			
			$images[] = $this->model_tool_image->resize($additional_image['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
		}



		#special
		if ((float)$product['special']) {
			$special = $this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax'));
		} else {
			$special = false;
		}


		//best_price
		$best_price = 0 ; 

		$price  = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));

		if(!($special == false)){
			$best_price = $special;
		}else{
			$best_price = $price;
			$special='';
		}

		#discounts
		$discounts = array();
		$data_discounts =  $this->model_catalog_product->getProductDiscounts($product['product_id']);

		foreach ($data_discounts as $discount) {
			$discounts[] = array(
				'quantity' => $discount['quantity'],
				'price'    => $this->tax->calculate($discount['price'], $product['tax_class_id'], $this->config->get('config_tax'))
			);
		}

		#options
		$options = array();
		$variant_array = array();
		$option_array = array();

		$option_data_array = array();

		$position_value = 0 ;  

		foreach ($this->model_catalog_product->getProductOptions($product['product_id']) as $option) { 

			$position_value++;
			
			if( isset($option['product_option_value']) && sizeof($option['product_option_value']) > 0 ){
	
				$option_value_data = array();
				$option_value_data_name = array();

				foreach ($option['product_option_value'] as $option_value) {

					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						
						$option_value_data_name []= $option_value['name'];

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
			
			
				$option_data_array[]=array(
					'id' 				=> $option['option_id'],
					'name'              => $option['name'],
					'position'			=> $position_value,
					'product_id'		=> $product['product_id'],
					'values'			=> $option_value_data_name


					);

				$options[] = array(
					'product_option_id' => $option['product_option_id'],
					'option_id'         => $option['option_id'],
					'name'              => $option['name'],
					'type'              => $option['type'],
					'option_value'      => $option_value_data,
					'required'          => $option['required']
				);

				array_push($variant_array, $option_value_data);
			    array_push($option_array, $option['product_option_id']);
			}					
			
		}

		$variant_data = $this->array_cartesian_product($variant_array,$option_array,$product['product_id'],$price,$special,$product['quantity']);

		$variant_count = count($variant_data);	


		$optionscount  = count($option_data_array); 



		if(!( $optionscount  > 0 )){

				$option_data_array[]=array(
					'id' 				=> $product['product_id'],
					'name'              => "Title",
					'position'			=> 1,
					'product_id'		=> $product['product_id'],
					'values'			=> array("Default Title")

					);
		}
		//attribute groups
		$attribute_groups_array = array();
			foreach($this->model_catalog_product->getProductAttributes($product['product_id']) as $attribute_groups){
				$attribute_data = array();
				foreach($attribute_groups['attribute'] as $attributes){
			    	$attribute_data[$attributes['name']] = $attributes['text'];
				}

				$attribute_groups_array[$attribute_groups['name']] = $attribute_data;
			}


		#minimum
		if ($product['minimum']) {
			$minimum = $product['minimum'];
		} else {
			$minimum = 1;
		}

		if($product['quantity']  > 0 ){
			$availability = 1; 
		}else{
			$availability = 0;
		}

		

		$json= array(
			'product_id'                    => $product['product_id'],
			'name'                          => $product['name'],
			'description'                   => html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8'),	
			'image'                         => $image,
			'other_images'                  => $images,
			'price'                         => $price,
			'special'                       => $special,
			'best_price' 					=> $best_price,
			'quantity'						=> $product['quantity'],
			'options'                       => $option_data_array,
			'variants'						=> $variant_data,
			'optionscount' 					=> $optionscount,
			'variantscount'					=> $variant_count,
			'brand'							=> $product['manufacturer'],
			'product_code'					=> '',
			'attribute_groups'              => (count($attribute_groups_array)==0)?"":json_encode($attribute_groups_array),
			'availability'					=> 1 , 
			'shareurl'						=> $this->url->link('product/product', 'product_id=' . $product['product_id']),

			'discounts'                     => $discounts,
			
			'date_added'  					=> $product['date_added'],
			'date_modified' 				=> $product['date_modified'],
			"call_for_pricing" 				=>0
			
		);


			$this->response->setOutput(json_encode($json));
		
	}





		private function array_cartesian_product($arrays,$option_array,$product_id,$price,$special,$quantity){
	        
	        global $current_price,$current_special,$current_best_price,$variant_count;
	        
	        $this->current_best_price = "";
	        $this->current_price = "";
	        $this->current_special = "";
	        $variant_id = "";
	        $result = array();
	        $arrays = array_values($arrays);
	        $sizeIn = sizeof($arrays);

	        $size = $sizeIn > 0 ? 1 : 0;

	        foreach ($arrays as $array){
	   			
	   			if(sizeof($array) > 0 ){

	            	$size = $size * sizeof($array);
	        	}
	        }

	        $this->variant_count = $size;
	        
	        if($sizeIn>0){

	            for ($i = 0; $i < $size; $i ++)
	            {
	                $curr_price = "";
	                $curr_special = "";
	                $current_variant = array();
	                $other_values = array();
	                $title = "";
	                $curr_price = $price;
	                $curr_special = $special;
	                $result[$i] = "";
	                $count = 1;
	                $variant_id = "";

	                for ($j = 0; $j < $sizeIn; $j ++)
	                {
		                    
		                    $title .= current($arrays[$j])['name'];
		                    array_push($other_values, "option[".$option_array[$j]."]:".current($arrays[$j])['product_option_value_id']);
		                    $variant_id .= current($arrays[$j])['product_option_value_id'];
		                    //$other_values["option[".$option_array[$j]."]"] = current($arrays[$j])['product_option_value_id'];
		                    if(current($arrays[$j])['price']!=='false'){
		                        if(current($arrays[$j])['price_prefix'] === "+"){
		                                $curr_price += str_replace(",","",trim(current($arrays[$j])['price'],"Rs."));
		                                if($curr_special != ""){
		                                        $curr_special += str_replace(",","",trim(current($arrays[$j])['price'],"Rs."));
		                                }
		                        }else{
		                                $curr_price -= str_replace(",","",trim(current($arrays[$j])['price'],"Rs."));
		                                if($curr_special != ""){
		                                        $curr_special -= str_replace(",","",trim(current($arrays[$j])['price'],"Rs."));
		                                }
		                        }
		                    }
		                    if($count != $sizeIn){
		                      $title .= " / ";
		                    }
		                    $count++;
	                }
	                for ($j = ($sizeIn -1); $j >= 0; $j --)
	                {
	                    if (next($arrays[$j]))
	                        break;
	                    elseif (isset ($arrays[$j]))
	                        reset($arrays[$j]);
	                }

	                $current_variant['product_id'] = $product_id;
	                $current_variant['variant_id'] = $variant_id;
	                $current_variant['options'] = explode(" / ",$title);
	                $current_variant['title'] = $title;
	                $current_variant['other_values'] = $other_values;
	                if($i==0){
	                    $this->current_price = $curr_price;
	                    $this->current_special = $curr_special;
	                    if($curr_special!=""){
	                        $this->current_best_price = $curr_special;
	                    }else{
	                        $this->current_best_price = $curr_price;
	                    }
	                }
	                $current_variant['price'] = $curr_price;
	                $current_variant['special'] = $curr_special;
	                $current_variant['quantity'] = $quantity;
	                $current_variant['position'] = $i+1;
	                $result[$i] = $current_variant;
	            }
	        }
	        else{

	            $this->variant_count = 1;
	            $this->current_price = $price;
	            $this->current_special = $special;
	            if($special!=""){
	                $this->current_best_price = $special;
	            }else{
	                $this->current_best_price = $price;
	            }
	            $current_variant['product_id'] = $product_id;
	            $current_variant['variant_id'] = $product_id."786";
	            $current_variant['title'] = "Default Title";
	            $current_variant['options'] = array("Default Title");
	            $current_variant['other_values'] = array();
	            $current_variant['price'] = $price;
	            $current_variant['special'] = $special;
	            $current_variant['quantity'] = $quantity;
	            $current_variant['position'] = 1;
	            $result[0] = $current_variant;
	        }

	        return $result;
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