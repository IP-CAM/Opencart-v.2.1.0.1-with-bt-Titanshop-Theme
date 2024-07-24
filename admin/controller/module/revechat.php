<?php
/**
 * @package       REVE Chat
 * @license       GNU/GPL 2 or later
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307,USA.
 *
 * The "GNU General Public License" (GPL) is available at
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 *
 */

class ControllerModuleRevechat extends Controller {
    private $error = array();

    protected function revechat_connect($data) {
        // Section
        $data['current_tab'] = 'settings';

        /***************************
         * Save Settings
         ***************************/
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            // Save Settings
            $this->model_setting_setting->editSetting('revechat', $this->request->post);

            // Redirect
            $this->response->redirect($this->url->link('module/revechat', ('token=' . $this->session->data['token'] . '&rc_action=saved'), 'SSL'));
        }

        return $data;
    }
    protected function index_positions($data) {
        // section
        $data['current_tab'] = 'positions';

        /*************************
         * Remove position
         *************************/
        if(($this->request->server['REQUEST_METHOD'] == 'GET') && $this->validate()) {

            // Add Position
            if(isset($this->request->get) && is_array($this->request->get)) {

                // Remove this position
                if(!empty($this->request->get['remove'])) {

                    // Remove
                    $sql = "DELETE FROM `" . DB_PREFIX . "layout_module` WHERE code='revechat' AND layout_module_id='" . intval($this->request->get['remove']) . "' LIMIT 1";
                    $result = $this->db->query($sql);

                    // Done
                    $data['rc_success_message'] = $data['rc_text_position_removed'];
                }
            }
        }

        /*************************
         * Save Settings
         **************************/
        if(($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate())
        {
            // Add Position
            if (isset($this->request->post) && is_array($this->request->post)) {
                if (!empty($this->request->post['rc_layout_id']) && !empty($this->request->post['rc_position']) && !empty($this->request->post['rc_sort_order'])) {

                    $rc_layout_id = $this->request->post['rc_layout_id'];
                    $rc_position = $this->request->post['rc_position'];
                    $rc_sort_order = $this->request->post['rc_sort_order'];

                    // Remove duplicates
                    $sql = "DELETE FROM `" . DB_PREFIX . "layout_module` WHERE layout_id = '" . intval($rc_layout_id) . "' AND code = 'revechat' AND position='" . $this->db->escape($rc_position) . "'";
                    $result = $this->db->query($sql);

                    // Add New
                    $sql = "INSERT INTO `" . DB_PREFIX . "layout_module` SET layout_id = '" . intval($rc_layout_id) . "', code = 'revechat', position='" . $this->db->escape($rc_position) . "', sort_order='" . intval($rc_sort_order) . "'";
                    $result = $this->db->query($sql);
                    $data['rc_success_message'] = $data['rc_text_position_added'];
                }
            }

            // Redirect
            $this->response->redirect($this->url->link('module/revechat', ('token=' . $this->session->data['token'] . '&rc_action=saved&do=positions'), 'SSL'));
        }

        /***********************************
         * Default data
         **********************************/

        // Layouts
        $data['rc_layouts'] = $this->model_design_layout->getLayouts();

        // Positions
        $data['rc_positions'] = array();

        // Read Positions
        $result = $this->db->query("SELECT lm.layout_module_id, lm.position, lm.sort_order, l.name FROM `" . DB_PREFIX . "layout_module` AS lm INNER JOIN `" . DB_PREFIX . "layout` AS l ON lm.layout_id = l.layout_id WHERE lm.code = 'revechat' ORDER by l.name ASC");
        if ($result->num_rows > 0)
        {
            foreach ($result->rows as $row)
            {
                $data['rc_positions'][] = $row;
            }
        }

        // Done
        return $data;

    }

    public function index() {
        // Language
        $this->load->language('module/revechat');

        // Page Title
        $this->document->setTitle($this->language->get('heading_title'));

        // CSS & JS
        $this->document->addStyle('view/stylesheet/revechat/revechat.css');

        // Load Models
        $this->load->model('setting/setting');
        $this->load->model('design/layout');

        // BreadCrumbs
        $data['breadcrumbs'] = array(
            array(
                'text' => $this->language->get('text_home'),
                'href' => $this->url->link('common/home', 'token='.$this->session->data['token'], 'SSL'),
                'separator' => false
            ),
            array(
                'text' => $this->language->get('text_extension'),
                'href' => $this->url->link('extension/module', 'token='.$this->session->data['token'], 'SSL'),
                'separator' => '::'
            ),
            array(
                'text' => $this->language->get('heading_title'),
                'href' => $this->url->link('module/revechat', 'token='.$this->session->data['token'], 'SSL'),
                'separator' => '::'
            )
        );

        $data['rc_text_position_removed'] = $this->language->get('rc_text_position_removed');
        $data['rc_text_position_added'] = $this->language->get('rc_text_position_added');

        // Add Settings
        $data = array_merge($data, $this->model_setting_setting->getSetting('revechat'));



        // What to show
        $do = ((!empty($this->request->get['do']) && ($this->request->get['do'] == 'positions')) ? 'positions':'settings');


        // Show Positions
        if($do == 'positions')
        {
            $data = $this->index_positions($data);
        } else {
            $data = $this->revechat_connect($data);
        }


        // Settings Saved
        if (isset($this->request->get) && !empty($this->request->get['rc_action']) == 'saved')
        {
            $data['rc_success_message'] = $this->language->get('text_success');
        }



        if (isset($this->error['warning']))
        {
            $data['error_warning'] = $this->error['warning'];
        }
        else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['error_aid']))
        {
            $data['error_aid'] = $this->error['error_aid'];
        }
        else
        {
            $data['error_aid'] = '';
        }

        $text = array('heading_title',
            'rc_button_connect',
            'rc_button_disconnect',
            'rc_entry_status',
            'rc_text_enabled',
            'rc_text_disabled',
            'rc_connected',
            'text_module',
            'text_success',
            'text_content_top',
            'text_content_bottom',
            'text_column_left',
            'text_column_right',
            'entry_aid',
            'rc_text_layout',
            'rc_text_position',
            'rc_text_sort_order',
            'rc_text_sort_order',
            'rc_text_add_position',
            'rc_text_positions',
            'rc_text_settings',
            'rc_text_connect',
            'rc_text_add_to_a_position',
            'rc_text_current_positions',
            'rc_text_remove_position',
            'rc_text_position_removed',
            'rc_text_position_added',
            'error_permission',
            'error_aid',
            'rc_text_signup',
            'rc_button_cancel',
            'revechat_already_have',
            'revechat_create_new',
            'revechat_login',
            'first_name',
            'last_name',
            'email',
            'create_password',
            'confirm_password',
            'revechat_is_installed',
            'revechat_already_have_header'
        );

        foreach($text as $key){
            $data[$key] = $this->language->get($key);
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');


        // Buttons
        $data['action'] = $this->url->link('module/revechat', 'token='.$this->session->data['token'], 'SSL');
        $data['cancel'] = $this->url->link('module/revechat', 'token='.$this->session->data['token'], 'SSL');
        $data['revechat_status '] =
        $data['revechat_aid'] = $this->config->get('revechat_aid');
        $data['revechat_status'] = $this->config->get('revechat_status');

        $this->response->setOutput($this->load->view('module/revechat.tpl', $data));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/revechat')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }
}