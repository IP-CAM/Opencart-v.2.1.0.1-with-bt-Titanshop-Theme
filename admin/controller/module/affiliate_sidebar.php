<?php
class ControllerModuleAffiliateSideBar extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/affiliate_sidebar');

		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->addStyle('view/javascript/ciaccountdashboard/colorpicker/css/colorpicker.css');
  		$this->document->addScript('view/javascript/ciaccountdashboard/colorpicker/js/colorpicker.js');

		$this->load->model('setting/setting');

		if(isset($this->request->get['store_id'])) {
			$store_id = $this->request->get['store_id'];
		}else{
			$store_id = 0;
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('affiliate_sidebar', $this->request->post, $store_id);	

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_both'] = $this->language->get('text_both');

		$data['text_type_setting'] = $this->language->get('text_type_setting');
		$data['text_value_setting'] = $this->language->get('text_value_setting');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_title_bgcolor'] = $this->language->get('entry_title_bgcolor');
		$data['entry_title_color'] = $this->language->get('entry_title_color');
		$data['entry_link_bgcolor'] = $this->language->get('entry_link_bgcolor');
		$data['entry_link_color'] = $this->language->get('entry_link_color');
		$data['entry_hover_bgcolor'] = $this->language->get('entry_hover_bgcolor');
		$data['entry_hover_color'] = $this->language->get('entry_hover_color');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_link_title'] = $this->language->get('entry_link_title');
		$data['entry_link'] = $this->language->get('entry_link');
		$data['entry_iconclass'] = $this->language->get('entry_iconclass');
		$data['entry_action'] = $this->language->get('entry_action');
		$data['entry_logged'] = $this->language->get('entry_logged');
		
		$data['help_title_bgcolor'] = $this->language->get('help_title_bgcolor');
		$data['help_title_color'] = $this->language->get('help_title_color');
		$data['help_link_bgcolor'] = $this->language->get('help_link_bgcolor');
		$data['help_link_color'] = $this->language->get('help_link_color');
		$data['help_hover_bgcolor'] = $this->language->get('help_hover_bgcolor');
		$data['help_hover_color'] = $this->language->get('help_hover_color');
		$data['help_title'] = $this->language->get('help_title');
		$data['help_sort_order'] = $this->language->get('help_sort_order');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_customer_title'] = $this->language->get('tab_customer_title');
		$data['tab_title'] = $this->language->get('tab_title');

		$data['button_link_title_add'] = $this->language->get('button_link_title_add');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_add_title'] = $this->language->get('button_add_title');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['link_title'])) {
			$data['error_link_title'] = $this->error['link_title'];
		} else {
			$data['error_link_title'] = array();
		}

		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = array();
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/affiliate_sidebar', 'token=' . $this->session->data['token'], true)
		);

		$data['store_id'] = $store_id;

		if(isset($store_id)) {
			$data['action'] = $this->url->link('module/affiliate_sidebar', 'token=' . $this->session->data['token'] . '&store_id='. $store_id, true);
		} else{
			$data['action'] = $this->url->link('module/affiliate_sidebar', 'token=' . $this->session->data['token'], true);
		}	

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'] . '&type=module', true);

		$this->load->model('setting/store');
		$data['stores'] = $this->model_setting_store->getStores();

		if ($this->request->server['REQUEST_METHOD'] != 'POST') {
			$module_info = $this->model_setting_setting->getSetting('affiliate_sidebar',  $store_id);
		}	

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['affiliate_sidebar_status'])) {
			$data['affiliate_sidebar_status'] = $this->request->post['affiliate_sidebar_status'];
		} elseif (!empty($module_info)) {
			$data['affiliate_sidebar_status'] = $module_info['affiliate_sidebar_status'];
		} else {
			$data['affiliate_sidebar_status'] = '';
		}
		if (isset($this->request->post['affiliate_sidebar_titlebgcolor'])) {
			$data['affiliate_sidebar_titlebgcolor'] = $this->request->post['affiliate_sidebar_titlebgcolor'];
		} elseif (!empty($module_info)) {
			$data['affiliate_sidebar_titlebgcolor'] = $module_info['affiliate_sidebar_titlebgcolor'];
		} else {
			$data['affiliate_sidebar_titlebgcolor'] = '';
		}
		if (isset($this->request->post['affiliate_sidebar_titlecolor'])) {
			$data['affiliate_sidebar_titlecolor'] = $this->request->post['affiliate_sidebar_titlecolor'];
		} elseif (!empty($module_info)) {
			$data['affiliate_sidebar_titlecolor'] = $module_info['affiliate_sidebar_titlecolor'];
		} else {
			$data['affiliate_sidebar_titlecolor'] = '';
		}
		if (isset($this->request->post['affiliate_sidebar_linkbgcolor'])) {
			$data['affiliate_sidebar_linkbgcolor'] = $this->request->post['affiliate_sidebar_linkbgcolor'];
		} elseif (!empty($module_info)) {
			$data['affiliate_sidebar_linkbgcolor'] = $module_info['affiliate_sidebar_linkbgcolor'];
		} else {
			$data['affiliate_sidebar_linkbgcolor'] = '';
		}
		if (isset($this->request->post['affiliate_sidebar_linkcolor'])) {
			$data['affiliate_sidebar_linkcolor'] = $this->request->post['affiliate_sidebar_linkcolor'];
		} elseif (!empty($module_info)) {
			$data['affiliate_sidebar_linkcolor'] = $module_info['affiliate_sidebar_linkcolor'];
		} else {
			$data['affiliate_sidebar_linkcolor'] = '';
		}
		if (isset($this->request->post['affiliate_sidebar_hoverbgcolor'])) {
			$data['affiliate_sidebar_hoverbgcolor'] = $this->request->post['affiliate_sidebar_hoverbgcolor'];
		} elseif (!empty($module_info)) {
			$data['affiliate_sidebar_hoverbgcolor'] = $module_info['affiliate_sidebar_hoverbgcolor'];
		} else {
			$data['affiliate_sidebar_hoverbgcolor'] = '';
		}
		if (isset($this->request->post['affiliate_sidebar_hovercolor'])) {
			$data['affiliate_sidebar_hovercolor'] = $this->request->post['affiliate_sidebar_hovercolor'];
		} elseif (!empty($module_info)) {
			$data['affiliate_sidebar_hovercolor'] = $module_info['affiliate_sidebar_hovercolor'];
		} else {
			$data['affiliate_sidebar_hovercolor'] = '';
		}
		if (isset($this->request->post['affiliate_sidebar_hovercolor'])) {
			$data['affiliate_sidebar_hovercolor'] = $this->request->post['affiliate_sidebar_hovercolor'];
		} elseif (!empty($module_info)) {
			$data['affiliate_sidebar_hovercolor'] = $module_info['affiliate_sidebar_hovercolor'];
		} else {
			$data['affiliate_sidebar_hovercolor'] = '';
		}

		if (isset($this->request->post['affiliate_sidebar_title'])) {
			$titles = $this->request->post['affiliate_sidebar_title'];
		} elseif (!empty($module_info)) {
			$titles = (!empty($module_info['affiliate_sidebar_title'])) ? (array)$module_info['affiliate_sidebar_title'] : array();
		} else {
			$titles = array();
		}

		function titlesSort($a, $b) {
		    return $a['sort_order'] - $b['sort_order'];
		}

		uasort($titles, 'titlesSort');

		$data['titles'] = array();
		
		foreach($titles as $key =>  $title) {			

			$data['titles'][$key] = array(
				'link_title'		=> isset($title['link_title']) ?  $title['link_title'] : array(),
				'description'		=> isset($title['description']) ?  $title['description'] : array(),
				'status'			=> isset($title['status']) ?  $title['status'] : '',
				'sort_order'		=> isset($title['sort_order']) ?  $title['sort_order'] : '',
			);
		}

		$data['config_language_id'] = $this->config->get('config_language_id');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/affiliate_sidebar.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/affiliate_sidebar')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (isset($this->request->post['affiliate_sidebar_title'])) {
			foreach ($this->request->post['affiliate_sidebar_title'] as $row => $description) {
				
				foreach ($description['description'] as $language_id => $value) {
					if ((utf8_strlen($value['title']) < 1) || (utf8_strlen($value['title']) > 128)) {
						$this->error['title'][$row][$language_id] = $this->language->get('error_title');
					}
				}
				if(isset($description['link_title'])) {
					foreach ($description['link_title'] as $link_title_row => $link_title) {
						foreach ($link_title['affiliate_sidebar_link_title_description'] as $language_id => $link_title_description) {
						
							if ((utf8_strlen($link_title_description['name']) < 1) || (utf8_strlen($link_title_description['name']) > 128)) {
								$this->error['link_title'][$row][$link_title_row][$language_id] = $this->language->get('error_link_title');
							}
						}
					}
				}
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}
}