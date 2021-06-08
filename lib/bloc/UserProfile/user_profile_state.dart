part of 'user_profile_cubit.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();
}

class UserProfileInitial extends UserProfileState {
  @override
  List<Object> get props => [];
}

class UserProfileLoading extends UserProfileState {
  @override
  List<Object> get props => [];
}

class UserProfileError extends UserProfileState {
  final String errorMassage;

  UserProfileError({this.errorMassage});

  @override
  List<Object> get props => [errorMassage];
}

class UserProfileSigned extends UserProfileState {
  final String token;
  final String name;

  UserProfileSigned({this.name, this.token});

  @override
  List<Object> get props => [token, name];
}

class UserProfileUnSigned extends UserProfileState {
  @override
  List<Object> get props => [];
}
