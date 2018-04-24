<?php
	class M_artikel extends CI_Model 
	{

		function __construct()
		{
			parent::__construct();
		}
		
		
		function list_artikel_limit($cari,$limit,$offset)
		{
			
			$query = $this->db->query("SELECT * FROM tb_artikel A
									   LEFT JOIN tb_kat_artikel B
										 ON A.id_kat_artikel = B.id_kat_artikel
									  ".$cari." ORDER BY judul_artikel ASC LIMIT ".$offset.",".$limit);
			if($query->num_rows() > 0)
			{
				return $query;
			}
			else
			{
				return false;
			}
		}
		
		function count_artikel_limit($cari)
		{
			$query = $this->db->query("SELECT COUNT(id_artikel) AS JUMLAH FROM tb_artikel A ".$cari);
			if($query->num_rows() > 0)
			{
				return $query->row();
			}
			else
			{
				return false;
			}
		}
		
		function show_content($id_artikel)
		{
			$query = $this->db->query("SELECT * FROM tb_artikel A
									   LEFT JOIN tb_kat_artikel B
										 ON A.id_kat_artikel = B.id_kat_artikel
									   WHERE A.id_artikel = '".$id_artikel."'");
			if($query->num_rows() > 0)
			{
				return $query->row();
			}
			else
			{
				return false;
			}
		}
		
		function get_artikel($judul_url)
		{
			$query = $this->db->query("SELECT * FROM tb_artikel A
									   LEFT JOIN tb_karyawan B
										 ON A.penulis = B.id_karyawan
									   WHERE A.judul_url = '".$judul_url."'");
			if($query->num_rows() > 0)
			{
				return $query->row();
			}
			else
			{
				return false;
			}
		}
		
		
		function simpan($id_kat_artikel,$judul_artikel,$content_artikel,$img_artikel,$user)
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
				
			$query = $this->db->query("
				INSERT INTO tb_artikel
							(id_artikel,
							 id_kat_artikel,
							 judul_artikel,
							 penulis,
							 content_artikel,
							 img_artikel,
							 judul_url,
							 tgl_ins,
							 user_updt,
							 kode_kantor)
				VALUES (
						(
							SELECT CONCAT('ART',FRMTGL,ORD) AS id_artikel
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
									 COALESCE(MAX(CAST(RIGHT(id_artikel,5) AS UNSIGNED)) + 1,1) AS ORD
									 From tb_artikel
									 WHERE DATE_FORMAT(tgl_ins,'%m-%Y') = DATE_FORMAT(NOW(),'%m-%Y')
									
								 ) AS A
							 ) AS AA
						),
						'".$id_kat_artikel."',
						'".$judul_artikel."',
						'".$user."',
						'".$content_artikel."',
						'".$img_artikel."',
						'".str_replace($tandaText,"-", $judul_artikel)."',
						NOW(),
						'".$user."',
						'');
			
			");
		}
		
		function edit($id_artikel,$id_kat_artikel,$judul_artikel,$content_artikel,$img_artikel,$user)
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
				
			$query = $this->db->query("
				UPDATE tb_artikel
				SET id_kat_artikel = '".$id_kat_artikel."',
				  judul_artikel = '".$judul_artikel."',
				  content_artikel = '".$content_artikel."',
				  img_artikel = '".$img_artikel."',
				  judul_url = '".str_replace($tandaText,"-", $judul_artikel)."',
				  tgl_updt = NOW(),
				  user_updt = '".$user."'
				WHERE id_artikel = '".$id_artikel."'
			");
		}
		
		function get_id_images()
		{
			$query = $this->db->query( "
				
					SELECT CONCAT('ART',FRMTGL,ORD) AS id_images
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
							 COALESCE(MAX(CAST(RIGHT(id_artikel,5) AS UNSIGNED)) + 1,1) AS ORD
							 From tb_artikel
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
		
		
		function hapus($id)
		{
			$this->db->query("DELETE FROM tb_artikel WHERE id_artikel = '".$id."' ");
		}
		
	}
	
?>