<?php

namespace App\Models;

use CodeIgniter\Model;

class Mkelas extends Model
{
    protected $DBGroup          = 'default';
    protected $table            = 'tbl_kelas';
    protected $primaryKey       = 'id_kelas';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = ['id_kelas','nama_kelas','nip_walikelas'];

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

    public function getAllKelas(){
        $kelas= NEW Mkelas;
        $queryKelas=$kelas->query("CALL sp_ambil_kelas()")->getResult();
        return $queryKelas;
    }
}
