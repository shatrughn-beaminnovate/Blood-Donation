import 'package:bloc/bloc.dart';
import 'package:blood_donation/admin/controller/login%20and%20signup/authentication/authentication_bloc.dart';
import 'package:blood_donation/admin/data/model/login/login_data.dart';
import 'package:blood_donation/admin/data/repositories/login_repository.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository userRepository = LoginRepository();
  final AuthenticationBloc authenticationBloc;
  LoginBloc({required this.authenticationBloc}) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      try {
        emit(LoginLoading());

        final loginData =
            await userRepository.getLoginData(event.username, event.password);
        if (loginData.error == false) {
          if (loginData.data != null) {
            authenticationBloc.add(LoggedIn(loginData: loginData.data!));
            emit(LoginInitial());
          } else {
            emit(LoginFailure(message: loginData.message!));
          }
        } else {
          print("This error :");

          emit(LoginFailure(message: loginData.message!));
        }
      } catch (e) {
        print("This error $e");
        emit(LoginFailure(message: e.toString()));
      }
    });
  }
}
