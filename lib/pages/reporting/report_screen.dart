import 'package:crowd/routes/route.dart';
import 'package:crowd/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:crowd/widget/custom_text_field.dart';
import 'package:get/get.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
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
                "Report Emergency",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "notify users about an emergency?",
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
      body: SafeArea(
          child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.all(width / 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: width / 13,
                    height: width / 13,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(color: Colors.black)),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black,
                        size: width / 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: width / 35, bottom: width / 25),
                    child: Text(
                      "Report",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(color: Colors.black, fontSize: width / 18),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: width / 35, bottom: width / 25),
                    child: Text(
                      "Repot",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(color: Colors.black, fontSize: width / 28),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: height / 26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Report",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: width / 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height / 80,
                          ),
                          CustomTextField(
                              hintText: "SEcond",
                              textInputType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              backgroundColor: Colors.transparent,
                              obscureText: false)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: height / 26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Report Description",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: width / 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height / 80,
                          ),
                          CustomTextField(
                              hintText: "third",
                              textInputType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              backgroundColor: Colors.transparent,
                              obscureText: false)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: height / 26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Report",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: width / 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height / 80,
                          ),
                          const CustomTextField(
                              hintText: "1200",
                              textInputType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              backgroundColor: Colors.transparent,
                              obscureText: false)
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
      bottomSheet: GestureDetector(
          onTap: () => Get.toNamed(RouteHelper.getInfo()),
          child: Padding(
            padding: EdgeInsets.only(bottom: width / 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                    color: Colors.blue,
                    height: height / 15,
                    width: width / 1.2,
                    text: "Continue")
              ],
            ),
          )),
    );
  }
}
