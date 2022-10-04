import 'package:blood_donation/admin/controller/login%20and%20signup/authentication/authentication_bloc.dart';
import 'package:blood_donation/admin/screens/home_screen/admin_home_screen.dart';
import 'package:blood_donation/admin/screens/home_screen/components/blood%20donor/admin_blood_donor.dart';
import 'package:blood_donation/admin/screens/login_screen/admin_login_screen.dart';
import 'package:blood_donation/constant/admin/admin_route.dart';
import 'package:blood_donation/constant/admin/admin_route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'admin/screens/custom_scroll.dart';
import 'admin/screens/home_screen/components/blood donor/components/add_new_donor_form.dart';
import 'app_config.dart';
import 'constant/custom_theme.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  const configuredApp = AppConfig(
    environment: Environment.admin,
    url: 'testing in prod mode',
    child: MyApp(),
  );
  runApp(
      const RootRestorationScope(restorationId: 'root', child: configuredApp));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthenticationBloc authenticationBloc = AuthenticationBloc();
  final ValueKey<String> _scaffoldKey = const ValueKey<String>('App scaffold');

  @override
  void initState() {
    authenticationBloc.add(const AppStarted());
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authenticationBloc,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _router(authenticationBloc).routerDelegate,
        routeInformationParser:
            _router(authenticationBloc).routeInformationParser,
        routeInformationProvider:
            _router(authenticationBloc).routeInformationProvider,
        scrollBehavior: MyCustomScrollBehavior(), //
        theme: CustomTheme().buildLightTheme(),
        // builder: (context, child) {
        //   return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        //     builder: (context1, state) {
        //       print(state);
        //       if (state is AuthenticationAuthenticated) {
        //         return AdminHomeScreen(pageIndex: 0);
        //       }
        //       if (state is AuthenticationUnauthenticated) {
        //         return AdminLoginScreen();
        //       }
        //       return AdminLoginScreen();
        //       // switch (state) {
        //       //   case AuthenticationAuthenticated
        //       //     _navigator.pushAndRemoveUntil<void>(
        //       //       HomePage.route(),
        //       //       (route) => false,
        //       //     );
        //       //     break;
        //       //   case AuthenticationStatus.unauthenticated:
        //       //     _navigator.pushAndRemoveUntil<void>(
        //       //       LoginPage.route(),
        //       //       (route) => false,
        //       //     );
        //       //     break;
        //       //   case AuthenticationStatus.unknown:
        //       //     break;
        //       // }
        //     },
        //   );
        // },
      ),
    );
  }

  GoRouter _router(AuthenticationBloc authenticationBloc1) {
    return GoRouter(
        // errorBuilder: (context, state) => ErrorScreen(error:state.error),
        // initialLocation: "/login",
        routes: <GoRoute>[
          GoRoute(
              path: '/home/:pageIndex',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  FadeTransitionPage(
                      child: AdminHomeScreen(
                    pageIndex: int.parse(state.params["pageIndex"]!),
                  ))),
          GoRoute(
              path: '/donorInfo/:title/:id/:purpose',
              pageBuilder: (BuildContext context, GoRouterState state) {
                String title = state.params["title"] ?? " ";
                int id = int.parse(state.params["id"]!);
                String purpose = state.params["purpose"] ?? " ";
                return FadeTransitionPage(
                    child: AddNewDonorForm(
                  title: title,
                  id: id,
                  purpose: purpose,
                ));
              }),
          GoRoute(
              path: '/login',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  FadeTransitionPage(child: const AdminLoginScreen())),
        ],
        redirect: (state) {
          print("This is router status ${state.subloc}");
          final authenticationState = authenticationBloc.state;

          final isLoggedIn =
              authenticationState is AuthenticationAuthenticated ? true : false;
          final isLoggingIn = state.subloc == '/login';

          if (!isLoggedIn && !isLoggingIn) return '/login';
          if (isLoggedIn && isLoggingIn) return '/home/${0}';

          return null;

          // // if the user is not logged in, they need to login
          // final bool loggedIn =
          //     authenticationState is AuthenticationAuthenticated ? true : false;

          // final bool loggingIn = state.location == '/login';
          // if (!loggedIn) {
          //   print("Sending user to login page");

          //   return loggingIn ? null : '/login';
          // }

          // // if the user is logged in but still on the login page, send them to
          // // the home page
          // if (loggingIn) {
          //   print("Sending user to home page");

          //   return '/home/${0}';
          // }

          // // no need to redirect at all
          // return null;
        },
        refreshListenable: GoRouterRefreshStream(authenticationBloc1.stream));
  }
}

class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required Widget child,
  }) : super(
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                textDirection: TextDirection.rtl,
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
            child: child);
}


  // return BlocBuilder<AuthenticationBloc, AuthenticationState>(
  //               builder: (context1, state) {
  //                 if (state is AuthenticationAuthenticated) {
  //                   return AdminLoginScreen();
  //                 }
  //                 if (state is AuthenticationUnauthenticated) {}
  //                 // switch (state) {
  //                 //   case AuthenticationAuthenticated
  //                 //     _navigator.pushAndRemoveUntil<void>(
  //                 //       HomePage.route(),
  //                 //       (route) => false,
  //                 //     );
  //                 //     break;
  //                 //   case AuthenticationStatus.unauthenticated:
  //                 //     _navigator.pushAndRemoveUntil<void>(
  //                 //       LoginPage.route(),
  //                 //       (route) => false,
  //                 //     );
  //                 //     break;
  //                 //   case AuthenticationStatus.unknown:
  //                 //     break;
  //                 // }
  //               },
  //             );