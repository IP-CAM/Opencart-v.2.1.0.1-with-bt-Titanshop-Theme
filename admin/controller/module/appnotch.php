<?php

class ControllerModuleAppnotch extends Controller{ 
    public function index(){
        $this->load->language('module/appnotch');
		$this->document->setTitle($this->language->get('page_heading_title'));
        $data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
        $data['heading_title'] = $this->language->get('page_heading_title');
		$data['button_convert'] = $this->language->get('button_convert');
		$data['text_form'] = $this->language->get('text_form');
		$data['entry_email_id'] = $this->language->get('entry_email_id');
		$data['entry_url'] = $this->language->get('entry_url');
		$data['appnotch_url'] = $this->language->get('appnotch_url');
		$data['email_error'] = $this->language->get('email_error');
		
		$this->load->model('module/appnotch');
		$customer_info = $this->model_module_appnotch->getCustomer($this->session->data['user_id']);
		$data['email_id'] = $customer_info['email'];
        $data['breadcrumbs'] = array();
	    $url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('page_heading_title'),
			'href' => $this->url->link('module/appnotch', 'token=' . $this->session->data['token'] . $url, true)
		);

		$this->config->set('config_url', HTTP_SERVER);
		$this->config->set('config_ssl', HTTPS_SERVER);
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$data['site_url'] =  str_replace("admin/","",$this->config->get('config_ssl'));;
		} else {
			$data['site_url'] =  str_replace("admin/","",$this->config->get('config_url'));
		}
		$data['store_name'] =  str_replace(" ","",$this->config->get('config_name'));
        $this->response->setOutput($this->load->view('module/appnotch.tpl', $data));
    }
}
?>