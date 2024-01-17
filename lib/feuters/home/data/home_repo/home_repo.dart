import 'package:dartz/dartz.dart';
import 'package:wordpress_rest_api/core/utils/failuer.dart';
import 'package:wordpress_rest_api/feuters/home/data/model/NewsModel.dart';
import 'package:wordpress_rest_api/feuters/home/data/model/comment/comment.dart';

abstract class HomerRepo {
  Future<Either<Failuer, List<NewsModel>>> getAllNews(
      {required int perPage, required int page});
  Future<Either<Failuer, List<Comment>>> getAllComment(String id);
  Future<Either<Failuer, int>> getNewsCount();
  Future<Either<Failuer, String>> deleterNews(
      {required String id, required String token});
}
