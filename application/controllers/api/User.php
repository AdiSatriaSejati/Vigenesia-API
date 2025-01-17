<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class User extends REST_Controller
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
    }

    // Menampilkan hasil login akun user
    function index_get()
    {
        $id = $this->get('iduser');
        if ($id == '') {
            $api = $this->db->get('user')->result();
        } else {
            $this->db->where('iduser', $id);
            $api = $this->db->get('user')->result();
        }
        $this->response($api, 200);
    }

    function index_delete()
    {
        $id = $this->delete('iduser');
        $this->db->where('iduser', $id);
        $delete = $this->db->delete('user');
        if ($delete) {
            $this->response([
                'message' => 'User successfully deleted',
                'data' => $delete
            ], REST_Controller::HTTP_OK);
        } else {
            $this->response(['status' => 'fail'], REST_Controller::HTTP_BAD_REQUEST);
        }
    }

    function index_put()
    {
        $id = $this->put('iduser');

        // Get the post data
        $nama = $this->put('nama');
        $profesi = $this->put('profesi');
        $email = $this->put('email');
        $password = $this->put('password');

        // Validate the post data
        if (!empty($nama) || !empty($profesi) || !empty($email) || !empty($password)) {
            // Filter inputs using strip_tags and handle null values
            $userData = array();
            if (!empty($nama)) {
                $userData['nama'] = strip_tags($nama);
            }
            if (!empty($profesi)) {
                $userData['profesi'] = strip_tags($profesi);
            }
            if (!empty($email)) {
                $userData['email'] = strip_tags($email);
            }
            if (!empty($password)) {
                $userData['password'] = md5($password);
            }

            // Update user's account data
            $this->db->where('iduser', $id);
            $update = $this->db->update('user', $userData);

            // Check if the user data is updated
            if ($update) {
                // Set the response and exit
                $this->response([
                    'status' => TRUE,
                    'message' => 'User berhasil memperbarui profil.'
                ], REST_Controller::HTTP_OK);
            } else {
                // Set the response and exit
                $this->response("Some problems occurred, please try again.", REST_Controller::HTTP_BAD_REQUEST);
            }
        } else {
            // Set the response and exit
            $this->response("Provide at least one user info to update.", REST_Controller::HTTP_BAD_REQUEST);
        }
    }
}
