import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mocuba/model/models/auth_form_data.dart';
import 'package:mocuba/view/widgets/form_text_field.dart';
import 'package:mocuba/view/widgets/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;

  const AuthForm({required this.onSubmit, super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _authFormData = AuthFormData();

  void _handleImagePick(File image) {
    _authFormData.image = image;
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    if (_authFormData.image == null && _authFormData.isSignup) {
      return _showError("Imagem não selecionada!");
    }
    widget.onSubmit(_authFormData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_authFormData.isSignup)
                UserImagePicker(onImage: _handleImagePick),
              if (_authFormData.isSignup)
                FormTextField(
                  key: const ValueKey('name'),
                  label: "Nome",
                  initialValue: _authFormData.name,
                  onChange: (name) => _authFormData.name = name,
                  validator: (_name) {
                    final name = _name ?? '';
                    if (name.trim().length < 5) {
                      return 'Nome deve ter no minimo 5 caracteres';
                    }
                    return null;
                  },
                ),
              FormTextField(
                key: const ValueKey('email'),
                label: "E-mail",
                validator: (_email) {
                  final email = _email ?? '';
                  if (!email.contains("@") && !email.contains(".com")) {
                    return 'email está invalido';
                  }
                  return null;
                },
                initialValue: _authFormData.email,
                onChange: (email) => _authFormData.email = email,
              ),
              FormTextField(
                  key: const ValueKey('password'),
                  label: "Senha",
                  initialValue: _authFormData.password,
                  validator: (_password) {
                    final password = _password ?? '';
                    if (password.length < 6) {
                      return 'a senha deve ter no minimo 6 caracteries';
                    }
                    return null;
                  },
                  onChange: (password) => _authFormData.password = password,
                  isPassword: true),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _submit,
                child: Text(
                  _authFormData.isLogin ? "Entrar" : "Cadastrar",
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _authFormData.toggleAuthMode();
                  });
                },
                child: Text(
                  _authFormData.isLogin
                      ? "Criar uma nova conta"
                      : "Já possui conta?",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
