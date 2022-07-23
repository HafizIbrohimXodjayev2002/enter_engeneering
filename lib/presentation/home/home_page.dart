import 'package:eriell_company/presentation/home/widgets/landscape_widget.dart';
import 'package:eriell_company/presentation/home/widgets/portrait_widget.dart';
import 'package:eriell_company/ui/components/app_bar/custom_app_bar.dart';
import 'package:eriell_company/presentation/home/bloc/home_bloc.dart';
import 'package:eriell_company/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = MediaQuery.of(context).size.width / 2.8;

    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<HomeBloc>();
          return Scaffold(
            appBar: EriellAppBar(
              title: "Статистики в этом году",
              leading: Assets.images.eriellLogo.image(),
            ),
            body: OrientationBuilder(
              builder: (context, orientation) {
                if (Orientation.portrait == orientation) {
                  return PortraitWidget(radius: radius, bloc: bloc);
                } else {
                  return LandscapeWidget(bloc: bloc);
                }
              },
            ),
          );
        },
      ),
    );
  }
}