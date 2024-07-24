<?php
class ControllerModuleHubtalk extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/hubtalk');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		$this->load->model('setting/store');
		$this->load->model('localisation/language');
		$this->load->model('design/layout');



		$this->getInfo();

		$this->enableAllLayouts();

	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			foreach($this->stores as $store) {

				$saveSettings = array();

				foreach($this->languages as $lang) {
					$key = 'module_hubtalk_code_'.$store['id'].'_'.$lang['id'];
					if ($this->request->post[$key]){
						$saveSettings[$key] = $this->request->post[$key];
					}
				}

				$this->model_setting_setting->editSetting('module_hubtalk', $saveSettings, $store['id']);
				$this->model_setting_setting->editSetting('hubtalk', array(
					"hubtalk_status" => "1"
				), $store['id']);
				
			}
			
			$this->enableAllLayouts();

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['code'])) {
			$data['error_code'] = $this->error['code'];
		} else {
			$data['error_code'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'] , true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/hubtalk', 'token=' . $this->session->data['token'] , true)
		);

		$data['action'] = $this->url->link('module/hubtalk', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);
		
		$data['token'] = $this->session->data['token'];
				
		
		
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		
		$data['entry_code'] = $this->language->get('entry_code');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['info_howto'] = $this->language->get('info_howto');
		$data['info_signup'] = $this->language->get('info_signup');
		$data['info_widget_a'] = $this->language->get('info_widget_a');
		$data['info_widget_b'] = $this->language->get('info_widget_b');
		$data['info_create_widget'] = $this->language->get('info_create_widget');
		$data['info_paste_code'] = $this->language->get('info_paste_code');
		$data['info_paste_code_a'] = $this->language->get('info_paste_code_a');
		$data['info_paste_code_b'] = $this->language->get('info_paste_code_b');
		$data['info_features'] = $this->language->get('info_features');
		$data['info_paste'] = $this->language->get('info_paste');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$data["stores"] = $this->stores;
		$data["languages"] = $this->languages;
		$data["hubtalk_settings"] = $this->hubtalkSettings;

		$this->response->setOutput($this->load->view('module/hubtalk.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/hubtalk')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}


	private function getInfo(){
		$this->stores = $this->getStores();
		$this->languages = $this->getLanguages();
		$this->layouts = $this->getLayouts();
		$this->hubtalkSettings = $this->getHubtalkSettings();
	}

	private function getStores(){
		$stores = $this->model_setting_store->getStores();

		$storesList = array();

		$storesList[] = array(
			'id'      => '0',
			'name'    => $this->config->get('config_name')
		);

		foreach($stores as $store) {
			$storesList[] = array(
				'id'      => $store['store_id'],
				'name'    => $store['name']
			);
		}

		return $storesList;

	}


	private function getLanguages(){
		$languages = $this->model_localisation_language->getLanguages();
		
		$languageList = array();

		foreach($languages as $code => $lang) {
			$languageList[] = array(
				'id'   => $lang['language_id'],
				'name' => $lang['name'],
				'code' => $lang['code']
			);
		}

		return $languageList;
	}

	private function getLayouts(){

		$layouts = $this->model_design_layout->getLayouts();

		$layoutList = array();

		foreach ($layouts as $layout) {
			$layoutList[] = array(
				'id'      => $layout['layout_id'],
				'name'    => $layout['name']
			);
		}

		return $layoutList;
	}


	private function getHubtalkSettings(){
		$settings = array();

		foreach($this->stores as $store) {
			foreach($this->languages as $lang) {
				$key = 'module_hubtalk_code_'.$store['id'].'_'.$lang['id'];
				$settings[$key] = $this->config->get($key,$store['id']);
			}
		}

		return $settings;
	}


	private function enableAllLayouts() {
		$layouts = $this->model_design_layout->getLayouts();

		foreach ($layouts as $layout) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module (layout_id, code, position, sort_order)
				SELECT '" . $layout['layout_id'] . "', 'hubtalk', 'content_bottom', '999' FROM dual
				WHERE NOT EXISTS (
					SELECT layout_module_id
					FROM " . DB_PREFIX . "layout_module
					WHERE layout_id = '" . $layout['layout_id'] . "' AND code = 'hubtalk'
				)
				LIMIT 1
			");
		}
	}


	public function uninstall() {
		$this->load->model('setting/setting');
		$this->load->model('setting/store');
		$stores = $this->getStores();
		foreach($stores as $store) {
			$this->model_setting_setting->deleteSetting('module_hubtalk',$store['id']);
			$this->model_setting_setting->deleteSetting('hubtalk',$store['id']);
		}
		
	}
}
