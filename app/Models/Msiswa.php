<?php

namespace App\Models;

use CodeIgniter\Model;

class Msiswa extends Model
{
    protected $DBGroup          = 'default';
    protected $table            = 'tbl_siswa';
    protected $primaryKey       = 'nis';
    protected $useAutoIncrement = false;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = ['nis','nama','tempat_lahir','tgl_lahir','id_kelas','id_spp','nik'];

    // Dates
    protected $useTimestamps = false;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

    // Validation
    protected $validationRules      = [];
    protected $validationMessages   = [];
    protected $skipValidation       = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks = true;
    protected $beforeInsert   = [];
    protected $afterInsert    = [];
    protected $beforeUpdate   = [];
    protected $afterUpdate    = [];
    protected $beforeFind     = [];
    protected $afterFind      = [];
    protected $beforeDelete   = [];
    protected $afterDelete    = [];
    
    public function getAllSiswa(){
        $siswa= NEW MSiswa;
        $querySiswa=$siswa->query("CALL tampil_siswa()")->getResult();
        return $querySiswa;
    }
    
    public function hapusSiswa($nis){
        $siswa= NEW MSiswa;
        $siswa->query("CALL sp_hapus_siswa('".$nis."')");

    }

    public function simpanSiswa($data){
        $siswa=NEW Msiswa;
        $nis        = $data['nis'];
        $nama       = $data['nama'];
        $tempat     = $data['tmpt_lhr'];
        $tanggal    = $data['tgl_lhr'];
        $kelas      = $data['id_kelas'];
        $tarif      = $data['id_spp'];
        $siswa->query("CALL sp_insert_siswa('$nis','$nama','$tempat','$tanggal','$kelas','$tarif')");

    }

    public function updateSiswa($data){
        $siswa=NEW Msiswa;
        $nis        = $data['nis'];
        $nama       = $data['nama'];
        $tempat     = $data['tmpt_lhr'];
        $tanggal    = $data['tgl_lhr'];
        $kelas      = $data['id_kelas'];
        $tarif      = $data['id_spp'];
        $siswa->query("CALL sp_update_siswa('$nis','$nama','$tempat','$tanggal','$kelas','$tarif')");
    }

    public function cariSiswa($nis){
        $siswa= NEW MSiswa;
        $querySiswa=$siswa->query("CALL sp_cari_siswa('".$nis."')")->getResult();
        return $querySiswa;
        
    }
}
