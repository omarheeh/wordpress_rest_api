part of 'comment_cubit.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}

final class CommentSucsess extends CommentState {
  final List<Comment> comments;
  CommentSucsess(this.comments);
}

final class CommentFailure extends CommentState {
  final String errMessage;
  CommentFailure(this.errMessage);
}

final class CommentLoading extends CommentState {}
