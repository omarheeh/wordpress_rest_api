import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:wordpress_rest_api/core/git_it.dart';
import 'package:wordpress_rest_api/core/widgets/title_widget.dart';
import 'package:wordpress_rest_api/feuters/auth/presentation/view/widgets/custom_button.dart';
import 'package:wordpress_rest_api/feuters/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:wordpress_rest_api/feuters/home/data/home_repo/homer_repo_impl.dart';
import 'package:wordpress_rest_api/feuters/home/data/model/NewsModel.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view/widgets/new_details_view_body.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view_model/comment_cubit/comment_cubit.dart';

class NewDetailsView extends StatelessWidget {
  const NewDetailsView({super.key});
  static const String id = 'newDetailsView';
  @override
  Widget build(BuildContext context) {
    final NewsModel newsModel =
        ModalRoute.of(context)!.settings.arguments as NewsModel;
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => CommentCubit(getIt.get<HomerRepoImpl>())
            ..getAllComment(newsModel.id),
          child: const NewDetailsViewBody(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28.0),
                  topRight: Radius.circular(28.0)),
            ),
            isScrollControlled: true,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const TitleWidgets(
                          title: 'Add Comment', icon: IconlyLight.chat),
                      const SizedBox(height: 16),
                      const CustomTextField(
                        hintText: 'Name',
                        icon: IconlyLight.profile,
                      ),
                      const SizedBox(height: 10),
                      const CustomTextField(
                        hintText: 'Email',
                        icon: IconlyLight.message,
                      ),
                      const SizedBox(height: 10),
                      const CustomTextField(
                        hintText: 'Content',
                        icon: Icons.description,
                      ),
                      const SizedBox(height: 12),
                      CustomButton(
                        onTap: () {},
                        title: 'Send',
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(IconlyLight.send),
                            SizedBox(width: 4),
                            Text('Send'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        child: Icon(
          IconlyLight.chat,
        ),
      ),
    );
  }
}
