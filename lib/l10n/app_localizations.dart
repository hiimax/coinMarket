import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @sell_product.
  ///
  /// In en, this message translates to:
  /// **'Sell product'**
  String get sell_product;

  /// No description provided for @no_products_in_this_category.
  ///
  /// In en, this message translates to:
  /// **'There are no products in this category yet'**
  String get no_products_in_this_category;

  /// No description provided for @error_selling.
  ///
  /// In en, this message translates to:
  /// **'Error in selling'**
  String get error_selling;

  /// No description provided for @properties.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get properties;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgot_password;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order book'**
  String get order;

  /// No description provided for @of_google_apply.
  ///
  /// In en, this message translates to:
  /// **'google apply.'**
  String get of_google_apply;

  /// No description provided for @cannot_leave_password_empty.
  ///
  /// In en, this message translates to:
  /// **'You cannot leave the password empty'**
  String get cannot_leave_password_empty;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @term_conditions_use.
  ///
  /// In en, this message translates to:
  /// **'Terms & Policies'**
  String get term_conditions_use;

  /// No description provided for @write_email.
  ///
  /// In en, this message translates to:
  /// **'Write your email...'**
  String get write_email;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get sign_in;

  /// No description provided for @additional_details.
  ///
  /// In en, this message translates to:
  /// **'Additional details'**
  String get additional_details;

  /// No description provided for @room.
  ///
  /// In en, this message translates to:
  /// **'room'**
  String get room;

  /// No description provided for @image_updated.
  ///
  /// In en, this message translates to:
  /// **'Updated image!'**
  String get image_updated;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @meet_public_place.
  ///
  /// In en, this message translates to:
  /// **'Meet in a well-lit public place with lots of people around, such as a coffee shop or a shopping mall that has video cameras. If you are buying a large item, bring a friend to help you carry it.'**
  String get meet_public_place;

  /// No description provided for @dont_have_account_register.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account yet? Register'**
  String get dont_have_account_register;

  /// No description provided for @promotions_news.
  ///
  /// In en, this message translates to:
  /// **'Promotions and news'**
  String get promotions_news;

  /// No description provided for @request_reviews.
  ///
  /// In en, this message translates to:
  /// **'Request for reviews'**
  String get request_reviews;

  /// No description provided for @logging_in_you_agree.
  ///
  /// In en, this message translates to:
  /// **'By \"logging in\" you agree to our'**
  String get logging_in_you_agree;

  /// No description provided for @change_language.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get change_language;

  /// No description provided for @edited_today.
  ///
  /// In en, this message translates to:
  /// **'Edited today'**
  String get edited_today;

  /// No description provided for @write_help_reason.
  ///
  /// In en, this message translates to:
  /// **'Enter the reason for the support...'**
  String get write_help_reason;

  /// No description provided for @favorites_sold.
  ///
  /// In en, this message translates to:
  /// **'Favorites sold'**
  String get favorites_sold;

  /// No description provided for @sellouts.
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get sellouts;

  /// No description provided for @expired_products.
  ///
  /// In en, this message translates to:
  /// **'Expired products'**
  String get expired_products;

  /// No description provided for @write_password.
  ///
  /// In en, this message translates to:
  /// **'Type a password...'**
  String get write_password;

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get edit_profile;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @near_me.
  ///
  /// In en, this message translates to:
  /// **'Near me'**
  String get near_me;

  /// No description provided for @reactivate.
  ///
  /// In en, this message translates to:
  /// **'Reactivate'**
  String get reactivate;

  /// No description provided for @please_fill_following_information.
  ///
  /// In en, this message translates to:
  /// **'Please fill in the following information:'**
  String get please_fill_following_information;

  /// No description provided for @profiles_you_follow.
  ///
  /// In en, this message translates to:
  /// **'Profiles you follow'**
  String get profiles_you_follow;

  /// No description provided for @to_follow_profile_click_follow_button.
  ///
  /// In en, this message translates to:
  /// **'To follow a user profile, press the follow button on their profile page.'**
  String get to_follow_profile_click_follow_button;

  /// No description provided for @tips_suggestions.
  ///
  /// In en, this message translates to:
  /// **'Tips and suggestions'**
  String get tips_suggestions;

  /// No description provided for @subcategory.
  ///
  /// In en, this message translates to:
  /// **'Subcategory'**
  String get subcategory;

  /// No description provided for @followed_at.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get followed_at;

  /// No description provided for @all_over_country.
  ///
  /// In en, this message translates to:
  /// **'All over {country}'**
  String all_over_country(Object country);

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Number'**
  String get name;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @completes_the.
  ///
  /// In en, this message translates to:
  /// **'Complete the {date}'**
  String completes_the(Object date);

  /// No description provided for @purchased.
  ///
  /// In en, this message translates to:
  /// **'Purchased'**
  String get purchased;

  /// No description provided for @you_not_have_any_products_for_sale.
  ///
  /// In en, this message translates to:
  /// **'You do not have any products for sale yet'**
  String get you_not_have_any_products_for_sale;

  /// No description provided for @brand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brand;

  /// No description provided for @new_products.
  ///
  /// In en, this message translates to:
  /// **'New products'**
  String get new_products;

  /// No description provided for @for_sale.
  ///
  /// In en, this message translates to:
  /// **'For sale'**
  String get for_sale;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @unknown_category.
  ///
  /// In en, this message translates to:
  /// **'Category unknown'**
  String get unknown_category;

  /// No description provided for @elevator.
  ///
  /// In en, this message translates to:
  /// **'Elevator'**
  String get elevator;

  /// No description provided for @swimming_pool.
  ///
  /// In en, this message translates to:
  /// **'Pool'**
  String get swimming_pool;

  /// No description provided for @all_ads.
  ///
  /// In en, this message translates to:
  /// **'All Listings'**
  String get all_ads;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @describe_your_ad.
  ///
  /// In en, this message translates to:
  /// **'Describe your ad'**
  String get describe_your_ad;

  /// No description provided for @restart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get restart;

  /// No description provided for @write_ad.
  ///
  /// In en, this message translates to:
  /// **'Write a title'**
  String get write_ad;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @balcony.
  ///
  /// In en, this message translates to:
  /// **'Balcony'**
  String get balcony;

  /// No description provided for @for_example_brand.
  ///
  /// In en, this message translates to:
  /// **'For example: Apple, Samsung, etc....'**
  String get for_example_brand;

  /// No description provided for @select_category.
  ///
  /// In en, this message translates to:
  /// **'Select a category'**
  String get select_category;

  /// No description provided for @title_ad.
  ///
  /// In en, this message translates to:
  /// **'Title of the advertisement'**
  String get title_ad;

  /// No description provided for @please_enter_description.
  ///
  /// In en, this message translates to:
  /// **'Please enter a description'**
  String get please_enter_description;

  /// No description provided for @select_subcategory.
  ///
  /// In en, this message translates to:
  /// **'Select a subcategory'**
  String get select_subcategory;

  /// No description provided for @publish_ad.
  ///
  /// In en, this message translates to:
  /// **'Post an ad'**
  String get publish_ad;

  /// No description provided for @update_ad.
  ///
  /// In en, this message translates to:
  /// **'Update ad'**
  String get update_ad;

  /// No description provided for @product_details.
  ///
  /// In en, this message translates to:
  /// **'Product details'**
  String get product_details;

  /// No description provided for @you_have_not_entered_condition.
  ///
  /// In en, this message translates to:
  /// **'You have not entered a condition'**
  String get you_have_not_entered_condition;

  /// No description provided for @upload_photo_description.
  ///
  /// In en, this message translates to:
  /// **'When you show several photos of your ad with good quality from different angles, it is easier to sell your ad.'**
  String get upload_photo_description;

  /// No description provided for @how_is_your_product.
  ///
  /// In en, this message translates to:
  /// **'How is your product?'**
  String get how_is_your_product;

  /// No description provided for @errors_in_form.
  ///
  /// In en, this message translates to:
  /// **'Errors have been found in the form'**
  String get errors_in_form;

  /// No description provided for @condition.
  ///
  /// In en, this message translates to:
  /// **'Condition'**
  String get condition;

  /// No description provided for @please_enter_price.
  ///
  /// In en, this message translates to:
  /// **'Please enter a price'**
  String get please_enter_price;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @you_have_not_entered_category.
  ///
  /// In en, this message translates to:
  /// **'You have not entered a category'**
  String get you_have_not_entered_category;

  /// No description provided for @you_have_not_entered_subcategory.
  ///
  /// In en, this message translates to:
  /// **'You have not entered a subcategory'**
  String get you_have_not_entered_subcategory;

  /// No description provided for @upload_least_one_photo.
  ///
  /// In en, this message translates to:
  /// **'Upload at least one photo'**
  String get upload_least_one_photo;

  /// No description provided for @man.
  ///
  /// In en, this message translates to:
  /// **'Man'**
  String get man;

  /// No description provided for @panama_region.
  ///
  /// In en, this message translates to:
  /// **'Panama'**
  String get panama_region;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @women.
  ///
  /// In en, this message translates to:
  /// **'Woman'**
  String get women;

  /// No description provided for @change_country.
  ///
  /// In en, this message translates to:
  /// **'Change country'**
  String get change_country;

  /// No description provided for @save_changes.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get save_changes;

  /// No description provided for @english_language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english_language;

  /// No description provided for @profiles_follow_you.
  ///
  /// In en, this message translates to:
  /// **'Profiles that follow you'**
  String get profiles_follow_you;

  /// No description provided for @nicaragua_region.
  ///
  /// In en, this message translates to:
  /// **'Nicaragua'**
  String get nicaragua_region;

  /// No description provided for @guatemala_region.
  ///
  /// In en, this message translates to:
  /// **'Guatemala'**
  String get guatemala_region;

  /// No description provided for @select_region.
  ///
  /// In en, this message translates to:
  /// **'Select your region'**
  String get select_region;

  /// No description provided for @sign_out.
  ///
  /// In en, this message translates to:
  /// **'Log off'**
  String get sign_out;

  /// No description provided for @follow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get follow;

  /// No description provided for @mexico_region.
  ///
  /// In en, this message translates to:
  /// **'Mexico'**
  String get mexico_region;

  /// No description provided for @costa_rica_region.
  ///
  /// In en, this message translates to:
  /// **'Costa Rica'**
  String get costa_rica_region;

  /// No description provided for @spanish_language.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanish_language;

  /// No description provided for @honduras_region.
  ///
  /// In en, this message translates to:
  /// **'Honduras'**
  String get honduras_region;

  /// No description provided for @el_salvador_region.
  ///
  /// In en, this message translates to:
  /// **'El Salvador'**
  String get el_salvador_region;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get change_password;

  /// No description provided for @north_american_region.
  ///
  /// In en, this message translates to:
  /// **'North America'**
  String get north_american_region;

  /// No description provided for @united_states_region.
  ///
  /// In en, this message translates to:
  /// **'United States'**
  String get united_states_region;

  /// No description provided for @date_birth.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get date_birth;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get delete_account;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get new_password;

  /// No description provided for @password_not_changed_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while changing the password.'**
  String get password_not_changed_error;

  /// No description provided for @new_construction.
  ///
  /// In en, this message translates to:
  /// **'New construction'**
  String get new_construction;

  /// No description provided for @current_password.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get current_password;

  /// No description provided for @change_email.
  ///
  /// In en, this message translates to:
  /// **'Exchange email'**
  String get change_email;

  /// No description provided for @write_date_birth.
  ///
  /// In en, this message translates to:
  /// **'Write your date of birth...'**
  String get write_date_birth;

  /// No description provided for @bathrooms.
  ///
  /// In en, this message translates to:
  /// **'bathrooms'**
  String get bathrooms;

  /// No description provided for @password_changed_correctly.
  ///
  /// In en, this message translates to:
  /// **'Password has been successfully changed'**
  String get password_changed_correctly;

  /// No description provided for @info_data_privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Zerobolas Inc\n\n200 Continental Drive\n\nSuite 401\n\nNewark, DE 19713\n\nUSA\n\nPhone\n\nGuatemala +(502) 5718 4537\n\nContact us by email\n\nhola@zerobolas.com\n\nLast Update: 01/13/2023\n\n\\nENGLISH'**
  String get info_data_privacy_policy;

  /// No description provided for @select_genre.
  ///
  /// In en, this message translates to:
  /// **'Select a genre...'**
  String get select_genre;

  /// No description provided for @genre.
  ///
  /// In en, this message translates to:
  /// **'Genre'**
  String get genre;

  /// No description provided for @purchases.
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get purchases;

  /// No description provided for @acceptable.
  ///
  /// In en, this message translates to:
  /// **'Acceptable'**
  String get acceptable;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @uploading_image.
  ///
  /// In en, this message translates to:
  /// **'Uploading image...'**
  String get uploading_image;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Configuration'**
  String get settings;

  /// No description provided for @error_upload_image.
  ///
  /// In en, this message translates to:
  /// **'There was an error uploading the image!'**
  String get error_upload_image;

  /// No description provided for @bathroom.
  ///
  /// In en, this message translates to:
  /// **'bathroom'**
  String get bathroom;

  /// No description provided for @i_prefer_not_to_mention.
  ///
  /// In en, this message translates to:
  /// **'I prefer not to mention'**
  String get i_prefer_not_to_mention;

  /// No description provided for @see_profile.
  ///
  /// In en, this message translates to:
  /// **'View profile'**
  String get see_profile;

  /// No description provided for @rooms.
  ///
  /// In en, this message translates to:
  /// **'rooms'**
  String get rooms;

  /// No description provided for @features.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get features;

  /// No description provided for @need_help.
  ///
  /// In en, this message translates to:
  /// **'Need help?'**
  String get need_help;

  /// No description provided for @like_new.
  ///
  /// In en, this message translates to:
  /// **'As new'**
  String get like_new;

  /// No description provided for @usable_m2.
  ///
  /// In en, this message translates to:
  /// **'useful m²'**
  String get usable_m2;

  /// No description provided for @chat_action.
  ///
  /// In en, this message translates to:
  /// **'Chatear'**
  String get chat_action;

  /// No description provided for @please_enter_brand.
  ///
  /// In en, this message translates to:
  /// **'Please enter a check mark'**
  String get please_enter_brand;

  /// No description provided for @please_enter_title.
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get please_enter_title;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @must_contain_more_than_10_characters.
  ///
  /// In en, this message translates to:
  /// **'Must contain more than 10 characters'**
  String get must_contain_more_than_10_characters;

  /// No description provided for @must_contain_more_than_3_characters.
  ///
  /// In en, this message translates to:
  /// **'Must contain more than 3 characters'**
  String get must_contain_more_than_3_characters;

  /// No description provided for @for_spare_or_repair.
  ///
  /// In en, this message translates to:
  /// **'For spare parts or repair'**
  String get for_spare_or_repair;

  /// No description provided for @followers.
  ///
  /// In en, this message translates to:
  /// **'Followers'**
  String get followers;

  /// No description provided for @new_.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get new_;

  /// No description provided for @enter_valid_email.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get enter_valid_email;

  /// No description provided for @want_to_receive_promotions_and_news.
  ///
  /// In en, this message translates to:
  /// **'I want to receive promotions and news from Zerobolas'**
  String get want_to_receive_promotions_and_news;

  /// No description provided for @already_have_account_sign_in.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign in'**
  String get already_have_account_sign_in;

  /// No description provided for @and_the.
  ///
  /// In en, this message translates to:
  /// **'and the'**
  String get and_the;

  /// No description provided for @continue_with_facebook.
  ///
  /// In en, this message translates to:
  /// **'Continue with Facebook'**
  String get continue_with_facebook;

  /// No description provided for @zerobolas_platform_operation.
  ///
  /// In en, this message translates to:
  /// **'Zerobolas is a platform that operates in several countries. Therefore, the ads you view and publish will be specifically targeted to the country of your choice.'**
  String get zerobolas_platform_operation;

  /// No description provided for @by_registering_you_accept.
  ///
  /// In en, this message translates to:
  /// **'By \"registering\", you accept our'**
  String get by_registering_you_accept;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @there_are_no_products_in_this_category.
  ///
  /// In en, this message translates to:
  /// **'There are no products in this category yet'**
  String get there_are_no_products_in_this_category;

  /// No description provided for @following.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get following;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @what_is_your_offer.
  ///
  /// In en, this message translates to:
  /// **'What is your offer?'**
  String get what_is_your_offer;

  /// No description provided for @send_offer.
  ///
  /// In en, this message translates to:
  /// **'Send offer'**
  String get send_offer;

  /// No description provided for @password_contain_more_than_8_characters.
  ///
  /// In en, this message translates to:
  /// **'The password must be at least 8 characters long'**
  String get password_contain_more_than_8_characters;

  /// No description provided for @you_must_accept_terms.
  ///
  /// In en, this message translates to:
  /// **'You must accept the terms and conditions.'**
  String get you_must_accept_terms;

  /// No description provided for @i_have_read_and_accept_terms.
  ///
  /// In en, this message translates to:
  /// **'I have read and accept the Terms of Use and Privacy Policy.'**
  String get i_have_read_and_accept_terms;

  /// No description provided for @cannot_empty_this_field.
  ///
  /// In en, this message translates to:
  /// **'You cannot leave this field empty'**
  String get cannot_empty_this_field;

  /// No description provided for @updated_correctly.
  ///
  /// In en, this message translates to:
  /// **'The data has been updated correctly!'**
  String get updated_correctly;

  /// No description provided for @delete_account_zerobolas.
  ///
  /// In en, this message translates to:
  /// **'Delete Zerobolas account'**
  String get delete_account_zerobolas;

  /// No description provided for @my_products.
  ///
  /// In en, this message translates to:
  /// **'My products'**
  String get my_products;

  /// No description provided for @send_proposal.
  ///
  /// In en, this message translates to:
  /// **'Send proposal'**
  String get send_proposal;

  /// No description provided for @cannot_leave_email_empty.
  ///
  /// In en, this message translates to:
  /// **'You cannot leave the email field empty'**
  String get cannot_leave_email_empty;

  /// No description provided for @region.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get region;

  /// No description provided for @write_name.
  ///
  /// In en, this message translates to:
  /// **'Write your name...'**
  String get write_name;

  /// No description provided for @select_location.
  ///
  /// In en, this message translates to:
  /// **'Select a location...'**
  String get select_location;

  /// No description provided for @register_accept.
  ///
  /// In en, this message translates to:
  /// **'By registering you accept our'**
  String get register_accept;

  /// No description provided for @continue_with_email.
  ///
  /// In en, this message translates to:
  /// **'Continue with Email'**
  String get continue_with_email;

  /// No description provided for @central_america_region.
  ///
  /// In en, this message translates to:
  /// **'Central America'**
  String get central_america_region;

  /// No description provided for @additional_options.
  ///
  /// In en, this message translates to:
  /// **'Additional options'**
  String get additional_options;

  /// No description provided for @my_favorites.
  ///
  /// In en, this message translates to:
  /// **'My favorites'**
  String get my_favorites;

  /// No description provided for @to_remodel.
  ///
  /// In en, this message translates to:
  /// **'To remodel'**
  String get to_remodel;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @continue_with_google.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continue_with_google;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send to'**
  String get send;

  /// No description provided for @what_zerobolas_meeting_points.
  ///
  /// In en, this message translates to:
  /// **'What are the Zerobolas meeting points?'**
  String get what_zerobolas_meeting_points;

  /// No description provided for @select_meeting_point_apple_maps.
  ///
  /// In en, this message translates to:
  /// **'Select a meeting point with Apple Maps'**
  String get select_meeting_point_apple_maps;

  /// No description provided for @site_protected_recaptcha.
  ///
  /// In en, this message translates to:
  /// **'Site protected by reCAPTCHA, the'**
  String get site_protected_recaptcha;

  /// No description provided for @how_do_zerobolas_meeting_points_work.
  ///
  /// In en, this message translates to:
  /// **'How do the Zerobolas meeting points work?'**
  String get how_do_zerobolas_meeting_points_work;

  /// No description provided for @propose_pucharse_of_product.
  ///
  /// In en, this message translates to:
  /// **'\n\nI propose you to purchase {myProduct} product in:\n\n'**
  String propose_pucharse_of_product(Object myProduct);

  /// No description provided for @use_one_of_points_authorized.
  ///
  /// In en, this message translates to:
  /// **'Use one of our points authorized by Zerobolas. This service is for collection and includes security in your transactions.'**
  String get use_one_of_points_authorized;

  /// No description provided for @hello_username.
  ///
  /// In en, this message translates to:
  /// **'Hello, {username}'**
  String hello_username(Object username);

  /// No description provided for @cannot_leave_name_empty.
  ///
  /// In en, this message translates to:
  /// **'You cannot leave the name empty'**
  String get cannot_leave_name_empty;

  /// No description provided for @register_sign_in.
  ///
  /// In en, this message translates to:
  /// **'Register / Login'**
  String get register_sign_in;

  /// No description provided for @register_in_zerobolas.
  ///
  /// In en, this message translates to:
  /// **'Register in Zerobolas'**
  String get register_in_zerobolas;

  /// No description provided for @authorized_meeting_points.
  ///
  /// In en, this message translates to:
  /// **'Zerobolas authorized meeting points'**
  String get authorized_meeting_points;

  /// No description provided for @unable_to_login.
  ///
  /// In en, this message translates to:
  /// **'Unable to log in.'**
  String get unable_to_login;

  /// No description provided for @google_terms_service.
  ///
  /// In en, this message translates to:
  /// **'Google Terms of Service'**
  String get google_terms_service;

  /// No description provided for @tips_before_buying_selling.
  ///
  /// In en, this message translates to:
  /// **'Tips before buying or selling'**
  String get tips_before_buying_selling;

  /// No description provided for @choose_place_to_meet.
  ///
  /// In en, this message translates to:
  /// **'Choose a place to meet'**
  String get choose_place_to_meet;

  /// No description provided for @choose_meeting_point.
  ///
  /// In en, this message translates to:
  /// **'Choose a meeting point'**
  String get choose_meeting_point;

  /// No description provided for @would_like_to_buy_product.
  ///
  /// In en, this message translates to:
  /// **'I would like to buy your {productTitle}'**
  String would_like_to_buy_product(Object productTitle);

  /// No description provided for @please_let_me_know_day_pick_it.
  ///
  /// In en, this message translates to:
  /// **'\n\nPlease let me know what day you could pick it up so I can review it and accept the purchase.'**
  String get please_let_me_know_day_pick_it;

  /// No description provided for @find_nearby_place_security.
  ///
  /// In en, this message translates to:
  /// **'Find a nearby, well-lit public place with security cameras where you can meet safely, such as a coffee shop or shopping mall.'**
  String get find_nearby_place_security;

  /// No description provided for @use_messages_in_zerobolas_other.
  ///
  /// In en, this message translates to:
  /// **'When you are on your way to the meeting, use Zerobolas messages to tell the other person that you are on your way and never share your personal details such as your phone number or WhatsApp. If you are late, let the other person know.'**
  String get use_messages_in_zerobolas_other;

  /// No description provided for @request_assistance.
  ///
  /// In en, this message translates to:
  /// **'Request assistance'**
  String get request_assistance;

  /// No description provided for @yard.
  ///
  /// In en, this message translates to:
  /// **'Yard'**
  String get yard;

  /// No description provided for @security_sentry_box.
  ///
  /// In en, this message translates to:
  /// **'Security sentry box'**
  String get security_sentry_box;

  /// No description provided for @garage.
  ///
  /// In en, this message translates to:
  /// **'Garage'**
  String get garage;

  /// No description provided for @propose_purchase_zerobolas_meeting_point.
  ///
  /// In en, this message translates to:
  /// **'I propose you to purchase your product at a Zerobolas meeting point:\n\n {meetingPoint}\n\n Please let me know what day you could deliver it to the Zerobolas meeting point so I can review and accept the purchase.'**
  String propose_purchase_zerobolas_meeting_point(Object meetingPoint);

  /// No description provided for @we_help_you_find_property.
  ///
  /// In en, this message translates to:
  /// **'We help you find your property'**
  String get we_help_you_find_property;

  /// No description provided for @upload_least_3_photos.
  ///
  /// In en, this message translates to:
  /// **'Upload at least 3 photos'**
  String get upload_least_3_photos;

  /// No description provided for @to_save_product_click_favorite_icon.
  ///
  /// In en, this message translates to:
  /// **'To save a product, click on the favorite product icon (heart emoji).'**
  String get to_save_product_click_favorite_icon;

  /// No description provided for @my.
  ///
  /// In en, this message translates to:
  /// **'mi'**
  String get my;

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'tu'**
  String get you;

  /// No description provided for @continue_with_apple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continue_with_apple;

  /// No description provided for @write_message.
  ///
  /// In en, this message translates to:
  /// **'Write a message...'**
  String get write_message;

  /// No description provided for @error_receiving_chats.
  ///
  /// In en, this message translates to:
  /// **'Error receiving your chats'**
  String get error_receiving_chats;

  /// No description provided for @report_ad.
  ///
  /// In en, this message translates to:
  /// **'Report ad'**
  String get report_ad;

  /// No description provided for @why_innovative_service.
  ///
  /// In en, this message translates to:
  /// **'Why is it an innovative service?'**
  String get why_innovative_service;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @name_and_last_name.
  ///
  /// In en, this message translates to:
  /// **'First and last name'**
  String get name_and_last_name;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @see_ads.
  ///
  /// In en, this message translates to:
  /// **'See ads'**
  String get see_ads;

  /// No description provided for @see_add.
  ///
  /// In en, this message translates to:
  /// **'See ad'**
  String get see_add;

  /// No description provided for @select_country.
  ///
  /// In en, this message translates to:
  /// **'Select country'**
  String get select_country;

  /// No description provided for @info_privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Introduction.\n\nWe take your privacy rights very seriously and want you to feel comfortable on Zerobolas Marketplace. This privacy policy addresses personally identifiable information (designated \"data\" below) that is collected by us on our site. This policy does not apply to other entities that we do not own or control, or to persons who are not our employees or agents. Please take the time to read our terms of use.\n\n1. Data Collection.\n\nOur registration process requires a valid e-mail address, a user ID, a password and the required fields in bold. Providing us with other information is your option. Please note that your user name, e-mail address, or other submissions you make on this site may contain your real name or other personally identifiable information and, as a result, may appear on this site. Like many Internet sites, we may also automatically receive general information contained in our server log files such as your IP address or cookie information. Information about how classifieds may be served on this site (if at all), can be seen below. zerobolas.com may send notifications or messages from users interested in your ads through the e-mail address you used to subscribe. You can unsubscribe from these e-mails. zerobolas.com will not ask you by phone or email credit card details. The only time you should provide your data is online and directly through the payment gateway Stripe.com, 2Checkout.com, and PayPal.\n\n2. Consent to use of information.\n\nThe registration of account and publication of announcements in zerobolas.com implies that the information of the advertiser will be publicly available in our network of sites in order to facilitate to the potential interested consumers the contact with the advertiser.\n\nYou agree that zerobolas.com may provide or share information and data collected from your account and related accounts with the authorities, in cases where it deems appropriate or at the express request of these.\n\n3. Conditions of consent and account deletion.\n\nRegistered users who wish to delete their account, may request it via email through hola@zerobolas.com. This process may take between 3 and 5 business days. In emergency cases, the deletion of your account can be requested by phone by calling the phone numbers below. It is important to emphasize that in case of account deletion, zerobolas.com will unpublish the user\'s information and ads from its network of sites, however, the company does not control and is not responsible for the listings published in other search engines such as Google, Yahoo, Bing or any other site not related to zerobolas.com.\n\n4. Use of data\n\nWe may use data to modify and improve your experience as a user of this Site. We will make efforts so that your data will not be provided to third parties unless:\n\n4.1. otherwise provided for within this privacy policy;\n\n4.2. we obtain your consent, for example, when you choose to OPT-in or OPT-out to data sharing;\n\n4.3. a service provided on our site requires interaction with or is provided by a third party, by way of example an application service provider;\n\n4.4. pursuant to legal process or law enforcement;\n\n4.5. we find that through the use of this site you violate our policy, terms of service, other usage guidelines or as deemed reasonably necessary by us to protect our legal rights and/or property;\n\n4.6. this site is purchased by third parties whereby those third parties may use data in a manner similar to us as provided in this policy. In the event you choose to use links appearing on our site to visit other sites. You are advised to read the privacy policies posted on those sites.\n\n5. Cookies.\n\nLike many Internet sites, we set and use cookies to enhance your user experience, such as retaining your personal settings. Advertisements may appear on our Web site and, if so, may set and access cookies on your computer and are subject to the privacy policy of those parties providing the advertisement. More information about Cookies is available at: http://es.wikipedia.org/wiki/Cookie\n\n5.1.DoubleClick DART Cookie. Google uses the DoubleClick DART cookie on ads served on websites like this one that display AdSense ads for content. Use of the DART cookie enables Google to serve ads to users who visit their sites and other sites on the Internet. Google uses advertising partners to serve ads when users visit our website. These companies may use the information they obtain from visits to this and other websites (not including name, address, e-mail address or telephone number) to provide users with advertisements about products and services of interest to them. *As a user, you may opt out of the use of the DART cookie by visiting the Google ad and content network privacy policy: http://www.google.com/privacy_ads.html.\n\n5.2. Web Beacons This site may also host web beacons (also known as web bugs). Web beacons are usually small images of one pixel by one pixel, visible or invisible placed within the source code of the web pages of a site. Web beacons serve and are used in a similar way to cookies. In addition, web beacons are often used to measure the traffic of users visiting a web page in order to get a pattern of users of a site. More information about web beacons is available at: http://es.wikipedia.org/wiki/Web_bug.\n\n6. Children.\n\nWe do not allow persons under the age of thirteen (13) to be members of this site. For more information, please contact our webmaster.\n\n7. Correcting or removing your account information.\n\nWe give you the ability to correct the information in your user account that you provided to us at registration using your personal area of the site settings. You may request cancellation of your user account by contacting our webmaster. Content or other data that you may have provided that is not within your user account, such as messages that may appear within our forums, may continue to appear on our site at our discretion even if your user account is deleted. Please see our terms of use for more information.\n\n8. Change to this privacy policy.\n\nWe may make changes to this Privacy Policy at any time. We will notify you of material changes to this policy either by posting a prominent notice on our site and/or by sending you a message to the e-mail address you have provided to us and which is contained in your user settings.\n\n9. We Make No Warranties.\n\nWhile this Privacy Policy indicates that our standards for data maintenance and we will make efforts to meet them, we are not in a position to guarantee these standards. There may be factors beyond our control that may result in data access. Accordingly, we disclaim any warranties or representations concerning the maintenance or non-release of data.\n\n10. Contact Information.\n\nIf you have any questions about this Privacy Policy or our web site, please feel free to contact our webmaster.\n\n11. Emails\n\nIn order to stop receiving emails sent by zerobolas.gt, you must start by clicking the unsubscribe link located at the bottom of the email sent. Depending on your user level, you may unsubscribe immediately after clicking on the link. If you already have a properly registered user account, you will need to log in to the account with your password and login before clicking on Confirm Unsubscription.\n\nIf you only want to stop receiving certain emails from zerobolas.gt and not others, you can manage these options from your account. You enter your account from the Login. You enter your account with your login and password. Under the menu Profile > Settings > Notifications you can deselect the notifications you do not want to receive.'**
  String get info_privacy_policy;

  /// No description provided for @messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @securely.
  ///
  /// In en, this message translates to:
  /// **'safely'**
  String get securely;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @report_user.
  ///
  /// In en, this message translates to:
  /// **'Report user'**
  String get report_user;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @radius_kms_around.
  ///
  /// In en, this message translates to:
  /// **'({radius} kms around)'**
  String radius_kms_around(Object radius);

  /// No description provided for @security_reasons_never_share_private.
  ///
  /// In en, this message translates to:
  /// **'For security reasons, never share private data.'**
  String get security_reasons_never_share_private;

  /// No description provided for @search_in_zerobolas.
  ///
  /// In en, this message translates to:
  /// **'Search in Zerobolas'**
  String get search_in_zerobolas;

  /// No description provided for @search_for_anything.
  ///
  /// In en, this message translates to:
  /// **'Search for anything'**
  String get search_for_anything;

  /// No description provided for @browse_by_category.
  ///
  /// In en, this message translates to:
  /// **'Browse by category'**
  String get browse_by_category;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get view_all;

  /// No description provided for @cars.
  ///
  /// In en, this message translates to:
  /// **'Cars'**
  String get cars;

  /// No description provided for @motorcycles.
  ///
  /// In en, this message translates to:
  /// **'Motorcycles'**
  String get motorcycles;

  /// No description provided for @motors_accessories.
  ///
  /// In en, this message translates to:
  /// **'Motors &\nAccessories'**
  String get motors_accessories;

  /// No description provided for @fashion_accessories.
  ///
  /// In en, this message translates to:
  /// **'Fashion &\nAccessories'**
  String get fashion_accessories;

  /// No description provided for @real_estate.
  ///
  /// In en, this message translates to:
  /// **'Real Estate'**
  String get real_estate;

  /// No description provided for @technology_electronics.
  ///
  /// In en, this message translates to:
  /// **'Technology &\nElectronics'**
  String get technology_electronics;

  /// No description provided for @sports_leisure.
  ///
  /// In en, this message translates to:
  /// **'Sports & leisure'**
  String get sports_leisure;

  /// No description provided for @bikes.
  ///
  /// In en, this message translates to:
  /// **'Bikes'**
  String get bikes;

  /// No description provided for @home_garden.
  ///
  /// In en, this message translates to:
  /// **'Home &\nGarden'**
  String get home_garden;

  /// No description provided for @appliances.
  ///
  /// In en, this message translates to:
  /// **'Appliances'**
  String get appliances;

  /// No description provided for @movies_books_music.
  ///
  /// In en, this message translates to:
  /// **'Movies, Books & Music'**
  String get movies_books_music;

  /// No description provided for @baby_child.
  ///
  /// In en, this message translates to:
  /// **'Baby & Child'**
  String get baby_child;

  /// No description provided for @collectibles_art.
  ///
  /// In en, this message translates to:
  /// **'Collectibles, TGAs & Art'**
  String get collectibles_art;

  /// No description provided for @construction.
  ///
  /// In en, this message translates to:
  /// **'Construction'**
  String get construction;

  /// No description provided for @agriculture_industrial.
  ///
  /// In en, this message translates to:
  /// **'Agriculture & Industrial'**
  String get agriculture_industrial;

  /// No description provided for @jobs.
  ///
  /// In en, this message translates to:
  /// **'Jobs'**
  String get jobs;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @others.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get others;

  /// No description provided for @in_good_condition.
  ///
  /// In en, this message translates to:
  /// **'In good condition'**
  String get in_good_condition;

  /// No description provided for @sell.
  ///
  /// In en, this message translates to:
  /// **'Sell'**
  String get sell;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @ads_you_like.
  ///
  /// In en, this message translates to:
  /// **'Ads you like'**
  String get ads_you_like;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @make_offer_this_ad.
  ///
  /// In en, this message translates to:
  /// **'Make an offer for this ad'**
  String get make_offer_this_ad;

  /// No description provided for @select_meeting_point_make_purchase.
  ///
  /// In en, this message translates to:
  /// **'Select a safe meeting point where you would like to make your purchase:'**
  String get select_meeting_point_make_purchase;

  /// No description provided for @choose_country_matches_location.
  ///
  /// In en, this message translates to:
  /// **'You must choose a country that matches your location.'**
  String get choose_country_matches_location;

  /// No description provided for @search_ads_interested_chatting.
  ///
  /// In en, this message translates to:
  /// **'Search for ads that interest you and\nstart chatting'**
  String get search_ads_interested_chatting;

  /// No description provided for @for_price.
  ///
  /// In en, this message translates to:
  /// **' for {price}'**
  String for_price(Object price);

  /// No description provided for @error_receiving_messages.
  ///
  /// In en, this message translates to:
  /// **'We have not been able to receive your messages.'**
  String get error_receiving_messages;

  /// No description provided for @buy.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get buy;

  /// No description provided for @delete_conversation.
  ///
  /// In en, this message translates to:
  /// **'Delete conversation'**
  String get delete_conversation;

  /// No description provided for @my_account.
  ///
  /// In en, this message translates to:
  /// **'My account'**
  String get my_account;

  /// No description provided for @block_user.
  ///
  /// In en, this message translates to:
  /// **'Block user'**
  String get block_user;

  /// No description provided for @propose_pucharse_of_product_meeting_point_zerobolas.
  ///
  /// In en, this message translates to:
  /// **'\n\nI propose you to make the purchase of {myProduct} product at a Zerobolas meeting point:\n\n'**
  String propose_pucharse_of_product_meeting_point_zerobolas(Object myProduct);

  /// No description provided for @seller_will_receive_money_from_24_hours_later.
  ///
  /// In en, this message translates to:
  /// **'The seller will receive the money from your sale 24 hours later, if the buyer accepts the purchase of the product (only available with cash payments).'**
  String get seller_will_receive_money_from_24_hours_later;

  /// No description provided for @no_data.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get no_data;

  /// No description provided for @imagine_publishes_ad_fake_airpod.
  ///
  /// In en, this message translates to:
  /// **'Imagine that someone publishes the ad of a fake AirPods, thanks to the Zerobolas meeting point service the buyer could detect that it is not an original product and not accept your purchase, thus avoiding being scammed.'**
  String get imagine_publishes_ad_fake_airpod;

  /// No description provided for @sellers_can_drop_off_products_in_our_meetings_points.
  ///
  /// In en, this message translates to:
  /// **'Sellers can drop off their products at any of our meeting points where the buyer can review the products and confirm their purchase, paying the price of the product plus the cost of the service (5% of the value of the product).'**
  String get sellers_can_drop_off_products_in_our_meetings_points;

  /// No description provided for @meeting_points.
  ///
  /// In en, this message translates to:
  /// **'Meeting points'**
  String get meeting_points;

  /// No description provided for @delete_product.
  ///
  /// In en, this message translates to:
  /// **'Delete product'**
  String get delete_product;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @saved_ads.
  ///
  /// In en, this message translates to:
  /// **'Saved ads'**
  String get saved_ads;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @sold.
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get sold;

  /// No description provided for @published_at.
  ///
  /// In en, this message translates to:
  /// **'Published on {date}'**
  String published_at(Object date);

  /// No description provided for @edited_yesterday.
  ///
  /// In en, this message translates to:
  /// **'Edited yesterday'**
  String get edited_yesterday;

  /// No description provided for @you_think_it_inflicts_our_standards.
  ///
  /// In en, this message translates to:
  /// **'Do you think it inflicts our standards?'**
  String get you_think_it_inflicts_our_standards;

  /// No description provided for @sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get sales;

  /// No description provided for @edited_days.
  ///
  /// In en, this message translates to:
  /// **'Edited {days} days ago'**
  String edited_days(Object days);

  /// No description provided for @mark_as_sold.
  ///
  /// In en, this message translates to:
  /// **'Mark as sold'**
  String get mark_as_sold;

  /// No description provided for @doors.
  ///
  /// In en, this message translates to:
  /// **'doors'**
  String get doors;

  /// No description provided for @seats.
  ///
  /// In en, this message translates to:
  /// **'seats'**
  String get seats;

  /// No description provided for @model.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get model;

  /// No description provided for @where.
  ///
  /// In en, this message translates to:
  /// **'Where?'**
  String get where;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @see_ad.
  ///
  /// In en, this message translates to:
  /// **'See ad'**
  String get see_ad;

  /// No description provided for @great_ad_uploaded.
  ///
  /// In en, this message translates to:
  /// **'Great! Ad uploaded'**
  String get great_ad_uploaded;

  /// No description provided for @our_team_reviewing.
  ///
  /// In en, this message translates to:
  /// **'Our team is already reviewing it... Soon it will be available for sale.'**
  String get our_team_reviewing;

  /// No description provided for @publish_other_ad.
  ///
  /// In en, this message translates to:
  /// **'Post another ad'**
  String get publish_other_ad;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @this_way_users_be_able_to_find.
  ///
  /// In en, this message translates to:
  /// **'This way users will be able to find your service'**
  String get this_way_users_be_able_to_find;

  /// No description provided for @operation_type.
  ///
  /// In en, this message translates to:
  /// **'Operation Type'**
  String get operation_type;

  /// No description provided for @select_operation_type.
  ///
  /// In en, this message translates to:
  /// **'Select operation type...'**
  String get select_operation_type;

  /// No description provided for @please_enter_operation_type.
  ///
  /// In en, this message translates to:
  /// **'Please enter a type of operation'**
  String get please_enter_operation_type;

  /// No description provided for @property_type.
  ///
  /// In en, this message translates to:
  /// **'Property Type'**
  String get property_type;

  /// No description provided for @select_property_type.
  ///
  /// In en, this message translates to:
  /// **'Select property type...'**
  String get select_property_type;

  /// No description provided for @please_enter_property_type.
  ///
  /// In en, this message translates to:
  /// **'Please, enter property type...'**
  String get please_enter_property_type;

  /// No description provided for @number_of_rooms.
  ///
  /// In en, this message translates to:
  /// **'Number of rooms'**
  String get number_of_rooms;

  /// No description provided for @how_many_bedrooms.
  ///
  /// In en, this message translates to:
  /// **'How many bedrooms does the property have?'**
  String get how_many_bedrooms;

  /// No description provided for @number_of_bathrooms.
  ///
  /// In en, this message translates to:
  /// **'Number of bathrooms'**
  String get number_of_bathrooms;

  /// No description provided for @how_many_bathrooms.
  ///
  /// In en, this message translates to:
  /// **'How many bathrooms does your property have?'**
  String get how_many_bathrooms;

  /// No description provided for @levels.
  ///
  /// In en, this message translates to:
  /// **'Levels'**
  String get levels;

  /// No description provided for @how_many_levels.
  ///
  /// In en, this message translates to:
  /// **'How many levels does the property have?'**
  String get how_many_levels;

  /// No description provided for @area_land.
  ///
  /// In en, this message translates to:
  /// **'Land area'**
  String get area_land;

  /// No description provided for @you_have_not_entered_location.
  ///
  /// In en, this message translates to:
  /// **'You have not entered location'**
  String get you_have_not_entered_location;

  /// No description provided for @add_position_to_add_point.
  ///
  /// In en, this message translates to:
  /// **'You must add a position to add a rendezvous point'**
  String get add_position_to_add_point;

  /// No description provided for @continue_word.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get continue_word;

  /// No description provided for @onboarding_location_title.
  ///
  /// In en, this message translates to:
  /// **'Buy and sell near you'**
  String get onboarding_location_title;

  /// No description provided for @onboarding_location_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enable location so we can set up your feed and show you the ads that are closest to you.'**
  String get onboarding_location_subtitle;

  /// No description provided for @onboarding_tracking_title.
  ///
  /// In en, this message translates to:
  /// **'Allow us to improve\nyour experience'**
  String get onboarding_tracking_title;

  /// No description provided for @onboarding_tracking_subtitle.
  ///
  /// In en, this message translates to:
  /// **'To personalize it based on your interests, we need your permission to use data such as device activity or your usage from other apps.'**
  String get onboarding_tracking_subtitle;

  /// No description provided for @onboarding_tracking_private_data_title.
  ///
  /// In en, this message translates to:
  /// **'Your private data is not used.'**
  String get onboarding_tracking_private_data_title;

  /// No description provided for @onboarding_tracking_private_data_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Consenting to the use of the above data does not mean giving access to other data not specified.'**
  String get onboarding_tracking_private_data_subtitle;

  /// No description provided for @mark_as_sold_title.
  ///
  /// In en, this message translates to:
  /// **'Who did you sell it to?'**
  String get mark_as_sold_title;

  /// No description provided for @sold_not_in_zerobolas.
  ///
  /// In en, this message translates to:
  /// **'I didn\'t sell it in Zerobolas'**
  String get sold_not_in_zerobolas;

  /// No description provided for @select_buyer.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!\n\nSelect who you sold your'**
  String get select_buyer;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get to;

  /// No description provided for @rate_buyer.
  ///
  /// In en, this message translates to:
  /// **'Qualifies the buyer'**
  String get rate_buyer;

  /// No description provided for @rate_buyer_with.
  ///
  /// In en, this message translates to:
  /// **'Rate your experience with'**
  String get rate_buyer_with;

  /// No description provided for @rate_stars.
  ///
  /// In en, this message translates to:
  /// **'Rate your experience by clicking the stars.\nThe more stars, the better the experience.'**
  String get rate_stars;

  /// No description provided for @select_quantity.
  ///
  /// In en, this message translates to:
  /// **'Indicate the amount you sold it for'**
  String get select_quantity;

  /// No description provided for @write_review.
  ///
  /// In en, this message translates to:
  /// **'Write your review'**
  String get write_review;

  /// No description provided for @publish_review.
  ///
  /// In en, this message translates to:
  /// **'Publish review'**
  String get publish_review;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
