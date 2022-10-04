// import 'package:blood_donation/admin/screens/home_screen/admin_home_screen.dart';
// //import 'package:blood_donation/admin/screens/home_screen/components/blood%20donor/components/add_new_donor_form.dart';
// import 'package:blood_donation/admin/screens/login_screen/admin_login_screen.dart';
// import 'package:blood_donation/constant/admin/admin_route.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class AdminRouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       // case "/":
//       //   return _GeneratePageRoute(
//       //       widget: const AdminLoginScreen(), routeName: settings.name!);
//       case AdminRouteName.loginPage:
//         return _GeneratePageRoute(
//             widget: const AdminLoginScreen(), routeName: settings.name!);
//       case AdminRouteName.homePage:
//         return _GeneratePageRoute(
//             widget: const AdminHomeScreen(), routeName: settings.name!);
//       // case AdminRouteName.donorInfo:
//       //   var routeData = settings.arguments != null
//       //       ? settings.arguments!
//       //       : {"routeData": null};
//       //   return _GeneratePageRoute(
//       //       widget: AddNewDonorForm(
//       //         navigationData: routeData as Map<String, dynamic>,
//       //       ),
//       //       routeName: settings.name!);
//       default:
//         return _GeneratePageRoute(
//             widget: const AdminLoginScreen(), routeName: settings.name!);
//     }
//   }
// }

// class _GeneratePageRoute extends PageRouteBuilder {
//   final Widget widget;
//   final String routeName;
//   _GeneratePageRoute({required this.widget, required this.routeName})
//       : super(
//             settings: RouteSettings(name: routeName),
//             pageBuilder: (BuildContext context, Animation<double> animation,
//                 Animation<double> secondaryAnimation) {
//               return widget;
//             },
//             transitionDuration: const Duration(milliseconds: 500),
//             transitionsBuilder: (BuildContext context,
//                 Animation<double> animation,
//                 Animation<double> secondaryAnimation,
//                 Widget child) {
//               return SlideTransition(
//                 textDirection: TextDirection.rtl,
//                 position: Tween<Offset>(
//                   begin: const Offset(1.0, 0.0),
//                   end: Offset.zero,
//                 ).animate(animation),
//                 child: child,
//               );
//             });
// }

// class FadeTransitionPage extends CustomTransitionPage<void> {
//   FadeTransitionPage({
//     required LocalKey key,
//     required Widget child,
//   }) : super(
//             key: key,
//             transitionDuration: const Duration(milliseconds: 500),
//             transitionsBuilder: (BuildContext context,
//                 Animation<double> animation,
//                 Animation<double> secondaryAnimation,
//                 Widget child) {
//               return SlideTransition(
//                 textDirection: TextDirection.rtl,
//                 position: Tween<Offset>(
//                   begin: const Offset(1.0, 0.0),
//                   end: Offset.zero,
//                 ).animate(animation),
//                 child: child,
//               );
//             },
//             child: child);
// }
