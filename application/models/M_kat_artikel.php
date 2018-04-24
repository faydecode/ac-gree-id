<?php
	class M_kat_artikel extends CI_Model 
	{

		function __construct()
		{
			parent::__construct();
		}
		
		function list_kat_artikel()
		{
			$query = $this->db->query("SELECT * FROM tb_kat_artikel  
										ORDER BY nama_kat_artikel ASC");
			if($query->num_rows() > 0)
			{
				return $query;
			}
			else
			{
				return false;
			}
		}
		
		function list_kat_artikel_limit($cari,$limit,$offset)
		{
			//$query = $this->db->query("SELECT * FROM tb_kat_artikel ".$cari." ORDER BY nama_kat_artikel ASC LIMIT ".$offset.",".$limit);
			$query = $this->db->query("SELECT * -- A.id_kat_artikel,A.nama_kat_artikel,A.ket_kat_artikel 
									   FROM tb_kat_artikel AS A
									  ".$cari." ORDER BY nama_kat_artikel ASC LIMIT ".$offset.",".$limit);
			if($query->num_rows() > 0)
			{
				return $query;
			}
			else
			{
				return false;
			}
		}
		
		function count_kat_artikel_limit($cari)
		{
			$query = $this->db->query("SELECT COUNT(id_kat_artikel) AS JUMLAH FROM tb_kat_artikel ".$cari);
			if($query->num_rows() > 0)
			{
				return $query->row();
			}
			else
			{
				return false;
			}
		}
		
		function get_judul($id)
		{
			$query = $this->db->query("SELECT nama_kat_artikel FROM tb_kat_artikel 
										WHERE id_kat_artikel = '".$id."'
			");
			
			if($query->num_rows() > 0)
			{
				return $query->row();
			}
			else
			{
				return false;
			}
		}
		
		function get_id_kat($nama_url)
		{
			$query = $this->db->query("
				SELECT id_kat_artikel FROM tb_kat_artikel
				WHERE nama_url LIKE '%".$nama_url."%'
			");
			
			if($query->num_rows() > 0)
            {
                return $query->row();
            }
            else
            {
                return false;
            }
		}
		
		
		function simpan($nama,$ket,$foto,$id_user)
		{
			$tandaText = array(
	    			'spasi'=>" ",
	    			'koma'=>",",
	    			'tandatanya'=>"?",
	    			'tandaseru'=>"!",
	    			'titikkoma'=>";",
	    			'titikdua'=>":",
	    			'kutipsatu'=>"'",
	    			'dan'=>"&",
	    			'at'=>"@",
	    			'hashtag'=>"#",
	    			'persen'=>"%",
	    			'bintang'=>"*",
	    			'dollar'=>"$",
	    			"kurungbuka"=>"(",
	    			"kurungtutup"=>")",
	    			"kurungkurawalbuka"=>"{",
	    			"kurungkurawaltutup"=>"}",
	    			"atau"=>"/",
	    			"titik"=>".",
	    			"kurungsikubuka"=>"<",
	    			"kurungsikututup"=>">",
	    			"panahatas"=>"^",
	    			"plus"=>"+",
	    			"minus"=>"-",
	    			"kurung["=>"[",
	    			"kurung]"=>"]",
	    		);
			
			
			$query = "
					INSERT INTO tb_kat_artikel
					(
								id_kat_artikel,
								 nama_kat_artikel,
								 ket_kat_artikel,
								 img_kat_artikel,
								 nama_url,
								 tgl_ins,
								 kode_kantor,
								 user_updt
					)
					VALUES (
						(
					 SELECT CONCAT('KA',FRMTGL,ORD) AS id_kat_artikel
					 From
					 (
						 SELECT CONCAT(Y,M) AS FRMTGL
						  ,CASE
							 WHEN (ORD >= 10 AND ORD < 99) THEN CONCAT('000',CAST(ORD AS CHAR))
							 WHEN (ORD >= 100 AND ORD < 999) THEN CONCAT('00',CAST(ORD AS CHAR))
							 WHEN (ORD >= 1000 AND ORD < 9999) THEN CONCAT('0',CAST(ORD AS CHAR))
							 WHEN ORD >= 10000 THEN CAST(ORD AS CHAR)
							 ELSE CONCAT('0000',CAST(ORD AS CHAR))
							 END As ORD
						 From
						 (
							 SELECT
							 CAST(LEFT(NOW(),4) AS CHAR) AS Y,
							 CAST(MID(NOW(),6,2) AS CHAR) AS M,
							 MID(NOW(),9,2) AS D,
							 COALESCE(MAX(CAST(RIGHT(id_kat_artikel,5) AS UNSIGNED)) + 1,1) AS ORD
							 From tb_kat_artikel
							 WHERE DATE_FORMAT(tgl_ins,'%m-%Y') = DATE_FORMAT(NOW(),'%m-%Y')
							
						 ) AS A
					 ) AS AA
				 ),
							'".$nama."',
							'".$ket."',
							'".$foto."',
							'".str_replace($tandaText,"-", $nama)."',
							now(),
							'',
							'".$id_user."'
					 );
			";
			
			
			
			$this->db->query($query);
		}
		
		function edit($id,$nama,$ket,$foto,$id_user)
		{
			$tandaText = array(
	    			'spasi'=>" ",
	    			'koma'=>",",
	    			'tandatanya'=>"?",
	    			'tandaseru'=>"!",
	    			'titikkoma'=>";",
	    			'titikdua'=>":",
	    			'kutipsatu'=>"'",
	    			'dan'=>"&",
	    			'at'=>"@",
	    			'hashtag'=>"#",
	    			'persen'=>"%",
	    			'bintang'=>"*",
	    			'dollar'=>"$",
	    			"kurungbuka"=>"(",
	    			"kurungtutup"=>")",
	    			"kurungkurawalbuka"=>"{",
	    			"kurungkurawaltutup"=>"}",
	    			"atau"=>"/",
	    			"titik"=>".",
	    			"kurungsikubuka"=>"<",
	    			"kurungsikututup"=>">",
	    			"panahatas"=>"^",
	    			"plus"=>"+",
	    			"minus"=>"-",
	    			"kurung["=>"[",
	    			"kurung]"=>"]",
	    		);
				
			$query = "
				UPDATE tb_kat_artikel
				SET nama_kat_artikel = '".$nama."',
				  ket_kat_artikel = '".$ket."',
				  img_kat_artikel = '".$foto."',
				  nama_url = '".str_replace($tandaText,"-", $nama)."',
				  tgl_updt = now(),
				  user_updt = '".$id_user."'
				WHERE id_kat_artikel = '".$id."';
			";
			
			$this->db->query($query);
		}
		
		function hapus($id)
		{
			$this->db->query("DELETE FROM tb_kat_artikel WHERE id_kat_artikel = '".$id."' ");
		}
		
		function get_kat_artikel_num_rows($berdasarkan,$cari)
        {
            $query = $this->db->get_where('tb_kat_artikel', array($berdasarkan => $cari ));
            if($query->num_rows() > 0)
            {
                return $query->num_rows();
            }
            else
            {
                return false;
            }
        }
		
		function get_kat_artikel($berdasarkan,$cari)
        {
            $query = $this->db->get_where('tb_kat_artikel', array($berdasarkan => $cari));
            if($query->num_rows() > 0)
            {
                return $query;
            }
            else
            {
                return false;
            }
        }
		
		function get_id_images()
		{
			$query = $this->db->query( "
				
					SELECT CONCAT('KA',FRMTGL,ORD) AS id_images
					 From
					 (
						 SELECT CONCAT(Y,M) AS FRMTGL
						  ,CASE
							 WHEN (ORD >= 10 AND ORD < 99) THEN CONCAT('000',CAST(ORD AS CHAR))
							 WHEN (ORD >= 100 AND ORD < 999) THEN CONCAT('00',CAST(ORD AS CHAR))
							 WHEN (ORD >= 1000 AND ORD < 9999) THEN CONCAT('0',CAST(ORD AS CHAR))
							 WHEN ORD >= 10000 THEN CAST(ORD AS CHAR)
							 ELSE CONCAT('0000',CAST(ORD AS CHAR))
							 END As ORD
						 From
						 (
							 SELECT
							 CAST(LEFT(NOW(),4) AS CHAR) AS Y,
							 CAST(MID(NOW(),6,2) AS CHAR) AS M,
							 MID(NOW(),9,2) AS D,
							 COALESCE(MAX(CAST(RIGHT(id_kat_artikel,5) AS UNSIGNED)) + 1,1) AS ORD
							 From tb_kat_artikel
							 WHERE DATE_FORMAT(tgl_ins,'%m-%Y') = DATE_FORMAT(NOW(),'%m-%Y')
							
						 ) AS A
					 ) AS AA
			");
			
			if($query->num_rows() > 0)
            {
                return $query->row();
            }
            else
            {
                return false;
            }
		}
	}
	
?>