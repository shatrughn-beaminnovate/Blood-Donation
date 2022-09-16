part of 'add_new_donor_bloc.dart';

abstract class AddNewDonorState extends Equatable {
  const AddNewDonorState();

  @override
  List<Object> get props => [];
}

class AddNewDonorInitial extends AddNewDonorState {}

class AddNewDonorLoading extends AddNewDonorState {}

class AddNewDonorSuccess extends AddNewDonorState {
  final Map<String, dynamic> donorResponse;

  const AddNewDonorSuccess(this.donorResponse);
}

class UpdateNewDonorSuccess extends AddNewDonorState {
  final Map<String, dynamic> donorResponse;

  const UpdateNewDonorSuccess(this.donorResponse);
}

class AddNewDonorFailure extends AddNewDonorState {
  final String message;
  const AddNewDonorFailure(this.message);
}
