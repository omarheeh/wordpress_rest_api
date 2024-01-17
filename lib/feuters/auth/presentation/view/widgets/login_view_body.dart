import 'package:flutter/material.dart';
import 'package:wordpress_rest_api/feuters/auth/presentation/view/widgets/auth_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AuthForm(),
    );
  }
}
