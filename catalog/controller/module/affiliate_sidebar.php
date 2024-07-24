<?php
class ControllerModuleAffiliateSidebar extends Controller {
	private $error = array();

	public function install() {
		$file = DIR_CONFIG . 'accountdashboard/affiliate_sidebar.php';

		if (file_exists($file)) {
			$_ = array();	   
			require($file);

	   		$this->load->model('setting/setting');
   			$this->model_setting_setting->editSetting('affiliate_sidebar', $_);
		}		
	}

	public function index() {
		$this->load->language('module/affiliate_sidebar');

		$this->document->addStyle('catalog/view/theme/default/stylesheet/accountdashboard/affiliatesidebar.css');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['logged'] = $this->affiliate->isLogged();
		$this->load->model('setting/setting');

		$data['main_links'] = array();
		$links = (array)$this->config->get('affiliate_sidebar_title');	
		foreach ($links as $parent_link) {
			if($parent_link['status']) {
				$children_links = array();
				
				if(!empty($parent_link['link_title'])) {
					foreach ($parent_link['link_title'] as $children_link) {
						if($this->affiliate->isLogged()) {
							$mylogged = '1'; // Logged In
						} else{
							$mylogged = '0'; // Logged Not 
						}
						
						if($children_link['logged'] == $mylogged  || $children_link['logged'] == '2') {
							$children_links[] = array(
									'title' 		=> isset($children_link['affiliate_sidebar_link_title_description'][$this->config->get('config_language_id')]['name']) ? $children_link['affiliate_sidebar_link_title_description'][$this->config->get('config_language_id')]['name'] : '',
									'link' => $children_link['link'],
									'iconclass' => $children_link['iconclass'],
									'logged' => $children_link['logged'],
							);
						}
					}
				}
				if ($children_links) {
					$data['main_links'][] = array(
						'title' 		=> isset($parent_link['description'][$this->config->get('config_language_id')]['title']) ? $parent_link['description'][$this->config->get('config_language_id')]['title'] : '',
						'sort_order' => $parent_link['sort_order'],
						'children_links' => $children_links,
										
					);
				}
			}
		}		

		$data['affiliate_sidebar_titlebgcolor'] = $this->config->get('affiliate_sidebar_titlebgcolor');
		$data['affiliate_sidebar_titlecolor'] = $this->config->get('affiliate_sidebar_titlecolor');
		$data['affiliate_sidebar_linkbgcolor'] = $this->config->get('affiliate_sidebar_linkbgcolor');
		$data['affiliate_sidebar_linkcolor'] = $this->config->get('affiliate_sidebar_linkcolor');
		$data['affiliate_sidebar_hoverbgcolor'] = $this->config->get('affiliate_sidebar_hoverbgcolor');
		$data['affiliate_sidebar_hovercolor'] = $this->config->get('affiliate_sidebar_hovercolor');


		usort($data['main_links'], array($this, 'sidebarsort'));

		if($data['main_links']) {
			if(VERSION < '2.2.0.0') {
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/affiliate_sidebar.tpl')) {
					return $this->load->view($this->config->get('config_template') . '/template/module/affiliate_sidebar.tpl', $data);
				} else {
					return $this->load->view('default/template/module/affiliate_sidebar.tpl', $data);
				}
			} else if(VERSION == '2.2.0.0') {
				return $this->load->view('module/affiliate_sidebar', $data);
			} else{
				return $this->load->view('extension/module/affiliate_sidebar', $data);
			}
		}
	}

	public function sidebarsort($a, $b) {
	    return $a['sort_order'] - $b['sort_order'];
	}

}