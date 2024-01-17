import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:wordpress_rest_api/feuters/home/data/model/comment/comment.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view_model/comment_cubit/comment_cubit.dart';
import 'package:html/parser.dart' as htmlParser;

class NewDetailsComment extends StatelessWidget {
  const NewDetailsComment({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentCubit, CommentState>(
      builder: (context, state) {
        if (state is CommentSucsess) {
          if (state.comments.isEmpty) {
            return SizedBox(
              height: 50,
              child: Center(
                child: Text('No Comments'),
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                return NewDetailsCommentItem(
                  comment: state.comments[index],
                );
              },
            );
          }
        } else if (state is CommentFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class NewDetailsCommentItem extends StatelessWidget {
  const NewDetailsCommentItem({
    super.key,
    required this.comment,
  });
  final Comment comment;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(IconlyLight.profile),
      title: Text(htmlParser
          .parse(comment.content!.rendered!)
          .documentElement!
          .text
          .toString()),
      subtitle: Text(comment.date ?? ''),
    );
  }
}
