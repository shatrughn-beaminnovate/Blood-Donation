part of 'donor_data_api_fetch_bloc.dart';

abstract class DonorDataApiFetchEvent extends Equatable {
  const DonorDataApiFetchEvent();

  @override
  List<Object> get props => [];
}

class LoadDonorData extends DonorDataApiFetchEvent {
  const LoadDonorData();
}

class DeleteDonorData extends DonorDataApiFetchEvent {
  final int id;
  const DeleteDonorData(this.id);

  @override
  List<Object> get props => [id];
}
