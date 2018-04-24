<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class C_admin_artikel extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		// Your own constructor code
		$this->load->model(array('M_artikel','M_kat_artikel'));
	}
	
	public function index()
	{
		if(($this->session->userdata('ses_user_admin') == null) or ($this->session->userdata('ses_pass_admin') == null))
		{
			header('Location: '.base_url().'login');
		}
		else
		{
			$cek_ses_login = $this->M_akun->get_cek_login($this->session->userdata('ses_user_admin'),md5(base64_decode($this->session->userdata('ses_pass_admin'))));
			
			if(!empty($cek_ses_login))
			{
				if((!empty($_GET['cari'])) && ($_GET['cari']!= "")  )
				{
					$cari = "WHERE judul_artikel LIKE '%".str_replace("'","",$_GET['cari'])."%'";
				}
				else
				{
					$cari = "";
				}
				
				$this->load->library('pagination');
				$config['first_url'] = site_url('admin-artikel?'.http_build_query($_GET));
				$config['base_url'] = site_url('admin-artikel/');
				$config['total_rows'] = $this->M_artikel->count_artikel_limit($cari)->JUMLAH;
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
				
				
				$list_artikel = $this->M_artikel->list_artikel_limit($cari,$config['per_page'],$this->uri->segment(2,0));
				
				$data = array('page_content'=>'admin_artikel',
							  'list_artikel'=>$list_artikel,'halaman'=>$halaman);
				$this->load->view('admin/container.html',$data);
				
			}
			else
			{
				header('Location: '.base_url().'login');
			}
		}
	}
	
	function tambah()
	{
		$list_kat_artikel = $this->M_kat_artikel->list_kat_artikel();
		
		/*std class 
		$show_artikel = array('id_artikel'=>'',
							  'judul_artikel'=>'',
							  'id_kat_artikel'=>'',
							  'content_artikel'=>'',
							  'img_artikel'=>''
							 );*/
		
		$data = array('page_content'=>'admin_add_artikel','list_kat_artikel'=>$list_kat_artikel);
		$this->load->view('admin/container.html',$data);
	}
	
	function edit()
	{
		$id_artikel = $this->uri->segment(2,0);
		
		$show_artikel = $this->M_artikel->show_content($id_artikel);
		
		$list_kat_artikel = $this->M_kat_artikel->list_kat_artikel();
		
		$data = array('page_content'=>'admin_add_artikel','list_kat_artikel'=>$list_kat_artikel,'artikel'=>$show_artikel);
		$this->load->view('admin/container.html',$data);
	}
	
	
	
	function simpan()
	{
		if (!empty($_POST['stat_edit']))
		{
			$judul = $_POST['judul'];
			$kategori = $_POST['kategori'];
			$isi = $_POST['content_artikel'];
			
			
			if (!empty($_FILES['foto']['name']))
			{
				$this->do_upload($_FILES['foto']['name'],$_POST['stat_edit']);
						$ext = pathinfo($_FILES['foto']['name'], PATHINFO_EXTENSION);
						$foto = $_POST['stat_edit'].".".$ext;
			} else {
				$foto = '';
			}
			$this->M_artikel->edit($_POST['stat_edit'],
								   $kategori,$judul,$isi,$foto,$this->session->userdata('ses_user_admin'));
			
		} else {
			$judul = $_POST['judul'];
			$kategori = $_POST['kategori'];
			$isi = $_POST['content_artikel'];
			
			$get_no = $this->M_artikel->get_id_images();
						$this->do_upload($_FILES['foto']['name'],$get_no->id_images);
						$ext = pathinfo($_FILES['foto']['name'], PATHINFO_EXTENSION);
						$foto = $get_no->id_images.".".$ext;
						
			$this->M_artikel->simpan($kategori,$judul,$isi,$foto,$this->session->userdata('ses_user_admin'));
		}
		
		header('Location: '.base_url().'admin-artikel?'.http_build_query($_GET));
	}
	
	public function hapus()
	{
		$id = $this->uri->segment(2,0);
		$this->M_artikel->hapus($id);
		header('Location: '.base_url().'admin-artikel?'.http_build_query($_GET));
	}
	
	
	
	function show_content_edit()
	{
		$id_artikel = $_POST['id_artikel'];
		
		$show_content = $this->M_artikel->show_content($id_artikel);
		
		echo $show_content->content_artikel;
	}
	
	function do_upload($id,$cek_bfr)
	{
		$this->load->library('upload');

		if($cek_bfr != '')
		{
			@unlink('./assets/images/artikel/'.$cek_bfr);
		}
		
		if (!empty($_FILES['foto']['name']))
		{
			$config['upload_path'] = 'assets/images/artikel/';
			$config['allowed_types'] = 'gif|jpg|png';
			$config['max_size']	= '2024';
			//$config['max_widtd']  = '300';
			//$config['max_height']  = '300';
			$config['file_name']	= $cek_bfr;
			$config['overwrite']	= true;
			

			$this->upload->initialize($config);

			//Upload file 1
			if ($this->upload->do_upload('foto'))
			{
				$hasil = $this->upload->data();
			}
		}
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/c_admin.php */