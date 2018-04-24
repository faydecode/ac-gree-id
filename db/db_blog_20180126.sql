/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.5.5-10.1.9-MariaDB : Database - db_blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_blog` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_blog`;

/*Table structure for table `ci_sessions` */

DROP TABLE IF EXISTS `ci_sessions`;

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ci_sessions` */

insert  into `ci_sessions`(`session_id`,`ip_address`,`user_agent`,`last_activity`,`user_data`) values ('c3058e9ef1cbecf256081c9168231ec9','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:51.0) Gecko/20100101 Firefox/51.0',1489958157,'a:11:{s:9:\"user_data\";s:0:\"\";s:14:\"ses_user_admin\";s:5:\"admin\";s:14:\"ses_pass_admin\";s:8:\"YWRtaW4=\";s:15:\"ses_id_karyawan\";s:16:\"KRYWN20170100001\";s:14:\"ses_id_jabatan\";s:15:\"JBTN20170100002\";s:16:\"ses_nama_jabatan\";s:14:\"Admin Aplikasi\";s:17:\"ses_nama_karyawan\";s:12:\"Ina Agustina\";s:14:\"ses_avatar_url\";s:56:\"http://localhost/kingpas/assets/global/users/loading.gif\";s:10:\"ses_alamat\";s:20:\"Cianjur - Jawa barat\";s:15:\"ses_kode_kantor\";s:6:\"YULPST\";s:11:\"ses_tgl_ins\";N;}');

/*Table structure for table `tb_akun` */

DROP TABLE IF EXISTS `tb_akun`;

CREATE TABLE `tb_akun` (
  `id_akun` varchar(25) NOT NULL,
  `id_karyawan` varchar(25) NOT NULL,
  `pertanyaan1` varchar(150) NOT NULL,
  `jawaban1` varchar(150) NOT NULL,
  `pertanyaan2` varchar(150) NOT NULL,
  `jawaban2` varchar(150) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(150) NOT NULL,
  `ket_akun` text NOT NULL,
  `tgl_insert` datetime NOT NULL,
  `tgl_updt` datetime NOT NULL,
  `kode_kantor` varchar(15) NOT NULL,
  `user_updt` int(11) NOT NULL,
  PRIMARY KEY (`id_akun`,`kode_kantor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_akun` */

insert  into `tb_akun`(`id_akun`,`id_karyawan`,`pertanyaan1`,`jawaban1`,`pertanyaan2`,`jawaban2`,`user`,`pass`,`ket_akun`,`tgl_insert`,`tgl_updt`,`kode_kantor`,`user_updt`) values ('AKN20170100001','KRYWN20170100001','','','','','admin','21232f297a57a5a743894a0e4a801fc3','-','2017-01-15 05:37:04','2017-04-24 16:32:56','YULPST',0);

/*Table structure for table `tb_artikel` */

DROP TABLE IF EXISTS `tb_artikel`;

CREATE TABLE `tb_artikel` (
  `id_artikel` varchar(25) NOT NULL,
  `id_kat_artikel` varchar(25) NOT NULL,
  `judul_artikel` varchar(100) NOT NULL,
  `penulis` varchar(50) NOT NULL,
  `content_artikel` text NOT NULL,
  `img_artikel` varchar(100) DEFAULT NULL,
  `judul_url` varchar(100) DEFAULT NULL,
  `tgl_ins` datetime NOT NULL,
  `tgl_updt` datetime NOT NULL,
  `user_updt` varchar(25) NOT NULL,
  `kode_kantor` varchar(25) NOT NULL,
  PRIMARY KEY (`id_artikel`,`kode_kantor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_artikel` */

insert  into `tb_artikel`(`id_artikel`,`id_kat_artikel`,`judul_artikel`,`penulis`,`content_artikel`,`img_artikel`,`judul_url`,`tgl_ins`,`tgl_updt`,`user_updt`,`kode_kantor`) values ('idArt045409','idKatArt065330','Tentang SMKN 1 Sukaluyu Cianjur','KRYWN20170100001','										<p style=\"text-align: justify;\"><strong><em>Pada dasarnya pengertian pendidikan</em></strong> (&nbsp;<em>UU</em>&nbsp;SISDIKNAS No.20 tahun 2003&nbsp;) adalah usaha sadar dan terencana untuk mewujudkan suasana belajar dan proses pembelajaran agar peserta didik secara aktif mengembangkan potensi dirinya untuk memiliki kekuatan spiritual keagamaan, pengendalian diri, kepribadian, kecerdasan, akhlak mulia, serta keterampilan yang diperlukan dirinya dan masyarakat.</p>\r\n<p>Menurut kamus Bahasa Indonesia Kata pendidikan berasal dari kata ‘didik’ dan mendapat imbuhan ‘pe’ dan akhiran ‘an’, maka kata ini mempunyai arti proses atau cara atau perbuatan mendidik. Secara bahasa definisi pendidikan adalah proses pengubahan sikap dan tata laku seseorang atau kelompok orang dalam usaha mendewasakan manusiamelalui upaya pengajaran dan pelatihan</p>\r\n<p style=\"text-align: justify;\">Menurut Ki Hajar Dewantara (Bapak Pendidikan Nasional Indonesia) menjelaskan tentang <span style=\"text-decoration: underline;\"><a title=\"Pengertian Pendidikan Menurut Ahli\" href=\"http://belajarpsikologi.com/pengertian-pendidikan-menurut-ahli/\">pengertian pendidikan</a></span> yaitu: Pendidikan yaitu tuntutan di dalam hidup tumbuhnya anak-anak, adapun maksudnya, pendidikan yaitu menuntun segala kekuatan kodrat yang ada pada anak-anak itu, agar mereka sebagai manusia dan sebagai anggota masyarakat dapatlah mencapai keselamatan dan kebahagiaan setinggi-tingginya.</p>\r\n<p style=\"text-align: justify;\"><a title=\"Kurikulum Pendidikan Jangan Sering Berubah\" href=\"http://belajarpsikologi.com/kurikulum-pendidikan-jangan-sering-berubah/\" target=\"_blank\">Pendidikan</a> adalah usaha sadar untuk menyiapkan peserta didik melalui kegiatan bimbingan, pengajaran, dan atau latihan bagi peranannya di masa yang akan datang.</p>\r\n<p style=\"text-align: justify;\">Menurut UU No. 20 tahun 2003 <a title=\"Pendidikan Anak Usia Dini\" href=\"http://belajarpsikologi.com/pentingnya-pendidikan-anak-usia-dini/\" target=\"_blank\">Pendidikan</a> adalah usaha sadar dan terencana untuk mewujudkan suasana belajar dan proses pembelajaran agar peserta didik secara aktif mengembangkan potensi dirinya untuk memiliki kekuatan spiritual keagamaaan, pengendalian diri, kepribadian, kecerdasan, akhlak mulia, serta ketrampilan yang diperlukan dirinya, masyarakat, bangsa, dan Negara.</p>\r\n<p style=\"text-align: justify;\">Sedangkan <strong><a title=\"Pengertian Pendidikan Menurut Ahli\" href=\"http://belajarpsikologi.com/pengertian-pendidikan-menurut-ahli/\">pengertian pendidikan</a></strong> menurut H. Horne, adalah proses yang terus menerus (abadi) dari penyesuaian yang lebih tinggi bagi makhluk manusia yang telah berkembang secara fisik dan mental, yang bebas dan sadar kepada vtuhan, seperti termanifestasi dalam alam sekitar intelektual, emosional dan kemanusiaan dari manusia.</p>\r\n<p style=\"text-align: justify;\">Dari beberapa <em><strong><a title=\"Pengertian Pendidikan Menurut Ahli\" href=\"http://belajarpsikologi.com/pengertian-pendidikan-menurut-ahli/\">pengertian pendidikan menurut ahli</a></strong></em> tersebut maka dapat disimpulkan bahwa Pendidikan adalah Bimbingan atau pertolongan yang diberikan oleh orang dewasa kepada perkembangan anak untuk mencapai kedewasaannya dengan tujuan agar anak cukup cakap melaksanakan tugas hidupnya sendiri tidak dengan bantuan orang lain.</p>									','idArt045409.','Tentang-SMKN-1-Sukaluyu-Cianjur','2017-09-29 04:54:09','2018-01-16 15:35:13','admin','disdukcjr'),('idArt053240','idKatArt065306','Ambisi Nuklir Korut Menghalangi Kegiatan Pendidikan','KRYWN20170100001','										<div class=\"article-content-body__item-content\" data-component-name=\"desktop:read-page:article-content-body:section:text\">\r\n<p><strong>Liputan6.com, Pyongyang -</strong> Lembaga-lembaga pendidikan yang didanai asing kabarnya mengurangi kegiatan mereka di Pyongyang, seiring dengan semakin banyak negara mengeluarkan peringatan perjalanan ke Korea Utara karena ancaman misil dan nuklirnya.</p>\r\n<p>\"British Council menghentikan sementara program pengajaran bahasa Inggris di Pyongyang setelah nasihat perjalanan pemerintah Inggris diubah,\" juru bicara lembaga berbasis di London itu mengatakan melalui email kepada <em>VOA News</em>, yang dikutip Senin (11/9/2017).</p>\r\n<div class=\"baca-juga\">\r\n<p class=\"baca-juga__header\">Baca Juga</p>\r\n<ul class=\"baca-juga__list\">\r\n<li><a title=\"Protes Uji Coba Nuklir, Meksiko Usir Dubes Korut\" href=\"http://global.liputan6.com/read/3086846/protes-uji-coba-nuklir-meksiko-usir-dubes-korut\" target=\"_blank\">Protes Uji Coba Nuklir, Meksiko Usir Dubes Korut</a></li>\r\n<li><a title=\"PM Korsel: Dua Hari Lagi Korut Akan Luncurkan Rudal...\" href=\"http://global.liputan6.com/read/3086428/pm-korsel-dua-hari-lagi-korut-akan-luncurkan-rudal\" target=\"_blank\">PM Korsel: Dua Hari Lagi Korut Akan Luncurkan Rudal...</a></li>\r\n<li><a title=\"Korsel Rilis Tips Selamat dari Serangan Nuklir Korut\" href=\"http://global.liputan6.com/read/3084686/korsel-rilis-tips-selamat-dari-serangan-nuklir-korut\" target=\"_blank\">Korsel Rilis Tips Selamat dari Serangan Nuklir Korut</a></li>\r\n</ul>\r\n</div>\r\n<p>British Council juga menangguhkan diskusi mengenai perluasan programnya di Korea Utara.</p>\r\n<p>Keputusan itu dikeluarkan mematuhi peringatan perjalanan yang dikeluarkan kementerian luar negeri Inggris belum lama ini setelah Pyongyang melakukan uji coba peluncuran misil jarak jauh dan ledakan bom <a title=\"nuklir\" href=\"http://global.liputan6.com/read/3085193/putin-krisis-nuklir-korut-mungkin-tidak-terselesaikan\">nuklir</a>.</p>\r\n<p>Hari Minggu, rezim Kim Jong-un mengumumkan melalui media pemerintah bahwa negara itu telah meledakkan senjata termonuklir yang dapat dipasang pada hulu ledak misil balistik antar benua.</p>\r\n<p>Sebelumnya pada Senin 4&nbsp;September, Pyongyang University of Science and Technology (PUST) merilis pengumuman dimulainya semester Musim Gugur. Dalam pernyataanya, universitas itu menyatakan pengaturan kelas sudah \"disesuaikan dengan sumber daya yang ada\".</p>\r\n<p>Pernyataan tersebut&nbsp;menunjukkan pelarangan melakukan perjalanan yang diberlakukan Amerika sejak 1 September.</p>\r\n<p>PUST adalah universitas swasta yang sebagian besar didanai oleh kelompok-kelompok gereja Kristen Penginji dari Barat, dan memberikan pendidikan untuk anak-anak dari golongan elit di <a title=\"Korut\" href=\"http://global.liputan6.com/read/3077688/as-jawab-ancaman-rudal-korut-dengan-uji-coba-bom-nuklir-b61-12\">Korut</a>. Universitas ini biasanya memiliki 60 hingga 80 tenaga pengajar asing dan kira-kira setengahnya adalah pemegang paspor Amerika.</p>\r\n<p>PUST tidak memberikan penjelasan berapa banyak tenaga pengajar Amerika yang terkena pelarangan melakukan perjalanan, namun universitas tersebut mengatakan ada \"tambahan tenaga akademik yang akan bergabung saat kegiatan belajar semester ini mulai berjalan.\"</p>\r\n</div>									','idArt053240.jpg','Ambisi-Nuklir-Korut-Menghalangi-Kegiatan-Pendidikan','2017-09-30 05:32:40','2018-01-16 15:35:01','admin','disdukcjr'),('idArt075956','idKatArt065330','Mencoba Google Adsense','KRYWN20170100001','																				<p style=\"text-align: justify;\">Google Adsense adalah salah satu program PPC (Pay Per Click) yang paling banyak digemari oleh publisher Indonesia untuk memonetize situs mereka. Sejak Google Adsense mendukung website berbahasa Indonesia tahun 2012 yang lalu, banyak sekali blogger Indonesia yang mendaftarkan blog mereka di Google Adsense. Sayangnya, untuk menjadi member dan mendapatkan penghasilan dari Google Adsense itu bukan hal yang mudah. Bahkan ada yang kesulitan tentang cara daftar Google Adsense, padahal sebenarnya cara mendaftar di program PPC Google ini tidak sulit juga sih.</p>\r\n<p style=\"text-align: justify;\">Banyak blogger yang sudah mendaftar, namun tidak semua diterima menjadi publisher di Google Adsense. Ini karena &nbsp;website atau blog yang didaftarkan tidak memenuhi kriteria yang diharapkan oleh Google. Pihak Google Adsense menginginkan website/ blog yang menjadi publisher mereka adalah situs-situs yang berkualitas dan memenuhi aturan (TOS) mereka.</p>\r\n<p style=\"text-align: justify;\">Kalau dulu, cara daftar Google Adsense itu sangat mudah. Tapi seiring pertumbuhan dan perkembangan internet, Google Adsense sudah melakukan banyak perubahan pada layanan mereka dan disesuaikan dengan perkembangan yang ada. Membuat sebuah blog ala kadarnya dan diisi dengan konten yang sangat “dangkal”, lalu mendaftarkannya di Google Adsense adalah sebuah tindakan yang sia-sia karena pasti tidak akan diterima.</p>\r\n<p style=\"text-align: justify;\">Lalu bagaimana cara mendaftar Google Adsense agar cepat diterima?&nbsp;Keunikan, nilai jual, dan originalitas sebuah website adalah syarat yang sangat penting agar diterima oleh Google Adsense. PPC ini adalah program periklanan yang sama halnya dengan program periklanan lainnya. Mereka tentunya menginginkan website yang menayangkan iklan mereka bisa memberikan promosi atau pemasaran yang baik bagi para pengiklan. Sebenarnya proses mendaftarnya sangat mudah, tapi untuk bisa diterima pada program PPC Google ini, Anda harus memperhatikan beberapa hal penting.Pelajari lebih lanjut cara mendaftar di&nbsp;<a href=\"https://support.google.com/adsense/answer/10162?hl=id\" rel=\"noopener\" target=\"_blank\"><strong>Google Adsense</strong></a></p>\r\n<p style=\"text-align: justify;\">Sebelum mendaftar, sebaiknya Anda memperhatikan beberapa hal penting berikut ini agar peluang diterima lebih besar:</p>\r\n<h2 style=\"text-align: justify;\">1. Membuat Konten yang Unik di Situs Anda</h2>\r\n<p style=\"text-align: justify;\">Seperti yang sudah disebutkan sebelumnya, originalitas sebuah ide atau konten di dalam website Anda adalah nilai penting bagi Google Adsense. Mereka memperhatikan apakah konten di dalam sebuah website bermanfaat bagi orang lain atau tidak.</p>\r\n<p style=\"text-align: justify;\">Sebenarnya konten-konten di internet itu banyak yang membahas topik yang sama. Namun, cara penyajiannya atau cara penulisannya yang berbeda. Misalnya, Anda menulis tentang “cara menanam bunga Mawar”, tentunya ada banyak konten di situs lain yang membahas tentang ini.</p>\r\n<p style=\"text-align: justify;\">Namun, cara menuliskan konten dan cara menyajikannya di blog Anda pasti berbeda dengan konten di blog orang lain. Nah, kalau konten Anda adalah hasil copy paste dari sumber lain, kemungkinan besar situs Anda tidak akan disetujui untuk ikut program PPC Google Adsense.</p>\r\n<h3 style=\"text-align: justify;\">2. Perhatikan Umur Situs yang Didaftarkan</h3>\r\n<p style=\"text-align: justify;\">Sebaiknya jangan terlalu terburu-buru untuk mendaftarkan blog Anda untuk Google Adsense karena mereka memperhatikan umur website, jumlah konten, jumlah pengunjung, page view, dan lain-lain.</p>\r\n<p>Bila Anda saat ini memiliki blog yang sudah berumur 6 bulan, sudah diisi banyak konten, dan memiliki unique visitor yang stabil, ini bisa meyakinkan pihak Google Adsense bahwa blog Anda adalah tempat yang baik untuk memasang iklan.</p>\r\n<p>Sebenarnya ini bukan patokan baku ya, tapi menurut saya blog dengan usia 6 bulan sudah cukup banyak visitor dan bisa menghasilkan uang dari Google Adsense.</p>\r\n<h3 style=\"text-align: justify;\">3. Perhatikan Jumlah Konten Di Website/ Blog Anda</h3>\r\n<p style=\"text-align: justify;\">Jumlah konten adalah salah satu faktor penting agar diterima di Google Adsense. Saya kurang yakin berapa jumlah konten minimun di dalam sebuah website agar bisa diterima, tapi menurut saya pribadi akan lebih mudah diterima bila website kita memiliki banyak konten. Saya pribadi menyarankan untuk membuat minimal 60 konten artikel sebelum mendaftar di Google Adsense.</p>\r\n<p style=\"text-align: justify;\">Untuk situs berbentuk blog, sebaiknya Anda rajin meng-update konten di dalam blog Anda karena ini bisa mempengaruhi penilaian dari pihak Google. Blog yang sering di-update oleh pemiliknya tentunya akan memiliki peluang lebih baik diterima oleh Google Adsense dibandingkan dengan blog yang jarang sekali di-update.</p>\r\n<h3 style=\"text-align: justify;\">4. Gunakan Blogger.com atau YouTube.com</h3>\r\n<p style=\"text-align: justify;\">Nah, ini sangat penting untuk kita perhatikan. Jika Anda sudah memiliki domain dan hosting sendiri, maka peluang untuk diterima oleh Google Adsense akan lebih besar, tentunya dengan memperhatikan poin-poin sebelumnya. Namun, jika Anda ingin menggunakan domain &amp; hosting gratis, dan ingin menjadi publisher Google Adsense, maka sebaiknya Anda menggunakan Blogger.com.</p>\r\n<p style=\"text-align: justify;\">Google Adsense tidak bisa dipasang pada blog yang dibuat dengan WordPress.com, baik itu subdomain di WordPress ataupun domain sendiri yang menggunakan free hosting di WordPress. Ini adalah kebijakan (TOS) dari pihak WordPress.com sendiri, bisa dibaca <a href=\"http://en.support.wordpress.com/advertising/\" rel=\"noopener\" target=\"_blank\">Di SINI</a>.</p>\r\n<p style=\"text-align: justify;\">Blogger.com adalah layanan blog gratis yang diberikan oleh pihak Google. Tentunya ini keuntungan tersendiri bagi mereka yang menggunakannya karena selama ini pihak Google selalu memberikan kesempatan pada para pengguna Blogger.com untuk memonetize blog mereka dengan program Google Adsense.</p>\r\n<p style=\"text-align: justify;\">Jika Anda tidak ingin membuat blog, masih ada cara lain, yaitu melalui YouTube.com. Tentunya Anda harus punya beberapa konten video original yang di-upload ke YouTube.com. Video ini harus memiliki views yang cukup banyak agar bisa diterima di program Google Adsense.</p>\r\n<h3 style=\"text-align: justify;\">5. Informasi Pendukung</h3>\r\n<p style=\"text-align: justify;\">Ada baiknya situs Anda dilengkapi dengan halaman informasi pendukung, misalnya halaman About, Privacy Policy, Kontak, TOS. Ini akan membuat situs Anda terlihat serius dan memperhatikan pengunjung blog Anda.</p>\r\n<blockquote>\r\n<p style=\"text-align: justify;\">Pelajari lebih lanjut cara mendaftar di <a href=\"https://support.google.com/adsense/answer/10162?hl=id\" rel=\"noopener\" target=\"_blank\"><strong>Google Adsense</strong></a></p>\r\n</blockquote>\r\n<p style=\"text-align: justify;\">Konten yang Anda buat tidak harus “luar biasa” agar diterima oleh Google Adsense. Yang terpenting adalah menyajikan konten yang bermanfaat bagi orang lain dan tentunya ditulis dengan cara yang unik, bukan hasil meng-copy konten orang lain.</p>\r\n<p style=\"text-align: justify;\">Ada banyak blogger yang memiliki penghasilan rutin dari iklan Google Adsense di blog mereka, mulai dari ratusan hingga ribuan dollar per bulan. Kalau Anda ingin memonitize website/ blog Anda dengan cara memasang iklan, Google Adsense salah satu program PPC yang harus Anda pertimbangkan.</p>																		','idArt075956.jpg','Mencoba-Google-Adsense','2017-12-01 07:59:56','2018-01-16 11:14:31','admin','disdukcjr'),('idArt101012','idKatArt065306','Kebijakan Pemerintah Pusat Dinilai Tak Sejalan dengan Daerah','KRYWN20170100001','										<p><strong>JAKARTA, KOMPAS.com</strong> - Ketua Umum Gerakan Mahasiswa Kristen Indonesia (GMKI) Sahat Martin Philip Sinurat mengatakan, saat ini terlihat tidak ada sinkronisasi antara <a class=\"inner-link\" style=\"color: #428bca;\" href=\"http://indeks.kompas.com/tag/pemerintah\" target=\"_blank\">pemerintah</a> pusat dan daerah.</p>\r\n<p>Hal ini terutama terlihat dalam masalah ekonomi. Kerap kali kebijakan pemerintah pusat yang bisa menyejahterakan masyarakat tak diterapkan secara merata oleh <a class=\"inner-link\" style=\"color: #428bca;\" href=\"http://indeks.kompas.com/tag/pemerintah-daerah\" target=\"_blank\">pemerintah daerah</a>.</p>\r\n<p>\"Ekonomi berkeadilan harusnya tidak hanya wacana aja, tapi benar dilakukan di pemerintah pusat dan daerah,\" ujar Sahat dalam diskusi di Jakarta, Rabu (29/3/2017).</p>\r\n<p>Kebijakan pemerintah pusat yang dimaksud Sahat antara lain reforma agraria, pendaftaran lahan untuk masyarakat, dan pembuatan sertifikat gratis.</p>\r\n<p>Sayangnya, kata Sahat, pemerintah daerah ada yang masih menutup akses itu. Bahkan, di daerah tertentu, pemerintah setempat mengeluarkan kebijak di luar kewenangannya.</p>\r\n<p>\"Di Padang Sidempuan, ada daerah yang digusur tanahnya padahal belum ada keputusan pengadilan,\" kata Sahat.</p>\r\n<p>Sahat menyebut bahwa pemerintah cenderung mengambil investasi besar dari perusahaan besar. Contoh lainnya yaitu kilang gas di Blok Masela, Maluku.</p>\r\n<p><a class=\"inner-link\" style=\"color: #428bca;\" href=\"http://indeks.kompas.com/tag/pemerintah\" target=\"_blank\">Pemerintah</a>, kata dia, hanya memberi ruang yang besar bagi investor di sana.</p>\r\n<p>\"Tapi tidak ada untuk meningkatkan kesejahteraan masyarakat. Harusnya masyarakat sekitar mendapat perhatian lebih banyak,\" ujar Sahat.</p>\r\n<p>Selain itu, soal pabrik semen di pegunungan Kendeng, Rembang, Jawa Tengah. Presiden Joko Widodo menyatakan bahwa pihaknya menunggu kajian lingkungan hidup strategis soal pembangunan pabrik tersebut.</p>\r\n<p>\"Tapi pemerintah daerah melanjutkan kebijakan yang berbeda. Makanya rancu kebijakan pemerintah,\" kata Sahat.</p>\r\n<p>\"Harusnya lebih tegas pemerintah daerah bisa lakukan kebijakan yang mendukung pemerintah pusat. Kita dorong bagaimana rakyat yang diutamakan,\" lanjut dia.</p>									','idArt101012.','Kebijakan-Pemerintah-Pusat-Dinilai-Tak-Sejalan-dengan-Daerah','2017-12-01 10:10:12','2018-01-16 15:35:09','admin','disdukcjr');

/*Table structure for table `tb_images` */

DROP TABLE IF EXISTS `tb_images`;

CREATE TABLE `tb_images` (
  `id_images` varchar(25) NOT NULL,
  `id` varchar(25) NOT NULL,
  `grup` varchar(35) NOT NULL,
  `nama_images` varchar(100) NOT NULL,
  `judul_images` varchar(225) NOT NULL,
  `tgl_ins` datetime NOT NULL,
  `tgl_updt` datetime NOT NULL,
  `user_updt` varchar(25) NOT NULL,
  `kode_kantor` varchar(25) NOT NULL,
  `ket_images` text NOT NULL,
  PRIMARY KEY (`id_images`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_images` */

