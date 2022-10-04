import 'package:bloc/bloc.dart';
import 'package:blood_donation/admin/data/repositories/donor_repository.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/donor_info/donor_details.dart';

part 'donor_data_api_fetch_event.dart';
part 'donor_data_api_fetch_state.dart';

class DonorDataApiFetchBloc
    extends Bloc<DonorDataApiFetchEvent, DonorDataApiFetchState> {
  DonorRepository donorRepository = DonorRepository();

  DonorDataApiFetchBloc() : super(DonorDataApiFetchInitial()) {
    on<LoadDonorData>((event, emit) async {
      try {
        emit(DonorDataApiFetchLoading());

        final donorDetails = await donorRepository.getDonorDetails();
        await Future.delayed(const Duration(seconds: 1));
        print(donorDetails);
        if (donorDetails.error == false) {
          if (donorDetails.data!.isEmpty) {
            emit(const DonorDataApiFetchEmpty("No Donor Data are available"));
          } else {
            emit(DonorDataApiFetchLoaded(donorDetails));
          }
        }
      } catch (e) {
        print(e);
        emit(DonorDataApiFetchFailure(e.toString()));
      }
    });

    on<DeleteDonorData>((event, emit) async {
      try {
        emit(DonorDataApiFetchLoading());

        final donorDetails = await donorRepository.deleteNewDonor(event.id);
        await Future.delayed(const Duration(seconds: 1));
        if (donorDetails["error"] == false) {
          emit(DonorDeletedSuccess(donorDetails));
        } else {
          emit(DonorDeletingFailure(donorDetails["message"]));
        }
      } catch (e) {
        print(e);
        emit(DonorDeletingFailure(e.toString()));
      }
    });
  }
}
