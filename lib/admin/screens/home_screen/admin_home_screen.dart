import 'package:blood_donation/admin/controller/login%20and%20signup/authentication/authentication_bloc.dart';
import 'package:blood_donation/admin/screens/home_screen/components/admin/admin_list.dart';
import 'package:blood_donation/admin/screens/home_screen/components/blood%20donor/admin_blood_donor.dart';
import 'package:blood_donation/constant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key, required this.pageIndex}) : super(key: key);
  final int pageIndex;

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.pageIndex;
    super.initState();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> widgetScreen = [
    Container(),
    const AdminBloodDonor(),
    Container(),
    const AdminList(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    return Scaffold(
      appBar: AppBar(
        key: scaffoldKey,
        automaticallyImplyLeading:
            deviceType == DeviceScreenType.mobile ? true : false,
        // leading: deviceType == DeviceScreenType.mobile
        //     ? Builder(builder: (context) {
        //         return IconButton(
        //           onPressed: () {
        //             Scaffold.of(context).openDrawer();
        //           },
        //           icon: const Icon(Icons.menu),
        //         );
        //       })
        //     : null,
        actions: deviceType == DeviceScreenType.mobile
            ? null
            : [
                TextButton.icon(
                    onPressed: () {
                      context.read<AuthenticationBloc>().add(const LoggedOut());
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    label: const Text("Logout",
                        style: TextStyle(color: Colors.white, fontSize: 16.0))),
                const SizedBox(
                  width: 10.0,
                )
              ],
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 32),
                child: const Text(
                  "Admin Panel",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ),
            ]),
      ),
      drawer: navigationDrawer(context),
      body: ScreenTypeLayout(
          mobile: Container(),
          tablet: _buildDesktopHomeScreen(),
          desktop: _buildDesktopHomeScreen()),
    );
  }

  Widget _buildDesktopHomeScreen() {
    return Row(
      children: [
        NavigationRail(
            //labelType: NavigationRailLabelType.all,
            extended: true,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.dashboard_rounded),
                selectedIcon: Icon(Icons.dashboard_rounded),
                label: Text('Dashboard'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bloodtype_sharp),
                selectedIcon: Icon(Icons.bloodtype_sharp),
                label: Text('Blood Donors'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bloodtype_sharp),
                selectedIcon: Icon(Icons.bloodtype_sharp),
                label: Text('Blood Requests'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                selectedIcon: Icon(Icons.person),
                label: Text('Administrative'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.group_add),
                selectedIcon: Icon(Icons.group_add),
                label: Text('Users'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bloodtype_outlined),
                selectedIcon: Icon(Icons.bloodtype_outlined),
                label: Text('Blood Bank'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.campaign),
                selectedIcon: Icon(Icons.campaign),
                label: Text('Blood Compaign'),
              ),
            ],
            selectedIndex: _selectedIndex),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: widgetScreen[_selectedIndex])
      ],
    );
  }

  //Navigation Drawer
  Drawer navigationDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        shrinkWrap: true,
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Blood User",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            accountEmail: const Text(
              "sampletext@gmail.com",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              child: Text(
                "B",
                style: TextStyle(
                    fontSize: 40.0,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          DrawerItem(
            onPress: () {},
            title: "Dashboard",
            iconData: Icons.dashboard_rounded,
          ),
          DrawerItem(
            onPress: () {},
            title: "Blood Donors",
            iconData: Icons.bloodtype_rounded,
          ),
          DrawerItem(
            onPress: () {},
            title: "Blood Requests",
            iconData: Icons.bloodtype_rounded,
          ),
          DrawerItem(
            onPress: () {},
            title: "Administrative",
            iconData: Icons.person,
          ),
          DrawerItem(
            onPress: () {},
            title: "Users",
            iconData: Icons.person_add,
          ),
          DrawerItem(
            onPress: () {},
            title: "Logout",
            iconData: Icons.logout_rounded,
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onPress})
      : super(key: key);

  final String title;
  final IconData iconData;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(title
          //style:  TextStyle(color: Colors.black54,fontSize: getProportionateScreenWidth(16.0)),
          ),
      onTap: onPress(),
    );
  }
}
