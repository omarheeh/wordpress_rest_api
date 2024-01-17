import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wordpress_rest_api/core/utils/size_config.dart';
import 'package:wordpress_rest_api/core/widgets/title_widget.dart';
import 'package:wordpress_rest_api/feuters/home/data/model/NewsModel.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view/widgets/new_details_comment.dart';

class NewDetailsViewBody extends StatelessWidget {
  const NewDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final NewsModel newsModel =
        ModalRoute.of(context)!.settings.arguments as NewsModel;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.defaultSize * 30,
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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsModel.title ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      newsModel.categoreName ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(newsModel.content ?? ''),
                    const SizedBox(height: 20),
                    TitleWidgets(
                      title: 'Comments',
                      icon: IconlyLight.chat,
                    ),
                    NewDetailsComment(),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.shade400,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(
                  IconlyLight.arrowLeft2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
