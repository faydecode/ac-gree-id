<?php 

class C_home extends CI_Controller
{
	
	function __construct(){
		parent::__construct();
		
	}

	public function index(){	
		
		$this->load->view('public/home.html');
	}

}