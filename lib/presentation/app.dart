import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vost/di/dependency_provider.dart';
import 'package:vost/localization/vost_localizations_delegate.dart';
import 'package:vost/presentation/navigation/navigation.dart';
import 'package:vost/presentation/ui/about/about_page.dart';
import 'package:vost/presentation/ui/contributors/contributors_page.dart';
import 'package:vost/presentation/ui/home/home_page.dart';
import 'package:vost/presentation/ui/intro/intro_page.dart';
import 'package:vost/presentation/ui/problem_report/problem_report_page.dart';
import 'package:vost/presentation/ui/splash/splash_page.dart';

import 'assets/colors.dart';

class VostApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vost App',
      theme: ThemeData(
        primaryColor: colorPrimary,
        accentColor: colorAccent,
      ),
      localizationsDelegates: [
        const VostLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialRoute: routeSplash,
      routes: {
        routeHome: (context) => HomePage(
              title: 'Vost App',
              bloc: DependencyProvider.of(context).getHomeBloc(),
            ),
        routeSplash: (context) => SplashPage(),
        routeAbout: (context) => AboutPage(),
        routeProblem: (context) => ProblemReportPage(),
        routeContributors: (context) => ContributorsPage(
              bloc: DependencyProvider.of(context).getContributorsBloc(),
            ),
        routeIntro: (context) => IntroPage(),
      },
    );
  }
}
