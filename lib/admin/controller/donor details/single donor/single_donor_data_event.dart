part of 'single_donor_data_bloc.dart';

abstract class SingleDonorDataEvent extends Equatable {
  const SingleDonorDataEvent();

  @override
  List<Object> get props => [];
}

class LoadSingleDonor extends SingleDonorDataEvent {
  final int id;
  const LoadSingleDonor(this.id);

  @override
  List<Object> get props => [id];
}
