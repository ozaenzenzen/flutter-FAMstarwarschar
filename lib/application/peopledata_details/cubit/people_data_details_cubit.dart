import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:soal_16_starwarsapi/model/peopledata_details_response.dart';
import 'package:soal_16_starwarsapi/repository/peopledata_details_repository.dart';

part 'people_data_details_state.dart';

class PeopleDataDetailsCubit extends Cubit<PeopleDataDetailsState> {
  PeopleDataDetailsCubit() : super(PeopleDataDetailsInitial());

  final PeopleDataDetailsRepository _peopleDataRepository = PeopleDataDetailsRepository();

  void getPeopleDataDetails(String id) async {
    emit(PeopleDataDetailsLoading());
    try {
      final _data = await _peopleDataRepository.getPeopleDataDetails(id);

      _data.fold(
        (l) => emit(PeopleDataDetailsError(l)),
        (r) => emit(PeopleDataDetailsGetSuccess(r)),
      );
    } catch (e) {
      emit(PeopleDataDetailsError(e.toString()));
    }
  }

   void saveDataToLocal(PeopleDataDetailsResponse data) async {
    emit(PeopleDataDetailsLoading());

    try {
      GetStorage().write('detailHasilBelajarData', jsonEncode(data));
      emit(PeopleDataDetailsSuccess());
    } catch (e) {
      emit(PeopleDataDetailsError(e.toString()));
    }
  }
}
