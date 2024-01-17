import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wordpress_rest_api/feuters/home/data/home_repo/homer_repo_impl.dart';
import 'package:wordpress_rest_api/feuters/home/data/model/comment/comment.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit(this.homerRepoImpl) : super(CommentInitial());
  final HomerRepoImpl homerRepoImpl;

  Future<void> getAllComment(String id) async {
    emit(CommentLoading());
    var result = await homerRepoImpl.getAllComment(id);
    result.fold(
      (failure) => emit(CommentFailure(failure.errMessage)),
      (comments) => emit(
        CommentSucsess(comments),
      ),
    );
  }
}
