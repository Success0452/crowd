import 'package:crowd/pages/reporting/reportcontroller.dart';
import 'package:crowd/routes/route.dart';
import 'package:crowd/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:crowd/widget/custom_text_field.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

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
                            "Report Title",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: width / 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height / 80,
                          ),
                          CustomTextField(
                            controller: context.read<ReportController>().title,
                              hintText: "specify title of the report",
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
                            "Report Warning",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: width / 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height / 80,
                          ),
                          CustomTextField(
                              controller: context.read<ReportController>().warning,
                              height: 80,
                              hintText: "specify what to avoid",
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
                              controller: context.read<ReportController>().description,
                              height: 200,
                              hintText: "specify description of the report",
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
      bottomSheet:
      GestureDetector(
          onTap: () {
            if(context.read<ReportController>().title.text.isNotEmpty &&
                context.read<ReportController>().warning.text.isNotEmpty &&
                context.read<ReportController>().description.text.isNotEmpty)
            {
              context.read<ReportController>().saveEmergencies();
            }else{
              Get.snackbar("info", "all fields are required", duration: const Duration(milliseconds: 1500));
            }

          },
          child: Container(
            color: Colors.grey.shade300,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: ButtonWidget(
                      color: Colors.blue,
                      height: height / 15,
                      width: width / 2,
                      text: "Notify"),
                )
              ],
            ),
          )),
    );
  }
}
