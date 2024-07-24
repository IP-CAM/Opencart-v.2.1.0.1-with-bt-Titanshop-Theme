<?php  
class ControllerModuleBossStaticBlock extends Controller {
	public function index($setting) { 
		if(isset($setting['description'][$this->config->get('config_language_id')])){
			$data['content'] = html_entity_decode($setting['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		}else{
			$data['content'] ='';
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_staticblock.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/boss_staticblock.tpl', $data);
		} else {
			return $this->load->view('default/template/module/boss_staticblock.tpl', $data);
		}
	}
}
?>