insert  into `tb_images`(`id_images`,`id`,`grup`,`nama_images`,`judul_images`,`tgl_ins`,`tgl_updt`,`user_updt`,`kode_kantor`,`ket_images`) values ('idImg0200030','idImg020003','images','788cc9f419331474bb139abfb2b0a169.jpeg','TEST IMAGES 2','2017-09-30 02:00:03','2017-09-30 02:00:03','idKry020349','disdukcjr','Kegiatan masak dan tata boga sekolah yang diadakan di berbagai event                   \r\n                    '),('idImg0200320','idImg020032','images','c9c0bd41adc3256da4271b0f9c51f8f2.jpeg','TEST IMAGES 3','2017-09-30 02:00:32','2017-09-30 02:00:32','idKry020349','disdukcjr','Kegiatan kewirausahaan sekolah di Cianjur                   \r\n                    '),('idImg0203130','idImg020313','images','a113161cb1a0db5dfd0c6d745e528225.jpeg','TEST IMAGES 4','2017-09-30 02:03:13','2017-09-30 02:03:13','idKry020349','disdukcjr','Menggunakan berbgai laat dan kebuthan untuk bersama                   \r\n                    '),('idImg0348590','idImg034859','images','ec1ac2435d54329963997ab243fc3fe3.jpeg','TEST IMAGES 5','2017-09-30 03:48:59','2017-09-30 03:48:59','idKry020349','disdukcjr','Test gambar saja, apakah bagus gambarnya                   \r\n                    '),('idImg0454090','idArt045409','artikel','1d4e2d941f70a1a37ed1d4bd857b2ca6.jpeg','artikel','2017-09-29 04:54:09','2017-09-29 04:54:09','idKry020349','disdukcjr','artikel'),('idImg0532400','idArt053240','artikel','01705e060a32572371918190f558188f.jpg','artikel','2017-09-30 05:32:40','2017-09-30 05:32:40','idKry020349','disdukcjr','artikel'),('idImg0714260','idHal071426','halaman','ec282cbd7c58003a093c6501547db026.jpeg','halaman','2017-11-29 07:14:26','2017-11-29 07:14:26','idKry020349','disdukcjr','halaman'),('idImg0715130','idHal071512','halaman','72f9ad4b37b306f9c68fa2003d105f03.jpeg','halaman','2017-11-29 07:15:13','2017-11-29 07:15:13','idKry020349','disdukcjr','halaman'),('idImg0715510','idHal071551','halaman','0b1e165f3e71ad1046198802382fc7be.jpeg','halaman','2017-11-29 07:15:51','2017-11-29 07:15:51','idKry020349','disdukcjr','halaman'),('idImg0759560','idArt075956','artikel','ada1d6f86ac277fd60a819c0acfd862a.jpeg','artikel','2017-12-01 07:59:56','2017-12-01 07:59:56','idKry020349','disdukcjr','artikel'),('idImg0950570','idImg095057','images','021c66ff35df99d01dba1361e289f55f.jpeg','TEST IMAGES','2017-09-29 09:50:57','2017-09-29 09:50:57','idKry020349','disdukcjr','GAMBAR KEGIATAN HARIAN SURABAYA                   \r\n                    '),('idImg1010120','idArt101012','artikel','9f5e71f58b8e0dc4d1c6fbc0ed7b2d5f.jpeg','artikel','2017-12-01 10:10:12','2017-12-01 10:10:12','idKry020349','disdukcjr','artikel');

