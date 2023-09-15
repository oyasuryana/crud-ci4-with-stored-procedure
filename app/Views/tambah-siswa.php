<?=$this->extend('dashboard');?>
<?=$this->section('konten');?>

 <h3><?=$judulHalaman;?></h3>
<p><?=$introTeks;?></p>

<form method="POST">
<div class="row">
    <label class="fw-bold">Nomor Induk</label>
    <div>
    <input class="form-control" type="text" name="txtNIS" width="10" value="<?=isset($detailSiswa[0]->nis) ? $detailSiswa[0]->nis : null;?>"/>
   </div>
</div>    

<div class="row">
    <label class="fw-bold">Nama Siswa</label>
    <div>
    <input class="form-control" type="text" name="txtNama" width="30" value="<?=isset($detailSiswa[0]->nama) ? $detailSiswa[0]->nama : null;?>"/>
    </div>
</div>    

<div class="row">
    <label class="fw-bold">Tempat Lahir</label>
    <div>
    <input type="text" class="form-control" name="txtTempat" width="20" value="<?=isset($detailSiswa[0]->tempat_lahir) ? $detailSiswa[0]->tempat_lahir : null;?>"/>
    </div>    
</div>

<div class="row">
    <label class="fw-bold">Tanggal Lahir</label>
    <div>
    <input type="date" class="form-control" name="txtTanggal" width="20" value="<?=isset($detailSiswa[0]->tgl_lahir) ? $detailSiswa[0]->tgl_lahir : null;?>"/>
    </div>
</div>

<div class="row">
    <label class="fw-bold">Kelas</label>
    <div>
    <select class="form-control"  name="opsiKelas">
    <?php
    if(isset($listKelas)) :
        foreach($listKelas as $baris) :
            if(isset($detailSiswa[0]->id_spp)) :
                $detailSiswa[0]->id_kelas == $baris->id_kelas ? $pilih = 'selected' : $pilih=null; 
             else :
                $pilih=null;
             endif;
            echo '<option '.$pilih.' value="'.$baris->id_kelas.'">'.$baris->nama_kelas.'</option>';
            endforeach; 
    endif;
    ?>
    </select>
    </div>
</div>
<div class="row">
    <label class="fw-bold">Tarif SPP</label>
    <div>
    <select  class="form-control" name="opsiTarif">
    <?php
    if(isset($listTarif)) :
        foreach($listTarif as $baris) :
            if(isset($detailSiswa[0]->id_spp)) :
                $detailSiswa[0]->id_spp == $baris->id_spp ? $pilih = 'selected' : $pilih=null; 
             else :
                $pilih=null;
             endif;
            echo '<option '.$pilih.' value="'.$baris->id_spp.'">'.$baris->tarif_spp.'</option>';
            endforeach; 
    endif;
    ?>
    </select>
    </div>
</div>

<div class="row mt-3">
    <div class="col-md-2">
    <button class="btn btn-block btn-primary btn-sm" type="submit">Simpan</button>
    </div>
</div>
</form>

<?=$this->endSection();?>