import 'package:google_fonts/google_fonts.dart';
import 'package:prodev/core/utils/import.dart';
import 'package:prodev/resources/colors.dart';

class AppTheme {
  static ThemeData get lightTheme => _baseTheme(brightness: Brightness.light);

  static ThemeData get darkTheme => _baseTheme(
    brightness: Brightness.dark,
  ).copyWith(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey[850],
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[400]),
      labelStyle: TextStyle(color: Colors.grey[400]),
      floatingLabelStyle: const TextStyle(color: Colors.green),
      prefixIconColor: Colors.green,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 16.0,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[700]!),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    ),
    // Dark theme specific text styles, inheriting from _baseTheme where not specified
    textTheme: TextTheme(
      // H1 Title
      headlineLarge: TextStyle(
        color: Colors.white,
        fontSize: 56.sp,
        fontWeight: FontWeight.w500, // Medium
        height: 64 / 56, // Line height 64
        letterSpacing: -0.01, // -1%
      ),
      // H2 Title
      headlineMedium: TextStyle(
        color: Colors.white,
        fontSize: 48.sp,
        fontWeight: FontWeight.w500, // Medium
        height: 56 / 48, // Line height 56
        letterSpacing: -0.01, // -1%
      ),
      // H3 Title
      headlineSmall: TextStyle(
        color: Colors.white,
        fontSize: 40.sp,
        fontWeight: FontWeight.w500, // Medium
        height: 48 / 40, // Line height 48
        letterSpacing: -0.01, // -1%
      ),
      // H4 Title
      displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 32.sp,
        fontWeight: FontWeight.w500, // Medium
        height: 40 / 32, // Line height 40
        letterSpacing: -0.005, // -0.5%
      ),
      // H5 Title
      displayMedium: TextStyle(
        color: Colors.white,
        fontSize: 24.sp,
        fontWeight: FontWeight.w500, // Medium
        height: 32 / 24, // Line height 32
        letterSpacing: 0, // 0%
      ),
      // H6 Title
      displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500, // Medium
        height: 28 / 20, // Line height 28
        letterSpacing: 0, // 0%
      ),
      // Label X-Large (from previous image)
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 24.sp,
        fontWeight: FontWeight.w500, // Medium
        height: 32 / 24, // Line height 32
        letterSpacing: -0.005, // -0.5%
      ),
      // SUBHEADING / MEDIUM (from current image, overwrites Label Large)
      labelMedium: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500, // Medium
        height: 24 / 16, // Line height 24
        letterSpacing: 0, // 0%
      ),
      // SUBHEADING / SMALL (from current image, overwrites Label Medium)
      labelSmall: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500, // Medium
        height: 20 / 16, // Line height 20
        letterSpacing: 0, // 0%
      ),
      // SUBHEADING / X-SMALL (from current image, overwrites Label Small (2))
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500, // Medium
        height: 16 / 12, // Line height 16
        letterSpacing: -0.04, // -4%
      ),
      // Paragraph X-Large (from previous image)
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 24.sp,
        fontWeight: FontWeight.w400, // Regular
        height: 32 / 24, // Line height 32
        letterSpacing: -0.005, // -0.5%
      ),
      // DOCS / LABEL (from current image, overwrites Paragraph Large)
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500, // Medium
        height: 32 / 16, // Line height 32
        letterSpacing: -0.005, // -0.5%
      ),
      // DOCS / PARAGRAPH (from current image, overwrites Paragraph Medium)
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400, // Regular
        height: 32 / 16, // Line height 32
        letterSpacing: -0.015, // -1.5%
      ),
      // SUBHEADING / 2X-SMALL (from current image, overwrites Paragraph Small (1))
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 10.sp,
        fontWeight: FontWeight.w500, // Medium
        height: 12 / 10, // Line height 12
        letterSpacing: -0.02, // -2%
      ),
    ),
  );

  static ThemeData _baseTheme({required Brightness brightness}) {
    final isLight = brightness == Brightness.light;
    final green = Colors.green;

    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor:
          isLight ? AppColors.primary80 : AppColors.primary80,
      fontFamily: GoogleFonts.nunito().fontFamily,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: isLight ? AppColors.white : Colors.black,
      ),
      textTheme: TextTheme(
        // Original titleLarge from the provided file
        titleLarge: TextStyle(
          color: isLight ? AppColors.neutral0 : Colors.white,
          letterSpacing: -1,
          fontSize: 56.sp,
          fontWeight: FontWeight.w500,
          height: 56 / 64,
        ),
        // H1 Title
        headlineLarge: TextStyle(
          color: isLight ? AppColors.neutral0 : Colors.white,
          fontSize: 56.sp,
          fontWeight: FontWeight.w500, // Medium
          height: 64 / 56, // Line height 64
          letterSpacing: -0.01, // -1%
        ),
        // H2 Title
        headlineMedium: TextStyle(
          color: isLight ? AppColors.neutral0 : Colors.white,
          fontSize: 48.sp,
          fontWeight: FontWeight.w500, // Medium
          height: 56 / 48, // Line height 56
          letterSpacing: -0.01, // -1%
        ),
        // H3 Title
        headlineSmall: TextStyle(
          color: isLight ? AppColors.neutral0 : Colors.white,
          fontSize: 40.sp,
          fontWeight: FontWeight.w500, // Medium
          height: 48 / 40, // Line height 48
          letterSpacing: -0.01, // -1%
        ),
        // H4 Title
        displayLarge: TextStyle(
          color: isLight ? AppColors.neutral0 : Colors.white,
          fontSize: 32.sp,
          fontWeight: FontWeight.w500, // Medium
          height: 40 / 32, // Line height 40
          letterSpacing: -0.005, // -0.5%
        ),
        // H5 Title
        displayMedium: TextStyle(
          color: isLight ? AppColors.neutral0 : Colors.white,
          fontSize: 24.sp,
          fontWeight: FontWeight.w500, // Medium
          height: 32 / 24, // Line height 32
          letterSpacing: 0, // 0%
        ),
        // H6 Title
        displaySmall: TextStyle(
          color: isLight ? AppColors.neutral0 : Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500, // Medium
          height: 28 / 20, // Line height 28
          letterSpacing: 0, // 0%
        ),
        // Label X-Large (from previous image)
        labelLarge: TextStyle(
          color: isLight ? AppColors.neutral0 : Colors.white,
          fontSize: 24.sp,
          fontWeight: FontWeight.w500, // Medium
          height: 32 / 24, // Line height 32
          letterSpacing: -0.005, // -0.5%
        ),
        // SUBHEADING / MEDIUM (from current image, overwrites Label Large)
        labelMedium: TextStyle(
          color: isLight ? AppColors.neutral0 : Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500, // Medium
          height: 24 / 16, // Line height 24
          letterSpacing: 0, // 0%
        ),
        // SUBHEADING / SMALL (from current image, overwrites Label Medium)
        labelSmall: TextStyle(
          color: isLight ? AppColors.neutral0 : Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500, // Medium
          height: 20 / 16, // Line height 20
          letterSpacing: 0, // 0%
        ),
        // SUBHEADING / X-SMALL (from current image, overwrites Label Small (2))
        bodySmall: TextStyle(
          color: isLight ? AppColors.neutral0 : Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500, // Medium
          height: 16 / 12, // Line height 16
          letterSpacing: -0.04, // -4%
        ),
        // Paragraph X-Large (from previous image)
        bodyLarge: TextStyle(
          color: isLight ? AppColors.neutral0 : Colors.white,
          fontSize: 24.sp,
          fontWeight: FontWeight.w400, // Regular
          height: 32 / 24, // Line height 32
          letterSpacing: -0.005, // -0.5%
        ),
        // DOCS / LABEL (from current image, overwrites Paragraph Large)
        bodyMedium: TextStyle(
          color: isLight ? AppColors.neutral0 : Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500, // Medium
          height: 32 / 16, // Line height 32
          letterSpacing: -0.005, // -0.5%
        ),
        // DOCS / PARAGRAPH (from current image, overwrites Paragraph Medium)
        titleMedium: TextStyle(
          color: isLight ? AppColors.neutral0 : Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400, // Regular
          height: 32 / 16, // Line height 32
          letterSpacing: -0.015, // -1.5%
        ),
        // SUBHEADING / 2X-SMALL (from current image, overwrites Paragraph Small (1))
        titleSmall: TextStyle(
          color: isLight ? AppColors.neutral0 : Colors.white,
          fontSize: 10.sp,
          fontWeight: FontWeight.w500, // Medium
          height: 12 / 10, // Line height 12
          letterSpacing: -0.02, // -2%
        ),
      ),
      appBarTheme: AppBarTheme(
        shadowColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        color: isLight ? AppColors.white : Colors.black,
        titleTextStyle: TextStyle(
          color: isLight ? Colors.white : Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.normal,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              isLight ? Brightness.light : Brightness.light,
          statusBarBrightness: isLight ? Brightness.dark : Brightness.light,
        ),
      ),
     
      inputDecorationTheme: InputDecorationTheme(
        fillColor: isLight ? Colors.green.withAlpha(2) : Colors.grey[850],
        filled: true,
        hintStyle: TextStyle(color: Colors.green.withAlpha(4), fontSize: 16.0),
        labelStyle: TextStyle(color: Colors.green.withAlpha(4), fontSize: 16.0),
        floatingLabelStyle: TextStyle(color: green, fontSize: 16.0),
        counterStyle: TextStyle(color: green, fontSize: 16.0),
        prefixIconColor: green,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 16.0,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: green, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: green, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: green, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 8.0,
          shadowColor: green,
          minimumSize: const Size(200.0, 56.0),
          backgroundColor: green,
          disabledBackgroundColor: green.withAlpha(4),
          disabledForegroundColor: AppColors.neutral600,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: green, width: 2.0),
          minimumSize: const Size(200.0, 56.0),
          disabledForegroundColor: AppColors.neutral600,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(200.0, 56.0),
          disabledForegroundColor: AppColors.neutral600,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
