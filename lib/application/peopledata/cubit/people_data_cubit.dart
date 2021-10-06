import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:soal_16_starwarsapi/repository/peopledata_repository.dart';
import 'package:soal_16_starwarsapi/model/peopledata_response.dart';

part 'people_data_state.dart';

class PeopleDataCubit extends Cubit<PeopleDataState> {
  PeopleDataCubit() : super(PeopleDataInitial());
  
  PeopleDataRepository _peopleDataRepository = PeopleDataRepository();

  void getAllPeopleData() async {
    emit(PeopleDataLoading());
    try {
      final _data = await _peopleDataRepository.getAllPeopleData();

      _data.fold(
        (l) => emit(PeopleDataError(l)),
        (r) => emit(PeopleDataGetSuccess(r)),
      );
    } catch (e) {
      emit(PeopleDataError(e.toString()));
    }
  }

   void saveDataToLocal(PeopleDataResponse data) async {
    emit(PeopleDataLoading());

    try {
      GetStorage().write('allPeopleData', jsonEncode(data));
      emit(PeopleDataSuccess());
    } catch (e) {
      emit(PeopleDataError(e.toString()));
    }
  }
}
