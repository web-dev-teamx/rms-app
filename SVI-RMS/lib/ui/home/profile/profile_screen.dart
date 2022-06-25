import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sv_rms_mobile/blocs/services_bloc.dart';
import 'package:sv_rms_mobile/model/get_vendor_detail/vendor_details.dart';
import 'package:sv_rms_mobile/ui/home/home_store.dart';
import 'package:sv_rms_mobile/ui/profile_details/about_me/about_me_screen.dart';
import 'package:sv_rms_mobile/ui/profile_details/my_attachments/my_attachments_screen.dart';
import 'package:sv_rms_mobile/ui/profile_details/my_payments/my_payments_screen.dart';
import 'package:sv_rms_mobile/ui/profile_details/my_tools/my_tools_screen.dart';
import 'package:sv_rms_mobile/ui/profile_details/others/others_screen.dart';
import 'package:sv_rms_mobile/utils/app_theme.dart';

class ProfileScreen extends StatefulWidget {
  final HomeScreenStore homeScreenStore;
  const ProfileScreen({
    Key? key,
    required this.homeScreenStore,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _smsNotificationOn = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<ServicesBloc>(builder: (context, value, _) {
      return FutureBuilder<VendorDetails>(
          future: value.getVendorDetails(id: "2128"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 28),
                              padding: const EdgeInsets.all(8.0),
                              height: MediaQuery.of(context).size.width / 2.8,
                              width: MediaQuery.of(context).size.width / 2.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color: Theme.of(context).cardColor,
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.width / 3,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90),
                                  color: Colors.blueGrey,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      snapshot.data!.basicInfo?.profileImage ??
                                          "",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              // "Ahmed Hamid",
                              snapshot.data!.basicInfo?.firstName ?? "No Name",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              // "Ahmed Hamid",
                              snapshot.data!.basicInfo?.lastName ?? '',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Theme.of(context).cardColor,
                              ),
                              child: Text(
                                snapshot.data!.basicInfo?.consultantHiredFrom ??
                                    "No Name",
                                // snapshot.data?.basicInfo!["consultant_hired_from"],
                                textAlign: TextAlign.center,
                                style: const TextStyle(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Material(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Location",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              snapshot.data?.basicInfo
                                                      ?.mobilityRegionLocation ??
                                                  "Not Available",
                                              // " snapshot.data!.basicInfo!",
                                              // "Luanda, Angola",
                                              style: const TextStyle(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "Rating",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "4 out of 5",
                                              style: TextStyle(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Employee Status",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              snapshot.data?.basicInfo
                                                      ?.employmentStatus ??
                                                  "",
                                              // "Freelancer",
                                              style: const TextStyle(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Availability",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              snapshot.data?.basicInfo
                                                      ?.availability ??
                                                  "",
                                              // snapshot
                                              //     .data?.basicInfo!["availability"],
                                              // "24/7",
                                              style: const TextStyle(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Text Number",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              snapshot.data?.basicInfo
                                                      ?.contactNumberPrimary ??
                                                  "",
                                              // "+92 4564 5445 24",
                                              style: const TextStyle(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Registration Date",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              // "2020-05-10",
                                              snapshot.data!.basicInfo
                                                      ?.registrationDate ??
                                                  "",
                                              style: const TextStyle(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Material(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Working experience",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  snapshot.data?.basicInfo
                                                          ?.workingExperienceYear ??
                                                      "",
                                                  // "1 Year, 02 Months",
                                                  style: const TextStyle(),
                                                ),
                                                // Text(
                                                //   // snapshot.data?.basicInfo![
                                                //   //         "working_experience_month"] +
                                                //   //     " Months",
                                                //   "1 Year, 02 Months",
                                                //   style: TextStyle(),
                                                // ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    height: 36,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Languages",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                itemCount: snapshot
                                                    .data!.languages.length,
                                                itemBuilder: (
                                                  BuildContext context,
                                                  int index,
                                                ) {
                                                  return Text(
                                                    snapshot
                                                            .data
                                                            ?.languages[index]!
                                                            .name! ??
                                                        "",
                                                    style: const TextStyle(),
                                                  );
                                                }),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "Interested In",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Full Time Role",
                                              style: TextStyle(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Material(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: const Text(
                                          "Skill Name",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        child: const Text(
                                          "Level",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.skills.length,
                                      itemBuilder: (
                                        BuildContext context,
                                        int index,
                                      ) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                snapshot.data?.skills[index]!
                                                        .name ??
                                                    "",
                                                // "Desk Side Support",
                                                style: const TextStyle(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              child: Text(
                                                // "1",
                                                snapshot.data?.skills[index]!
                                                        .skillLevel ??
                                                    "",
                                                style: const TextStyle(),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                  const Divider(),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceAround,
                                  //   children: [
                                  //     SizedBox(
                                  //       width: MediaQuery.of(context)
                                  //               .size
                                  //               .width *
                                  //           0.6,
                                  //       child: const Text(
                                  //         // snapshot.data!.skills![1].name,
                                  //         "Mobile App Testing",
                                  //         style: TextStyle(),
                                  //       ),
                                  //     ),
                                  //     SizedBox(
                                  //       width: MediaQuery.of(context)
                                  //               .size
                                  //               .width *
                                  //           0.2,
                                  //       child: const Text(
                                  //         "L3",
                                  //         // snapshot.data!.skills![1].skillLevel,
                                  //         style: TextStyle(),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // const Divider(),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceAround,
                                  //   children: [
                                  //     SizedBox(
                                  //       width: MediaQuery.of(context)
                                  //               .size
                                  //               .width *
                                  //           0.6,
                                  //       child: const Text(
                                  //         "Python and Debug",
                                  //         // snapshot.data!.skills![2].name,
                                  //         style: TextStyle(),
                                  //       ),
                                  //     ),
                                  //     SizedBox(
                                  //       width: MediaQuery.of(context)
                                  //               .size
                                  //               .width *
                                  //           0.2,
                                  //       child: const Text(
                                  //         "L2",
                                  //         // snapshot.data!.skills![2].skillLevel,
                                  //         style: TextStyle(),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Material(
                            color: Theme.of(context).cardColor,
                            clipBehavior: Clip.hardEdge,
                            shape: SquircleBorder(
                                radius: BorderRadius.circular(18)),
                            child: Column(
                              children: [
                                ProfileTile(
                                  title: "About",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AboutMeScreen(
                                          basicInfo: snapshot.data!.basicInfo,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icons.person_pin,
                                ),
                                const Divider(height: 1),
                                ProfileTile(
                                  title: "Attachments",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MyAttachmentsScreen(
                                          certificates:
                                              snapshot.data!.certificates,
                                          education: snapshot.data!.educations,
                                          vendorAttachments:
                                              snapshot.data!.vendorAttachments,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icons.attachment_rounded,
                                ),
                                const Divider(height: 1),
                                ProfileTile(
                                  title: "Tools",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyToolsScreen(
                                          tool: snapshot.data!.tools,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icons.radar,
                                ),
                                const Divider(height: 1),
                                ProfileTile(
                                  title: "Payments",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyPaymentsScreen(
                                          bankDetail:
                                              snapshot.data!.bankDetails,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icons.payment,
                                ),
                                const Divider(height: 1),
                                ProfileTile(
                                  title: "Others",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OthersScreen(
                                          coverageArea:
                                              snapshot.data!.coverageAreas,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icons.devices_other,
                                ),
                                const Divider(height: 1),
                                ProfileTile(
                                  title: "Sms Notifications",
                                  onTap: () {},
                                  icon: Icons.sms,
                                  trailing: CupertinoSwitch(
                                    value: _smsNotificationOn,
                                    onChanged: (change) {
                                      setState(() {
                                        _smsNotificationOn = change;
                                      });
                                    },
                                  ),
                                ),
                                const Divider(height: 1),
                                ProfileTile(
                                  title: "Change Password",
                                  onTap: () {},
                                  icon: Icons.lock,
                                ),
                                const Divider(height: 1),
                                ProfileTile(
                                  title: "Logout",
                                  onTap: () {},
                                  icon: Icons.logout,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    });
  }
}

class ProfileTile extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  final bool isLast;
  final Widget trailing;
  const ProfileTile({
    Key? key,
    required this.title,
    required this.onTap,
    required this.icon,
    this.trailing = const Icon(
      Icons.arrow_forward_ios_rounded,
      size: 18.0,
    ),
    this.isLast = false,
  }) : super(key: key);

  @override
  _ProfileTileState createState() => _ProfileTileState();
}

class _ProfileTileState extends State<ProfileTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 65,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  radius: 15,
                  child: Icon(widget.icon, size: 16.0),
                ),
                const SizedBox(width: 12),
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            widget.trailing,
          ],
        ),
      ),
    );
  }
}

class CustomTabBarItem extends StatelessWidget {
  final HomeScreenStore store;
  final String title;
  final int index;
  const CustomTabBarItem({
    Key? key,
    required this.title,
    required this.index,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return InkWell(
        onTap: () {
          store.profileTabIndex = index;
        },
        child: SizedBox(
          height: 40,
          width: (MediaQuery.of(context).size.width / 3) - (40 / 3),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCirc,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: store.profileTabIndex == index ? 16 : 14,
              color: store.profileTabIndex == index
                  ? AppTheme.primaryColor
                  : Colors.grey,
            ),
            child: Center(
              child: Text(
                title,
              ),
            ),
          ),
        ),
      );
    });
  }
}
