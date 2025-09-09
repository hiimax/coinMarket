import 'package:prodev/app/router_paths.dart';
import 'package:prodev/core/utils/import.dart';
import 'package:prodev/features/auth/screens/splashscreen.dart';
import 'package:prodev/features/crypto/screens/crypto_detail_screen.dart';
import 'package:prodev/features/crypto/screens/crypto_list_screen.dart';
import 'package:prodev/resources/colors.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final rootScaffoldStateKey = GlobalKey<ScaffoldState>();

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  navigatorKey: rootNavigatorKey,
  // initialLocation: AppPath.timeline.goRoute,
  observers: [],
  routes: [
    GoRoute(
      path: AppPath.splash.goRoute,
      name: AppPath.splash.path,
      builder: (context, state) => SplashScreen(),
    ),

    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
              ScaffoldWithNestedNavigation(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppPath.crypto.goRoute,
              name: AppPath.crypto.path,
              builder: (context, state) => const CryptoListScreen(),
              routes: [
                GoRoute(
                  path: AppPath.crypto.detail.goRoute,
                  name: AppPath.crypto.detail.path,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) {
                    return CryptoDetailScreen(
                      cryptoId: state.uri.queryParameters['id'] ?? '',
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),

    // Crypto detail route (outside of bottom navigation)
  ],
);

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) => navigationShell.goBranch(
    index,
    initialLocation: index == navigationShell.currentIndex,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavWidget(
        currentIndex: navigationShell.currentIndex,
        onTap: _goBranch,
      ),
    );
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        key: rootScaffoldStateKey,
        body: body,
        bottomNavigationBar: BottomNavWidget(
          currentIndex: selectedIndex,
          onTap: onDestinationSelected,
        ),
      ),
    );
  }
}

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.customColor1.withAlpha(10),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      height: 85.h,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(0);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Icon(
                currentIndex == 0
                    ? Icons.currency_bitcoin
                    : Icons.currency_bitcoin_outlined,
                color: currentIndex == 0 ? Colors.white : Colors.white70,
                size: 24.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
