<!DOCTYPE html>
<html lang="en">
<head>
    <title>Data Siswa</title>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
    .body{
        margin-top:70px;
    }    
    </style>
</head>
<body>
<div class="container">
<header >
  <!-- Fixed navbar -->
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-success">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">AppSiswa</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link" href="<?=site_url();?>">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?=site_url('list-siswa');?>">Data Siswa</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?=site_url('tambah-siswa');?>">Tambah Siswa</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?=site_url('cari-siswa');?>">Cari Siswa</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>
<div class="body">
<?php
         if(isset($judulHalaman)){
             echo $this->renderSection('konten');
          } else {
            echo '<div class="container my-5">
            <div class="p-5 text-center bg-body-tertiary rounded-3">
              <h1 class="text-body-emphasis">Aplikasi Data Siswa</h1>
              <p class="lead">
                Aplikasi ini merupakan contoh penggunaan Stored Procedure didalam database MySQL yang diimplementasikan pada framework COdeIgniter4.
              </p>
            </div>
          </div>';
          }
?>
</div>
</div>
</body>
</html>