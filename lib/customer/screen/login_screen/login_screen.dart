import 'package:blood_donation/constant/size_config.dart';
import 'package:blood_donation/customer/screen/home_screen/main_screen.dart';
import 'package:blood_donation/customer/screen/login_screen/components/header_text.dart';
import 'package:blood_donation/customer/screen/login_screen/components/login_screen_text_form_field.dart';
import 'package:blood_donation/customer/screen/login_screen/components/text_button_with_icon.dart';
import 'package:blood_donation/customer/screen/login_screen/signup_screen.dart';
import 'package:flutter/material.dart';

import 'components/start_up_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginFormKey = GlobalKey<FormState>();

  TextEditingController loginEmailContoller = TextEditingController();

  TextEditingController loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const HeaderText(
                header1: "Log In",
                header2: "Sign in to your account",
              ),
              const SizedBox(
                height: 20,
              ),
              const StartUpImage(),
              const SizedBox(
                height: 30,
              ),
              const LoginScreenTextFormField(
                  textInputType: TextInputType.emailAddress,
                  label: "Username",
                  obscureText: false,
                  readOnly: true),
              const SizedBox(
                height: 20,
              ),
              const LoginScreenTextFormField(
                  textInputType: TextInputType.emailAddress,
                  label: "Password",
                  obscureText: true,
                  readOnly: true),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: const Alignment(1.0, 0.0),
                child: InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, MainScreen.id);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: TextButtonWithIcon(
                    label: "Login",
                    onPress: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const MainScreen();
                      }));
                    },
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignUp();
                        }));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
