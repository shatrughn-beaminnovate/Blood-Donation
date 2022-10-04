import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:blood_donation/admin/data/model/login/login_data.dart';
import 'package:blood_donation/admin/data/repositories/login_repository.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginRepository loginRepository = LoginRepository();
  AuthenticationBloc() : super(AuthenticationUninitialized()) {
    on<AppStarted>((event, emit) async {
      emit(AuthenticationLoading());
      final bool hasToken = await loginRepository.hasToken();

      if (hasToken) {
        final loginData = await loginRepository.getTokenData();

        //Decoding login data
        LoginData userInfo = LoginData.fromJson(jsonDecode(loginData!));

        emit(AuthenticationAuthenticated(userInfo));
      } else {
        emit(AuthenticationUnauthenticated());
      }
    });

    on<LoggedIn>((event, emit) async {
      emit(AuthenticationLoading());
      await loginRepository.persistToken(event.loginData);

      emit(AuthenticationAuthenticated(event.loginData));
      // notifyListeners();
    });

    on<LoggedOut>((event, emit) async {
      emit(AuthenticationLoading());
      // ignore: unused_local_variable

      await loginRepository.deleteToken();
      // emit(AuthenticatedUserLoggedout(logoutDetails: logoutData));
      emit(AuthenticationUnauthenticated());
    });
  }
}
