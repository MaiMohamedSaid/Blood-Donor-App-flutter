// ignore_for_file: no_leading_underscores_for_local_identifiers, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/provider/auth_provider.dart';
import 'package:untitledtest11/provider/donation_provider.dart';
import 'package:untitledtest11/provider/localization_provider.dart';
import 'package:untitledtest11/provider/needs_provider.dart';
import 'package:untitledtest11/provider/section_provider.dart';
import 'package:untitledtest11/provider/theme_provider.dart';
import 'package:untitledtest11/services/navigation_services.dart';
import 'package:untitledtest11/theme/dark_theme.dart';
import 'package:untitledtest11/theme/light_theme.dart';
import 'package:untitledtest11/util/app_constants.dart';
import 'package:untitledtest11/views/screens/splash/splash_screen.dart';
import 'di_container.dart' as di;
import './util/router.dart' as router;
import 'di_container.dart';
import 'helper/custom_delegate.dart';
import 'localization/app_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await di.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<LocalizationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<DonationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SectionProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<NeedsProvider>()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Locale> _locals = [];
    for (var language in AppConstants.languages!) {
      _locals.add(Locale(language.languageCode, language.countryCode));
    }
    return MaterialApp(
      title: AppConstants.APP_NAME,
      navigatorKey: locator<NavigationServices>().navigatorKey,
      onGenerateRoute: router.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
      locale: Provider.of<LocalizationProvider>(context).locale,
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackLocalizationDelegate()
      ],
      supportedLocales: _locals,
      home: SplashScreen(),
    );
  }
}