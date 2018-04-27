<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class C_public_produk extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		// Your own constructor code

	}

	public function index()
	{
		$this->load->view('public/produk.html');
	}

	public function detail() {
		$id = $this->uri->segment(3);
		if ($id == 1):
			$this->load->view('public/produk/detail.html');
		else:
			$this->load->view('public/produk/detail1.html');
		endif;
	}

}

/* End of file welcome.php */
/* Location: ./application/controllers/c_admin.php */
