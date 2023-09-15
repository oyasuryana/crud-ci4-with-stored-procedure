<?=$this->extend('dashboard');?>
<?=$this->section('konten');?>
<h3><?=$judulHalaman;?></h3>
<p><?=$introTeks;?></p>

<form method="POST">
<div class="row">
    <label class="fw-bold">Nomor Induk</label>
    <div>
    <input class="form-control" type="text" name="txtNIS" width="10" autocomplete="off" placeholder="Masukan Nomor Induk Siswa"/>
   </div>
</div> 

<div class="row mt-3">
    <div class="col-md-2">
    <button class="btn btn-block btn-primary btn-sm" type="submit">Cari Siswa</button>
    </div>
</div>

</form>
<?php
if(isset($hasilCari)) : ?>
 
 <table class="table mt-2 table-sm table-striped table-bordered">
    <thead>
    <tr>
        <th>No</th>        
        <th>NIS</th>
        <th>Nama Siswa</th>
        <th>Tempat, Tanggal Lahir</th>
        <th>Kelas</th>
        <th>Wali Kelas</th>
        <th>Tarif SPP/Bulan</th>
        <th>Aksi</th>
    </tr>
    </thead>
    <tbody>

    <?php
if(isset($hasilCari)) :
    $html =null;
    $no = null;
    foreach($hasilCari as $baris) :
        $no++;
        $html .='<tr>';
        $html .='<td>'. $no.'</td>';
        $html .='<td>'. $baris->nis.'</td>';
        $html .='<td>'. ucwords(strtolower($baris->nama)).'</td>';
        $html .='<td>'. $baris->tempat_lahir.', '.$baris->tgl_lahir.'</td>';
        $html .='<td>'. $baris->nama_kelas.'</td>';
        $html .='<td>'. $baris->nama_walikelas.'</td>';
        $html .='<td align="right">'. number_format($baris->tarif_spp,0,',','.').'</td>';
        $html .='<td align="center">
        <a href="'.site_url('edit-siswa/'.$baris->nis).'" class="btn btn-primary btn-sm fw-bold">...</a>
        <a href="'.site_url('hapus-siswa/'.$baris->nis).'" OnClick="return confirm(\'Anda Yakin ?\')" class="btn btn-danger btn-sm fw-bold">X</a>
        </td>';
        $html .='</tr>';
    endforeach;
endif;

    echo $html;
    ?>
    </tbody>
</table>

<?php 
endif;
?>

<?=$this->endSection();?>