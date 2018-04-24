<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class C_public_course extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		// Your own constructor code
		$this->load->model(array('M_artikel','M_kat_artikel'));
	}
	
	public function index()
	{
		
		$this->load->library('pagination');
		$config['first_url'] = site_url('course?'.http_build_query($_GET));
		$config['base_url'] = site_url('course/');
		$config['total_rows'] = $this->M_kat_artikel->count_kat_artikel_limit('')->JUMLAH;
		$config['uri_segment'] = 2;	
		$config['per_page'] = 10;
		$config['num_links'] = 2;
		$config['suffix'] = '?' . http_build_query($_GET, '', "&");
		$config['first_page'] = 'Awal';
		$config['last_page'] = 'Akhir';
		$config['next_page'] = '&laquo;';
		$config['prev_page'] = '&raquo;';
		
		$config['full_tag_open'] = '<div><ul class="pagination">';
		$config['full_tag_close'] = '</ul></div>';
		$config['first_link'] = '&laquo; First';
		$config['first_tag_open'] = '<li class="prev page">';
		$config['first_tag_close'] = '</li>';
		$config['last_link'] = 'Last &raquo;';
		$config['last_tag_open'] = '<li class="next page">';
		$config['last_tag_close'] = '</li>';
		$config['next_link'] = 'Next &rarr;';
		$config['next_tag_open'] = '<li class="next page">';
		$config['next_tag_close'] = '</li>';
		$config['prev_link'] = '&larr; Previous';
		$config['prev_tag_open'] = '<li class="prev page">';
		$config['prev_tag_close'] = '</li>';
		$config['cur_tag_open'] = '<li class="active"><a href="">';
		$config['cur_tag_close'] = '</a></li>';
		$config['num_tag_open'] = '<li class="page">';
		$config['num_tag_close'] = '</li>';
		
		
		//inisialisasi config
		$this->pagination->initialize($config);
		$halaman = $this->pagination->create_links();
		
		$list_kat_artikel = $this->M_kat_artikel->list_kat_artikel('',$config['per_page'],$this->uri->segment(2,0));
		
		$data = array('page_content'=>'course',
					  'list_kat_artikel'=>$list_kat_artikel,'halaman'=>$halaman);
		$this->load->view('public/course/course.html',$data);
		
	}
	
	
	function kategori()
	{
		$nama_kat = $this->uri->segment(2,0);
		
		$id_kat = $this->M_kat_artikel->get_id_kat($nama_kat)->id_kat_artikel;
		
		$judul_kategori = $this->M_kat_artikel->get_judul($id_kat)->nama_kat_artikel;
		
		$cari = "WHERE A.id_kat_artikel = '".$id_kat."'";
		
		$this->load->library('pagination');
		$config['first_url'] = site_url('kategori/'.$nama_kat.'?'.http_build_query($_GET));
		$config['base_url'] = site_url('kategori/'.$nama_kat.'/');
		$config['total_rows'] = $this->M_artikel->count_artikel_limit($cari)->JUMLAH;
		$config['uri_segment'] = 3;	
		$config['per_page'] = 8;
		$config['num_links'] = 2;
		$config['suffix'] = '?' . http_build_query($_GET, '', "&");
		$config['first_page'] = 'Awal';
		$config['last_page'] = 'Akhir';
		$config['next_page'] = '&laquo;';
		$config['prev_page'] = '&raquo;';
		
		$config['full_tag_open'] = '<div><ul class="pagination">';
		$config['full_tag_close'] = '</ul></div>';
		$config['first_link'] = '&laquo; First';
		$config['first_tag_open'] = '<li class="prev page">';
		$config['first_tag_close'] = '</li>';
		$config['last_link'] = 'Last &raquo;';
		$config['last_tag_open'] = '<li class="next page">';
		$config['last_tag_close'] = '</li>';
		$config['next_link'] = 'Next &rarr;';
		$config['next_tag_open'] = '<li class="next page">';
		$config['next_tag_close'] = '</li>';
		$config['prev_link'] = '&larr; Previous';
		$config['prev_tag_open'] = '<li class="prev page">';
		$config['prev_tag_close'] = '</li>';
		$config['cur_tag_open'] = '<li class="active"><a href="">';
		$config['cur_tag_close'] = '</a></li>';
		$config['num_tag_open'] = '<li class="page">';
		$config['num_tag_close'] = '</li>';
		
		
		//inisialisasi config
		$this->pagination->initialize($config);
		$halaman = $this->pagination->create_links();
		
		
		$list_artikel = $this->M_artikel->list_artikel_limit($cari,$config['per_page'],$this->uri->segment(3,0));
		
		$data = array('judul_kategori'=>$judul_kategori,
					  'list_artikel'=>$list_artikel,'halaman'=>$halaman);
		$this->load->view('public/course/kategori.html',$data);
		
	}
	
	function artikel()
	{
		$nama_artikel = $this->uri->segment(2,0);
		
		$get_artikel = $this->M_artikel->get_artikel($nama_artikel);
		
		
		$data = array('get_artikel'=>$get_artikel);
		
		$this->load->view('public/course/single_page.html',$data);
	}
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/c_admin.php */