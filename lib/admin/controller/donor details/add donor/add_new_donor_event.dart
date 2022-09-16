part of 'add_new_donor_bloc.dart';

abstract class AddNewDonorEvent extends Equatable {
  const AddNewDonorEvent();

  @override
  List<Object> get props => [];
}

class AddNewDonor extends AddNewDonorEvent {
  final Map<String, dynamic> donorData;

  const AddNewDonor(this.donorData);

  @override
  List<Object> get props => [donorData];
}

class UpdateNewDonor extends AddNewDonorEvent {
  final Map<String, dynamic> donorData;

  const UpdateNewDonor(this.donorData);

  @override
  List<Object> get props => [donorData];
}
