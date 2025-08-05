import 'package:google_fonts/google_fonts.dart';
import 'package:prodev/core/utils/import.dart'; // Assuming .sp extension is here

// const _fontFamily = FontFamily.euclidCircularA;
final _fontFamily = GoogleFonts.nunito().fontFamily;

class AppTextStyles {
  AppTextStyles._();

  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;

  // --- Font Size Constants (Derived from Typography Overview Image) ---
  static const _h1 = 56.0;
  static const _h2 = 48.0;
  static const _h3 = 40.0;
  static const _h4 = 32.0;
  static const _h5 = 24.0;
  static const _h6 = 20.0;

  static const _bodyXLargeSize = 16.0;
  static const _bodyLargeSize = 14.0;
  static const _bodyMediumSize = 12.0;
  static const _bodySmallSize = 10.0;
  static const _bodyXSmallSize = 8.0;

  static const _labelXLargeSize = 16.0;
  static const _labelLargeSize = 14.0;
  static const _labelMediumSize = 12.0;
  static const _labelSmallSize = 10.0;
  static const _labelXSmallSize = 8.0;

  // --- Display Styles (Inter Display for Titles) ---
  // H1 Display: 56.0sp, w500, height: 64/56, letterSpacing: -0.01
  static TextStyle h1Display = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _medium,
    fontSize: _h1.sp,
    height: 64 / _h1,
    letterSpacing: -0.01,
  );

  // H2 Display: 48.0sp, w500, height: 56/48, letterSpacing: -0.01
  static TextStyle h2Display = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _medium,
    fontSize: _h2.sp,
    height: 56 / _h2,
    letterSpacing: -0.01,
  );

  // H3 Display: 40.0sp, w500, height: 48/40, letterSpacing: -0.01
  static TextStyle h3Display = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _medium,
    fontSize: _h3.sp,
    height: 48 / _h3,
    letterSpacing: -0.01,
  );

  // H4 Display: 32.0sp, w500, height: 40/32, letterSpacing: -0.005
  static TextStyle h4Display = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _medium,
    fontSize: _h4.sp,
    height: 40 / _h4,
    letterSpacing: -0.005,
  );

  // H5 Display: 24.0sp, w500, height: 32/24, letterSpacing: 0
  static TextStyle h5Display = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _medium,
    fontSize: _h5.sp,
    height: 32 / _h5,
    letterSpacing: 0,
  );

  // H6 Display: 20.0sp, w500, height: 28/20, letterSpacing: 0
  static TextStyle h6Display = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _medium,
    fontSize: _h6.sp,
    height: 28 / _h6,
    letterSpacing: 0,
  );

  // --- Body Styles (Paragraphs) ---
  // Body X-Large: 16.0sp, w400, height: 24/16, letterSpacing: -0.015
  static TextStyle bodyXLarge = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _regular,
    fontSize: _bodyXLargeSize.sp,
    height: 24 / _bodyXLargeSize,
    letterSpacing: -0.015,
  );

  // Body Large: 14.0sp, w400, height: 20/14, letterSpacing: -0.005
  static TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _regular,
    fontSize: _bodyLargeSize.sp,
    height: 20 / _bodyLargeSize,
    letterSpacing: -0.005,
  );

  // Body Medium: 12.0sp, w400, height: 16/12, letterSpacing: 0
  static TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _regular,
    fontSize: _bodyMediumSize.sp,
    height: 16 / _bodyMediumSize,
    letterSpacing: 0,
  );

  // Body Small: 10.0sp, w400, height: 12/10, letterSpacing: 0
  static TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _regular,
    fontSize: _bodySmallSize.sp,
    height: 12 / _bodySmallSize,
    letterSpacing: 0,
  );

  // Body X-Small: 8.0sp, w400, height: 10/8, letterSpacing: 0
  static TextStyle bodyXSmall = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _regular,
    fontSize: _bodyXSmallSize.sp,
    height: 10 / _bodyXSmallSize,
    letterSpacing: 0,
  );

  // --- Label Styles (Buttons, Inputs, etc.) ---
  // Label X-Large: 16.0sp, w500, height: 24/16, letterSpacing: -0.005
  static TextStyle labelXLarge = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _medium,
    fontSize: _labelXLargeSize.sp,
    height: 24 / _labelXLargeSize,
    letterSpacing: -0.005,
  );

  // Label Large: 14.0sp, w500, height: 20/14, letterSpacing: -0.005
  static TextStyle labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _medium,
    fontSize: _labelLargeSize.sp,
    height: 20 / _labelLargeSize,
    letterSpacing: -0.005,
  );

  // Label Medium: 12.0sp, w500, height: 16/12, letterSpacing: 0
  static TextStyle labelMedium = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _medium,
    fontSize: _labelMediumSize.sp,
    height: 16 / _labelMediumSize,
    letterSpacing: 0,
  );

  // Label Small: 10.0sp, w500, height: 12/10, letterSpacing: 0
  static TextStyle labelSmall = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _medium,
    fontSize: _labelSmallSize.sp,
    height: 12 / _labelSmallSize,
    letterSpacing: 0,
  );

  // Label X-Small: 8.0sp, w500, height: 10/8, letterSpacing: 0
  static TextStyle labelXSmall = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _medium,
    fontSize: _labelXSmallSize.sp,
    height: 10 / _labelXSmallSize,
    letterSpacing: 0,
  );

  // --- Utility Styles (for specific cases, if needed) ---
  // Example: A style for a specific bold text, if not covered by a general heading/body style
  static TextStyle bold16 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _bold,
    fontSize: 16.0.sp,
  );
}
