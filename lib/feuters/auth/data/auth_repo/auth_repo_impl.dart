import 'package:dartz/dartz.dart';
import 'package:wordpress_rest_api/core/utils/api_serves.dart';
import 'package:wordpress_rest_api/core/utils/failuer.dart';
import 'package:wordpress_rest_api/feuters/auth/data/auth_repo/auth_repo.dart';
import 'package:wordpress_rest_api/feuters/auth/data/models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  ApiServes apiServes;
  AuthRepoImpl(this.apiServes);

  @override
  Future<Either<Failuer, UserModel>> getUser(
      {required String username, required String password}) async {
    try {
      Map<String, dynamic> data = await apiServes.auth(
        endPoint: 'token',
        username: username,
        password: password,
      );
      UserModel userModel = UserModel.fromJsonData(data);
      return right(userModel);
    } catch (e) {
      return left(ServerFailure('error in api'));
    }
  }
}
