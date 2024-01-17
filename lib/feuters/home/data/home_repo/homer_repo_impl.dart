import 'package:dartz/dartz.dart';
import 'package:wordpress_rest_api/core/utils/api_serves.dart';
import 'package:wordpress_rest_api/core/utils/failuer.dart';
import 'package:wordpress_rest_api/feuters/home/data/home_repo/home_repo.dart';
import 'package:wordpress_rest_api/feuters/home/data/model/NewsModel.dart';
import 'package:wordpress_rest_api/feuters/home/data/model/comment/comment.dart';

class HomerRepoImpl extends HomerRepo {
  final ApiServes apiServes;
  HomerRepoImpl(this.apiServes);
  @override
  Future<Either<Failuer, List<NewsModel>>> getAllNews(
      {required int perPage, required int page}) async {
    try {
      List<dynamic> data =
          await apiServes.get('posts?_embed&per_page=$perPage&page=$page');
      List<NewsModel> news = [];
      for (int i = 0; i < data.length; i++) {
        news.add(NewsModel.fromJsonData(data[i]));
      }
      return right(news);
    } catch (e) {
      return left(ServerFailure('error in api get news'));
    }
  }

  @override
  Future<Either<Failuer, List<Comment>>> getAllComment(String id) async {
    try {
      List<dynamic> data = await apiServes.get('comments?post=$id');
      List<Comment> comments = [];
      for (int i = 0; i < data.length; i++) {
        comments.add(Comment.fromJsonData(data[i]));
      }
      return right(comments);
    } catch (e) {
      return left(ServerFailure('error in get comments api'));
    }
  }

  @override
  Future<Either<Failuer, String>> deleterNews(
      {required String id, required String token}) async {
    try {
      await apiServes.delete(endPoint: 'posts/$id', token: token);
      return right('delete is sucsess');
    } catch (e) {
      return left(ServerFailure('error delete has error'));
    }
  }

  @override
  Future<Either<Failuer, int>> getNewsCount() async {
    try {
      List<dynamic> data = await apiServes.get('posts?_embed');

      return right(data.length);
    } catch (e) {
      return left(ServerFailure('error in api get news'));
    }
  }
}
