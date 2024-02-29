import 'dart:io';

import 'package:mocuba/model/models/user_model.dart';
import 'package:mocuba/model/services/auth/auth_mock_service.dart';

abstract class AuthService {
  UserModel? get currentUser;
  Stream<UserModel?> get userChanges;

  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  );

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();
  factory AuthService(){
    return AuthMockService();
  }
}
