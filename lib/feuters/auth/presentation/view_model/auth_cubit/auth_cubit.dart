import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wordpress_rest_api/feuters/auth/data/auth_repo/auth_repo_impl.dart';
import 'package:wordpress_rest_api/feuters/auth/data/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepoImpl) : super(AuthInitial());
  AuthRepoImpl authRepoImpl;
  UserModel? userModel;

  Future<void> getUser(
      {required String username, required String password}) async {
    emit(AuthLoading());
    var resutl =
        await authRepoImpl.getUser(username: username, password: password);
    resutl.fold(
      (failure) => emit(AuthFailure(failure.errMessage)),
      (user) {
        userModel = user;
        emit(AuthSucsess());
      },
    );
  }

  bool isAdmin() {
    return userModel != null;
  }

  void singOut() {
    userModel = null;
    emit(AuthLogout());
  }
}
