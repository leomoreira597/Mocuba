import 'package:flutter/material.dart';
import 'package:mocuba/model/models/auth_form_data.dart';
import 'package:mocuba/model/services/auth/auth_mock_service.dart';
import 'package:mocuba/view/widgets/auth_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      setState(() {
        _isLoading = true;
      });
      if (formData.isLogin) {
        await AuthMockService().login(
          formData.email,
          formData.password,
        );
      } else {
        await AuthMockService().signup(
          formData.name,
          formData.email,
          formData.password,
          formData.image,
        );
      }
    } catch (e) {
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: AuthForm(onSubmit: _handleSubmit),
            ),
          ),
          if (_isLoading)
            Container(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    );
  }
}
