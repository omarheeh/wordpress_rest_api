import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress_rest_api/feuters/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScrolingCircleLodingIndecator extends StatelessWidget {
  const ScrolingCircleLodingIndecator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Visibility(
            visible: state is HomeGetNewsScrollLoading,
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(
                child: SvgPicture.asset('assets/svg/Spinner-1s-200px.svg'),
              ),
            ),
          );
        },
      ),
    );
  }
}
