import 'package:bloc/bloc.dart';
import 'package:blood_donation/admin/data/model/donor_info/single%20donor%20info/single_donor_data.dart';
import 'package:blood_donation/admin/data/repositories/donor_repository.dart';
import 'package:equatable/equatable.dart';

part 'single_donor_data_event.dart';
part 'single_donor_data_state.dart';

class SingleDonorDataBloc
    extends Bloc<SingleDonorDataEvent, SingleDonorDataState> {
  DonorRepository donorRepository = DonorRepository();
  SingleDonorDataBloc() : super(SingleDonorDataInitial()) {
    on<LoadSingleDonor>((event, emit) async {
      try {
        emit(SingleDonorDataLoading());
        final singleDonorData =
            await donorRepository.getSingleDonorDetails(event.id);
        if (singleDonorData.error!) {
          emit(const SingleDonorDataFailure("Something went wrong!!"));
        } else {
          emit(SingleDonorDataLoaded(singleDonorData));
        }
      } catch (e) {
        emit(SingleDonorDataFailure(e.toString()));
      }
    });
  }
}
