import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sv_rms_mobile/ui/complaints/complaints_screen.dart';
import 'package:sv_rms_mobile/ui/home/dashboard/dashboard_screen.dart';
import 'package:sv_rms_mobile/ui/home/manage_bids/manage_bids_store.dart';
import 'package:sv_rms_mobile/ui/home/notifications/notifications_screen.dart';
import 'package:sv_rms_mobile/ui/home/profile/profile_screen.dart';
import 'package:sv_rms_mobile/ui/home/projects/project_screen.dart';
import 'package:sv_rms_mobile/ui/home/projects/project_screen_store.dart';
import 'package:sv_rms_mobile/ui/how_it_works/how_it_works_screen.dart';
import 'package:sv_rms_mobile/ui/invoices/invoices_screen.dart';
import 'package:sv_rms_mobile/ui/settings/settings_screen.dart';
import 'package:sv_rms_mobile/ui/technicians/technician_screen.dart';
import 'package:sv_rms_mobile/utils/icons/custom_icons_icons.dart';

import 'home_store.dart';
import 'manage_bids/manage_bids_screen.dart';
import 'widgets/bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.homeScreenStore}) : super(key: key);

  final HomeScreenStore homeScreenStore;

  static const String route = "home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getHomeView(int index) {
    switch (index) {
      case 0:
        return const DashboardScreen();
      case 1:
        return ProjectScreen(store: ProjectScreenStore());
      case 2:
        return BidsScreen(store: BidsScreenStore());
      case 3:
        return ProfileScreen(
          homeScreenStore: widget.homeScreenStore,
        );
      case 4:
        return const NotificationScreen();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        drawer: Drawer(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              DrawerHeader(
                margin: const EdgeInsets.only(bottom: 28),
                padding: EdgeInsets.zero,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 100,
                        width: 160,
                        child: Center(
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            height: 80,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey.shade300,
                            ),
                            child: Image.asset(
                              "assets/images/logo 2.png",
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome to SVI",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "RMS Resource Management Platform",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              const Divider(height: 0, color: Colors.blueGrey),
              // ListTile(
              //   title: const Text("Dashboard"),
              //   leading: const Icon(CustomIcons.fi_rr_subtitles),
              //   trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              //   onTap: () {
              //     Navigator.pop(context);
              //     widget.homeScreenStore.homeIndex = 0;
              //   },
              // ),
              // const Divider(height: 0, color: Colors.blueGrey),
              // ListTile(
              //   title: const Text("Manage Projects"),
              //   leading: const Icon(CustomIcons.fi_rr_shield_plus),
              //   trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              //   onTap: () {
              //     Navigator.pop(context);
              //     widget.homeScreenStore.homeIndex = 1;
              //   },
              // ),
              // const Divider(height: 0, color: Colors.blueGrey),
              // ListTile(
              //   title: const Text("Manage Bids"),
              //   leading: const Icon(CustomIcons.fi_rr_notebook),
              //   trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              //   onTap: () {
              //     Navigator.pop(context);
              //     widget.homeScreenStore.homeIndex = 2;
              //   },
              // ),
              const Divider(height: 0, color: Colors.blueGrey),
              ListTile(
                title: const Text("Manage Invoices"),
                leading: const Icon(CustomIcons.fi_rr_network),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, InvoicesScreen.route);
                },
              ),
              const Divider(height: 0, color: Colors.blueGrey),
              ListTile(
                title: const Text("Manage Technicians"),
                leading: const Icon(CustomIcons.fi_rr_user),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, TechniciansScreen.route);
                },
              ),
              const Divider(height: 0, color: Colors.blueGrey),
              ListTile(
                title: const Text("Complaints"),
                leading: const Icon(CustomIcons.fi_rr_stats),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, ComplaintsScreen.route);
                },
              ),
              const Divider(height: 0, color: Colors.blueGrey),
              ListTile(
                title: const Text("How it Works"),
                leading: const Icon(CustomIcons.fi_rr_database),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, HowItWorksScreen.route);
                },
              ),
              const Divider(height: 0, color: Colors.blueGrey),
              ListTile(
                title: const Text("App Settings"),
                leading: const Icon(CustomIcons.fi_rr_settings),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, SettingsScreen.route);
                },
              ),
              const Divider(height: 0, color: Colors.blueGrey),
            ],
          ),
        ),
        appBar: AppBar(
            title: const Text(
              "SV RMS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  widget.homeScreenStore.homeIndex = 4;
                },
                icon: const Icon(
                  Icons.notifications_rounded,
                ),
              )
            ]),
        bottomNavigationBar: TALBottomBar(
          homeScreenStore: widget.homeScreenStore,
        ),
        body: PageTransitionSwitcher(
          reverse: false,
          transitionBuilder: (Widget child1, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return SharedAxisTransition(
              fillColor: Colors.transparent,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child1,
            );
          },
          child: getHomeView(
            widget.homeScreenStore.homeIndex,
          ),
        ),
      );
    });
  }
}
