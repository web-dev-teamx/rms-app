import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sv_rms_mobile/services/client/http_client_provider.dart';
import 'package:sv_rms_mobile/ui/authentication/login_screen.dart';
import 'package:sv_rms_mobile/utils/app_theme.dart';

import 'config_store.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RmsApp extends StatefulWidget {
  const RmsApp({
    Key? key,
    required this.configStore,
  }) : super(key: key);
  final ConfigStore configStore;
  @override
  _RmsAppState createState() => _RmsAppState();
}

class _RmsAppState extends State<RmsApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) {
            final dioProvider = DioClientProvider(
              baseUrl: "https://rmsportal.net/api",
              sessionHandler: Provider.of(context, listen: false),
            );
            return dioProvider.dio;
          },
        ),
      ],
      child: Observer(
        builder: (context) => MaterialApp(
          title: 'TAL ESS',
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          initialRoute: LoginScreen.route,
          onGenerateRoute: generateRoute,
          // initialRoute: SplashScreen.route,
          // localizationsDelegates: const [
          //   AppLocalizations.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ], 
          // supportedLocales: AppLocalizations.supportedLocales,
          // locale: _resolveLocale(widget.configStore.locale),
          themeMode: _getThemeMode(widget.configStore.isDarkMode),
          darkTheme: ThemeData(
            cardColor: const Color(0xff302c61),
            canvasColor: const Color(0xff302c61),
            shadowColor: Colors.white70,
            applyElevationOverlayColor: false,
            splashFactory: InkRipple.splashFactory,
            primarySwatch: AppTheme.primaryColor,
            splashColor: AppTheme.primaryDarkColor.withOpacity(0.1),
            highlightColor: Colors.transparent,
            appBarTheme: AppBarTheme(
              elevation: 4,
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: Colors.black,
            ),
            scaffoldBackgroundColor: Colors.black,
            fontFamily: GoogleFonts.poppins().fontFamily,
            brightness: Brightness.dark,
          ),
          theme: ThemeData(
            appBarTheme:  AppBarTheme(
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: Colors.white,
              elevation: 1,
            ),
            shadowColor: Colors.black12,
            cardColor: Colors.white,
            canvasColor: Colors.white,
            brightness: Brightness.light,
            splashFactory: InkRipple.splashFactory,
            primarySwatch: AppTheme.primaryColor,
            splashColor: AppTheme.primaryColor.withOpacity(0.1),
            backgroundColor: Colors.white,
            highlightColor: Colors.transparent,
            scaffoldBackgroundColor:  Colors.blueGrey.shade50,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      ),
    );
  }
}

ThemeMode _getThemeMode(bool? isDarkMode) {
  switch (isDarkMode) {
    case true:
      return ThemeMode.dark;
    case false:
      return ThemeMode.light;
    case null:
      return ThemeMode.system;
    default:
      return ThemeMode.system;
  }
}

// Locale _resolveLocale(Language locale) {
//   switch (locale) {
//     case Language.english:
//       return const Locale('en');
//     case Language.arabic:
//       return const Locale('ar');
//   }
// }

// String? _resolveFontFamily(Language locale) {
//   switch (locale) {
//     case Language.english:
//       // return "GoogleSans";
//       return GoogleFonts.poppins().fontFamily;
//     case Language.arabic:
//       return GoogleFonts.poppins().fontFamily;
//     // return "GoogleSans";
//     // return GoogleFonts.ibmPlexSans().fontFamily;
//   }
// }
