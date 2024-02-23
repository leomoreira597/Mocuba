import 'dart:io';
import 'dart:math';
import 'package:mocuba/model/models/user_model.dart';
import 'package:mocuba/model/services/auth/auth_service.dart';
import 'dart:async';

class AuthMockService implements AuthService {
  static Map<String, UserModel> _users = {};
  static UserModel? _currentUser;
  static MultiStreamController<UserModel?>? _controller;
  static final _userStream = Stream<UserModel?>.multi((controller) {
    _controller = controller;
    _updateUser(null);
  });

  @override
  // TODO: implement currentUser
  UserModel? get currentUser {
    return null;
  }

  @override
  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  @override
  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  ) async {
    final newUser = UserModel(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
      imageURL: image?.path ?? "//",
    );
    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  // TODO: implement userChanges
  Stream<UserModel?> get userChanges {
    return _userStream;
  }

  static void _updateUser(UserModel? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
