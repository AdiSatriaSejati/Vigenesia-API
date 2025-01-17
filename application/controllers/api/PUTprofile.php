<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class PUTprofile extends REST_Controller
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
        $this->load->model('user');
    }

    function index_put()
    {
        $id = $this->put('id');
        $data = array(
            'id'           => $this->post('id'),
            'nama'          => $this->post('nama'),
            'instansi'    => $this->post('instansi'),
            'tnggal_lahir'    => $this->post('tnggal_lahir'),
            'umur'    => $this->post('umur'),
            'jenis_kelamin'    => $this->post('jenis_kelamin'),
            'alamat'    => $this->post('alamat'),
            'email'    => $this->post('email'),
            'call_num'    => $this->post('call_num'),
            'image'    => $this->post('image'),
            'password'    => $this->post('password'),
            'role_id'    => $this->post('role_id'),
            'is_active'    => $this->post('is_active'),
            'tanggal_input'    => $this->post('tanggal_input')
        );
        $this->db->where('id', $id);
        $update = $this->db->update('user', $data);
        if ($update) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    function index_get()
    {
        $id = $this->get('id');
        if ($id == '') {
            $api = $this->db->get('user')->result();
        } else {
            $this->db->where('id', $id);
            $api = $this->db->get('user')->result();
        }
        $this->response($api, 200);
    }

}
