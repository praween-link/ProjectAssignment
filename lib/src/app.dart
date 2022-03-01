import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myassigment/constants/colors.dart';
import 'package:myassigment/controller/services_provider.dart';
import 'package:myassigment/routes/my_routes.dart';
import 'package:provider/provider.dart';


/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
            ChangeNotifierProvider<ServiceProvider>(create: (context) => ServiceProvider()),
          ],
          child: MaterialApp(
            title: 'My Assignment',
            debugShowCheckedModeBanner: false,
            restorationScopeId: 'app',
            localizationsDelegates: const [
              // AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],

            // onGenerateTitle: (BuildContext context) =>
            //     AppLocalizations.of(context)!.appTitle,

            theme: ThemeData(
              primaryColor: MyColors.appBar,
              bottomAppBarColor: MyColors.appBar,
            ),
            darkTheme: ThemeData.dark(),

            onGenerateRoute: (RouteSettings routeSettings) {
              return MyRoutes.route(routeSettings: routeSettings);
            },
          ),
    );
  }
}
