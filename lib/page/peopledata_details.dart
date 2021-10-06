import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soal_16_starwarsapi/application/peopledata_details/cubit/people_data_details_cubit.dart';
import 'package:soal_16_starwarsapi/model/peopledata_details_response.dart';

class PeopleDataDetailsPage extends StatefulWidget {
  const PeopleDataDetailsPage({Key? key}) : super(key: key);

  @override
  _PeopleDataDetailsPageState createState() => _PeopleDataDetailsPageState();
}

class _PeopleDataDetailsPageState extends State<PeopleDataDetailsPage> {
  ScreenUtil screenUtil = ScreenUtil();

  PeopleDataDetailsResponse? peopleDataDetailsResponse;

  var id = Get.arguments;

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
      body: BlocProvider(
        create: (context) => PeopleDataDetailsCubit()..getPeopleDataDetails(id['id']),
        child: BlocConsumer<PeopleDataDetailsCubit, PeopleDataDetailsState>(
          listener: (context, state) {
            if (state is PeopleDataDetailsError) {
              showDialog(
                context: context,
                // ignore: prefer_const_constructors
                builder: (context) => AlertDialog(
                  title: const Text("Error"),
                  content: Text(state.errorMessage.toString()),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
            } else if (state is PeopleDataDetailsLoading) {
              // ignore: avoid_print
              print("loading");
            } else if (state is PeopleDataDetailsGetSuccess) {
              // BlocProvider.of<PeopleDataCubit>(context).saveDataToLocal();
              peopleDataDetailsResponse = state.peopleDataDetailsResponse;
            }
          },
          builder: (context, state) {
            print(state);
            if (state is PeopleDataDetailsLoading) {
              return Center(
                // ignore: sized_box_for_whitespace
                child: Container(
                  width: screenUtil.setWidth(30),
                  height: screenUtil.setHeight(30),
                  // ignore: prefer_const_constructors
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: screenUtil.setWidth(15),
                  vertical: screenUtil.setHeight(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${peopleDataDetailsResponse!.name}",
                      // "widget.name.toString()",
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
                      "${peopleDataDetailsResponse!.gender}",
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
                      "Height: ${peopleDataDetailsResponse!.height}",
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
                      "Mass: ${peopleDataDetailsResponse!.mass}",
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
                      "Hair Color: ${peopleDataDetailsResponse!.hairColor}",
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
                      "Eye Color: ${peopleDataDetailsResponse!.eyeColor}",
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
                      "Birth Year: ${peopleDataDetailsResponse!.birthYear}",
                      style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: screenUtil.setSp(13),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(5),
                    ),
                    Text(
                      "List Films: \n${peopleDataDetailsResponse!.films}",
                      style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: screenUtil.setSp(13),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(3),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
