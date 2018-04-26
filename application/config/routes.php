<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
//$route['default_controller'] = 'C_home';
$route['default_controller'] = 'C_home';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

//ROUTE INI UNTUK AREA ADMIN PANEL / BACKEND


	$route['admin'] = "C_admin/index";
	$route['admin/(:any)'] = 'C_admin/index';

	$route['login'] = "C_admin_login/index";
	$route['login/(:any)'] = 'C_admin_login/index';

	$route['admin-cek-login'] = "C_admin_login/cek_login";
	$route['admin-cek-login/(:any)'] = 'C_admin_login/cek_login';

	$route['admin-kat-artikel'] = "C_admin_kat_artikel/index";
	$route['admin-kat-artikel/(:any)'] = "C_admin_kat_artikel/index";

	$route['admin-kat-artikel-simpan'] = "C_admin_kat_artikel/simpan";
	$route['admin-kat-artikel-simpan/(:any)'] = "C_admin_kat_artikel/simpan";

	$route['admin-kat-artikel-hapus'] = "C_admin_kat_artikel/hapus";
	$route['admin-kat-artikel-hapus/(:any)'] = "C_admin_kat_artikel/hapus";

	$route['admin-artikel'] = "C_admin_artikel/index";
	$route['admin-artikel/(:any)'] = "C_admin_artikel/index";

	$route['tambah-artikel'] = "C_admin_artikel/tambah";
	$route['tambah-artikel/(:any)'] = "C_admin_artikel/tambah";

	$route['edit-artikel'] = "C_admin_artikel/edit";
	$route['edit-artikel/(:any)'] = "C_admin_artikel/edit";

	$route['admin-artikel-simpan'] = "C_admin_artikel/simpan";
	$route['admin-artikel-simpan/(:any)'] = "C_admin_artikel/simpan";

	$route['admin-artikel-hapus'] = "C_admin_artikel/hapus";
	$route['admin-artikel-hapus/(:any)'] = "C_admin_artikel/hapus";

    $route['admin-images'] = "C_admin_images/index";
	$route['admin-images/(:any)'] = "C_admin_images/index";



//ROUTE INI UNTUK AREA FRONTEND

	$route['course'] = "C_public_course/index";
	$route['course/(:any)'] = "C_public_course/index";

	$route['tentang'] = "C_public_tentang/index";
	$route['tentang/(:any)'] = "C_public_tentang/index";
	$route['tentang/(:any)/(:any)'] = "C_public_tentang/index";

	$route['artikel'] = "C_public_course/artikel";
	$route['artikel/(:any)'] = "C_public_course/artikel";
