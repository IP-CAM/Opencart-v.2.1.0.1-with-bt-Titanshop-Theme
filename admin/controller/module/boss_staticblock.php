<?php
class ControllerModuleBossStaticblock extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/boss_staticblock');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('boss_staticblock', $this->request->post);		
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->response->redirect($this->url->link('module/boss_staticblock', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_browse'] = $this->language->get('text_browse');
        $data['text_clear'] = $this->language->get('text_clear');
        $data['text_image_manager'] = $this->language->get('text_image_manager');
		$data['text_content_top'] = $this->language->get('text_content_top');
		$data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$data['text_header'] = $this->language->get('text_header');
		$data['text_footer'] = $this->language->get('text_footer');		
		$data['text_column_left'] = $this->language->get('text_column_left');
		$data['text_column_right'] = $this->language->get('text_column_right');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_all'] = $this->language->get('text_all');
		
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_module'] = $this->language->get('button_add_module');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_add_new_block'] = $this->language->get('button_add_new_block');
		
		$data['entry_content'] = $this->language->get('entry_content');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_position'] = $this->language->get('entry_position');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		//tab
		$data['tab_content'] = $this->language->get('tab_content');		
		$data['tab_header'] = $this->language->get('tab_header');		
		$data['tab_footer'] = $this->language->get('tab_footer');
		$data['tab_footer_1'] = $this->language->get('tab_footer_1');
		$data['tab_footer_2'] = $this->language->get('tab_footer_2');
		$data['tab_footer_3'] = $this->language->get('tab_footer_3');
		$data['tab_footer_4'] = $this->language->get('tab_footer_4');		
		$data['tab_header_callus'] = $this->language->get('tab_header_callus');
		$data['tab_header_default'] = $this->language->get('tab_header_default');
		$data['tab_header_default_currency'] = $this->language->get('tab_header_default_currency');
		$data['tab_header_default_language'] = $this->language->get('tab_header_default_language');
		$data['tab_header_default_cart'] = $this->language->get('tab_header_default_cart');
		$data['tab_header_default_search'] = $this->language->get('tab_header_default_search');
		$data['tab_header_default_welcome'] = $this->language->get('tab_header_default_welcome');
		$data['tab_header_default_home'] = $this->language->get('tab_header_default_home');
		$data['tab_header_default_wish_list'] = $this->language->get('tab_header_default_wish_list');
		$data['tab_header_default_account'] = $this->language->get('tab_header_default_account');
		$data['tab_header_default_shopping_cart'] = $this->language->get('tab_header_default_shopping_cart');
		$data['tab_header_default_checkout'] = $this->language->get('tab_header_default_checkout');
		$data['tab_footer_link'] = $this->language->get('tab_footer_link');
		$data['tab_footer_information'] = $this->language->get('tab_footer_information');
		$data['tab_footer_link_my_account'] = $this->language->get('tab_footer_link_my_account');
		$data['tab_footer_link_extras'] = $this->language->get('tab_footer_link_extras');
		$data['tab_footer_link_service'] = $this->language->get('tab_footer_link_service');
		$data['tab_footer_link_info'] = $this->language->get('tab_footer_link_info');
		$data['tab_footer_link_account'] = $this->language->get('tab_footer_link_account');
		$data['tab_footer_link_order'] = $this->language->get('tab_footer_link_order');
		$data['tab_footer_link_wish_list'] = $this->language->get('tab_footer_link_wish_list');
		$data['tab_footer_link_newsletter'] = $this->language->get('tab_footer_link_newsletter');
		$data['tab_footer_link_brands'] = $this->language->get('tab_footer_link_brands');
		$data['tab_footer_link_gift'] = $this->language->get('tab_footer_link_gift');
		$data['tab_footer_link_affiliates'] = $this->language->get('tab_footer_link_affiliates');
		$data['tab_footer_link_specials'] = $this->language->get('tab_footer_link_specials');
		$data['tab_footer_link_contact'] = $this->language->get('tab_footer_link_contact');
		$data['tab_footer_link_returns'] = $this->language->get('tab_footer_link_returns');
		$data['tab_footer_link_site'] = $this->language->get('tab_footer_link_site');
		$data['tab_footer_link_framework'] = $this->language->get('tab_footer_link_framework');
		
		$data['tab_block'] = $this->language->get('tab_block');
		
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
			'href'      => $this->url->link('module/boss_staticblock', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('module/boss_staticblock', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$data['boss_staticblock_header'] = array();
		
		if (isset($this->request->post['boss_staticblock_header'])) {
            $boss_staticblock_header = $this->request->post['boss_staticblock_header'];
		} elseif ($this->config->get('boss_staticblock_header')) { 
            $boss_staticblock_header = $this->config->get('boss_staticblock_header');
		} else{
			$boss_staticblock_header = '';
		}
		
		$data['boss_staticblock_header'] = $boss_staticblock_header;
		
		
		$data['boss_staticblock_footer_1'] = array();
		
		if (isset($this->request->post['boss_staticblock_footer_1'])) {
            $boss_staticblock_footer_1 = $this->request->post['boss_staticblock_footer_1'];
		} elseif ($this->config->get('boss_staticblock_footer_1')) { 
            $boss_staticblock_footer_1 = $this->config->get('boss_staticblock_footer_1');
		} else{
			$boss_staticblock_footer_1 = '';
		}
		
		$data['boss_staticblock_footer_1'] = $boss_staticblock_footer_1;
		
		$data['boss_staticblock_footer_2'] = array();
		
		if (isset($this->request->post['boss_staticblock_footer_2'])) {
            $boss_staticblock_footer_2 = $this->request->post['boss_staticblock_footer_2'];
		} elseif ($this->config->get('boss_staticblock_footer_2')) { 
            $boss_staticblock_footer_2 = $this->config->get('boss_staticblock_footer_2');
		}else{
			$boss_staticblock_footer_2 = '';
		}
		
		$data['boss_staticblock_footer_2'] = $boss_staticblock_footer_2;
		
		$data['boss_staticblock_footer_3'] = array();
		
		if (isset($this->request->post['boss_staticblock_footer_3'])) {
            $boss_staticblock_footer_3 = $this->request->post['boss_staticblock_footer_3'];
		} elseif ($this->config->get('boss_staticblock_footer_3')) { 
            $boss_staticblock_footer_3 = $this->config->get('boss_staticblock_footer_3');
		}else{
			$boss_staticblock_footer_3 = '';
		}
		
		$data['boss_staticblock_footer_3'] = $boss_staticblock_footer_3;
		$data['boss_staticblock_footer_4'] = array();
		
		if (isset($this->request->post['boss_staticblock_footer_4'])) {
            $boss_staticblock_footer_4 = $this->request->post['boss_staticblock_footer_4'];
		} elseif ($this->config->get('boss_staticblock_footer_4')) { 
            $boss_staticblock_footer_4= $this->config->get('boss_staticblock_footer_4');
		}else{
			$boss_staticblock_footer_4 = '';
		}
		
		$data['boss_staticblock_footer_4'] = $boss_staticblock_footer_4;
		
		
		
		$data['boss_staticblock_footer_default'] = array();		
		if (isset($this->request->post['boss_staticblock_footer_default'])) {
            $boss_staticblock_footer_default = $this->request->post['boss_staticblock_footer_default'];
		} elseif ($this->config->get('boss_staticblock_footer_default')) { 
            $boss_staticblock_footer_default= $this->config->get('boss_staticblock_footer_default');
		}else{
			$boss_staticblock_footer_default = '';
		}		
		$data['boss_staticblock_footer_default'] = $boss_staticblock_footer_default;
		
		$data['boss_staticblock_header_default'] = array();		
		if (isset($this->request->post['boss_staticblock_header_default'])) {
            $boss_staticblock_header_default = $this->request->post['boss_staticblock_header_default'];
		} elseif ($this->config->get('boss_staticblock_header_default')) { 
            $boss_staticblock_header_default= $this->config->get('boss_staticblock_header_default');
		}else{
			$boss_staticblock_header_default = '';
		}		
		$data['boss_staticblock_header_default'] = $boss_staticblock_header_default;
		
		if (isset($this->request->post['boss_staticblock_status'])) {
			$data['boss_staticblock_status'] = $this->request->post['boss_staticblock_status'];
		} else {
			$data['boss_staticblock_status'] = $this->config->get('boss_staticblock_status');
		}
		
		$data['modules'] = array();
		
		if (isset($this->request->post['boss_staticblock_module'])) {
			$data['modules'] = $this->request->post['boss_staticblock_module'];
		} elseif ($this->config->get('boss_staticblock_module')) { 
			$data['modules'] = $this->config->get('boss_staticblock_module');
		}else{
			$data['modules'] = array();
		}
		
		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->load->model('setting/store');
		
		$data['stores'] = $this->model_setting_store->getStores();
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
						
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/boss_staticblock.tpl', $data));
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/boss_staticblock')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	private function getIdLayout($layout_name) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "layout WHERE LOWER(name) = LOWER('".$layout_name."')");
		return (int)$query->row['layout_id'];
	}
	
	public function install(){
		$this->load->model('setting/setting');
		
		$this->load->model('localisation/language');
			
		$languages = $this->model_localisation_language->getLanguages();
		
		$array_description1 = array();
		$array_description2 = array();
		$array_description3456 = array();
		$array_description7 = array();
		$array_description8 = array();
		
		$boss_staticblock_header = array();
		
		$boss_staticblock_footer_1 = array();
		$boss_staticblock_footer_2 = array();
		$boss_staticblock_footer_3 = array();
		$boss_staticblock_footer_4 = array();
		
		
						
		foreach($languages as $language){
			$array_description1{$language['language_id']} = '&lt;div class=&quot;boss-static-content-freeshpping not-animated&quot; data-animate=&quot;fadeInLeft&quot; data-delay=&quot;200&quot;&gt;
&lt;div class=&quot;icon&quot;&gt;&lt;span&gt;&lt;i class=&quot;fa fa-truck&quot;&gt;&lt;span&gt;test&lt;/span&gt;&lt;/i&gt;&lt;/span&gt;&lt;/div&gt;

&lt;div class=&quot;text&quot;&gt;
&lt;h1&gt;Free shipping on orders over $100&lt;/h1&gt;

&lt;p&gt;Nam eu dui elementum felis dictum cursus done convallis tristique rutrum vitae&lt;/p&gt;
&lt;/div&gt;
&lt;/div&gt;';
			$array_description2{$language['language_id']} = '&lt;div class=&quot;boss-static-category&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;banner category&quot;&gt;&lt;img alt=&quot;banner&quot; src=&quot;http://demo.bossthemes.com/fashionist/image/data/bt_fashionist/banner_category.jpg&quot; title=&quot;&quot; /&gt;&lt;span class=&quot;hover hover1&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover2&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover3&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover4&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover5&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover6&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover7&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover8&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover9&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover10&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover11&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover12&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover13&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover14&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover15&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover16&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover17&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover18&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover19&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover20&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover21&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover22&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover23&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover24&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover25&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover26&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover27&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover28&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover29&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover30&quot;&gt;test&lt;/span&gt; &lt;span class=&quot;detail&quot;&gt;&lt;span class=&quot;text text1&quot;&gt;African&lt;/span&gt;&lt;span class=&quot;text text2&quot;&gt;Fashion&lt;span&gt;week&lt;/span&gt;&lt;/span&gt;&lt;span class=&quot;text text3&quot;&gt;August 15 - 18, 2015&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;';
			$array_description3456{$language['language_id']} = '&lt;div class=&quot;boss-static-left&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Banner&quot;&gt;&lt;img alt=&quot;Banner&quot; src=&quot;http://demo.bossthemes.com/fashionist/image/data/bt_fashionist/banner_left.jpg&quot; /&gt;&lt;/a&gt;&lt;/div&gt;';
			$array_description7{$language['language_id']} = '&lt;div class=&quot;boss-static-content&quot;&gt;
&lt;ul&gt;
	&lt;li class=&quot;block block-1 col-xs-24 col-sm-16 col-md-16  not-animated&quot; data-animate=&quot;fadeInLeft&quot; data-delay=&quot;200&quot;&gt;
	&lt;div class=&quot;block-home&quot;&gt;&lt;img alt=&quot;TitanShop&quot; src=&quot;http://demo.bossthemes.com/fashionist/image/data/bt_fashionist/bg_block.jpg&quot; title=&quot;TitanShop&quot; /&gt; &lt;span class=&quot;cover&quot;&gt;test&lt;/span&gt;
	&lt;div class=&quot;detail detail1&quot;&gt;&lt;span&gt;Fashion night out&lt;/span&gt;&lt;/div&gt;

	&lt;div class=&quot;detail detail2&quot;&gt;&lt;span&gt;eu diam cursus eget conval&lt;/span&gt;&lt;/div&gt;

	&lt;div class=&quot;detail detail3&quot;&gt;&lt;span&gt;Sed fringilla augue in metus tempus porta dictum ut lectus nulla lobor&lt;/span&gt;&lt;/div&gt;

	&lt;div class=&quot;label_text&quot;&gt;&lt;span class=&quot;text1&quot;&gt;Join Us&lt;/span&gt;&lt;span class=&quot;text2&quot;&gt;now&lt;/span&gt;&lt;/div&gt;
	&lt;/div&gt;
	&lt;/li&gt;
	&lt;li class=&quot;block block-2 col-xs-24 col-sm-8 col-md-8 not-animated&quot; data-animate=&quot;fadeInLeft&quot; data-delay=&quot;400&quot;&gt;
	&lt;div class=&quot;block-home&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Banner&quot;&gt;&lt;img alt=&quot;Banner&quot; src=&quot;http://demo.bossthemes.com/fashionist/image/data/bt_fashionist/home_banner.jpg&quot; /&gt;&lt;/a&gt;
	&lt;div class=&quot;detail detail4&quot;&gt;&lt;span&gt;Fashion / style&lt;/span&gt;&lt;/div&gt;
	&lt;/div&gt;
	&lt;/li&gt;
&lt;/ul&gt;
&lt;/div&gt;';
			$array_description8{$language['language_id']} = '&lt;div class=&quot;boss-static-content2 not-animated&quot; data-animate=&quot;fadeInLeft&quot; data-delay=&quot;200&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Banner&quot;&gt;&lt;img alt=&quot;Banner&quot; src=&quot;http://demo.bossthemes.com/fashionist/image/data/bt_fashionist/banner_large.jpg&quot; /&gt;&lt;span class=&quot;hover hover1&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover2&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover3&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover4&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover5&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover6&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover7&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover8&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover9&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover10&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover11&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover12&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover13&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover14&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover15&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover16&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover17&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover18&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover19&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover20&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover21&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover22&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover23&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover24&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover25&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover26&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover27&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover28&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover29&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;hover hover30&quot;&gt;test&lt;/span&gt; &lt;span class=&quot;detail detail1&quot;&gt;Do you like &lt;span&gt;Our Work&lt;/span&gt; so far?&lt;/span&gt; &lt;span class=&quot;detail detail2&quot;&gt;Let&rsquo;s talk about &lt;span&gt;Your project!&lt;/span&gt;&lt;/span&gt; &lt;span class=&quot;block_button&quot;&gt;&lt;span&gt;get in touch&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;';
			
				
			$boss_staticblock_header{$language['language_id']} = '&lt;p&gt;Call Us &lt;span&gt;1800 - 111 - Fashion&lt;/span&gt;&lt;/p&gt;';
				
			$boss_staticblock_footer_1{$language['language_id']} = '&lt;div class=&quot;boss-static-footer-text not-animated&quot; data-animate=&quot;fadeInLeft&quot; data-delay=&quot;200&quot;&gt;
&lt;h3&gt;TESTIMONIALS&lt;/h3&gt;

&lt;p&gt;Cras fringilla varius tortor. Duis nunc orci, iaculis at porttitor at, egestas eget enim. Nam sodales felis nunc, ut commodo mauris imperdiet sed. Aenean fringilla sodales volutpat. Sed scelerisque tortor eget dui iaculis, at convallis felis ornare.&lt;/p&gt;
&lt;span&gt;FUSCE PHARET&lt;/span&gt;&lt;/div&gt;';
			$boss_staticblock_footer_2{$language['language_id']} = '&lt;div class=&quot;boss-static-footer-about-us column col-xs-24 col-sm-6 col-md-6 not-animated&quot; data-animate=&quot;fadeInLeft&quot; data-delay=&quot;200&quot;&gt;
&lt;div class=&quot;content&quot;&gt;
&lt;h3&gt;ABOUT US&lt;/h3&gt;

&lt;p&gt;Pellentesque a lobortis ligula. Phasellus aliquam, orci et congue bibendum, elit orci facilisis turpis, viate suscipit nisi neque a enim massa loreser&lt;/p&gt;
&lt;/div&gt;

&lt;h3 class=&quot;connect&quot;&gt;CONNECT WITH US&lt;/h3&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a class=&quot;icon1&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;&lt;i class=&quot;fa fa-facebook&quot;&gt;&lt;span&gt;test&lt;/span&gt;&lt;/i&gt;&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a class=&quot;icon2&quot; href=&quot;#&quot; title=&quot;Vimeo&quot;&gt;&lt;i class=&quot;fa fa-vimeo-square&quot;&gt;&lt;span&gt;test&lt;/span&gt;&lt;/i&gt;&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a class=&quot;icon3&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;&lt;i class=&quot;fa fa-twitter&quot;&gt;&lt;span&gt;test&lt;/span&gt;&lt;/i&gt;&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a class=&quot;icon4&quot; href=&quot;#&quot; title=&quot;Pinterest&quot;&gt;&lt;i class=&quot;fa fa-pinterest&quot;&gt;&lt;span&gt;test&lt;/span&gt;&lt;/i&gt;&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/div&gt;';
			$boss_staticblock_footer_3{$language['language_id']} = '&lt;div class=&quot;boss-static-footer-link not-animated&quot; data-animate=&quot;fadeInLeft&quot; data-delay=&quot;200&quot;&gt;
&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot; title=&quot;&quot;&gt;Fusce Uttest &lt;/a&gt;&lt;span&gt;|&lt;/span&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot; title=&quot;&quot;&gt;Diam Tempor &lt;/a&gt;&lt;span&gt;|&lt;/span&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot; title=&quot;&quot;&gt;Justo Malesuada&lt;/a&gt;&lt;span&gt;|&lt;/span&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot; title=&quot;&quot;&gt;Volutpat &lt;/a&gt;&lt;span&gt;|&lt;/span&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot; title=&quot;&quot;&gt;Aliquam Auctor &lt;/a&gt;&lt;span&gt;|&lt;/span&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot; title=&quot;&quot;&gt;Elit Quis&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/div&gt;';
			$boss_staticblock_footer_4{$language['language_id']} = '&lt;div class=&quot;boss-static-footer-payment not-animated&quot; data-animate=&quot;fadeInLeft&quot; data-delay=&quot;400&quot;&gt;
&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot; title=&quot;Payment&quot;&gt;&lt;img alt=&quot;Payment&quot; class=&quot;cs-tooltip&quot; data-original-title=&quot;Payment&quot; data-placement=&quot;top&quot; data-toggle=&quot;tooltip&quot; src=&quot;http://demo.bossthemes.com/fashionist/image/data/bt_fashionist/payment_03.png&quot; /&gt;&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot; title=&quot;Visa&quot;&gt;&lt;img alt=&quot;Visa&quot; class=&quot;cs-tooltip&quot; data-original-title=&quot;Visa&quot; data-placement=&quot;top&quot; data-toggle=&quot;tooltip&quot; src=&quot;http://demo.bossthemes.com/fashionist/image/data/bt_fashionist/payment_04.png&quot; /&gt;&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot; title=&quot;American Express&quot;&gt;&lt;img alt=&quot;American Express&quot; class=&quot;cs-tooltip&quot; data-original-title=&quot;American Express&quot; data-placement=&quot;top&quot; data-toggle=&quot;tooltip&quot; src=&quot;http://demo.bossthemes.com/fashionist/image/data/bt_fashionist/payment_05.png&quot; /&gt;&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot; title=&quot;Master Card&quot;&gt;&lt;img alt=&quot;Master Card&quot; class=&quot;cs-tooltip&quot; data-original-title=&quot;Master Card&quot; data-placement=&quot;top&quot; data-toggle=&quot;tooltip&quot; src=&quot;http://demo.bossthemes.com/fashionist/image/data/bt_fashionist/payment_06.png&quot; /&gt;&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/div&gt;';
			
        }
		$data = array(
			'boss_staticblock_module' 	=> array(
				1 => array('description' => $array_description1, 'store_id' => array(0=>0)),
				2 => array('description' => $array_description2, 'store_id' => array(0=>0)),
				3 => array('description' => $array_description3456, 'store_id' => array(0=>0)),
				4 => array('description' => $array_description3456, 'store_id' => array(0=>0)),
				5 => array('description' => $array_description3456, 'store_id' => array(0=>0)),
				6 => array('description' => $array_description7, 'store_id' => array(0=>0)),
				7 => array('description' => $array_description8, 'store_id' => array(0=>0)),
				
			),			
			'boss_staticblock_header'			=> array('content' => $boss_staticblock_header,'store_id' => array(0=>0)),
			'boss_staticblock_footer_1'			=> array('content' => $boss_staticblock_footer_1, 'store_id' => array(0=>0)),
			'boss_staticblock_footer_2'			=> array('content' => $boss_staticblock_footer_2, 'store_id' => array(0=>0)),
			'boss_staticblock_footer_3'			=> array('content' => $boss_staticblock_footer_3, 'store_id' => array(0=>0)),
			'boss_staticblock_footer_4'			=> array('content' => $boss_staticblock_footer_4, 'store_id' => array(0=>0)),
			
			'boss_staticblock_header_default'			=> array(
				'currency' => 1,
				'language' => 1,
				'cart' => 1,
				'search' => 1,
				'welcome' => 1,
				'home' => 0,
				'wish_list' => 1,
				'account' => 1,
				'shopping_cart' => 0,
				'checkout' => 1,
				),
			'boss_staticblock_footer_default'			=> array(
				'info' => 1,
				'account' => 1,
				'order' => 1,
				'wish_list' => 1,
				'newsletter' => 1,
				'brands' => 1,
				'gift' => 1,
				'affiliates' => 1,
				'specials' => 1,
				'contact' => 1,
				'returns' => 1,
				'site' => 1,
				'frame' => 1,
				),
		);

		$this->model_setting_setting->editSetting('boss_staticblock', $data);		
	}
}
?>