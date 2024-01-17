import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view/new_details_view.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view/widgets/failure_widget.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view/widgets/home_view_list_view_item.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view/widgets/home_view_loading.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view/widgets/scroling_circle_loading_indecator.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view_model/home_cubit/home_cubit.dart';

class HomeViewListView extends StatefulWidget {
  const HomeViewListView({
    super.key,
  });

  @override
  State<HomeViewListView> createState() => _HomeViewListViewState();
}

class _HomeViewListViewState extends State<HomeViewListView> {
  late ScrollController _scrollController;
  bool strollValid = true;
  @override
  void initState() {
    super.initState();
    scrollGetDataMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeGetNewsSucsess ||
                state is HomeGetNewsScrollLoading) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<HomeCubit>(context).getAllNewsRefresh();
                },
                child: ListView(
                  controller: _scrollController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '${BlocProvider.of<HomeCubit>(context).newsCount} News',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ...List.generate(
                      BlocProvider.of<HomeCubit>(context).newsModel.length,
                      (index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            NewDetailsView.id,
                            arguments: BlocProvider.of<HomeCubit>(context)
                                .newsModel[index],
                          );
                        },
                        child: HomeViewListViewItem(
                          newsModel: BlocProvider.of<HomeCubit>(context)
                              .newsModel[index],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is HomeGetNewsFailure) {
              return FailureWidget(
                message: state.errMessage,
              );
            }
            return const HomeViewLoading();
          },
        ),
        const ScrolingCircleLodingIndecator(),
      ],
    );
  }

  void scrollGetDataMethod() {
    _scrollController = ScrollController();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          strollValid) {
        strollValid = false;
        await BlocProvider.of<HomeCubit>(context).getAllNewsParts();
        strollValid = true;
      }
    });
  }
}
