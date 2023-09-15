<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class Siswa extends BaseController
{


    public function index()
    {
        return view('dashboard');
    }

    public function tampilSiswa(){
        $data =[
            'judulHalaman' =>'Data Siswa',
            'introTeks'=>'Berikut data siswa SMK Negeri 2 Kuningan yang sudah terdata dalam databaase.',
            'listSiswa'=>$this->siswa->getAllSiswa(),
        ] ;
        return view('list-siswa',$data);
    }
    public function hapus($nisNya){
        $this->siswa->hapusSiswa($nisNya);
        return redirect()->to('/');
    }

    public function tambah(){
        // mengambil data kelas dan spp untuk komponen select
        $data=[
            'judulHalaman' =>'Penambahan Data Siswa',
            'introTeks'=>'Untuk menambah data baru, silahkan masukan data siswa baru  pada form dibawah ini',
            'listKelas'=>$this->kelas->getAllKelas(),
            'listTarif'=>$this->spp->getAllTarifSPP()
        ];
        
        // memastikan keempat field dalam form  tidak dikosongkan
        $validasiForm=[
            'txtNIS'=>'required',
            'txtNama'=>'required',
            'txtTempat'=>'required',
            'txtTanggal'=>'required'
        ];

        // jika tombol simpan ditekan
        if($this->validate($validasiForm)){
            $data=[
            'nis'   =>$this->request->getPost('txtNIS'),
            'nama'  =>$this->request->getPost('txtNama'),
            'tmpt_lhr'  =>$this->request->getPost('txtTempat'),
            'tgl_lhr'   =>$this->request->getPost('txtTanggal'),
            'id_kelas'  =>$this->request->getPost('opsiKelas'),
            'id_spp'    =>$this->request->getPost('opsiTarif')
            ];

            $cekRecord=$this->siswa->cariSiswa($data['nis']);

            if(isset($cekRecord[0]->nis)){
                $this->siswa->updateSiswa($data);
            } else {
                $this->siswa->simpanSiswa($data);
            }

            return redirect()->to('/list-siswa');
        }

        return view('tambah-siswa',$data);
    }

    public function edit($nis){
        $data =[
            'judulHalaman' =>'Perubahan Data Siswa',
            'introTeks'=>'Untuk merubah data silahkan lakukan perubahan pada form dibawah ini',
            'detailSiswa'=>$this->siswa->cariSiswa($nis),
            'listKelas'=>$this->kelas->getAllKelas(),
            'listTarif'=>$this->spp->getAllTarifSPP()
        ] ;
        return view('tambah-siswa',$data);

    }

    public function cariSiswa(){
        $data =[
            'judulHalaman' =>'Pencarian Data Siswa',
            'introTeks'=>'Silahkan masukan nomor induk siswa untuk mencari data siswa.'
        ];
        
        $validasiForm=[
            'txtNIS' => 'required'
        ];
        
        if($validasiForm){
            $nis=$this->request->getPost('txtNIS');
            $data=[
                'judulHalaman' =>'Pencarian Data Siswa',
                'introTeks'=>'Silahkan masukan nomor induk siswa untuk mencari data siswa.',
                'hasilCari'=>$cekRecord=$this->siswa->cariSiswa($nis)
            ];
        }

        return view('cari-siswa',$data);
    }

    
}
