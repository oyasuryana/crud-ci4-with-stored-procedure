<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Siswa::index');
$routes->get('/list-siswa', 'Siswa::tampilSiswa');

$routes->get('/hapus-siswa/(:num)', 'Siswa::hapus/$1');
$routes->get('/tambah-siswa', 'Siswa::tambah');
$routes->post('/tambah-siswa', 'Siswa::tambah');

$routes->get('/edit-siswa/(:num)', 'Siswa::edit/$1');
$routes->post('/edit-siswa/(:num)', 'Siswa::tambah');

$routes->get('/cari-siswa', 'Siswa::cariSiswa');
$routes->post('/cari-siswa', 'Siswa::cariSiswa');