import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PeopleDataDetailsPage extends StatefulWidget {
  const PeopleDataDetailsPage({Key? key}) : super(key: key);

  @override
  _PeopleDataDetailsPageState createState() => _PeopleDataDetailsPageState();
}

class _PeopleDataDetailsPageState extends State<PeopleDataDetailsPage> {
  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.amber.shade800,
        centerTitle: true,
        title: Text(
          "Character Details",
          style: GoogleFonts.raleway(
            color: Colors.black,
            fontSize: screenUtil.setSp(18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
