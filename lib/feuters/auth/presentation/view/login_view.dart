import 'package:flutter/material.dart';
import 'package:wordpress_rest_api/feuters/auth/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String id = 'loginView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody(),
    );
  }
}
