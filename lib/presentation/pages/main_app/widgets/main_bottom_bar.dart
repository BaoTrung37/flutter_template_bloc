import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortune_teller/config/color/app_colors.dart';
import 'package:fortune_teller/injection/di.dart';
import 'package:fortune_teller/presentation/pages/main_app/cubit/bottom_tab_cubit.dart';
import 'package:fortune_teller/presentation/resources/app_text_styles.dart';

class MainBottomBar extends StatelessWidget {
  const MainBottomBar({super.key});

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
                getIt<BottomTabCubit>().changeTab(index);
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
