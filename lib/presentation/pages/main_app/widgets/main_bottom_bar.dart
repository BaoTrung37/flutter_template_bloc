// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:example_flutter_app/core/color/app_colors.dart';
import 'package:example_flutter_app/presentation/pages/main_app/cubit/bottom_tab_cubit.dart';
import 'package:example_flutter_app/presentation/resources/app_text_styles.dart';
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
        // iconSvg: Assets.icons.icHomeOutline,
        // iconSvgSelected: Assets.icons.icHome,
        text: 'Home',
      ),
      TabItem(
        // iconSvg: Assets.icons.icResumeOutline,
        // iconSvgSelected: Assets.icons.icResume,
        text: 'More',
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
              backgroundColor: context.colors.secondaryColor,
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
              color: context.colors.border,
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(4).r,
                bottomRight: const Radius.circular(4).r,
              ),
            ),
          ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // if (isSelected)
            //   tabItem.iconSvgSelected.svg(
            //     height: 24.h,
            //   )
            // else
            //   tabItem.iconSvg.svg(
            //     height: 24.h,
            //   ),
            8.verticalSpace,
            Text(
              tabItem.text,
              style: AppTextStyles.labelSmall.copyWith(
                color: isSelected
                    ? context.colors.textPrimary
                    : context.colors.textSecondary,
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
    // required this.iconSvg,
    // required this.iconSvgSelected,
    required this.text,
  });

  // final SvgGenImage iconSvg;
  // final SvgGenImage iconSvgSelected;
  final String text;
}
