<?php
class ControllerModuleBestDiscount extends Controller {
	public function index($setting) {
	
		static $module = 0;
		
		$this->load->language('module/best_discount');
		
		$data['text_hours'] = $this->language->get('text_hours');
		$data['text_days'] = $this->language->get('text_days');
		$data['text_minutes'] = $this->language->get('text_minutes');
		$data['text_seconds'] = $this->language->get('text_seconds');
		$data['text_your_save'] = $this->language->get('text_your_save');
		$data['text_quantity_apply'] = $this->language->get('text_quantity_apply');
		
		$data['heading_title'] = $setting['title'][$this->config->get('config_language_id')];
		
		$data['slider_setting'] = array();
		
		$data['slider_setting'] = $this->config->get('slider_setting');
		
		$label_setting = array();
		
		$label_setting = $this->config->get('best_discount_label_setting');
		
		$data['button_cart'] = $this->language->get('button_cart');
		
		$data['label_opening'] = $label_setting['opening'][$this->config->get('config_language_id')];
		
		$data['label_upcoming'] = $label_setting['upcoming'][$this->config->get('config_language_id')];
		
		$data['label_closed'] = $label_setting['closed'][$this->config->get('config_language_id')];
		
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/best_discount.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/best_discount.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/bossthemes/best_discount.css');
		}
		
		$this->load->model('module/best_discount'); 
		
		$this->load->model('tool/image');

		$data['products'] = array();

		$products = $setting['best_discount_product'];		

		if (empty($setting['limit'])) {
			$setting['limit'] = 5;
		}
		
		$limit = (int)$setting['limit'];
		
		$products = array_slice($products, 0, $limit);
		
		
		
		foreach ($products as $product_id) {
			$product_info = $this->model_module_best_discount->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price_original = $this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax'));
					$discount_original = $price_original;
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
				
				if ((float)$product_info['discount']) {
					
					$discount_original = $this->tax->calculate($product_info['discount'], $product_info['tax_class_id'], $this->config->get('config_tax'));
					
					$discount = $this->currency->format($this->tax->calculate($product_info['discount'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					
				} else {
					$discount = false;
				}
					
				$money_save_original = $price_original-$discount_original;
				
				$money_save = $this->currency->format($money_save_original);
				
				$percent_original = round((float)($money_save_original/$price_original*100),2);
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
				
				$product_discounts = $this->model_module_best_discount->getProductDiscounts($product_id);
				
				if(!empty($product_discounts)){
					$date_end = '1970-01-01';
					$discount_qty = 0;
					$discount_status = $data['label_upcoming'];
					foreach ($product_discounts  as $product_discount) {
					
						if (($product_discount['date_start'] == '0000-00-00' || $product_discount['date_start'] <= date('Y-m-d')) && ($product_discount['date_end'] == '0000-00-00' || $product_discount['date_end'] > date('Y-m-d'))) {
						
							$discount_status = $data['label_opening'];
							
							$date_end = $product_discount['date_end'];
							
							$discount_qty = $product_discount['quantity'];
							
							break;
						}else{
							
							if($product_discount['date_start'] > date('Y-m-d')){
								$discount_status = $data['label_upcoming'].' <span class="small">('.$product_discount['date_start'].')</span>';
								$date_end = $product_discount['date_start'];
							}
							if($product_discount['date_end'] <= date('Y-m-d')){
								$discount_status = $data['label_closed'].' <span class="small">('.$product_discount['date_end'].')</span>';
								$date_end = '0000-00-00';
							}
							$discount_qty = $product_discount['quantity'];
							//$discount = $product_discount['price'];
						}	
					}
						
					$data['products'][] = array(
						'product_id' => $product_info['product_id'],
						'thumb'   	 => $image,
						'name'    	 => $product_info['name'],
						'price'   	 => $price,
						'discount'   => $discount,
						'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, 200),
						'discount_status' => $discount_status,
						'date_end'   => $date_end,
						'discount_qty'   => $discount_qty,
						'money_save' 	 => $money_save,
						'percent_save' 	 => $percent_original,
						'rating'     => $rating,
						'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
						'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
						'minimum'     => $product_info['minimum'] > 0 ? $product_info['minimum'] : 1,
					);
				
				}
			}
		}
		
		$data['module'] = $module++; 
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/best_discount.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/best_discount.tpl', $data);
		} else {
			return $this->load->view('default/template/module/best_discount.tpl', $data);
		}
	}
	
	public function discountProduct(){
		
		$product_id = $this->request->get['product_id'];
		
		$this->load->model('module/best_discount'); 
		
		$this->language->load('module/best_discount');
		
		$data['text_hours'] = $this->language->get('text_hours');
		$data['text_days'] = $this->language->get('text_days');
		$data['text_minutes'] = $this->language->get('text_minutes');
		$data['text_seconds'] = $this->language->get('text_seconds');
		$data['text_discount_status'] = $this->language->get('text_discount_status');
		$data['text_expires'] = $this->language->get('text_expires');
			
		$product_discounts = $this->model_module_best_discount->getProductDiscountDetails($product_id);
		
		if(!empty($product_discounts)){
		
			if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/best_discount.css')) {
				$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/best_discount.css');
			} else {
				$this->document->addStyle('catalog/view/theme/default/stylesheet/bossthemes/best_discount.css');
			}
		
			$label_setting = array();
	
			$label_setting = $this->config->get('best_discount_label_setting');
			
			$data['label_opening'] = $label_setting['opening'][$this->config->get('config_language_id')];
			
			$data['label_upcoming'] = $label_setting['upcoming'][$this->config->get('config_language_id')];
			
			$data['label_closed'] = $label_setting['closed'][$this->config->get('config_language_id')];
		
			$date_end = '1970-01-01';
			
			$discount_status = $data['label_upcoming'];
			
			foreach ($product_discounts  as $product_discount) {
				if (($product_discount['date_start'] == '0000-00-00' || $product_discount['date_start'] <= date('Y-m-d')) && ($product_discount['date_end'] == '0000-00-00' || $product_discount['date_end'] >= date('Y-m-d'))) {
					$discount_status = $data['label_opening'];
					$date_end = $product_discount['date_end'];
					break;
				}else{
					
					if($product_discount['date_start'] > date('Y-m-d')){
						$discount_status = $data['label_upcoming'].' <span class="small">('.$product_discount['date_start'].')</span>';
						$date_end = $product_discount['date_start'];
					}
					if($product_discount['date_end'] < date('Y-m-d')){
						$discount_status = $data['label_closed'].' <span class="small">('.$product_discount['date_end'].')</span>';
						$date_end = '';
					}
				}	
			}
			
			$data['discount_status'] = $discount_status;
			$data['date_end'] = $date_end;
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/best_discount_product.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/best_discount_product.tpl', $data);
			} else {
				return $this->load->view('default/template/module/best_discount_product.tpl', $data);
			}
		}
	}
}
?>