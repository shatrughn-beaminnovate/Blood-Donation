part of 'single_donor_data_bloc.dart';

abstract class SingleDonorDataState extends Equatable {
  const SingleDonorDataState();

  @override
  List<Object> get props => [];
}

class SingleDonorDataInitial extends SingleDonorDataState {}

class SingleDonorDataLoading extends SingleDonorDataState {}

class SingleDonorDataLoaded extends SingleDonorDataState {
  final SingleDonorData singleDonorData;
  const SingleDonorDataLoaded(this.singleDonorData);
}

class SingleDonorDataFailure extends SingleDonorDataState {
  final String message;
  const SingleDonorDataFailure(this.message);
}
