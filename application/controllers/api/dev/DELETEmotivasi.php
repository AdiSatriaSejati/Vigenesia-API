<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class DELETEmotivasi extends REST_Controller
{

    function __construct($config = 'rest')
    {
        parent::__construct($config);
        $this->load->database();
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
        $method = $_SERVER['REQUEST_METHOD'];
        if ($method == "OPTIONS") {
            die();
        }
        $this->load->model('motivasi');
    }

    public function index_get()
    {
        $iduser = $this->get('iduser');
        $tanggal_input = $this->get('tanggal_input');
        if ($iduser == '') {
            $this->db->order_by('tanggal_input', 'DESC');
            $api = $this->db->get('motivasi')->result();
        } else {
            //$this->db->where('id', $id);
            //$api = $this->db->get('motivasi')->result();

            $this->db->where('iduser', $iduser);
            $api = $this->db->get('motivasi')->result();
        }
        $this->response($api, 200);
    }

    function index_delete()
    {
        // Coba ambil ID dari berbagai kemungkinan sumber
        $id = $this->delete('id');
        if (!$id) {
            $id = $this->input->get('id');
        }
        
        // Validasi ID
        if (!$id) {
            $this->response([
                'status' => false,
                'message' => 'ID tidak ditemukan'
            ], REST_Controller::HTTP_BAD_REQUEST);
            return;
        }

        $this->db->where('id', $id);
        $delete = $this->db->delete('motivasi');
        
        if ($delete) {
            $this->response([
                'status' => true,
                'message' => 'Postingan Berhasil di Hapus.',
                'id' => $id
            ], REST_Controller::HTTP_OK);
        } else {
            $this->response([
                'status' => false,
                'message' => 'Gagal menghapus postingan',
                'id' => $id
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
    }
}
