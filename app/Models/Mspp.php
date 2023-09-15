<?php

namespace App\Models;

use CodeIgniter\Model;

class Mspp extends Model
{
    protected $DBGroup          = 'default';
    protected $table            = 'tbl_spp';
    protected $primaryKey       = 'id_spp';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = ['id_spp','tahun_spp','tarif_spp'];

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

    public function getAllTarifSPP(){
        $tarifSPP= NEW Mspp;
        $querySpp=$tarifSPP->query("CALL sp_ambil_tarif()")->getResult();
        return $querySpp;
    }
}
