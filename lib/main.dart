import 'package:flutter/material.dart';
import 'package:wordpress_rest_api/core/git_it.dart';
import 'package:wordpress_rest_api/feuters/auth/data/auth_repo/auth_repo_impl.dart';
import 'package:wordpress_rest_api/feuters/auth/presentation/view/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress_rest_api/feuters/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:wordpress_rest_api/feuters/home/data/home_repo/homer_repo_impl.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view/home_view.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view/new_details_view.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view_model/home_cubit/home_cubit.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              HomeCubit(getIt.get<HomerRepoImpl>())..getAllNewsOnStart(),
        ),
      ],
      child: MaterialApp(
        routes: {
          HomeView.id: (context) => const HomeView(),
          LoginView.id: (context) => const LoginView(),
          NewDetailsView.id: (context) => const NewDetailsView(),
        },
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}
