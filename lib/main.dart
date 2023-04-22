import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:work_calculator/Views/Screens/Auth/login_screen.dart';
import 'package:work_calculator/Views/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:work_calculator/shared_preferences/shared_preferences.dart';
import 'Providers/lang_provider.dart';
import 'Providers/theme_provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Shared Preferences
  await SharedPreferencesController().initSharedPreferences();

  /// App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LangProviders>(
          create: (context) => LangProviders(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            home: const LoginScreen(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            locale: Locale(Provider.of<LangProviders>(context).lang_),
            debugShowCheckedModeBanner: false,
            title: 'Your App',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            // themeMode:
            //     themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,

          );
        },
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider(
  //     create: (_) => ThemeProvider(),
  //     child: Consumer<ThemeProvider>(
  //       builder: (context, themeProvider, child) => MaterialApp(
  //         title: 'Your App',
  //         theme: ThemeData.light(),
  //         darkTheme: ThemeData.dark(),
  //         themeMode:
  //         themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
  //         home: const LoginScreen(),
  //         localizationsDelegates: AppLocalizations.localizationsDelegates,
  //         supportedLocales: const [
  //           Locale('ar'),
  //           Locale('en'),
  //         ],
  //         locale: Locale(Provider.of<LangProviders>(context).lang_),
  //         debugShowCheckedModeBanner: false,
  //       ),
  //     ),
  //   );
  // }




}
