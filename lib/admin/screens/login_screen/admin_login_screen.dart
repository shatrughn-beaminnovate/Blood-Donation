import 'package:blood_donation/admin/controller/login%20and%20signup/authentication/authentication_bloc.dart';
import 'package:blood_donation/admin/controller/login%20and%20signup/login/login_bloc.dart';
import 'package:blood_donation/admin/screens/home_screen/admin_home_screen.dart';
import 'package:blood_donation/constant/size_config.dart';
import 'package:blood_donation/customer/screen/login_screen/components/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  bool isChecked = false;

  //creating controller for textfield
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  //creating instance for bloc
  late LoginBloc loginBloc;
  late AuthenticationBloc authenticationBloc;

  bool isProgress = false;

  @override
  void initState() {
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    loginBloc = LoginBloc(
      authenticationBloc: authenticationBloc,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocProvider(
        create: (context) => loginBloc,
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              setState(() {
                isProgress = true;
              });
            }
            if (state is LoginInitial) {
              setState(() {
                isProgress = false;
              });
              print("Login Initial called");
            }
            if (state is LoginFailure) {
              print("Login Failure called ${state.message}");
              setState(() {
                isProgress = false;
              });
            }
          },
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
              ScreenTypeLayout(
                // breakpoints: const ScreenBreakpoints(
                //     tablet: 1024, desktop: 1224, watch: 300),
                mobile: _buildLoginFormForMobile(context),
                desktop: _buildLoginFormForDeskTop(context),
                tablet: _buildLoginFormForDeskTop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginFormForDeskTop(BuildContext context) {
    return Center(
      child: Card(
        elevation: 2.0,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              width: 600,
              height: 490,
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: 40.0),
                  const HeaderText(
                      header1: "Log In", header2: "Sign in to your account"),
                  const SizedBox(height: 48.0),
                  TextFormField(
                    controller: _username,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      labelStyle: TextStyle(
                          fontSize: 16.0,
                          color: const Color(0xFF000000).withOpacity(0.6)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xFF000000).withOpacity(0.38)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xFF000000).withOpacity(0.38)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xFF000000).withOpacity(0.38)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    autofocus: false,
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      labelStyle: TextStyle(
                          fontSize: 16.0,
                          color: const Color(0xFF000000).withOpacity(0.6)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xFF000000).withOpacity(0.38)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xFF000000).withOpacity(0.38)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xFF000000).withOpacity(0.38)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {},
                          ),
                          const Text("Remember Me")
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: ElevatedButton(
                      onPressed: () {
                        loginBloc.add(LoginButtonPressed(
                            username: _username.text,
                            password: _password.text));
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return const AdminHomeScreen();
                        // }));
                      },
                      child: const Text('Log In',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            (isProgress)
                ? Container(
                    color: Colors.black12,
                    width: 600,
                    height: 490,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20.0,
                        )
                      ],
                    ))
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Widget _buildLoginFormForMobile(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5.0,
        child: Container(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20.0),
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 2.0,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10.0),
              const HeaderText(
                  header1: "Log In", header2: "Sign in to your account"),
              const SizedBox(height: 30.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                controller: _username,
                decoration: InputDecoration(
                  hintText: 'Username',
                  contentPadding:
                      const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                  labelStyle: TextStyle(
                      fontSize: 16.0,
                      color: const Color(0xFF000000).withOpacity(0.6)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.38)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.38)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.38)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
              const SizedBox(height: 15.0),
              TextFormField(
                autofocus: false,
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding:
                      const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                  labelStyle: TextStyle(
                      fontSize: 16.0,
                      color: const Color(0xFF000000).withOpacity(0.6)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.38)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.38)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.38)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {},
                      ),
                      const Text("Remember Me")
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 2.5,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const AdminHomeScreen();
                    }));
                  },
                  child: const Text('Log In',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
