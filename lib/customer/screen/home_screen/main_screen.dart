import 'package:blood_donation/customer/screen/home_screen/blood_bank/blood_bank_screen.dart';
import 'package:blood_donation/customer/screen/home_screen/home_screen/home_screen.dart';
import 'package:blood_donation/customer/screen/home_screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  List<Widget> bottomNavigationItem = [
    const HomeScreen(),
    const BloodBankScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectIndex,
        children: bottomNavigationItem,
      ),
      drawer: _buildDrawer(context),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_sharp,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bloodtype_rounded,
              ),
              label: "Blood Bank"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Profile"),
        ],
        elevation: 4,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        selectedIconTheme: IconThemeData(
            size: 25.0, color: Theme.of(context).colorScheme.onPrimary),
        unselectedIconTheme: IconThemeData(
            size: 25.0,
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.70)),
        unselectedItemColor:
            Theme.of(context).colorScheme.onPrimary.withOpacity(0.70),
        selectedFontSize: 14,
        currentIndex: _selectIndex,
        unselectedFontSize: 14,
        onTap: _onItemTapped,
      ),
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
}
