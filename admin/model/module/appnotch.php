<?php
class ModelModuleAppnotch extends Model {
    public function getCustomer($customer_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "user WHERE user_id = '" . (int)$customer_id . "'");
		return $query->row;
		//return ("SELECT DISTINCT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");
	} 
}
?>