import 'package:flutter/material.dart';
import 'package:coin_market/resources/colors.dart';

class DashboardCustomTabBar extends StatelessWidget
    implements PreferredSizeWidget {
  final TabController tabController;
  final List<Widget> tabs;

  const DashboardCustomTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: EdgeInsets.zero,
            labelColor: Colors.black,
            unselectedLabelColor: AppColors.grey,
            indicatorColor: AppColors.pureBlack,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            isScrollable: false,
            padding: EdgeInsets.zero,
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.circular(100),
              borderSide: const BorderSide(
                color: AppColors.pureBlack,
                width: 4.0,
              ),
            ),
            tabs: tabs,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
