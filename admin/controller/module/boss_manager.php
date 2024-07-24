<?php
class ControllerModuleBossManager extends Controller {
	private $error = array(); 

	public function index() {   
		$this->language->load('module/boss_manager');
		$this->document->addStyle('view/stylesheet/bossthemes/boss_manager.css');
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('boss_manager', $this->request->post);
			$custom_data = isset($this->request->post['custom'])?:array();	
			$custom_font_data = isset($this->request->post['custom_font'])?:array();
			$this->saveXML($this->request->post['xml'],$custom_data);
			$this->saveXMLFont($this->request->post['xml_font'],$custom_font_data);
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('module/boss_manager', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_content_top'] = $this->language->get('text_content_top');
		$data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$data['text_column_left'] = $this->language->get('text_column_left');
		$data['text_column_right'] = $this->language->get('text_column_right');

		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_position'] = $this->language->get('entry_position');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_module'] = $this->language->get('button_add_module');
		$data['button_remove'] = $this->language->get('button_remove');
		
		$data['arrstatus'] = array(
			"0" => $this->language->get('text_disabled'),
			"1" => $this->language->get('text_enabled')
		);
		
		$data['arrshow'] = array(
			"use_tab" => $this->language->get('text_tab'),
			"use_accordion" => $this->language->get('text_accordion')
		);
		$data['arrview'] = array(
			"grid" => $this->language->get('text_grid'),
			"list" => $this->language->get('text_list'),
			"both_list" => $this->language->get('text_both_list'),
			"both_grid" => $this->language->get('text_both_grid')
		);
		$data['arrgridview'] = array(
			"6_4_3" => $this->language->get('text_large'),
			"4_3_cs5" => $this->language->get('text_medium'),
			"3_cs5_2" => $this->language->get('text_small')
		);
		$data['token'] = $this->session->data['token'];
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/boss_manager', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['action'] = $this->url->link('module/boss_manager', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->load->model('tool/image');

		$data['boss_manager'] = array();
		
		$data['option'] = array();
		$data['layout'] = array();
		$data['footer_about'] = array();
		
		
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
		if (isset($this->request->post['boss_manager_footer_about'])) {
			$data['footer_about'] = $this->request->post['boss_manager_footer_about'];
		} elseif ($this->config->get('boss_manager_footer_about')) { 
			$data['footer_about'] = $this->config->get('boss_manager_footer_about');
		}
		
		$footer_about = $data['footer_about'];
		
		if (isset($footer_about['image_link']) && file_exists(DIR_IMAGE . $footer_about['image_link'])) {
			$data['about_image'] = $this->model_tool_image->resize($footer_about['image_link'], 100, 100);
		} else {
			$data['about_image'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		$data['footer_contact'] = array();
		
		if (isset($this->request->post['boss_manager_footer_contact'])) {
			$data['footer_contact'] = $this->request->post['boss_manager_footer_contact'];
		} elseif ($this->config->get('boss_manager_footer_contact')) { 
			$data['footer_contact'] = $this->config->get('boss_manager_footer_contact');
		}
		
		$data['footer_social'] = array();
		
		if (isset($this->request->post['boss_manager_footer_social'])) {
			$data['footer_social'] = $this->request->post['boss_manager_footer_social'];
		} elseif ($this->config->get('boss_manager_footer_social')) { 
			$data['footer_social'] = $this->config->get('boss_manager_footer_social');
		}
		
		$data['footer_payment'] = array();
		
		if (isset($this->request->post['boss_manager_footer_payment'])) {
			$data['footer_payment'] = $this->request->post['boss_manager_footer_payment'];
		} elseif ($this->config->get('boss_manager_footer_social')) { 
			$data['footer_payment'] = $this->config->get('boss_manager_footer_payment');
		}
		
		$data['footer_powered'] = array();
		
		if (isset($this->request->post['boss_manager_footer_powered'])) {
			$data['footer_powered'] = $this->request->post['boss_manager_footer_powered'];
		} elseif ($this->config->get('boss_manager_footer_powered')) { 
			$data['footer_powered'] = $this->config->get('boss_manager_footer_powered');
		}
		
		$boss_manager = array();

		if (isset($this->request->post['boss_manager'])) {
			$boss_manager = $this->request->post['boss_manager'];
		} elseif ($this->config->get('boss_manager')) { 
			$boss_manager = $this->config->get('boss_manager');
		}

		$data['boss_manager'] = $boss_manager;
		
		if(!empty($boss_manager)){
			$data['option'] = $boss_manager['option'];
			$data['status'] = $boss_manager['status'];
			$data['layout'] = $boss_manager['layout'];
			$data['other'] = $boss_manager['other'];
			$data['color'] = $boss_manager['color'];
		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/boss_manager.tpl', $data));

	}
	
	protected function saveXML($groups,$customs) {
		//echo "<pre>"; print_r($customs); echo "</pre>";die();
		$xml = new DOMDocument('1.0','UTF-8');

		//create item_setting
		$root = $xml->createElement('items_setting');
		$xml->appendChild($root);	
		
		foreach($groups as $group){
			//create groups
			$groups_xml = $xml->createElement('groups');
			$root->appendChild($groups_xml);
			
			//create title		
			$title = $xml->createElement('title');
			$groups_xml->appendChild($title);
			//add value
			$title->appendChild($xml->createTextNode($group['title'][0]));
			for($i=0; $i< count($group['text']) ; $i++){ 
				//create item
				$item = $xml->createElement('item');
				$groups_xml->appendChild($item);		
				
				//create text		
				$text = $xml->createElement('text');
				$item->appendChild($text);
				//add value
				$text->appendChild($xml->createTextNode($group['text'][$i]));
				
				//create name		
				$name = $xml->createElement('name');
				$item->appendChild($name);
				//add value
				$name->appendChild($xml->createTextNode($group['name'][$i]));
				
				//create class		
				$class = $xml->createElement('class');
				$item->appendChild($class);
				//add value
				$class->appendChild($xml->createTextNode($group['class'][$i]));
				
				//create value		
				$value = $xml->createElement('value');
				$item->appendChild($value);
				//add value
				$value->appendChild($xml->createTextNode($group['value'][$i]));
				
				//create style		
				$style = $xml->createElement('style');
				$item->appendChild($style);
				//add value
				$style->appendChild($xml->createTextNode($group['style'][$i]));
			}
		}
		
		//create customs
		$customs_xml = $xml->createElement('customs');
		$root->appendChild($customs_xml);
		foreach($customs as $custom){ 		
			//create item
			$item = $xml->createElement('item');
			$customs_xml->appendChild($item);		
			
			//create text		
			$text = $xml->createElement('text');
			$item->appendChild($text);
			//add value
			$text->appendChild($xml->createTextNode($custom['text']));
			
			//create class		
			$class = $xml->createElement('class');
			$item->appendChild($class);
			//add value
			$class->appendChild($xml->createTextNode($custom['class']));
			
			//create value		
			$value = $xml->createElement('value');
			$item->appendChild($value);
			//add value
			$value->appendChild($xml->createTextNode($custom['value']));
			
			//create important		
			$important = $xml->createElement('important');
			$item->appendChild($important);
			//add value
			$important->appendChild($xml->createTextNode($custom['important']));
			
			//create style		
			$style = $xml->createElement('style');
			$item->appendChild($style);
			//add value
			$style->appendChild($xml->createTextNode($custom['style']));
		}
		//nice output
		$xml->formatOutput = true;
		$xml->save("../config_xml/color_setting.xml"); 
	}
	protected function saveXMLFont($groups,$customs) {
		//echo "<pre>"; print_r($customs); echo "</pre>";die();
		$xml = new DOMDocument('1.0','UTF-8');

		//create item_setting
		$root = $xml->createElement('items_setting');
		$xml->appendChild($root);	
		
		foreach($groups as $group){
			//create groups
			$groups_xml = $xml->createElement('groups');
			$root->appendChild($groups_xml);
			
			//create title		
			$title = $xml->createElement('title');
			$groups_xml->appendChild($title);
			//add value
			$title->appendChild($xml->createTextNode($group['title'][0]));
			for($i=0; $i< count($group['text']) ; $i++){ 
				//create item
				$item = $xml->createElement('item');
				$groups_xml->appendChild($item);		
				
				//create text		
				$text = $xml->createElement('text');
				$item->appendChild($text);
				//add value
				$text->appendChild($xml->createTextNode($group['text'][$i]));
				
				//create style		
				$style = $xml->createElement('style');
				$item->appendChild($style);
				//add value
				$style->appendChild($xml->createTextNode($group['style'][$i]));
				
				//create size		
				$size = $xml->createElement('size');
				$item->appendChild($size);
				//add value
				$size->appendChild($xml->createTextNode($group['size'][$i]));
				
				//create weight		
				$weight = $xml->createElement('weight');
				$item->appendChild($weight);
				//add value
				$weight->appendChild($xml->createTextNode($group['weight'][$i]));
				
				//create transform		
				$transform = $xml->createElement('transform');
				$item->appendChild($transform);
				//add value
				$transform->appendChild($xml->createTextNode($group['transform'][$i]));
				
				//create class_name		
				$class_name = $xml->createElement('class_name');
				$item->appendChild($class_name);
				//add value
				$class_name->appendChild($xml->createTextNode($group['class_name'][$i]));
			}
		}
		
		//create customs
		$customs_xml = $xml->createElement('customs');
		$root->appendChild($customs_xml);
		foreach($customs as $custom){ 		
			//create item
			$item = $xml->createElement('item');
			$customs_xml->appendChild($item);		
			
			//create text		
			$text = $xml->createElement('text');
			$item->appendChild($text);
			//add value
			$text->appendChild($xml->createTextNode($custom['text']));
			
			//create style		
			$style = $xml->createElement('style');
			$item->appendChild($style);
			//add value
			$style->appendChild($xml->createTextNode($custom['style']));
			
			//create size		
			$size = $xml->createElement('size');
			$item->appendChild($size);
			//add value
			$size->appendChild($xml->createTextNode($custom['size']));
			
			//create weight		
			$weight = $xml->createElement('weight');
			$item->appendChild($weight);
			//add value
			$weight->appendChild($xml->createTextNode($custom['weight']));
			
			//create transform		
			$transform = $xml->createElement('transform');
			$item->appendChild($transform);
			//add value
			$transform->appendChild($xml->createTextNode($custom['transform']));
			
			//create class_name		
			$class_name = $xml->createElement('class_name');
			$item->appendChild($class_name);
			//add value
			$class_name->appendChild($xml->createTextNode($custom['class_name']));
		}
		//nice output
		$xml->formatOutput = true;
		$xml->save("../config_xml/font_setting.xml"); 
	}
	public function changeTemplate(){
		
		$this->document->addStyle('view/stylesheet/bossthemes/boss_manager.css');
		if (isset($this->request->get['value']) && !empty($this->request->get['value'])) {
			$value = $this->request->get['value'];			
		} else {
			$value = 1;
		}
		
		if($value==1){
			$data['objXML'] = simplexml_load_file("../config_xml/theme_color_1.xml");
		}else if($value==2){
			$data['objXML'] = simplexml_load_file("../config_xml/theme_color_2.xml"); 
		}else if($value==3){
			$data['objXML'] = simplexml_load_file("../config_xml/theme_color_3.xml"); 
		}else if($value==4){
			$data['objXML'] = simplexml_load_file("../config_xml/theme_color_4.xml"); 
		}else if($value==5){
			$data['objXML'] = simplexml_load_file("../config_xml/theme_color_5.xml"); 
		}else if($value==6){
			$data['objXML'] = simplexml_load_file("../config_xml/theme_color_6.xml"); 
		}
	
		$json = array();			
	
		$json['output'] = $this->load->view('module/boss_changetemplate.tpl', $data);
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/boss_manager')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	public function addLayout($data) {
	
		$name = $this->db->escape($data['name']);
		
		$this->deleteLayout($name);
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "layout SET layout_id	= '" . (int)$data['layout_id'] . "', name = '" . $this->db->escape($data['name']) . "'");
	}
    
    private function deleteLayout($layout_name) {
	
    	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout WHERE name = '".$layout_name."'");
		
    	if($query->num_rows){
    		$layout_id = $query->row['layout_id'];
			
    		$this->db->query("DELETE FROM " . DB_PREFIX . "layout WHERE layout_id = '" . (int)$layout_id . "'");
    	}
   	}
	
	private function deleteModuleLayout() {
			
    	$this->db->query("TRUNCATE TABLE " . DB_PREFIX . "layout_module");
    	
   	}
	
	private function uninstallModule($code) {
			
    	$this->db->query("DELETE FROM " . DB_PREFIX . "extension WHERE code = '" . $this->db->escape($code) . "'");
    	
   	}
	
	private function installModule($data) {
	
		$this->load->model('user/user_group');
		
		foreach($data as $code){
		
			$this->uninstallModule($code);
			
			$this->db->query("INSERT INTO " . DB_PREFIX . "extension SET type	= 'module', code = '" . $this->db->escape($code) . "'");
		
			$this->model_user_user_group->addPermission($this->user->getId(), 'access', 'module/'.$code);
		}
    	
   	}
	
	private function deleteDataModule($code) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "module WHERE code = '" . $this->db->escape($code). "'");
   	}
	
