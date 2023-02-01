import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:news/block/tab_index_bloc.dart';
import 'package:news/config/config.dart';
import 'package:news/tab/business.dart';
import 'package:news/tab/entertainment.dart';
import 'package:news/tab/health.dart';
import 'package:news/tab/science.dart';
import 'package:news/tab/sport.dart';
import 'package:news/tab/technology.dart';
import 'package:news/tab/topNews.dart';
import 'package:news/tab/world.dart';
import 'package:news/widgets/drawer.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late TabController tabController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 8, initialIndex: 0, vsync: this);
    tabController.addListener(() {
      if (tabController.index == 0) {
        _testSetCurrentScreen("Top News", "TopNewsMain");
      } else if (tabController.index == 1) {
        _testSetCurrentScreen("World News", "WorldNewsMain");
      } else if (tabController.index == 2) {
        _testSetCurrentScreen("Business News", "BusinessNewsMain");
      } else if (tabController.index == 3) {
        _testSetCurrentScreen("Entertainment News", "EntertainmentNewsMain");
      } else if (tabController.index == 4) {
        _testSetCurrentScreen("Health News", "HealthNewsMain");
      } else if (tabController.index == 5) {
        _testSetCurrentScreen("Science News", "ScienceNewsMain");
      } else if (tabController.index == 6) {
        _testSetCurrentScreen("Sport News", "SportNewsMain");
      } else if (tabController.index == 7) {
        _testSetCurrentScreen("Technology News", "TechnologyNewsMain");
      }
    });
    // tabController.addListener(() {
    //   context.read<TabIndexBloc>().setTabIndex(tabController.index);
    // });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Future<void> _testSetCurrentScreen(String screenName, String classObserve) async {
    analytics.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: classObserve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        key: scaffoldKey,
        // backgroundColor: Config.primaryColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Feather.menu,
              size: 25,
            ),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          centerTitle: true,
          title: Container(
            child: Container(
              child: Image(height: 80, fit: BoxFit.contain, image: AssetImage(Config.logo)),
            ),
          ),
          // backgroundColor: Config.primaryColor,
          bottom: TabBar(
            isScrollable: true,
            controller: tabController,
            onTap: (int index) {
              if (index == 0) {
                _testSetCurrentScreen("Top News", "TopNewsMain");
              } else if (index == 1) {
                _testSetCurrentScreen("World News", "WorldNewsMain");
              }else if (index == 2) {
                _testSetCurrentScreen("Business News", "BusinessNewsMain");
              } else if (index == 3) {
                _testSetCurrentScreen("Entertainment News", "EntertainmentNewsMain");
              } else if (index == 4) {
                _testSetCurrentScreen("Health News", "HealthNewsMain");
              } else if (index == 5) {
                _testSetCurrentScreen("Science News", "ScienceNewsMain");
              } else if (index == 6) {
                _testSetCurrentScreen("Sport News", "SportNewsMain");
              } else if (index == 7) {
                _testSetCurrentScreen("Technology News", "TechnologyNewsMain");
              }
            },
            // indicatorColor: Colors.black,
            // labelColor: Colors.black,
            tabs: [
              Tab(
                child: Row(
                  children: [
                    SvgIcon(
                      icon: SvgIconData(Config.topNews),
                      size: 35,
                      color: Color(0xffea2224),
                    ),
                    Text(
                      'Top News',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    SvgIcon(
                      icon: SvgIconData(Config.world),
                      size: 35,
                      color: Color(0xff2393e3),
                    ),
                    Text(
                      'World News',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    SvgIcon(
                      icon: SvgIconData(Config.businessNews),
                      size: 35,
                      color: Color(0xff62A666),
                    ),
                    Text(
                      'Business',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    SvgIcon(
                      icon: SvgIconData(Config.entertainmentNews),
                      size: 35,
                      color: Color(0xFF9370db),
                    ),
                    Text(
                      'Entertainment',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    SvgIcon(
                      icon: SvgIconData(Config.healthNews),
                      size: 35,
                      color: Color(0xff0D98BA),
                    ),
                    Text(
                      'Health',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    SvgIcon(
                      icon: SvgIconData(Config.scienceNews),
                      size: 35,
                      color: Color(0xff5c8aec),
                    ),
                    Text(
                      'Science',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    SvgIcon(
                      icon: SvgIconData(Config.sportsNews),
                      size: 35,
                      color: Color(0xff009688),
                    ),
                    Text(
                      'Sports',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    SvgIcon(
                      icon: SvgIconData(Config.technologyNews),
                      size: 35,
                      color: Colors.orange[500],
                    ),
                    Text(
                      'Technology',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        drawer: CustomDrawer(
          tabController: tabController,
          analytics: analytics,
        ),
        body: Container(
          child: TabBarView(
            controller: tabController,
            children: [
              Container(
                // color: Config.primaryColor,
                child: TopNews(),
              ),
              Container(
                // color: Config.primaryColor,
                child: World(),
              ),
              Container(
                // color: Config.primaryColor,
                child: Business(),
              ),
              Container(
                // color: Config.primaryColor,
                child: Entertainment(),
              ),
              Container(
                // color: Config.primaryColor,
                child: Health(),
              ),
              Container(
                // color: Config.primaryColor,
                child: Science(),
              ),
              Container(
                // color: Config.primaryColor,
                child: Sport(),
              ),
              Container(
                // color: Config.primaryColor,
                child: Technology(),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
