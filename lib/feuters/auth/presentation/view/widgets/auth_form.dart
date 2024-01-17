import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:wordpress_rest_api/core/utils/validator.dart';
import 'package:wordpress_rest_api/core/widgets/logo.dart';
import 'package:wordpress_rest_api/feuters/auth/presentation/view/widgets/custom_button.dart';
import 'package:wordpress_rest_api/feuters/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:wordpress_rest_api/feuters/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view/home_view.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    super.key,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late TextEditingController userNameTextEditingController;
  late TextEditingController passwordTextEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameTextEditingController.dispose();
    passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Logo(
            title: 'Dashbord',
            fontSize: 30,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            validator: (value) {
              return MyValidators.displayNamevalidator(value);
            },
            hintText: 'username',
            icon: IconlyLight.profile,
            controller: userNameTextEditingController,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            validator: (value) {
              return MyValidators.passwordValidator(value);
            },
            hintText: 'password',
            controller: passwordTextEditingController,
            icon: IconlyLight.password,
          ),
          const SizedBox(height: 20),
          CustomButton(
            title: 'Login',
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSucsess) {
                  Navigator.of(context).pushNamed(HomeView.id);
                } else if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.errMessage,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const Text(
                    'login',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
              },
            ),
            onTap: () {
              if (formkey.currentState!.validate()) {
                BlocProvider.of<AuthCubit>(context).getUser(
                  username: userNameTextEditingController.text,
                  password: passwordTextEditingController.text,
                );
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
          ),
          TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed(HomeView.id);
              },
              icon: const Icon(IconlyLight.arrowLeft),
              label: const Text('Go to home page'))
        ],
      ),
    );
  }
}