	private function addDataModule($data,$code_module) {
	
		$this->deleteDataModule($code_module);
		
		foreach($data as $code){
			
			if(!empty($code['setting'])){
				$this->db->query("INSERT INTO " . DB_PREFIX . "module SET name = '" . $this->db->escape($code['name']) . "', code = '" . $this->db->escape($code['code']) . "',setting = '" . $code['setting'] . "'");
			
				$module_id = '.'.$this->db->getLastId();
			}else{
				$module_id = '';
			}
			
			if(isset($code['layout'])){
				foreach($code['layout'] as $layout){
					$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . $this->db->escape($layout['layout_id']) . "', code = '" . $this->db->escape($code['code'].$module_id) . "', position = '" . $this->db->escape($layout['position']) . "', sort_order = '" . (int)$layout['sort_order'] . "'");
				}
			}else{
				$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . $this->db->escape($code['layout_id']) . "', code = '" . $this->db->escape($code['code'].$module_id) . "', position = '" . $this->db->escape($code['position']) . "', sort_order = '" . (int)$code['sort_order'] . "'");
			}
		}
    	
   	}
	
	private function getIdLayout($layout_name) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "layout WHERE LOWER(name) = LOWER('".$layout_name."')");
		return (int)$query->row['layout_id'];
	}
	
	public function install() {
	
		
		
		$alllayout = array ('layout_id' => 9999, 'name' => 'All Layouts');
		
		$this->addLayout($alllayout);
		
		$dataModule = array("bestseller","category","boss_manufacturer","boss_zoom","boss_alphabet","boss_featured","boss_tagcloud","boss_staticblock","boss_quickshop","boss_revolutionslider","boss_menucategory","boss_carousel","boss_procate","boss_newmegamenu","newslettersubscribe","best_discount","html");
        	
		$this->deleteModuleLayout();
		
		$this->installModule($dataModule);
		
		$this->load->model('localisation/language');
			
		$languages = $this->model_localisation_language->getLanguages();
		
		$about_title = array();
		$about_content = array();
		$contact_title = array();
		$contact_content = array();
		$social_title = array();
		$footer_powered = array();
		
		foreach($languages as $language){
			$about_title{$language['language_id']} = 'About Us';
			$about_content{$language['language_id']} = '&lt;div class=&quot;about-store&quot;&gt;&lt;span&gt;Lorem ipsum dolor consectetur&lt;/span&gt;
&lt;p&gt;Adipiscing elit. Nam nisl nisl frgilla non euismod rutrum at metus non euismod rutrum at metus [...]&lt;/p&gt;

&lt;/div&gt;';
			$contact_title{$language['language_id']} = 'Contact us';
			$contact_content{$language['language_id']} = '&lt;div class=&quot;contact-us not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;300&quot;&gt;
&lt;div class=&quot;address&quot;&gt;
&lt;div class=&quot;image&quot;&gt;&lt;span&gt;test&lt;/span&gt;&lt;/div&gt;

&lt;p&gt;&lt;span&gt;123 Fake Street Name, Fake City, Fake Country.&lt;/span&gt;&lt;/p&gt;
&lt;/div&gt;

&lt;div class=&quot;email&quot;&gt;
&lt;div class=&quot;image&quot;&gt;&lt;span&gt;test&lt;/span&gt;&lt;/div&gt;

&lt;p&gt;&lt;span&gt;support@handcraft.com&lt;/span&gt;&lt;/p&gt;
&lt;/div&gt;

&lt;div class=&quot;font&quot;&gt;
&lt;div class=&quot;image&quot;&gt;&lt;span&gt;test&lt;/span&gt;&lt;/div&gt;

&lt;p&gt;&lt;span&gt;(01) 123 456 HC&lt;/span&gt;&lt;/p&gt;
&lt;/div&gt;
&lt;/div&gt;';
			$social_title{$language['language_id']} = 'Follow us';
			$footer_powered{$language['language_id']} = '&lt;div id=&quot;powered&quot;&gt;
&lt;p&gt;&copy; 2014 Copyright by TitanShop. All rights Reserved.&lt;span&gt;Opencart Themes by &lt;a href=&quot;http://www.bossthemes.com&quot;&gt;Bossthemes.com.&lt;/a&gt;&lt;/span&gt;&lt;/p&gt;
&lt;/div&gt;';
		}
		
		$boss_manager = array(
			'boss_manager' => Array ( 'status' => 1, 'option' => Array ( 'bt_scroll_top' => 1, 'animation' => 1, 'quick_view' => 1 ), 'other' => Array ( 'refine_search' => 1,'show_loading' => 1, 'grid_view' => '6_4_3' ), 'layout' => Array ( 'mode_css' => 'wide', 'box_width' => 1200, 'h_mode_css' => 'inherit', 'h_box_width' => 1180, 'f_mode_css' => 'inherit', 'f_box_width' => 1180 ), 'color' => 1 ),
			'boss_manager_footer_about' => Array ( 'status' => 1, 'image_status' => 1, 'image_link' => 'catalog/bt_titanshop/img_footer.png', 'image_url' => '#', 'about_title' => $about_title, 'about_content' => $about_content),
			'boss_manager_footer_contact' => Array('status' => 0, 'contact_title' => $contact_title, 'contact_content' => $contact_content),
			'boss_manager_footer_social' => Array ('status' => 1, 'title' => $social_title, 'face_url' => '#', 'pinterest_url' => '#', 'twitter_url' => '#', 'googleplus_url' => '#', 'rss_url' => '#', 'youtube_url' => '#'),
			'boss_manager_footer_payment' => Array ( 'status' => 1, 'visa_status' => 'on', 'visa_link' => '','master_status]'=> 'on', 'master_link' => '','merican_status' => 'on', 'merican_link' =>'', 'paypal_status' => 'on', 'paypal_link' => '','skrill_status' => 'on', 'skrill_link' =>''),
			'boss_manager_footer_powered' =>  $footer_powered
		);
		
		$this->load->model('setting/setting');

		$this->model_setting_setting->editSetting('boss_manager', $boss_manager);
			
	}
	
	public function addSampleData(){
		$module_code = $this->request->get['module_code'];
		switch ($module_code) {
			case 'bestseller':
				$bestseller = array(
					0 => array('name'=>'Bestsellers','code'=>'bestseller','setting'=>'a:5:{s:4:"name";s:23:"Bestsellers  - Homepage";s:5:"limit";s:1:"3";s:5:"width";s:3:"100";s:6:"height";s:3:"100";s:6:"status";s:1:"1";}','layout_id'=> $this->getIdLayout("home"),'position'=>'column_left','sort_order'=> 2),
					
				);
				
				$this->addDataModule($bestseller,'bestseller');
				break;
			case 'category':
				$category = array(
					0 => array('name'=>'','code'=>'category','setting'=>'','layout' => array(
						0 => array('layout_id' => $this->getIdLayout("product"),'position'=>'column_left','sort_order'=> 1),
						1 => array('layout_id' => $this->getIdLayout("category"),'position'=>'column_left','sort_order'=> 1)
					)),
					
				);
				
				$this->addDataModule($category,'category');
				break;
		
			case 'boss_featured':
				$boss_featured = array(
					0 => array('name'=>'New Arrivals','code'=>'boss_featured','setting'=>'a:16:{s:4:"name";s:12:"New Arrivals";s:5:"title";a:2:{i:1;s:12:"New Arrivals";i:2;s:12:"New Arrivals";}s:12:"type_product";s:6:"latest";s:11:"image_width";s:3:"210";s:12:"image_height";s:3:"210";s:5:"limit";s:1:"8";s:11:"show_slider";s:1:"1";s:7:"num_row";s:1:"1";s:7:"per_row";s:1:"4";s:8:"nav_type";s:1:"0";s:14:"show_pro_large";s:1:"0";s:12:"product_name";s:0:"";s:10:"product_id";s:0:"";s:9:"img_width";s:3:"380";s:10:"img_height";s:3:"380";s:6:"status";s:1:"1";}','layout_id'=> $this->getIdLayout("home"),'position'=>'content_top','sort_order'=> 2),
					1 => array('name'=>'Featured','code'=>'boss_featured','setting'=>'a:18:{s:4:"name";s:8:"Featured";s:5:"title";a:2:{i:1;s:8:"Featured";i:2;s:8:"Featured";}s:12:"type_product";s:8:"featured";s:8:"featured";s:1:"m";s:16:"product_featured";a:8:{i:0;s:2:"41";i:1;s:2:"40";i:2;s:2:"48";i:3;s:2:"36";i:4;s:2:"30";i:5;s:2:"34";i:6;s:2:"32";i:7;s:2:"43";}s:11:"image_width";s:3:"210";s:12:"image_height";s:3:"210";s:5:"limit";s:1:"8";s:11:"show_slider";s:1:"1";s:7:"num_row";s:1:"1";s:7:"per_row";s:1:"4";s:8:"nav_type";s:1:"0";s:14:"show_pro_large";s:1:"0";s:12:"product_name";s:0:"";s:10:"product_id";s:0:"";s:9:"img_width";s:3:"380";s:10:"img_height";s:3:"380";s:6:"status";s:1:"1";}','layout_id'=> $this->getIdLayout("home"),'position'=>'content_top','sort_order'=> 3),
					2 => array('name'=>'LEATHERS','code'=>'boss_featured','setting'=>'a:16:{s:4:"name";s:8:"LEATHERS";s:5:"title";a:2:{i:1;s:8:"LEATHERS";i:2;s:8:"LEATHERS";}s:12:"type_product";s:7:"popular";s:11:"image_width";s:3:"210";s:12:"image_height";s:3:"210";s:5:"limit";s:1:"8";s:11:"show_slider";s:1:"1";s:7:"num_row";s:1:"1";s:7:"per_row";s:1:"4";s:8:"nav_type";s:1:"0";s:14:"show_pro_large";s:1:"0";s:12:"product_name";s:0:"";s:10:"product_id";s:0:"";s:9:"img_width";s:3:"380";s:10:"img_height";s:3:"380";s:6:"status";s:1:"1";}','layout_id'=> $this->getIdLayout("home"),'position'=>'content_top','sort_order'=> 4),
					3 => array('name'=>'Best sellers','code'=>'boss_featured','setting'=>'a:16:{s:4:"name";s:12:"Best sellers";s:5:"title";a:2:{i:1;s:12:"Best sellers";i:2;s:12:"Best sellers";}s:12:"type_product";s:11:"best_seller";s:11:"image_width";s:3:"210";s:12:"image_height";s:3:"210";s:5:"limit";s:1:"8";s:11:"show_slider";s:1:"1";s:7:"num_row";s:1:"1";s:7:"per_row";s:1:"4";s:8:"nav_type";s:1:"0";s:14:"show_pro_large";s:1:"0";s:12:"product_name";s:0:"";s:10:"product_id";s:0:"";s:9:"img_width";s:3:"380";s:10:"img_height";s:3:"380";s:6:"status";s:1:"1";}','layout_id'=> $this->getIdLayout("home"),'position'=>'content_top','sort_order'=> 5),
					4 => array('name'=>'Special','code'=>'boss_featured','setting'=>'a:16:{s:4:"name";s:7:"Special";s:5:"title";a:2:{i:1;s:7:"Special";i:2;s:7:"Special";}s:12:"type_product";s:7:"special";s:11:"image_width";s:3:"210";s:12:"image_height";s:3:"210";s:5:"limit";s:1:"8";s:11:"show_slider";s:1:"1";s:7:"num_row";s:1:"1";s:7:"per_row";s:1:"4";s:8:"nav_type";s:1:"0";s:14:"show_pro_large";s:1:"0";s:12:"product_name";s:0:"";s:10:"product_id";s:0:"";s:9:"img_width";s:3:"380";s:10:"img_height";s:3:"380";s:6:"status";s:1:"1";}','layout_id'=> $this->getIdLayout("home"),'position'=>'content_top','sort_order'=> 6)
				);
				
				$this->addDataModule($boss_featured,'boss_featured');
				break;
			case 'html':
				$html = array(
					0 => array('name'=>'Left home page','code'=>'html','setting'=>'a:3:{s:4:"name";s:14:"Left home page";s:18:"module_description";a:2:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:718:"&lt;div class=&quot;banner-column not-animated&quot; data-animate=&quot;fadeInLeft&quot; data-delay=&quot;100&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Discount&quot;&gt;&lt;img alt=&quot;TitanShop&quot; src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/home_left1.jpg&quot; title=&quot;TitanShop&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;banner-column not-animated&quot; data-animate=&quot;fadeInLeft&quot; data-delay=&quot;100&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Discount&quot;&gt;&lt;img alt=&quot;TitanShop&quot; src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/home_left2.png&quot; title=&quot;TitanShop&quot;&gt;&lt;/a&gt;&lt;/div&gt;";}i:2;a:2:{s:5:"title";s:0:"";s:11:"description";s:724:"&lt;div class=&quot;banner-column not-animated&quot; data-animate=&quot;fadeInLeft&quot; data-delay=&quot;100&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Discount&quot;&gt;&lt;img alt=&quot;TitanShop&quot; src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/home_left1.jpg&quot; title=&quot;TitanShop&quot;&gt;&lt;/a&gt;&lt;/div&gt;


&lt;div class=&quot;banner-column not-animated&quot; data-animate=&quot;fadeInLeft&quot; data-delay=&quot;100&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Discount&quot;&gt;&lt;img alt=&quot;TitanShop&quot; src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/home_left2.png&quot; title=&quot;TitanShop&quot;&gt;&lt;/a&gt;&lt;/div&gt;";}}s:6:"status";s:1:"1";}','layout_id'=> $this->getIdLayout("home"),'position'=>'column_left','sort_order'=> 3),
					1 => array('name'=>'Content top - category page','code'=>'html','setting'=>'a:3:{s:4:"name";s:27:"Content top - category page";s:18:"module_description";a:2:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:515:"&lt;div data-delay=&quot;400&quot; data-animate=&quot;fadeInUp&quot; class=&quot;block-cate-page fadeInUp animated&quot;&gt;&lt;a title=&quot;banner category&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/banner_ca.jpg&quot; alt=&quot;banner-category&quot;&gt;&lt;span&gt;&lt;img src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/text_banner.png&quot; alt=&quot;banner-category&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;";}i:2;a:2:{s:5:"title";s:0:"";s:11:"description";s:515:"&lt;div data-delay=&quot;400&quot; data-animate=&quot;fadeInUp&quot; class=&quot;block-cate-page fadeInUp animated&quot;&gt;&lt;a title=&quot;banner category&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/banner_ca.jpg&quot; alt=&quot;banner-category&quot;&gt;&lt;span&gt;&lt;img src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/text_banner.png&quot; alt=&quot;banner-category&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;";}}s:6:"status";s:1:"1";}','layout_id'=> $this->getIdLayout("category"),'position'=>'content_top','sort_order'=> 1),
					2 => array('name'=>'Left - Category page','code'=>'html','setting'=>'a:3:{s:4:"name";s:20:"Left - Category page";s:18:"module_description";a:2:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:414:"&lt;div class=&quot;banner-column&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/small_banner1.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;banner-column&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/small_banner2.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;";}i:2;a:2:{s:5:"title";s:0:"";s:11:"description";s:414:"&lt;div class=&quot;banner-column&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/small_banner1.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;banner-column&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/small_banner2.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;";}}s:6:"status";s:1:"1";}','layout_id'=> $this->getIdLayout("category"),'position'=>'column_left','sort_order'=> 7),
					3 => array('name'=>'Footer','code'=>'html','setting'=>'a:3:{s:4:"name";s:6:"Footer";s:18:"module_description";a:2:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:1458:"&lt;div class=&quot;footer-block&quot; data-animate=&quot;fadeInLeft&quot; data-delay=&quot;300&quot;&gt;&lt;div class=&quot;container&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;col-sm-3 col-xs-24&quot;&gt;&lt;div class=&quot;block&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Free Shipping&quot;&gt;&lt;img alt=&quot;Free Shipping&quot; src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/free_ship.jpg&quot;&gt; &lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;col-sm-3 col-xs-24&quot;&gt;&lt;div class=&quot;block&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Return&quot;&gt;&lt;img alt=&quot;Return&quot; src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/return.jpg&quot;&gt; &lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;col-sm-3 col-xs-24&quot;&gt;&lt;div class=&quot;block&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Best product&quot;&gt;&lt;img alt=&quot;Best product&quot; src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/best_product.jpg&quot;&gt; &lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;col-sm-3 col-xs-24&quot;&gt;&lt;div class=&quot;block&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Gift&quot;&gt;&lt;img alt=&quot;Gift&quot; src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/gift.jpg&quot;&gt; &lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;";}i:2;a:2:{s:5:"title";s:0:"";s:11:"description";s:1478:"&lt;div class=&quot;footer-block&quot; data-animate=&quot;fadeInLeft&quot; data-delay=&quot;300&quot;&gt;&lt;div class=&quot;container&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;col-sm-3 col-xs-24&quot;&gt;&lt;div class=&quot;block&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Free Shipping&quot;&gt;&lt;img alt=&quot;Free Shipping&quot; src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/free_ship.jpg&quot;&gt; &lt;/a&gt;&lt;/div&gt;

&lt;/div&gt;

&lt;div class=&quot;col-sm-3 col-xs-24&quot;&gt;&lt;div class=&quot;block&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Return&quot;&gt;&lt;img alt=&quot;Return&quot; src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/return.jpg&quot;&gt; &lt;/a&gt;&lt;/div&gt;

&lt;/div&gt;

&lt;div class=&quot;col-sm-3 col-xs-24&quot;&gt;&lt;div class=&quot;block&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Best product&quot;&gt;&lt;img alt=&quot;Best product&quot; src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/best_product.jpg&quot;&gt; &lt;/a&gt;&lt;/div&gt;

&lt;/div&gt;

&lt;div class=&quot;col-sm-3 col-xs-24&quot;&gt;&lt;div class=&quot;block&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Gift&quot;&gt;&lt;img alt=&quot;Gift&quot; src=&quot;http://demo.bossthemes.com/titanshop_v2/image/catalog/bt_titanshop/gift.jpg&quot;&gt; &lt;/a&gt;&lt;/div&gt;

&lt;/div&gt;

&lt;/div&gt;

&lt;/div&gt;

&lt;/div&gt;";}}s:6:"status";s:1:"1";}','layout_id'=> 9999,'position'=>'btfooter','sort_order'=> 1)
					
				);
				
				$this->addDataModule($html,'html');
				break;
			case 'newslettersubscribe':
				$newslettersubscribe = array(
					0 => array('name'=>'Newsletter','code'=>'newslettersubscribe','setting'=>'a:7:{s:4:"name";s:21:"News letter -  Footer";s:6:"status";s:1:"1";s:5:"title";a:2:{i:1;s:10:"Newsletter";i:2;s:10:"Newsletter";}s:9:"sub_title";a:2:{i:1;s:87:"Sign up to get exclusive offers from our favorite brands and to be well up in the news.";i:2;s:87:"Sign up to get exclusive offers from our favorite brands and to be well up in the news.";}s:18:"option_unsubscribe";s:1:"0";s:31:"newslettersubscribe_mail_status";s:1:"1";s:30:"newslettersubscribe_registered";s:1:"0";}','layout_id'=> 9999,'position'=>'btfooter','sort_order'=> 3),
					
				);
				
				$this->addDataModule($newslettersubscribe,'newslettersubscribe');
				break;
			case 'boss_zoom':
				$boss_zoom = array(
					0 => array('name'=>'Boss Zoom','code'=>'boss_zoom','setting'=>'a:20:{s:4:"name";s:11:"Boss - Zoom";s:27:"boss_zoom_thumb_image_width";s:3:"380";s:28:"boss_zoom_thumb_image_heigth";s:3:"380";s:30:"boss_zoom_addition_image_width";s:3:"100";s:31:"boss_zoom_addition_image_heigth";s:3:"100";s:26:"boss_zoom_zoom_image_width";s:3:"500";s:27:"boss_zoom_zoom_image_heigth";s:3:"500";s:25:"boss_zoom_zoom_area_width";s:3:"228";s:26:"boss_zoom_zoom_area_heigth";s:3:"228";s:28:"boss_zoom_position_zoom_area";s:6:"inside";s:17:"boss_zoom_adjustX";s:1:"0";s:17:"boss_zoom_adjustY";s:1:"0";s:21:"boss_zoom_title_image";s:1:"1";s:23:"boss_zoom_title_opacity";s:3:"0.5";s:14:"boss_zoom_tint";s:4:"#FFF";s:22:"boss_zoom_tint_opacity";s:3:"0.5";s:19:"boss_zoom_softFocus";s:1:"0";s:21:"boss_zoom_lensOpacity";s:3:"0.7";s:20:"boss_zoom_smoothMove";s:1:"3";s:6:"status";s:1:"1";}','layout_id'=> $this->getIdLayout("product"),'position'=>'content_top','sort_order'=> 0),
					
				);
				
				$this->addDataModule($boss_zoom,'boss_zoom');
				break;
			case 'boss_tagcloud':
				$boss_tagcloud = array(
					0 => array('name'=>'Tag Cloud','code'=>'boss_tagcloud','setting'=>'a:7:{s:4:"name";s:20:"Tag Cloud Colum Left";s:20:"boss_tagcloud_module";a:2:{i:1;a:1:{s:5:"title";s:9:"Tag Cloud";}i:2;a:1:{s:5:"title";s:9:"Tag Cloud";}}s:26:"boss_tagcloud_module_limit";s:2:"20";s:29:"boss_tagcloud_module_min_size";s:1:"9";s:29:"boss_tagcloud_module_max_size";s:2:"25";s:32:"boss_tagcloud_module_font_weight";s:6:"normal";s:6:"status";s:1:"1";}','layout' => array(
						0 => array('layout_id' => $this->getIdLayout("product"),'position'=>'column_left','sort_order'=> 5),
						1 => array('layout_id' => $this->getIdLayout("category"),'position'=>'column_left','sort_order'=> 6)
					)),
					
				);
				
				$this->addDataModule($boss_tagcloud,'boss_tagcloud');
				break;
			case 'boss_quickshop':
				$boss_quickshop = array(
					0 => array('name'=>'Quickshop','code'=>'boss_quickshop','setting'=>'a:3:{s:4:"name";s:9:"Quickshop";s:21:"boss_quickshop_module";a:3:{s:5:"title";a:2:{i:1;s:10:"Quick View";i:2;s:10:"Quick View";}s:20:"array_class_selected";s:75:".bt-item-extra &gt; section,.product-layout&gt;div,#product_related &gt; li";s:5:"width";s:3:"900";}s:6:"status";s:1:"1";}','layout' => array(
						0 => array('layout_id' => $this->getIdLayout("home"),'position'=>'content_top','sort_order'=> 0),
						1 => array('layout_id' => $this->getIdLayout("product"),'position'=>'content_top','sort_order'=> 0),
						2 => array('layout_id' => $this->getIdLayout("category"),'position'=>'content_top','sort_order'=> 0)
					))
				);
				
				$this->addDataModule($boss_quickshop,'boss_quickshop');
				break;
			case 'boss_procate':
				$boss_procate = array(
					0 => array('name'=>'Product Category Tab','code'=>'boss_procate','setting'=>'a:14:{s:4:"name";s:28:"Product Category - Home page";s:11:"category_id";a:3:{i:0;s:2:"20";i:1;s:2:"25";i:2;s:2:"18";}s:11:"image_width";s:3:"210";s:12:"image_height";s:3:"210";s:5:"limit";s:1:"8";s:12:"type_display";s:7:"use_tab";s:11:"show_slider";s:1:"1";s:7:"num_row";s:1:"1";s:7:"per_row";s:1:"4";s:8:"nav_type";s:1:"0";s:14:"show_pro_large";s:1:"0";s:9:"img_width";s:3:"380";s:10:"img_height";s:3:"380";s:6:"status";s:1:"1";}','layout_id'=> $this->getIdLayout("home"),'position'=>'content_top','sort_order'=> 1),
					
				);
				
				$this->addDataModule($boss_procate,'boss_procate');
				break;
			case 'boss_newmegamenu':
				$boss_newmegamenu = array(
					0 => array('name'=>'Mega Menu','code'=>'boss_newmegamenu','setting'=>'a:3:{s:4:"name";s:21:"Mega Menu All Layouts";s:6:"status";s:1:"1";s:23:"boss_newmegamenu_module";a:3:{s:10:"menu_width";s:4:"1180";s:10:"num_column";s:1:"6";s:9:"module_id";s:2:"18";}}','layout_id'=> 9999,'position'=>'btmainmenu','sort_order'=> 1),
					
				);
				
				$this->load->model('bossthemes/boss_newmegamenu');
		
				$this->model_bossthemes_boss_newmegamenu->createdb();
				
				$this->addDataModule($boss_newmegamenu,'boss_newmegamenu');
				break;
			case 'boss_menucategory':
				$boss_menucategory = array(
					0 => array('name'=>'Menu Category','code'=>'boss_menucategory','setting'=>'a:4:{s:4:"name";s:23:"Menu Category All Pages";s:6:"status";s:1:"1";s:5:"title";a:2:{i:1;s:10:"Categories";i:2;s:10:"Categories";}s:24:"boss_menucategory_config";a:11:{s:15:"y3rc7idcepfd2t9";a:8:{s:5:"title";a:2:{i:1;s:18:"Nulla ut venenatis";i:2;s:18:"Nulla ut venenatis";}s:4:"icon";s:30:"catalog/bt_titanshop/icon1.png";s:11:"category_id";s:2:"17";s:6:"column";s:1:"2";s:9:"sub_width";s:3:"430";s:7:"bgimage";s:30:"catalog/bt_titanshop/menu1.png";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}s:16:"r4pukhlnz1pjh5mi";a:8:{s:5:"title";a:2:{i:1;s:7:"Cameras";i:2;s:7:"Cameras";}s:4:"icon";s:30:"catalog/bt_titanshop/icon2.png";s:11:"category_id";s:2:"33";s:6:"column";s:1:"2";s:9:"sub_width";s:3:"430";s:7:"bgimage";s:30:"catalog/bt_titanshop/menu3.png";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}s:11:"pmyrlcgxdmo";a:8:{s:5:"title";a:2:{i:1;s:13:"Phasellus leo";i:2;s:13:"Phasellus leo";}s:4:"icon";s:30:"catalog/bt_titanshop/icon3.png";s:11:"category_id";s:2:"24";s:6:"column";s:1:"2";s:9:"sub_width";s:3:"430";s:7:"bgimage";s:30:"catalog/bt_titanshop/menu2.png";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}s:11:"3vpq2tpanbj";a:8:{s:5:"title";a:2:{i:1;s:15:"Scanners Levies";i:2;s:15:"Scanners Levies";}s:4:"icon";s:30:"catalog/bt_titanshop/icon4.png";s:11:"category_id";s:2:"24";s:6:"column";s:1:"2";s:9:"sub_width";s:3:"430";s:7:"bgimage";s:30:"catalog/bt_titanshop/menu2.png";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"7";}s:11:"k2rtuwqu70o";a:8:{s:5:"title";a:2:{i:1;s:8:"Leathers";i:2;s:8:"Leathers";}s:4:"icon";s:30:"catalog/bt_titanshop/icon5.png";s:11:"category_id";s:2:"35";s:6:"column";s:1:"1";s:9:"sub_width";s:3:"210";s:7:"bgimage";s:0:"";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"11";}s:11:"5uzu121itgb";a:8:{s:5:"title";a:2:{i:1;s:17:"Totes &amp; Hobos";i:2;s:17:"Totes &amp; Hobos";}s:4:"icon";s:30:"catalog/bt_titanshop/icon6.png";s:11:"category_id";s:2:"75";s:6:"column";s:1:"2";s:9:"sub_width";s:3:"430";s:7:"bgimage";s:0:"";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"8";}s:11:"3wa3g7akmox";a:8:{s:5:"title";a:2:{i:1;s:12:"Men’s bags";i:2;s:12:"Men’s bags";}s:4:"icon";s:30:"catalog/bt_titanshop/icon7.png";s:11:"category_id";s:2:"18";s:6:"column";s:1:"1";s:9:"sub_width";s:3:"210";s:7:"bgimage";s:0:"";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"9";}s:11:"rq2zvdjlffh";a:8:{s:5:"title";a:2:{i:1;s:18:"Musical instrument";i:2;s:18:"Musical instrument";}s:4:"icon";s:30:"catalog/bt_titanshop/icon8.png";s:11:"category_id";s:2:"24";s:6:"column";s:1:"2";s:9:"sub_width";s:3:"430";s:7:"bgimage";s:30:"catalog/bt_titanshop/menu3.png";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"4";}s:10:"awm76rkq9o";a:8:{s:5:"title";a:2:{i:1;s:16:"Dimanond luctiun";i:2;s:16:"Dimanond luctiun";}s:4:"icon";s:30:"catalog/bt_titanshop/icon9.png";s:11:"category_id";s:2:"35";s:6:"column";s:1:"1";s:9:"sub_width";s:3:"210";s:7:"bgimage";s:0:"";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"10";}s:10:"9803yowwzf";a:8:{s:5:"title";a:2:{i:1;s:14:"Euismod Tellus";i:2;s:14:"Euismod Tellus";}s:4:"icon";s:31:"catalog/bt_titanshop/icon10.png";s:11:"category_id";s:2:"33";s:6:"column";s:1:"2";s:9:"sub_width";s:3:"430";s:7:"bgimage";s:30:"catalog/bt_titanshop/menu1.png";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"5";}s:10:"tt32uzvavf";a:8:{s:5:"title";a:2:{i:1;s:10:"MP3 Player";i:2;s:10:"MP3 Player";}s:4:"icon";s:31:"catalog/bt_titanshop/icon11.png";s:11:"category_id";s:2:"24";s:6:"column";s:1:"2";s:9:"sub_width";s:3:"430";s:7:"bgimage";s:30:"catalog/bt_titanshop/menu3.png";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"6";}}}','layout_id'=> 9999,'position'=>'btheader','sort_order'=> 1),
					
				);
				
				$this->addDataModule($boss_menucategory,'boss_menucategory');
				break;
			case 'boss_manufacturer':
				$boss_manufacturer = array(
					0 => array('name'=>'Manufacturer','code'=>'boss_manufacturer','setting'=>'a:3:{s:4:"name";s:12:"Manufacturer";s:18:"module_description";a:2:{i:1;a:1:{s:5:"title";s:12:"Manufacturer";}i:2;a:1:{s:5:"title";s:12:"Manufacturer";}}s:6:"status";s:1:"1";}','layout' => array(
						0 => array('layout_id' => $this->getIdLayout("category"),'position'=>'column_left','sort_order'=> 3),
						1 => array('layout_id' => $this->getIdLayout("product"),'position'=>'column_left','sort_order'=> 2)
					)),
					
				);
				
				$this->addDataModule($boss_manufacturer,'boss_manufacturer');
				break;
			case 'boss_carousel':
				$boss_carousel = array(
					0 => array('name'=>'Carousel - Footer','code'=>'boss_carousel','setting'=>'a:3:{s:4:"name";s:17:"Carousel - Footer";s:20:"boss_carousel_module";a:4:{s:9:"banner_id";s:1:"8";s:5:"limit";s:2:"12";s:5:"width";s:3:"150";s:6:"height";s:2:"80";}s:6:"status";s:1:"1";}','layout_id'=> 9999,'position'=>'btfooter','sort_order'=> 2),
					
				);
				
				$this->addDataModule($boss_carousel,'boss_carousel');
				break;
			case 'boss_alphabet':
				$boss_alphabet = array(
					0 => array('name'=>'Products by Alphabet','code'=>'boss_alphabet','setting'=>'a:3:{s:4:"name";s:20:"Products by Alphabet";s:20:"boss_alphabet_module";a:1:{s:5:"title";a:2:{i:1;s:20:"Products by Alphabet";i:2;s:20:"Products by Alphabet";}}s:6:"status";s:1:"1";}',
					'layout' => array(
						0 => array('layout_id' => $this->getIdLayout("category"),'position'=>'column_left','sort_order'=> 4),
						1 => array('layout_id' => $this->getIdLayout("product"),'position'=>'column_left','sort_order'=> 3)
					)
					)
					
				);
				
				$this->addDataModule($boss_alphabet,'boss_alphabet');
				break;
			case 'best_discount':
				$best_discount = array(
					0 => array('name'=>'Deals','code'=>'best_discount','setting'=>'a:14:{s:11:"filter_name";s:0:"";s:12:"filter_model";s:0:"";s:12:"filter_price";s:0:"";s:15:"filter_quantity";s:0:"";s:13:"filter_status";s:1:"*";s:4:"name";s:5:"Deals";s:6:"status";s:1:"1";s:7:"product";s:0:"";s:21:"best_discount_product";a:3:{i:0;s:2:"41";i:1;s:2:"40";i:2;s:2:"48";}s:5:"title";a:2:{i:1;s:5:"Deals";i:2;s:5:"Deals";}s:5:"limit";s:1:"3";s:11:"image_width";s:3:"200";s:12:"image_height";s:3:"200";s:13:"label_setting";a:4:{s:11:"show_closed";s:1:"0";s:7:"opening";a:2:{i:1;s:7:"Opening";i:2;s:7:"Opening";}s:8:"upcoming";a:2:{i:1;s:8:"Upcoming";i:2;s:8:"Upcoming";}s:6:"closed";a:2:{i:1;s:6:"Closed";i:2;s:6:"Closed";}}}','layout_id'=> $this->getIdLayout("home"),'position'=>'column_left','sort_order'=> 1),
					
				);
				
				$this->addDataModule($best_discount,'best_discount');
				break;
			case 'boss_revolutionslider':
				$boss_revolutionslider = array(
					0 => array('name'=>'Slider Homepage','code'=>'boss_revolutionslider','setting'=>'a:3:{s:4:"name";s:15:"Slider Homepage";s:6:"status";s:1:"1";s:9:"slider_id";i:1;}','layout_id'=> $this->getIdLayout("home"),'position'=>'btslideshow','sort_order'=> 1),
					
				);
				
				$this->load->model('bossthemes/boss_revolutionslider');
		
				$this->model_bossthemes_boss_revolutionslider->createdb();
				
				$this->load->model('tool/backup');
				
				$content = false;
				
				$content = file_get_contents('../admin/model/bossthemes/slider_default.sql');

				if ($content) {
					$this->model_tool_backup->restore($content);
				}
				
				$this->addDataModule($boss_revolutionslider,'boss_revolutionslider');
				break;
			case 'boss_blog':
				$this->load->model('bossblog/articles');
        
				$this->model_bossblog_articles->checkBlogArticle();
				
				$this->load->model('bossblog/category');
				
				$this->model_bossblog_category->checkBlogCategory();
				
				$this->load->model('bossblog/comment');
				
				$this->model_bossblog_comment->checkBlogComment();
				
				$this->load->model('tool/backup');
				
				$content = false;
				
				$content = file_get_contents('../admin/model/bossthemes/bossblog_default.sql');

				if ($content) {
					$this->model_tool_backup->restore($content);
				}
				
				break;
		}
		$json = array();			
	
		$json['output'] = '<i class="fa fa-check-circle"></i> Install module success! go to module page to see the changes';
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
?>