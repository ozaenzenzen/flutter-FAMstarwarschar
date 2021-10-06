import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soal_16_starwarsapi/peopledata_details.dart';

class PeopleDataItem extends StatefulWidget {
  final String? name;
  final String? height;
  final String? mass;
  final String? hairColor;
  final String? skinColor;
  final String? eyeColor;
  final String? birthYear;
  final String? gender;
  final String? homeworld;
  final List<String>? films;
  final List<String>? species;
  final List<String>? vehicles;
  final List<String>? starships;
  final DateTime? created;
  final DateTime? edited;
  final String? url;

  PeopleDataItem({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.gender,
    this.homeworld,
    this.films,
    this.species,
    this.vehicles,
    this.starships,
    this.created,
    this.edited,
    this.url,
  });

  @override
  _PeopleDataItemState createState() => _PeopleDataItemState();
}

class _PeopleDataItemState extends State<PeopleDataItem> {
  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => PeopleDataDetailsPage(),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: screenUtil.setHeight(10),
        ),
        width: screenUtil.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   width: screenUtil.screenWidth,
            //   height: screenUtil.setHeight(150),
            //   color: Colors.grey,
            // ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: screenUtil.setWidth(10),
                vertical: screenUtil.setHeight(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name.toString(),
                    // peopleDataResponse!.results![index].name.toString(),
                    style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: screenUtil.setSp(18),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(5),
                  ),
                  Text(
                    widget.gender.toString(),
                    style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: screenUtil.setSp(13),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(3),
                  ),
                  Text(
                    "Height: ${widget.height.toString()}",
                    style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: screenUtil.setSp(13),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(3),
                  ),
                  Text(
                    "Mass: ${widget.mass.toString()}",
                    style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: screenUtil.setSp(13),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(3),
                  ),
                  Text(
                    "Birth Year: ${widget.birthYear.toString()}",
                    style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: screenUtil.setSp(13),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
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
      ),
    );
  }
}
