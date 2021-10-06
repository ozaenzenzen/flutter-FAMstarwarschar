part of 'people_data_cubit.dart';

@immutable
abstract class PeopleDataState {}

class PeopleDataInitial extends PeopleDataState {}

class PeopleDataSuccess extends PeopleDataState {}

class PeopleDataLoading extends PeopleDataState {}

class PeopleDataError extends PeopleDataState {
  final String errorMessage;
  PeopleDataError(this.errorMessage);
}

class PeopleDataGetSuccess extends PeopleDataState {
  final PeopleDataResponse peopleDataResponse;
  PeopleDataGetSuccess(this.peopleDataResponse);
}