/*Table structure for table `tb_jabatan` */

DROP TABLE IF EXISTS `tb_jabatan`;

CREATE TABLE `tb_jabatan` (
  `id_jabatan` varchar(25) NOT NULL,
  `kode_jabatan` varchar(25) NOT NULL,
  `nama_jabatan` varchar(25) NOT NULL,
  `ket_jabatan` text NOT NULL,
  `tgl_insert` datetime NOT NULL,
  `tgl_update` datetime NOT NULL,
  `user` int(11) NOT NULL,
  `kode_kantor` varchar(15) NOT NULL,
  PRIMARY KEY (`id_jabatan`,`kode_kantor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_jabatan` */

insert  into `tb_jabatan`(`id_jabatan`,`kode_jabatan`,`nama_jabatan`,`ket_jabatan`,`tgl_insert`,`tgl_update`,`user`,`kode_kantor`) values ('JBTN20170100002','','Admin Aplikasi','-','2017-01-15 05:37:04','2017-01-15 05:37:04',0,'YULPST');

/*Table structure for table `tb_karyawan` */

DROP TABLE IF EXISTS `tb_karyawan`;

CREATE TABLE `tb_karyawan` (
  `id_karyawan` varchar(25) NOT NULL,
  `id_jabatan` varchar(25) NOT NULL,
  `no_karyawan` varchar(25) NOT NULL,
  `nik_karyawan` varchar(35) NOT NULL,
  `nama_karyawan` varchar(35) NOT NULL,
  `pnd` varchar(50) NOT NULL,
  `tlp` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `avatar` varchar(100) DEFAULT '',
  `avatar_url` text NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `ket_karyawan` text NOT NULL,
  `tgl_ins` datetime NOT NULL,
  `tgl_updt` datetime NOT NULL,
  `user_updt` int(11) NOT NULL,
  `kode_kantor` varchar(15) NOT NULL,
  PRIMARY KEY (`id_karyawan`,`kode_kantor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tb_karyawan` */

insert  into `tb_karyawan`(`id_karyawan`,`id_jabatan`,`no_karyawan`,`nik_karyawan`,`nama_karyawan`,`pnd`,`tlp`,`email`,`avatar`,`avatar_url`,`alamat`,`ket_karyawan`,`tgl_ins`,`tgl_updt`,`user_updt`,`kode_kantor`) values ('KRYWN20170100001','JBTN20170100002','KRYWN2017010001','20170116','yufiarti','S1 Teknik Informatika','085759596841','mulyanayusuf30@gmail.com','','','Cianjur - Jawa barat','-','2017-01-17 03:38:23','2017-03-25 14:13:50',0,'YULPST');

/*Table structure for table `tb_kat_artikel` */

DROP TABLE IF EXISTS `tb_kat_artikel`;

CREATE TABLE `tb_kat_artikel` (
  `id_kat_artikel` varchar(25) NOT NULL,
  `nama_kat_artikel` varchar(50) NOT NULL,
  `ket_kat_artikel` text NOT NULL,
  `img_kat_artikel` varchar(100) DEFAULT NULL,
  `nama_url` varchar(100) DEFAULT NULL,
  `tgl_ins` datetime NOT NULL,
  `tgl_updt` datetime NOT NULL,
  `user_updt` varchar(25) NOT NULL,
  `kode_kantor` varchar(25) NOT NULL,
  PRIMARY KEY (`id_kat_artikel`,`kode_kantor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_kat_artikel` */

insert  into `tb_kat_artikel`(`id_kat_artikel`,`nama_kat_artikel`,`ket_kat_artikel`,`img_kat_artikel`,`nama_url`,`tgl_ins`,`tgl_updt`,`user_updt`,`kode_kantor`) values ('idKatArt065306','Berita/Informasi','Berita/Informasi Sekolah ','idKatArt065306.png','berita-informasi-sekolah','2017-09-27 06:53:06','2017-09-27 06:53:06','idKry020349','disdukcjr'),('idKatArt065330','Artikel','Artikel Sekolah ','idKatArt065330.jpg','artikel-sekolah','2017-09-27 06:53:30','2017-09-27 06:53:30','idKry020349','disdukcjr');

/*Table structure for table `tb_videos` */

DROP TABLE IF EXISTS `tb_videos`;

CREATE TABLE `tb_videos` (
  `id_videos` varchar(50) NOT NULL,
  `id` varchar(50) NOT NULL,
  `link_videos` text NOT NULL,
  `judul_videos` varchar(255) NOT NULL,
  `tgl_ins` datetime NOT NULL,
  `tgl_updt` datetime NOT NULL,
  `user_updt` varchar(25) NOT NULL,
  `kode_kantor` varchar(25) NOT NULL,
  `ket_videos` text NOT NULL,
  `grup` varchar(50) NOT NULL,
  PRIMARY KEY (`id_videos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_videos` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
