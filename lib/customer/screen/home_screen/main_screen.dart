import 'package:blood_donation/customer/screen/home_screen/blood_bank/blood_bank_screen.dart';
import 'package:blood_donation/customer/screen/home_screen/home_screen/home_screen.dart';
import 'package:blood_donation/customer/screen/home_screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../blood_request/blood_request_form.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectIndex = 0;

  List<Widget> bottomNavigationItem = [
    const HomeScreen(),
    const BloodBankScreen(),
    Container(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectIndex,
        children: bottomNavigationItem,
      ),
      // extendBody: true,
      drawer: _buildDrawer(context),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const BloodRequest();
          }));
        },
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,

      bottomNavigationBar: _buildBottomNavigationBar(),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Theme.of(context).canvasColor,
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home_sharp,
      //         ),
      //         label: "Home"),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.bloodtype_rounded,
      //         ),
      //         label: "Blood Bank"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle), label: "Profile"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle), label: "Profile"),
      //   ],
      //   elevation: 14,
      //   //  backgroundColor: Theme.of(context).colorScheme.primary,
      //   selectedItemColor: Theme.of(context).colorScheme.primary,
      //   selectedIconTheme: IconThemeData(
      //       size: 25.0, color: Theme.of(context).colorScheme.primary),
      //   unselectedIconTheme: IconThemeData(
      //       size: 25.0,
      //       color: Theme.of(context).colorScheme.primary.withOpacity(0.50)),
      //   unselectedItemColor:
      //       Theme.of(context).colorScheme.primary.withOpacity(0.50),
      //   selectedFontSize: 14,
      //   currentIndex: _selectIndex,
      //   unselectedFontSize: 14,
      //   onTap: _onItemTapped,
      // ),
    );
  }

  //Navigation drawer
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "UserName",
              style: TextStyle(
                  fontSize: 14.0,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            accountEmail: Text(
              "sample@gmail.com",
              style: TextStyle(
                  fontSize: 14.0,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Text(
                "U",
                style: TextStyle(
                    fontSize: 40.0,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Settings',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            leading: Icon(Icons.settings,
                size: 24, color: Theme.of(context).colorScheme.onSurface),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            leading: Icon(Icons.logout_rounded,
                size: 24, color: Theme.of(context).colorScheme.onSurface),
            onTap: () {
              // Navigator.pushNamed(context, loginRoute);
            },
          ),
        ],
      ),
    );
  }

  //Bottom navigation bar
  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      elevation: 8,
      color: Theme.of(context).canvasColor,
      child: SizedBox(
        //color: Theme.of(context).canvasColor,
        height: 58.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Tooltip(
              message: "Home",
              margin: const EdgeInsets.only(bottom: 10.0),
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectIndex = 0;
                  });
                },
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).canvasColor,
                    ),
                    splashFactory: NoSplash.splashFactory // <-- Button color

                    // overlayColor:
                    //     MaterialStateProperty.resolveWith<Color?>((states) {
                    //   if (states.contains(MaterialState.pressed)) {
                    //     return Colors.white12;
                    //   } // <-- Splash color
                    // }),
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_rounded,
                      color: (_selectIndex == 0)
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.50),
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: (_selectIndex == 0)
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Tooltip(
              message: "Blood Bank",
              margin: const EdgeInsets.only(bottom: 10.0),
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectIndex = 1;
                  });
                },
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).canvasColor,
                    ),
                    splashFactory: NoSplash.splashFactory // <-- Button color
                    // overlayColor:
                    //     MaterialStateProperty.resolveWith<Color?>((states) {
                    //   if (states.contains(MaterialState.pressed)) {
                    //     return Colors.white12;
                    //   } // <-- Splash color
                    // }),
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        color: (_selectIndex == 1)
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.50),
                        height: 24,
                        width: 20,
                        image: const AssetImage(
                            "assets/images/icons/bloodBank.png")),

                    // Icon(
                    //   Icons.store_mall_directory_rounded,
                    //   color: (_selectIndex == 1)
                    //       ? Theme.of(context).colorScheme.primary
                    //       : Theme.of(context)
                    //           .colorScheme
                    //           .primary
                    //           .withOpacity(0.50),
                    // ),
                    Text(
                      "Blood Bank",
                      style: TextStyle(
                        color: (_selectIndex == 1)
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(
              flex: 10,
            ),
            Tooltip(
              message: "Blood Request",
              margin: const EdgeInsets.only(bottom: 10.0),
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectIndex = 2;
                  });
                },
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).canvasColor,
                    ),
                    splashFactory: NoSplash.splashFactory // <-- Button color

                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        color: (_selectIndex == 2)
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.50),
                        height: 24,
                        width: 24,
                        image: const AssetImage(
                            "assets/images/icons/bloodDonor.png")),
                    // Icon(
                    //   Icons.bloodtype_rounded,
                    //   color: (_selectIndex == 2)
                    //       ? Theme.of(context).colorScheme.primary
                    //       : Theme.of(context)
                    //           .colorScheme
                    //           .primary
                    //           .withOpacity(0.50),
                    // ),
                    Text(
                      "My Request",
                      style: TextStyle(
                        color: (_selectIndex == 2)
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Tooltip(
              message: "Profile",
              margin: const EdgeInsets.only(bottom: 10.0),
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectIndex = 3;
                  });
                },
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).canvasColor,
                    ),
                    splashFactory: NoSplash.splashFactory // <-- Button color
                    // <-- Button color
                    // overlayColor:
                    //     MaterialStateProperty.resolveWith<Color?>((states) {
                    //   if (states.contains(MaterialState.pressed)) {
                    //     return Colors.white12;
                    //   } // <-- Splash color
                    // }),
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: (_selectIndex == 3)
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.50),
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: (_selectIndex == 3)
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
