part of 'donor_data_api_fetch_bloc.dart';

abstract class DonorDataApiFetchState extends Equatable {
  const DonorDataApiFetchState();

  @override
  List<Object> get props => [];
}

class DonorDataApiFetchInitial extends DonorDataApiFetchState {}

class DonorDataApiFetchLoading extends DonorDataApiFetchState {}

class DonorDataApiFetchLoaded extends DonorDataApiFetchState {
  final DonorDetails donorDetails;
  const DonorDataApiFetchLoaded(this.donorDetails);
}

class DonorDeletedSuccess extends DonorDataApiFetchState {
  final Map<String, dynamic> deleteDonorResponse;
  const DonorDeletedSuccess(this.deleteDonorResponse);
}

class DonorDataApiFetchEmpty extends DonorDataApiFetchState {
  final String message;
  const DonorDataApiFetchEmpty(this.message);
}

class DonorDataApiFetchFailure extends DonorDataApiFetchState {
  final String message;
  const DonorDataApiFetchFailure(this.message);
}
