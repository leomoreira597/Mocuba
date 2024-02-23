import 'dart:io';

import 'package:mocuba/model/models/user_model.dart';
import 'package:mocuba/model/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  @override
  // TODO: implement currentUser
  UserModel? get currentUser {
    return null;
  }

  @override
  Future<void> login(String email, String password) async {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> signup(
      String nome, String email, String password, File image) async {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  // TODO: implement userChanges
  Stream<UserModel?> get userChanges => throw UnimplementedError();
}
