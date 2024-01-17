import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wordpress_rest_api/core/utils/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wordpress_rest_api/feuters/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:wordpress_rest_api/feuters/home/data/model/NewsModel.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view_model/home_cubit/home_cubit.dart';

class HomeViewListViewItem extends StatelessWidget {
  const HomeViewListViewItem({
    super.key,
    required this.newsModel,
  });
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, 1),
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: SizeConfig.defaultSize * 20,
              child: CachedNetworkImage(
                imageUrl: newsModel.featuredImageUrl!
                    .replaceAll('localhost', '10.0.2.2'),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Text(
                  newsModel.title ?? '',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  newsModel.content ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(IconlyLight.chat),
                    Text(
                      '  ${newsModel.commentsCount} Comments',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Align(
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade400,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          newsModel.categoreName ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: BlocProvider.of<AuthCubit>(context).isAdmin(),
                      child: Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.shade400,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                IconlyLight.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 3),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red.shade400,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: IconButton(
                              onPressed: () async {
                                String token =
                                    BlocProvider.of<AuthCubit>(context)
                                        .userModel!
                                        .token!;
                                await BlocProvider.of<HomeCubit>(context)
                                    .deleteNews(
                                  id: newsModel.id,
                                  token: token,
                                );
                              },
                              icon: const Icon(
                                IconlyLight.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )),
                    )
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
