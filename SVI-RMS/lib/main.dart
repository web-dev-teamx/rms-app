import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sv_rms_mobile/blocs/services_bloc.dart';
import 'package:sv_rms_mobile/ui/profile_details/my_payments/my_payments_screen.dart';

import 'app/app.dart';
import 'app/config_store.dart';
import 'app/session_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appSession = await _initializeSession();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then(
    (value) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ServicesBloc(),
          ),
          ChangeNotifierProvider(
            create: (context) => PaymentBloc(),
          ),
          Provider(create: (_) => SessionHandler()),
          Provider<ConfigStore>(
            create: (context) => ConfigStore(
              appSession: appSession,
              sessionHandler:
                  Provider.of<SessionHandler>(context, listen: false),
            ),
            dispose: (context, value) => value.dispose(),
          ),
        ],
        child: Builder(
          builder: (BuildContext context) {
            return RmsApp(
              configStore: Provider.of<ConfigStore>(context, listen: false),
            );
          },
        ),
      ),
    ),
  );
}

Future<AppSession> _initializeSession() async {
  final sessionHandler = SessionHandler();
  final appLocale = await sessionHandler.getLanguage();
  final bool? isDarkMode = await sessionHandler.getThemeMode();
  return AppSession(
    locale: appLocale,
    isDarkMode: isDarkMode,
  );
}
