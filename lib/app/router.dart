import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:prodev/app/router_paths.dart';
import 'package:prodev/core/utils/import.dart';
import 'package:prodev/features/auth/screens/splashscreen.dart';
import 'package:prodev/features/heart/screens/heart.dart';
import 'package:prodev/features/home/screens/home.dart';
import 'package:prodev/features/map/screens/map.dart';
import 'package:prodev/features/music/screens/music.dart';
import 'package:prodev/resources/colors.dart';
import 'package:prodev/resources/resources.dart';

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
              path: AppPath.home.goRoute,
              name: AppPath.home.path,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppPath.music.goRoute,
              name: AppPath.music.path,
              builder: (context, state) => const MusicScreen(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppPath.heart.goRoute,
              name: AppPath.heart.path,
              builder: (context, state) => const HeartScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppPath.map.goRoute,
              name: AppPath.map.path,
              builder: (context, state) => const MapScreen(),
            ),
          ],
        ),
      ],
    ),
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
    final sessionConfig = SessionConfig(
      invalidateSessionForAppLostFocus: const Duration(
        seconds: kDebugMode ? 100000000 : 30,
      ),
      invalidateSessionForUserInactivity: const Duration(
        minutes: kDebugMode ? 100000000 : 3,
      ),
    );

    sessionConfig.stream.listen((SessionTimeoutState timeoutEvent) {
      if (timeoutEvent == SessionTimeoutState.userInactivityTimeout) {
        // showDialog(
        //   context: context,
        //   barrierDismissible: false,
        //   builder:
        //       (context) => Dialog(
        //         backgroundColor: AppColors.transparent,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(12),
        //         ),
        //         child: BackdropFilter(
        //           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        //           child: PopScope(
        //             canPop: false,
        //             child: AppLockedWidget(
        //               message:
        //                   'The app is locked for security reasons due to inactivity, please unlock the app to continue',
        //               buttonTitle:
        //                   locator.get<SharedPrefs>().biometricVerification ==
        //                           true
        //                       ? 'Unlock'
        //                       : 'Login again',
        //               unlock: () {
        //                 locator.get<SharedPrefs>().biometricVerification == true
        //                     ? launchBiometric(context, () {
        //                       context.pop();
        //                     })
        //                     : context.pushReplacementNamed(
        //                       AppPath.auth.login.path,
        //                     );
        //               },
        //             ),
        //           ),
        //         ),
        //       ),
        // );
      } else if (timeoutEvent == SessionTimeoutState.appFocusTimeout) {
        // showDialog(
        //   context: context,
        //   builder:
        //       (context) => Dialog(
        //         backgroundColor: AppColors.transparent,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(12),
        //         ),
        //         child: BackdropFilter(
        //           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        //           child: PopScope(
        //             canPop: false,
        //             child: AppLockedWidget(
        //               message:
        //                   'The app is locked for security reasons due to inactivity, please unlock the app  to continue',
        //               buttonTitle:
        //                   locator.get<SharedPrefs>().biometricVerification ==
        //                           true
        //                       ? 'Unlock'
        //                       : 'Login again',
        //               unlock: () {
        //                 locator.get<SharedPrefs>().biometricVerification == true
        //                     ? launchBiometric(context, () {
        //                       context.pop();
        //                     })
        //                     : context.pushReplacementNamed(
        //                       AppPath.auth.login.path,
        //                     );
        //               },
        //             ),
        //           ),
        //         ),
        //       ),
        // );
      }
    });
    return SessionTimeoutManager(
      sessionConfig: sessionConfig,
      child: ScaffoldWithNavigationBar(
        body: navigationShell,
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
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
              child: SvgPicture.asset(
                currentIndex == 0 ? SvgIcons.homeActive : SvgIcons.homeInactive,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(1);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SvgPicture.asset(
                currentIndex == 1
                    ? SvgIcons.musicActive
                    : SvgIcons.musicInactive,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(2);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SvgPicture.asset(
                currentIndex == 2
                    ? SvgIcons.heartActive
                    : SvgIcons.heartInactive,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(3);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SvgPicture.asset(
                currentIndex == 3 ? SvgIcons.mapPin : SvgIcons.mapPin,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
