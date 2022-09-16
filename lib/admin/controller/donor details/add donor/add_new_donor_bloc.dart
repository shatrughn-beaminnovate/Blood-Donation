import 'package:bloc/bloc.dart';
import 'package:blood_donation/admin/data/repositories/donor_repository.dart';
import 'package:equatable/equatable.dart';

part 'add_new_donor_event.dart';
part 'add_new_donor_state.dart';

class AddNewDonorBloc extends Bloc<AddNewDonorEvent, AddNewDonorState> {
  final DonorRepository donorRepository = DonorRepository();
  AddNewDonorBloc() : super(AddNewDonorInitial()) {
    on<AddNewDonor>((event, emit) async {
      try {
        emit(AddNewDonorLoading());

        final addNewDonorResponse =
            await donorRepository.addNewDonor(event.donorData);
        await Future.delayed(const Duration(seconds: 1));

        if (addNewDonorResponse["error"] == false) {
          emit(AddNewDonorSuccess(addNewDonorResponse));
        } else {
          emit(const AddNewDonorFailure("Something went wrong"));
        }
      } catch (e) {
        print(e);
        emit(AddNewDonorFailure(e.toString()));
      }
    });

    on<UpdateNewDonor>((event, emit) async {
      try {
        emit(AddNewDonorLoading());
        final addNewDonorResponse =
            await donorRepository.updateNewDonor(event.donorData);
        if (addNewDonorResponse["error"] == false) {
          emit(UpdateNewDonorSuccess(addNewDonorResponse));
        } else {
          emit(const AddNewDonorFailure("Something went wrong"));
        }
      } catch (e) {
        print(e);
        emit(AddNewDonorFailure(e.toString()));
      }
    });
  }
}
