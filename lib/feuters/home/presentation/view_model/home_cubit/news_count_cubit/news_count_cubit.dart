import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wordpress_rest_api/feuters/home/data/home_repo/homer_repo_impl.dart';

part 'news_count_state.dart';

class NewsCountCubit extends Cubit<NewsCountState> {
  NewsCountCubit(this.homerRepoImpl) : super(NewsCountInitial());
  HomerRepoImpl homerRepoImpl;
}
