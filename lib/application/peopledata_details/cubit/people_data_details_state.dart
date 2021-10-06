part of 'people_data_details_cubit.dart';

@immutable
abstract class PeopleDataDetailsState {}

class PeopleDataDetailsInitial extends PeopleDataDetailsState {}

class PeopleDataDetailsSuccess extends PeopleDataDetailsState {}

class PeopleDataDetailsLoading extends PeopleDataDetailsState {}

class PeopleDataDetailsError extends PeopleDataDetailsState {
  final String errorMessage;
  PeopleDataDetailsError(this.errorMessage);
}

class PeopleDataDetailsGetSuccess extends PeopleDataDetailsState {
  final PeopleDataDetailsResponse peopleDataDetailsResponse;
  PeopleDataDetailsGetSuccess(this.peopleDataDetailsResponse);
}
