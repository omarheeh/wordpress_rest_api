import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:wordpress_rest_api/core/utils/size_config.dart';
import 'package:wordpress_rest_api/feuters/auth/presentation/view/login_view.dart';
import 'package:wordpress_rest_api/feuters/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String id = 'homeView';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BlocProvider.of<AuthCubit>(context).isAdmin()
            ? BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLogout) {
                    Navigator.of(context).pushReplacementNamed(LoginView.id);
                  }
                },
                child: IconButton(
                  icon: const Icon(
                    IconlyLight.logout,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).singOut();
                  },
                ),
              )
            : IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(LoginView.id);
                },
                icon: const Icon(
                  Icons.dashboard,
                  color: Colors.black,
                ),
              ),
        title: const Text(
          'News',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
