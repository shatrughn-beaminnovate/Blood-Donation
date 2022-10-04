import 'package:blood_donation/constant/size_config.dart';
import 'package:blood_donation/customer/screen/home_screen/home_screen/donor_info_form.dart';
import 'package:blood_donation/customer/screen/login_screen/components/header_text.dart';
import 'package:blood_donation/customer/screen/login_screen/components/login_screen_text_form_field.dart';
import 'package:blood_donation/customer/screen/login_screen/components/text_button_with_icon.dart';
import 'package:blood_donation/customer/screen/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

import 'components/start_up_image.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final loginFormKey = GlobalKey<FormState>();

  TextEditingController emailContoller = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                header1: "Register",
                header2: "Sign up to your account",
              ),
              const SizedBox(
                height: 20,
              ),
              const StartUpImage(),
              //  const   SizedBox(
              //       height: 20,
              //     ),
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
                height: 20,
              ),
              const LoginScreenTextFormField(
                  textInputType: TextInputType.emailAddress,
                  label: "Confirm Password",
                  obscureText: true,
                  readOnly: true),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: TextButtonWithIcon(
                    label: "Register",
                    onPress: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const DonorInfoForm();
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
                    "Already have an account?",
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
                          return const LoginScreen();
                        }));
                      },
                      child: Text(
                        "Sign In",
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
