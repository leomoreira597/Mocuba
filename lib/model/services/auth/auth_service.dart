import 'dart:io';

import 'package:mocuba/model/models/user_model.dart';

abstract class AuthService {
  UserModel? get currentUser;
  Stream<UserModel?> get userChanges;

  Future<void> signup(
    String nome,
    String email,
    String password,
    File image,
  );

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();
}
