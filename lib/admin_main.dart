import 'package:blood_donation/admin/controller/login%20and%20signup/authentication/authentication_bloc.dart';
import 'package:blood_donation/admin/screens/home_screen/admin_home_screen.dart';
import 'package:blood_donation/admin/screens/login_screen/admin_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'admin/screens/custom_scroll.dart';
import 'app_config.dart';
import 'constant/custom_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const configuredApp = AppConfig(
    environment: Environment.admin,
    url: 'testing in prod mode',
    child: MyApp(),
  );
  runApp(configuredApp);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthenticationBloc authenticationBloc = AuthenticationBloc();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(), //
      theme: CustomTheme().buildLightTheme(),
      home: BlocProvider(
        create: (context) => authenticationBloc,
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationUnauthenticated) {
              return const AdminLoginScreen();
            }
            if (state is AuthenticationAuthenticated) {
              return const AdminHomeScreen();
            }
            return const AdminLoginScreen();
          },
        ),
      ),
    );
  }
}
