import 'package:flutter/material.dart';
import 'package:news/block/business_block.dart';
import 'package:news/block/entertainment_block.dart';
import 'package:news/block/helth_block.dart';
import 'package:news/block/science_block.dart';
import 'package:news/block/sport_block.dart';
import 'package:news/block/technology_block.dart';
import 'package:news/block/theme_bloc.dart';
import 'package:news/block/topnews_block.dart';
import 'package:news/block/world_block.dart';
import 'package:news/model/theme.dart';
import 'package:news/pages/splash.dart';
import 'package:news/tabs_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeBloc>(
      create: (_) => ThemeBloc(),
      child: Consumer<ThemeBloc>(
        builder: (_, mode, child) {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider<TopNewsBlock>(create: (context) => TopNewsBlock()),
                ChangeNotifierProvider<WorldNewsBlock>(create: (context) => WorldNewsBlock()),
                ChangeNotifierProvider<BusinessNewsBlock>(create: (context) => BusinessNewsBlock()),
                ChangeNotifierProvider<EntertainmentNewsBlock>(create: (context) => EntertainmentNewsBlock()),
                ChangeNotifierProvider<HealthNewsBlock>(create: (context) => HealthNewsBlock()),
                ChangeNotifierProvider<ScienceNewsBlock>(create: (context) => ScienceNewsBlock()),
                ChangeNotifierProvider<SportsNewsBlock>(create: (context) => SportsNewsBlock()),
                ChangeNotifierProvider<TechnologyNewsBlock>(create: (context) => TechnologyNewsBlock()),


              ],
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  // supportedLocales: context.supportedLocales,
                  // localizationsDelegates: context.localizationDelegates,
                  // navigatorObservers: [firebaseObserver],
                  // locale: context.locale,
                  theme: ThemeModel().lightTheme,
                  darkTheme: ThemeModel().darkTheme,
                  themeMode: mode.darkTheme == true ? ThemeMode.dark : ThemeMode.light,
                  home: SplashPage()
              )
          );
        },
      ),
    );
  }
}




