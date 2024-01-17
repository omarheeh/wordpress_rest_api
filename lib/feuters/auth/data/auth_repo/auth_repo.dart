import 'package:dartz/dartz.dart';
import 'package:wordpress_rest_api/core/utils/failuer.dart';
import 'package:wordpress_rest_api/feuters/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failuer, UserModel>> getUser(
      {required String username, required String password});
}
