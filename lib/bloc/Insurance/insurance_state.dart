part of './insurance_cubit.dart';

abstract class InsuranceState extends Equatable {
  const InsuranceState();
}

class InsuranceInitial extends InsuranceState {
  @override
  List<Object> get props => [];
}

class InsuranceLoading extends InsuranceState {
  @override
  List<Object> get props => [];
}

class InsuranceLoaded extends InsuranceState {
  final Map<String, Insurance> insurance;
  InsuranceLoaded({this.insurance});

  @override
  List<Object> get props => [insurance];
}

class InsuranceError extends InsuranceState {
  final String message;
  InsuranceError({this.message});

  @override
  List<Object> get props => [message];
}
