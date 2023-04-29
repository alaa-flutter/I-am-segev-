import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:work_calculator/shared_preferences/shared_preferences.dart';
import 'Providers/lang_provider.dart';
import 'Providers/theme_provider.dart';
import 'Views/Screens/bottom_bar_screen.dart';

/// AppLocalizations.of(context)!.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesController().initSharedPreferences();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          return Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
            return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: const [
                Locale('ar'),
                Locale('en'),
              ],
              locale: Locale(Provider.of<LangProviders>(context).lang_),
              debugShowCheckedModeBanner: false,
              home: const BottomBarScreen(),
              title: 'Your App',
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode:
                  themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            );
          });
        },
      ),
    );
  }
}
