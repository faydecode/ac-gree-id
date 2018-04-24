<?php

	Class C_admin_login extends CI_Controller
	{
		public function __construct()
		{
			parent::__construct();
			$this->load->helper(array('captcha','array'));
            $this->load->library(array('form_validation'));
            $this->config->load('cap');
		}
		
		function index()
		{
			
			$this->load->view('admin/login.html');

		}
        
        public function cek_login()
        {
            $user = $_POST['username'];
            $pass = $_POST['password'];
			
            $data_login = $this->M_akun->get_login($user,md5($pass));
    		if(!empty($data_login))
    		{
                if ($data_login->avatar <> "")
                {
                    $src = base_url().'assets/images/users/'.$data_login->avatar;
                }
                else
                {
                	$src = base_url().'assets/images/users/noavatar.jpg';
                }
				
				$user = array(
					'ses_user_admin'  => $user,
					'ses_pass_admin'  => base64_encode($pass),
					'ses_kode_kantor' => $data_login->kode_kantor,
					'ses_id_karyawan' => $data_login->id_karyawan,
					'ses_id_jabatan' => $data_login->id_jabatan,
					'ses_nama_jabatan' => $data_login->nama_jabatan,
					'ses_nama_karyawan' => $data_login->nama_karyawan,
					'ses_avatar_url' => $src,
					'ses_tgl_ins' => $data_login->tgl_ins
				);
				
    			
    
    			$this->session->set_userdata($user);
				header('Location: '.base_url().'admin');
    		}
    		else
    		{
    			//redirect('index.php/login','location');
				header('Location: '.base_url().'login');
    		}
        }
        
        
        function logout()
		{
			$this->session->unset_userdata('ses_user_admin');
			$this->session->unset_userdata('ses_pass_admin');
			$this->session->unset_userdata('ses_id_karyawan');
            $this->session->unset_userdata('ses_id_jabatan');
			$this->session->unset_userdata('ses_nama_jabatan');
			$this->session->unset_userdata('ses_nama_karyawan');
			$this->session->unset_userdata('ses_avatar_url');
			$this->session->unset_userdata('ses_tgl_ins');
			
			//redirect('index.php/login','location');
			header('Location: '.base_url().'login');
		}
 
	}

?>