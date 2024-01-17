import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wordpress_rest_api/core/utils/size_config.dart';

class HomeViewLoading extends StatelessWidget {
  const HomeViewLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          height: SizeConfig.defaultSize * 36,
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
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: SizeConfig.defaultSize * 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
