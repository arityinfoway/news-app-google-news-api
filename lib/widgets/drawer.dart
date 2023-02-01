import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:news/block/theme_bloc.dart';

import 'package:news/config/config.dart';
import 'package:news/services/app_service.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  final TabController tabController;
  final FirebaseAnalytics analytics;

  CustomDrawer({Key? key, required this.tabController, required this.analytics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        alignment: Alignment.center,
                        color: Theme.of(context).colorScheme.primaryVariant,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Image(height: 150, fit: BoxFit.contain, image: AssetImage(Config.logo)),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        isThreeLine: false,
                        contentPadding: EdgeInsets.only(left: 8, top: 10),
                        leading: SvgIcon(
                          icon: SvgIconData(Config.topNews),
                          size: 35,
                          color: Color(0xffea2224),
                        ),
                        horizontalTitleGap: 5,
                        title: Text(
                          'Top News',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () async {
                          Navigator.pop(context);

                          tabController.index = 0;

                          _testSetCurrentScreen("DrawerTop News", "TopNews");
                        },
                      ),
                      ListTile(
                        isThreeLine: false,
                        contentPadding: EdgeInsets.only(left: 8),
                        leading: SvgIcon(
                          icon: SvgIconData(Config.world),
                          color: Color(0xff2393e3),
                          size: 35,
                        ),
                        horizontalTitleGap: 5,
                        title: Text(
                          'World News',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () async {
                          Navigator.pop(context);

                          tabController.index = 1;

                          _testSetCurrentScreen("DrawerWorld News", "WorldNews");
                        },
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 8),
                        leading: SvgIcon(
                          icon: SvgIconData(Config.businessNews),
                          size: 35,
                          color: Color(0xff62A666),
                        ),
                        horizontalTitleGap: 5,
                        title: Text(
                          'Business',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () async {
                          Navigator.pop(context);

                          tabController.index = 2;
                          _testSetCurrentScreen("DrawerBusiness News", "BusinessNews");
                        },
                        // onTap: () => AppService().openLink(context, 'tel:02165041109'),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 8),
                        leading: SvgIcon(
                          icon: SvgIconData(Config.entertainmentNews),
                          size: 35,
                          color: Color(0xFF9370db),
                        ),
                        horizontalTitleGap: 5,
                        title: Text(
                          'Entertainment',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () async {
                          Navigator.pop(context);
                          tabController.index = 3;
                          _testSetCurrentScreen("DrawerEntertainment News", "EntertainmentNews");
                        },
                        // onTap: () => AppService().openLink(context, 'tel:02165041109'),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 8),
                        leading: SvgIcon(
                          icon: SvgIconData(Config.healthNews),
                          size: 35,
                          color: Color(0xff0D98BA),
                        ),
                        horizontalTitleGap: 5,
                        title: Text(
                          'Health',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () async {
                          Navigator.pop(context);
                          tabController.index = 4;
                          _testSetCurrentScreen("DrawerHealth News", "HealthNews");
                        },
                        // onTap: () => AppService().openLink(context, 'tel:02165041109'),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 8),
                        leading: SvgIcon(
                          icon: SvgIconData(Config.scienceNews),
                          size: 35,
                          color: Color(0xff5c8aec),
                        ),
                        horizontalTitleGap: 5,
                        title: Text(
                          'Science',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () async {
                          Navigator.pop(context);
                          tabController.index = 5;
                          _testSetCurrentScreen("DrawerScience News", "ScienceNews");
                        },
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 8),
                        leading: SvgIcon(
                          icon: SvgIconData(Config.sportsNews),
                          size: 35,
                          color: Color(0xff009688),
                        ),
                        horizontalTitleGap: 5,
                        title: Text(
                          'Sports',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () async {
                          Navigator.pop(context);
                          tabController.index = 6;
                          _testSetCurrentScreen("DrawerSports News", "SportsNews");
                        },
                        // onTap: () => AppService().openLink(context, 'tel:02165041109'),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 8),
                        leading: SvgIcon(
                          icon: SvgIconData(Config.technologyNews),
                          size: 35,
                          color: Colors.orange[500],
                        ),
                        horizontalTitleGap: 5,
                        title: Text(
                          'Technology',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () async {
                          Navigator.pop(context);
                          tabController.index = 7;
                          _testSetCurrentScreen("DrawerTechnology News", "TechnologyNews");
                        },
                        // onTap: () => AppService().openLink(context, 'tel:02165041109'),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 8),
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          radius: 18,
                          child: Icon(
                            Icons.wb_sunny,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          'Dark mode',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.primary),
                        ),
                        trailing: Switch(
                            activeColor: Theme.of(context).primaryColor,
                            value: context.watch<ThemeBloc>().darkTheme!,
                            onChanged: (bool) {
                              context.read<ThemeBloc>().toggleTheme();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 5),
              alignment: Alignment.center,
              child: Text('App Version : 1.0.3'),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Powered by '),
                  InkWell(
                    onTap: ()=> AppService().openLink(context, "https://arityinfoway.com"),
                    child: Text("ArityInfoway ",style: TextStyle(color: Colors.green),),
                  ),
                  Text("& Google News")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _testSetCurrentScreen(String screenName, String classObserve) async {
    analytics.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: classObserve,
    );
  }
}
