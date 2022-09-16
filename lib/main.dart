import 'package:blood_donation/constant/custom_theme.dart';
import 'package:blood_donation/customer/screen/login_screen/login_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'app_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const configuredApp = AppConfig(
    environment: Environment.customer,
    url: 'testing in prod mode',
    child: MyApp(),
  );
  runApp(configuredApp);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: CustomTheme().buildLightTheme(),
      darkTheme: CustomTheme().buildDarkTheme(),
      home: const LoginScreen(),
    );
  }
}
