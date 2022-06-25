import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sv_rms_mobile/blocs/services_bloc.dart';
import 'package:sv_rms_mobile/model/get_project_detail/get_project_details.dart';
import 'package:sv_rms_mobile/model/get_projects/get_active_projects_model.dart';

class ActiveProjectDetailsScreen extends StatefulWidget {
  const ActiveProjectDetailsScreen({
    Key? key,
    required this.project,
    required this.activeIndex,
  }) : super(key: key);

  final GetActiveProjectModel project;
  final int activeIndex;
  @override
  _ActiveProjectDetailsScreenState createState() =>
      _ActiveProjectDetailsScreenState();
}

class _ActiveProjectDetailsScreenState
    extends State<ActiveProjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ServicesBloc>(builder: (context, value, _) {
      return FutureBuilder<GetProjectDetails>(
          future: value.getProjectDetails(
              id: '195',
              projectid:
                  widget.project.data?[widget.activeIndex].projectId ?? '',
              aspid: widget.project.data?[widget.activeIndex].asPId ?? ''),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return Scaffold(
                body: Stack(
                  children: [
                    CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                          pinned: true,
                          title: const Text(
                            "Project Details",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          actions: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bookmark_add_outlined,
                                ))
                          ],
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              snapShot.data!.projectName ?? "",
                              // "NIC Card Replacement 13 Oct France",
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 24,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Description",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  snapShot.data?.projectDescription ??
                                      "No Discription",
                                  // "NIC replacement in controller B.\nFor more information contact relevant whatsapp group or email support@svinternationalltd.com",
                                  style: const TextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: Divider(),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              DetailsTile(
                                label: "Category",
                                description: snapShot.data?.projectCategory ??
                                    "Break-Fix",
                                color: Colors.teal,
                                iconData: Icons.category,
                              ),
                              DetailsTile(
                                label: "Skills",
                                description: snapShot.data?.projectSkills ??
                                    "Level 1 technician",
                                color: Colors.blue,
                                iconData: Icons.vpn_key,
                              ),
                              DetailsTile(
                                label: "Location(s)",
                                description: snapShot.data?.projectLocation ??
                                    "Épagny-Metz-Tessy, France",
                                color: Colors.redAccent,
                                iconData: Icons.location_pin,
                              ),
                              DetailsTile(
                                label: "Currency",
                                description:
                                    snapShot.data?.projectCurrencyunit ??
                                        "Euros",
                                color: Colors.purple,
                                iconData: Icons.money_outlined,
                              ),
                              DetailsTile(
                                label: "Duration",
                                description: snapShot.data?.projectDuration ??
                                    "Minimum two hours",
                                color: Colors.orange,
                                iconData: Icons.more_time,
                              ),
                              DetailsTile(
                                label: "No of FE(s) Required",
                                description:
                                    snapShot.data?.projectNoOfFe ?? "1",
                                color: Colors.pink,
                                iconData: Icons.near_me_outlined,
                              ),
                              DetailsTile(
                                label: "Start Date/Time",
                                description:
                                    snapShot.data?.projectStartDatetime ??
                                        "2021-10-13T10:00",
                                color: Colors.green,
                                iconData: Icons.arrow_forward_ios,
                              ),
                              DetailsTile(
                                label: snapShot.data?.projectEndDatetime ??
                                    "End Date/Time",
                                description: "2021-10-13T12:00",
                                color: Colors.red,
                                iconData: Icons.arrow_back_ios_new_rounded,
                              ),
                              DetailsTile(
                                label: "Tools",
                                description: snapShot.data?.projectTools ??
                                    "Windows Laptop,",
                                color: Colors.purple,
                                iconData: Icons.design_services,
                              ),
                              // DetailsTile(
                              //   label: "Deliverables",
                              //   description: widget
                              //           .project.projectDetail!.status ??
                              //       "Attendance (Check In/Out - Public Holiday - Office Closed - Absent - Leave) Work Report (Text Format Report - No Character Limits - Aplha Numeric)",
                              //   color: Colors.teal,
                              //   iconData: Icons.delivery_dining_rounded,
                              // ),
                            ],
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 120,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: CupertinoButton.filled(
                                pressedOpacity: 0.9,
                                child: const Text(
                                  "Bid Now",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => BidNowScreen(
                                  //       project: widget.project,
                                  //     ),
                                  //   ),
                                  // );
                                  // Navigator.pushNamed(context, BidNowScreen.route);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
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

class DetailsTile extends StatelessWidget {
  const DetailsTile({
    Key? key,
    required this.label,
    required this.description,
    required this.color,
    required this.iconData,
  }) : super(key: key);
  final String label;
  final String description;
  final Color color;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: color,
            shape: SquircleBorder(
              radius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                iconData,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  description,
                  style: const TextStyle(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
