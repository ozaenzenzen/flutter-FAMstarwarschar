import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soal_16_starwarsapi/application/peopledata/cubit/people_data_cubit.dart';
import 'package:soal_16_starwarsapi/model/peopledata_response.dart';
import 'package:soal_16_starwarsapi/widget/peopledata_home_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScreenUtil screenUtil = ScreenUtil();

  PeopleDataResponse? peopleDataResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber.shade800,
        centerTitle: true,
        title: Text(
          "Starwars Character",
          style: GoogleFonts.raleway(
            color: Colors.black,
            fontSize: screenUtil.setSp(18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => PeopleDataCubit()..getAllPeopleData(),
        child: BlocConsumer<PeopleDataCubit, PeopleDataState>(
          listener: (context, state) {
            if (state is PeopleDataError) {
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
            } else if (state is PeopleDataLoading) {
              // ignore: avoid_print
              print("loading");
            } else if (state is PeopleDataGetSuccess) {
              // BlocProvider.of<PeopleDataCubit>(context).saveDataToLocal();
              peopleDataResponse = state.peopleDataResponse;
              // ignore: avoid_print
              // print(peopleDataResponse!.results![1].name);
            }
          },
          builder: (context, state) {
            // print(state);
            if (state is PeopleDataLoading) {
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
              return ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: screenUtil.setWidth(20),
                  vertical: screenUtil.setHeight(20),
                ),
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: peopleDataResponse!.results!.length,
                itemBuilder: (context, index) {
                  return PeopleDataItem(
                    index: (index + 1).toString(),
                    name: peopleDataResponse!.results![index].name.toString(),
                    gender:
                        peopleDataResponse!.results![index].gender.toString(),
                    height:
                        peopleDataResponse!.results![index].height.toString(),
                    mass: peopleDataResponse!.results![index].mass.toString(),
                    birthYear: peopleDataResponse!.results![index].birthYear
                        .toString(),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
