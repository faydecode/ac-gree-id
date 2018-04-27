<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class C_public_artikel extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		// Your own constructor code

	}

	public function index()
	{
		$this->load->view('public/artikel.html');
	}

}

/* End of file welcome.php */
/* Location: ./application/controllers/c_admin.php */
