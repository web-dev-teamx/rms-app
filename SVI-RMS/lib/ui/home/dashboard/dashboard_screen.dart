import 'package:flutter/material.dart';
import 'package:sv_rms_mobile/ui/project_details/project_details_screen.dart';

import 'widgets/dash_tile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Hello Ahmed,",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                  ),
                ),
                Text("Welcome to your dashboard"),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: const [
                Align(
                  alignment: Alignment.topLeft,
                  child: DashTile(
                    alignmentGeometry: Alignment.bottomRight,
                    color: Color(0xff6dcdda),
                    label: "Earnings",
                    amount: "\$230K",
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: DashTile(
                    alignmentGeometry: Alignment.bottomLeft,
                    color: Color(0xffe55f69),
                    label: "Receivables",
                    amount: "\$3200",
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: DashTile(
                    alignmentGeometry: Alignment.topRight,
                    color: Color(0xff4e54d9),
                    label: "Paid Invioces",
                    amount: "90",
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: DashTile(
                    alignmentGeometry: Alignment.topLeft,
                    color: Color(0xfff0944a),
                    label: "Ready Invoices",
                    amount: "12",
                  ),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Your Projects",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 8,
                      ),
                      child: SizedBox(
                        width: 200,
                        child: Material(
                          borderRadius: BorderRadius.circular(12),
                          borderOnForeground: true,
                          clipBehavior: Clip.hardEdge,
                          color: Theme.of(context).cardColor,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ProjectDetailsScreen.route);
                            },
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        "NIC Card Replacement 13 Oct France",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        "Break-Fix",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 11),
                                      ),
                                      Divider(
                                        height: 8,
                                      ),
                                      Text(
                                        "LOCATION: Épagny-Metz-Tessy, France",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                        ),
                                      ),
                                      Text(
                                        "DURATION: Minimum two hours",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                        ),
                                      ),
                                      Text(
                                        "SKILLS: Level-1 Technician",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                        ),
                                      ),
                                      // Divider(height: 8),
                                      // Text(
                                      //   "Starts: 2021-09-14T09:00",
                                      //   style: TextStyle(
                                      //     color: Colors.grey,
                                      //     fontSize: 11,
                                      //   ),
                                      // ),
                                      // Text(
                                      //   "Ends: 2021-09-14T17:00",
                                      //   style: TextStyle(
                                      //     color: Colors.grey,
                                      //     fontSize: 11,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          child: const Text(
                                            "On-going",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward,
                                          size: 18,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 7,
                ),
              ),
            ],
          ),
        ),
        // SliverToBoxAdapter(
        //   child: CupertinoSwitch(
        //     value: darkMode,
        //     onChanged: (change) {
        //       setState(() {
        //         darkMode = change;
        //       });
        //       _configStore.setThemeMode(change);
        //     },
        //   ),
        // ),
      ],
    );
  }
}
