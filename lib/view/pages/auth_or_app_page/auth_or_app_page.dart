import 'package:flutter/material.dart';
import 'package:mocuba/model/models/user_model.dart';
import 'package:mocuba/view/pages/auth_page/auth_page.dart';
import 'package:mocuba/view/pages/chat_page/chat_page.dart';
import 'package:mocuba/view/pages/loading_page/loading_page.dart';

import '../../../model/services/auth/auth_service.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<UserModel?>(
        stream: AuthService().userChanges,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          } else {
            return snapshot.hasData ? const ChatPage() : const AuthPage();
          }
        },
      ),
    );
  }
}
