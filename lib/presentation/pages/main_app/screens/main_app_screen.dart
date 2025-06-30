import 'package:auto_route/auto_route.dart';
import 'package:example_flutter_app/core/router/app_router.dart';
import 'package:example_flutter_app/injection/injection.dart';
import 'package:example_flutter_app/presentation/pages/main_app/cubit/bottom_tab_cubit.dart';
import 'package:example_flutter_app/presentation/pages/main_app/widgets/main_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  final _bottomTabCubit = getIt<BottomTabCubit>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomTabCubit>(
          create: (context) => _bottomTabCubit,
        ),
      ],
      child: AutoTabsRouter(
        routes: const [
          HomeRoute(),
          ProfileRoute(),
        ],
        transitionBuilder: (context, child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);

          return Scaffold(
            body: child,
            bottomNavigationBar: BlocListener<BottomTabCubit, int>(
              bloc: _bottomTabCubit,
              listener: (context, state) {
                tabsRouter.setActiveIndex(state);
              },
              child: MainBottomBar(
                bottomTabCubit: _bottomTabCubit,
              ),
            ),
          );
        },
      ),
    );
  }
}
