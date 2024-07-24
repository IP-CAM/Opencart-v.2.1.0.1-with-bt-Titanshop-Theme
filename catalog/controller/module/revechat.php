<?php
/**
 * Version 0.2
 */
class ControllerModuleRevechat extends Controller
{
    public function index(){
        $data['revechat_aid'] = $this->config->get('revechat_aid');
        return $this->load->view('module/revechat.tpl', $data);
    }
}