// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:example_flutter_app/core/infrastructure/core/core.dart';
import 'package:example_flutter_app/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBottomBar extends StatelessWidget {
  const MainBottomBar({
    required this.bottomTabCubit,
    super.key,
  });
  final BottomTabCubit bottomTabCubit;
  @override
  Widget build(BuildContext context) {
    final tabs = <TabItem>[
      TabItem(
        text: 'Home',
      ),
      TabItem(
        text: 'Profile',
      ),
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<BottomTabCubit, int>(
          bloc: bottomTabCubit,
          buildWhen: (previous, current) => previous != current,
          builder: (BuildContext context, int page) {
            return AnimatedBottomNavigationBar.builder(
              itemCount: tabs.length,
              tabBuilder: (int index, bool isActive) {
                return _TabBarItem(
                  tabItem: tabs[index],
                  isSelected: page == index,
                );
              },
              backgroundColor: context.colors.primary,
              activeIndex: page,
              gapLocation: GapLocation.none,
              leftCornerRadius: 20.r,
              rightCornerRadius: 20.r,
              onTap: (int index) {
                bottomTabCubit.changeTab(index);
              },
              splashRadius: 0,
              safeAreaValues: const SafeAreaValues(bottom: false),
            );
          },
        ),
      ],
    );
  }
}

class _TabBarItem extends StatelessWidget {
  const _TabBarItem({
    required this.tabItem,
    this.isSelected = false,
  });
  final bool isSelected;
  final TabItem tabItem;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        if (isSelected)
          Container(
            height: 2.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: context.colors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(4).r,
                bottomRight: const Radius.circular(4).r,
              ),
            ),
          ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            8.verticalSpace,
            Text(
              tabItem.text,
              style: context.textTheme.semibold12.copyWith(
                color: isSelected ? context.colors.white : context.colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}

class TabItem {
  TabItem({
    required this.text,
  });

  final String text;
}
