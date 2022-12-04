import 'package:crowd/pages/dashboard/dashboard_screen.dart';
import 'package:crowd/pages/info/info_screen.dart';
import 'package:crowd/pages/profile/profile_screen.dart';
import 'package:crowd/pages/reporting/report_screen.dart';
import 'package:flutter/material.dart';

class Source extends StatefulWidget {
  const Source({Key? key}) : super(key: key);

  @override
  State<Source> createState() => _SourceState();
}

class _SourceState extends State<Source> with SingleTickerProviderStateMixin {
  String title = 'BottomNavigation';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          DashboardScreen(),
          InfoScreen(),
          ProfileScreen(),
          ReportScreen()
        ],
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        padding: EdgeInsets.only(bottom: height / 76),
        child: TabBar(
          isScrollable: false,
          labelColor: Colors.transparent,
          padding: EdgeInsets.only(left: width / 20, right: width / 20),
          labelStyle: TextStyle(fontSize: width / 22.5),
          unselectedLabelColor: Colors.white,
          tabs: [
            Tab(
              child: Container(
                  width: width / 12,
                  height: height / 25.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(width / 30)),
                    color: Colors.transparent,
                  ),
                  child: Icon(
                    Icons.home,
                    size: width / 15,
                    color: Colors.black,
                  )),
            ),
            Tab(
              child: Container(
                  width: width / 12,
                  height: height / 25.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(width / 30)),
                    color: Colors.transparent,
                  ),
                  child: Icon(
                    Icons.info_rounded,
                    size: width / 15,
                    color: Colors.black,
                  )),
            ),
            Tab(
              child: Container(
                  width: width / 12,
                  height: height / 25.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(width / 30)),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.person,
                    size: width / 15,
                    color: Colors.black,
                  )),
            ),
            Tab(
              child: Container(
                  width: width / 12,
                  height: height / 25.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(width / 30)),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.report,
                    size: width / 15,
                    color: Colors.black,
                  )),
            ),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
