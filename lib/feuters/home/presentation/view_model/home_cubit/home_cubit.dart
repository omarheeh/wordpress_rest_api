import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wordpress_rest_api/feuters/home/data/home_repo/homer_repo_impl.dart';
import 'package:wordpress_rest_api/feuters/home/data/model/NewsModel.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homerRepoImpl) : super(HomeInitial());
  HomerRepoImpl homerRepoImpl;
  //all news
  List<NewsModel> newsModel = [];
  //store all news count
  int newsCount = 0;
  //how mach news he get in one request
  int perPage = 3;
  //where start get news in wordpress api
  int page = 1;
  //get all posts
  //scroll get news loading bool
  bool isScroll = false;
  Future<void> getAllNewsOnStart() async {
    emit(HomeGetNewsLoading());
    var result = await homerRepoImpl.getAllNews(page: 1, perPage: perPage);
    await getNewsCount();
    result.fold(
      (failure) => emit(HomeGetNewsFailure(failure.errMessage)),
      (news) {
        newsModel.addAll(news);

        emit(HomeGetNewsSucsess());
      },
    );
  }

  Future<void> getAllNewsParts() async {
    addPage();
    if (newsCount > newsModel.length) {
      emit(HomeGetNewsScrollLoading());

      var result = await homerRepoImpl.getAllNews(page: page, perPage: perPage);
      await getNewsCount();
      result.fold(
        (failure) => emit(HomeGetNewsFailure(failure.errMessage)),
        (news) {
          newsModel.addAll(news);
          isScroll = false;
          emit(HomeGetNewsSucsess());
        },
      );
    }
  }

  Future<void> getAllNewsRefresh() async {
    emit(HomeGetNewsLoading());
    resetCubit();
    var result = await homerRepoImpl.getAllNews(page: page, perPage: perPage);
    await getNewsCount();
    result.fold(
      (failure) => emit(HomeGetNewsFailure(failure.errMessage)),
      (news) {
        newsModel.addAll(news);
        emit(HomeGetNewsSucsess());
      },
    );
  }

  //get token
  Future<void> deleteNews({required String id, required String token}) async {
    emit(HomeDeleteLoading());
    var result = await homerRepoImpl.deleterNews(id: id, token: token);
    result.fold((felure) => emit(HomeDeleteFailure(felure.errMessage)),
        (message) {
      emit(HomeDeleteSucsess(message));
      getAllNewsOnStart();
    });
  }

  //get all news count
  Future<void> getNewsCount() async {
    var result = await homerRepoImpl.getNewsCount();
    result.fold(
      (failure) {},
      (count) {
        newsCount = count;
      },
    );
  }

  //add new page to add news request
  void addPage() {
    page += 1;
  }

  void resetCubit() {
    newsModel = [];
    page = 1;
  }
}
