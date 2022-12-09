import 'package:crowd/pages/info/infocontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crowd/routes/route.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "Recent Emergencies",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "explore recent emergencies",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              )
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 100,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
        ),
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(left: width / 20, right: width / 20, top: 100),
        children: [
          SizedBox(
            height: height / 18,
          ),
          GestureDetector(
            //  onTap: () =>  Get.toNamed(RouteHelper.getManageBusinessPage()),
            child: Padding(
              padding: EdgeInsets.only(top: height / 100),
              child: Container(
                  width: width,
                  height: height / 12,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(width / 30)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width / 18,
                        right: width / 18,
                        bottom: height / 80),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.business_sharp,
                              size: width / 18,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: width / 18,
                            ),
                            Text(
                              "Recent Emergencies",
                              style: TextStyle(
                                  color: Colors.white, fontSize: width / 18),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: width / 18,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )),
            ),
          ),
          GestureDetector(
            // onTap: () =>  Get.toNamed(RouteHelper.getManageAccountPage()),
            child: Padding(
              padding: EdgeInsets.only(top: height / 30),
              child: Container(
                  width: width,
                  height: height / 12,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(width / 30)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width / 18,
                        right: width / 18,
                        bottom: height / 80),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.notifications_none,
                              size: width / 18,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: width / 18,
                            ),
                            Text(
                              "Older Emergencies",
                              style: TextStyle(
                                  color: Colors.white, fontSize: width / 18),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: width / 18,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )),
            ),
          ),
          ValueListenableBuilder(
              valueListenable: context.read<InfoController>().loadstate,
              builder: (context, ref, child) {
                return ref == false
                    ? GestureDetector(
                onTap: (){
                  context.read<InfoController>().logout();
                },
                child: Padding(
                padding: EdgeInsets.only(top: height / 30),
                child: Container(
                width: width,
                height: height / 12,
                decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(width / 20)),
                ),
                child: Padding(
                padding: EdgeInsets.only(
                left: width / 18,
                right: width / 18,
                bottom: height / 80),
                child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                children: [
                Icon(
                Icons.login,
                size: width / 18,
                color: Colors.red,
                ),
                SizedBox(
                width: width / 18,
                ),
                Text(
                "Log out",
                style: TextStyle(
                color: Colors.red, fontSize: width / 18),
                ),
                ],
                ),
                ],
                ),
                )),
                ),
                )
                    : Container(
                    width: 40,
                    height: 40,
                    child: const CircularProgressIndicator(
                      strokeWidth: 6,
                    ));
              }),

        ],
      ),
    );
  }
}
