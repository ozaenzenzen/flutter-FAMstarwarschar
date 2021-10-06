import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeopleDataItem2 extends StatefulWidget {
  const PeopleDataItem2({Key? key}) : super(key: key);

  @override
  State<PeopleDataItem2> createState() => _PeopleDataItem2State();
}

class _PeopleDataItem2State extends State<PeopleDataItem2> {
  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: screenUtil.setWidth(20),
        vertical: screenUtil.setHeight(20),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: screenUtil.setHeight(220),
        crossAxisCount: 2,
        mainAxisSpacing: screenUtil.setWidth(15),
        crossAxisSpacing: screenUtil.setHeight(15),
      ),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              Container(
                width: screenUtil.screenWidth,
                height: screenUtil.setHeight(150),
                color: Colors.grey,
              ),
            ],
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                spreadRadius: 0.7,
                blurRadius: 5,
                color: Colors.amber,
              ),
            ],
          ),
        );
      },
    );
  }
}
