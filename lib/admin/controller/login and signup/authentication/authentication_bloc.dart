import 'package:bloc/bloc.dart';
import 'package:blood_donation/admin/data/model/login/login_data.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUninitialized()) {
    on<LoggedIn>((event, emit) {
      emit(AuthenticationLoading());

      emit(AuthenticationAuthenticated(event.loginData));
    });
  }
}
