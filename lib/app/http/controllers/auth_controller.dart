import 'dart:io';

import 'package:vania/vania.dart';
import 'package:paml_backend_vania/app/models/users_model.dart';

class AuthController extends Controller {
  Future<Response> register(Request request) async {
    try {
      // Validasi input
      request.validate({
        'username': 'required',
        'email': 'required|email',
        'password': 'required|min_length:6|confirmed',
      }, {
        'username.required': 'Nama tidak boleh kosong',
        'email.required': 'Email tidak boleh kosong',
        'email.email': 'Format email tidak valid',
        'password.required': 'Password tidak boleh kosong',
        'password.min_length': 'Password harus minimal 6 karakter',
        'password.confirmed': 'Konfirmasi password tidak sesuai',
      });

      // Ambil data dari request
      final id = request.input('id');
      final name = request.input('name');
      final username = request.input('username');
      final email = request.input('email');
      var password = request.input('password');

      // Periksa apakah pengguna sudah ada
      var existingUser =
          await UsersModel().query().where('email', '=', email).first();
      if (existingUser != null) {
        return Response.json({
          "message": "User sudah terdaftar",
        }, 409);
      }

      // Hash password dan simpan pengguna
      password = Hash().make(password);
      await UsersModel().query().insert({
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "password": password,
        "created_at": DateTime.now().toIso8601String(),
      });

      return Response.json({
        "message": "Berhasil mendaftarkan user",
      }, 201);
    } catch (e) {
      return Response.json({
        "message": "Terjadi kesalahan: ${e.toString()}",
      }, 500);
    }
  }

Future<Response> login(Request request) async {
  try {
    // Validasi input
    request.validate({
      'email': 'required|email',
      'password': 'required',
    }, {
      'email.required': 'Email tidak boleh kosong',
      'email.email': 'Format email tidak valid',
      'password.required': 'Password tidak boleh kosong',
    });

    // Ambil data dari request
    final email = request.input('email');
    var password = request.input('password').toString();

    // Cari pengguna berdasarkan email
    var user = await UsersModel().query().where('email', '=', email).first();
    if (user == null) {
      return Response.json({
        "message": "User belum terdaftar",
      }, 404);
    }

    // Verifikasi password
    if (!Hash().verify(password, user['password'])) {
      return Response.json({
        "message": "Password salah",
      }, 401);
    }

    // Pastikan 'id' ada di user
    if (user['id'] == null) {
      return Response.json({
        "message": "ID pengguna tidak ditemukan",
      }, 500);
    }

    // Buat token
    final token = await Auth().login(user).createToken(
      expiresIn: Duration(days: 30),
      withRefreshToken: true
    );

    return Response.json({
      "message": "Berhasil login",
      "token": token,
    }, 200);
  } catch (e) {
    return Response.json({
      "message": "Terjadi kesalahan: ${e.toString()}",
    }, 500);
  }
}


  Future<Response> me() async {
    try {
      // Ambil pengguna yang sudah terotentikasi
      Map? authUser = Auth().user();

      // Periksa apakah token valid dan data pengguna ada
      if (authUser != null) {
        final email =
            authUser['email']; // Asumsi token menyimpan email pengguna
        var user =
            await UsersModel().query().where('email', '=', email).first();

        if (user != null) {
          // Hapus data sensitif
          user.remove('password');

          return Response.json({
            "message": "success",
            "data": {
              "username": user['username'],
              "email": user['email'],
            },
          }, 200);
        }
      }

      return Response.json({
        "message": "Token tidak valid atau pengguna tidak ditemukan",
      }, 401);
    } catch (e) {
      return Response.json({
        "message": "Terjadi kesalahan: ${e.toString()}",
      }, 500);
    }
  }
}

final AuthController authController = AuthController();
