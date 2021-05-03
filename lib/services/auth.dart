import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_sanctum/models/user.dart';
import 'package:flutter_sanctum/services/dio.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = true;

  User _user;
  String _token;

  bool get authenticated => _isLoggedIn;
  User get user => _user;

  void login({Map creds}) async {
    print(creds);

    Dio.Response response = await dio().post('/sanctum/token',data: creds);

    print(response.data.toString());
     _isLoggedIn = true;
     notifyListeners();
  }

  void logout(){
     _isLoggedIn = false;
     notifyListeners();

  }
}