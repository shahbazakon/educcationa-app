import 'package:dotted_border/dotted_border.dart';
import 'package:education_app/Constants/color_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/constant.dart';
import '../../Constants/widget_utils.dart';

class TestSeriesScreen extends StatefulWidget {
  const TestSeriesScreen({Key? key}) : super(key: key);

  @override
  State<TestSeriesScreen> createState() => _TestSeriesScreenState();
}

class _TestSeriesScreenState extends State<TestSeriesScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  String dropDownValue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          getToolBar("Test Series", () {
            backClick();
          }),
          testSeriesSubjectDropDown(context),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            testUploadButton(size,
                title: "Add Files",
                icon: const Icon(Icons.file_upload_outlined),
                color: Colors.blue.shade100),
            testUploadButton(size,
                title: "Take Photo",
                icon: const Icon(Icons.camera_alt_outlined),
                color: Colors.redAccent.shade100),
          ]),
          testSeriesHeading(),
          testSeriesList()
        ],
      ),
    );
  }

  DottedBorder testUploadButton(
    Size size, {
    Color? color,
    Widget? icon,
    String? title,
  }) {
    return DottedBorder(
      color: Colors.black54,
      strokeWidth: .8,
      borderType: BorderType.RRect,
      radius: Radius.circular(18.h),
      child: Container(
        height: size.height * .06,
        width: size.width / 2.3,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.h),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          icon!,
          const SizedBox(width: 10),
          Text(
            title!,
            style: const TextStyle(fontWeight: FontWeight.w600),
          )
        ]),
      ),
    );
  }

  // Dropdown To Select The Subject
  Container testSeriesSubjectDropDown(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 2),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: accentColor),
          borderRadius: BorderRadius.circular(18.h),
          boxShadow: [
            BoxShadow(color: "#2423408F".toColor(), blurRadius: 16.h, offset: const Offset(-4, 5))
          ]),
      child: DropdownButton(
        value: dropDownValue,
        isExpanded: true,
        underline: const SizedBox(),
        elevation: 3,
        borderRadius: BorderRadius.circular(18.h),
        icon: const Icon(Icons.keyboard_arrow_down),
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropDownValue = newValue!;
          });
        },
      ),
    );
  }

  //Page Heading
  Padding testSeriesHeading() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
        Text("All Test Series", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        Icon(Icons.menu_outlined)
      ]),
    );
  }

  // Test Series List Tile
  Widget getProfileWidget({String? title, Function? function, String? image}) {
    return GestureDetector(
      onTap: () {
        function!();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        padding: EdgeInsets.all(18.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22.h),
            boxShadow: [
              BoxShadow(color: "#2423408F".toColor(), blurRadius: 16.h, offset: const Offset(-4, 5))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(color: Colors.blueGrey, height: 30.h, width: 30.h)),
                getHorSpace(18.h),
                getCustomFont(title!, 15.sp, Colors.black, 1,
                    fontWeight: FontWeight.w700, txtHeight: 1.53.h)
              ],
            ),
            getSvgImage("arrow_right.svg", height: 24.h, width: 24.h),
          ],
        ),
      ),
    );
  }

  //Test Series List
  Expanded testSeriesList() {
    return Expanded(
        flex: 1,
        child: ListView.builder(
          itemCount: 10,
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child:
                  getProfileWidget(title: "History", function: () {}, image: "profile_image.png"),
            );
          },
        ));
  }
}