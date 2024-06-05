class AppConstants {
  AppConstants._();

  static const String appName = 'example';
  static const String drawingBaseUrl = 'https://api.openrouteservice.org';
  static const String baseUrl = 'https://api.hamsterkombat.io';
  static const String webUrl = 'https://example.uz';

  static const String googleApiKey = '******';
  static const String privacyPolicyUrl = '$baseUrl/privacy-policy';
  static const String firebaseWebKey = '******';
  static const String uriPrefix = 'https://example.page.link';
  static const String routingKey = '**';
  static const String androidPackageName = 'uz.example';
  static const String iosPackageName = 'uz.example';

  static const int radius = 16;

  //location
  static const double demoLatitude = 40.2725769;
  static const double demoLongitude = 68.8169827;

  //refresh duration
  static const Duration timeRefresh = Duration(seconds: 30);
}

//translation key generate
/// dart run easy_localization:generate -S "assets/tr" -O "lib/infrastructure/translations"
/// dart run easy_localization:generate -S assets/tr -f keys -O lib/infrastructure/translations -o locale_keys.g.dart

//logo generate
/// dart run flutter_launcher_icons
//splash generate
/// dart run flutter_native_splash:create

