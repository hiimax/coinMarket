import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:coin_market/app/router.dart';
import 'package:coin_market/core/styles/theme/app_theme.dart';
import 'package:coin_market/l10n/app_localizations.dart';
import 'package:coin_market/resources/colors.dart';
import 'package:toastification/toastification.dart';

class ProDevApp extends HookConsumerWidget {
  const ProDevApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final savedThemeMode = useState(AdaptiveThemeMode.light);
    // final local = ref.watch(localeNotifierProvider);

    return ToastificationWrapper(
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        builder:
            (_, child) => GlobalLoaderOverlay(
              overlayWidgetBuilder: (_) {
                return Center(child: SizedBox());
              },
              child: AdaptiveTheme(
                light: AppTheme.lightTheme,
                dark: AppTheme.darkTheme,
                initial: savedThemeMode.value,

                // overrideMode: AdaptiveThemeMode.dark,
                builder: (theme, darkTheme) {
                  return MaterialApp.router(
                    localizationsDelegates: [
                      FlutterI18nDelegate(
                        translationLoader: FileTranslationLoader(),
                        missingTranslationHandler: (key, locale) {},
                      ),
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                      for (var locale in supportedLocales) {
                        if (locale.languageCode == deviceLocale!.languageCode) {
                          return deviceLocale;
                        }
                      }
                      return supportedLocales.first;
                    },
                    supportedLocales: AppLocalizations.supportedLocales,
                    // locale: Locale(local.language),
                    debugShowCheckedModeBanner: false,
                    darkTheme: darkTheme,
                    theme: theme,
                    routerConfig: router,
                  );
                },
              ),
            ),
      ),
    );
  }
}
