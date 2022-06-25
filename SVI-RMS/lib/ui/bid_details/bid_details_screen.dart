import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sv_rms_mobile/blocs/services_bloc.dart';
import 'package:sv_rms_mobile/model/get_bids_details/biddetail.dart';
import 'package:sv_rms_mobile/ui/project_details/project_details_screen.dart';

class BidDetailsScreen extends StatefulWidget {
  final String? bidid;
  final String? detialid;
  const BidDetailsScreen(
      {Key? key, required this.bidid, required this.detialid})
      : super(key: key);

  @override
  _BidDetailsScreenState createState() => _BidDetailsScreenState();
}

class _BidDetailsScreenState extends State<BidDetailsScreen> {
  int _groupValue = -1;
  bool viewVisible = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ServicesBloc>(
      builder: (context, value, index) {
        return FutureBuilder<BidDetailModel>(
            future: value.getbidsdetails(
                id: "195",
                bidId: widget.bidid ?? '',
                detailId: widget.detialid ?? ''),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // print(snapshot.data?.data?.projectName);
                return Scaffold(
                  body: Stack(
                    children: [
                      CustomScrollView(
                        physics: const BouncingScrollPhysics(),
                        slivers: [
                          const SliverAppBar(
                            pinned: true,
                            title: Text(
                              "Bid Details",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SliverToBoxAdapter(child: SizedBox(height: 16)),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data?.data?.projectName ?? '',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Bid Date: ${snapshot.data?.data?.projectStartDatetime ?? ''}",
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
                                  label: "Project Number",
                                  description:
                                      snapshot.data!.data!.projectId ?? '',
                                  color: Colors.blue,
                                  iconData: Icons.numbers,
                                ),
                                DetailsTile(
                                    label: "Project Type",
                                    description:
                                        snapshot.data!.data!.projectType ?? '',
                                    color: Colors.brown,
                                    iconData: Icons.money),
                                DetailsTile(
                                    label: "Project Catergory",
                                    description:
                                        snapshot.data!.data!.projectCategory ??
                                            '',
                                    color: Colors.deepPurple,
                                    iconData: Icons.category),
                                DetailsTile(
                                  label: "Payment Type",
                                  description:
                                      snapshot.data!.data!.paymentType ?? '',
                                  color: Colors.orange,
                                  iconData: Icons.money_rounded,
                                ),
                                DetailsTile(
                                  label: "Booking Type",
                                  description:
                                      snapshot.data?.data?.projectBookingtype ??
                                          '',
                                  color: Colors.lightGreen,
                                  iconData: Icons.merge_type_rounded,
                                ),
                                DetailsTile(
                                  label: "Project Languages",
                                  description:
                                      snapshot.data?.data?.projectLanguages ??
                                          '',
                                  color: Colors.blueAccent,
                                  iconData: Icons.language,
                                ),
                                DetailsTile(
                                  label: "Location(s)",
                                  description:
                                      snapshot.data!.data!.projectLocation ??
                                          'abc',
                                  color: Colors.redAccent,
                                  iconData: Icons.location_pin,
                                ),
                                DetailsTile(
                                  label: "No of FE(s) Required",
                                  description:
                                      snapshot.data?.data?.projectNoOfFe ?? '',
                                  color: Colors.pink,
                                  iconData: Icons.near_me_outlined,
                                ),
                                DetailsTile(
                                  label: "Start Date/Time",
                                  description: snapshot
                                          .data?.data?.projectStartDatetime ??
                                      '',
                                  color: Colors.green,
                                  iconData: Icons.arrow_forward_ios,
                                ),
                                DetailsTile(
                                  label: "End Date/Time",
                                  description:
                                      snapshot.data?.data?.projectEndDatetime ??
                                          '',
                                  color: Colors.red,
                                  iconData: Icons.arrow_back_ios_new_rounded,
                                ),
                                DetailsTile(
                                  label: "Call out Rate",
                                  description: snapshot.data?.data?.fCor ?? '',
                                  color: Colors.teal,
                                  iconData: Icons.delivery_dining_rounded,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 4),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Material(
                                            color: Colors.redAccent,
                                            shape: SquircleBorder(
                                              radius: BorderRadius.circular(18),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.travel_explore_outlined,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          const Text(
                                            'Travel & Purchase Expense',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          _myRadioButton(
                                              title: "Yes",
                                              value: 0,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _groupValue = newValue;
                                                  viewVisible = true;
                                                });
                                              }),
                                          _myRadioButton(
                                              title: "NO",
                                              value: 1,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _groupValue = newValue;
                                                  viewVisible = false;
                                                });
                                              }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                    visible: viewVisible,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                'Travel Expense Rate:',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueAccent,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                snapshot.data?.data
                                                        ?.fTeAbcRate ??
                                                    '',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              const Text(
                                                'Purchase Expense Rate:',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueAccent,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                snapshot.data?.data
                                                        ?.fPeAbcRate ??
                                                    '1',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            child: const Text(
                                              '',
                                              style: TextStyle(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
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
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: CupertinoButton.filled(
                                  pressedOpacity: 0.9,
                                  child: const Text(
                                    "Save Changes",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            });
      },
    );
  }

  Widget _myRadioButton(
      {required String title, required int value, required onChanged}) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: _groupValue,
          onChanged: onChanged,
        ),
        Text(title)
      ],
    );
  }
}
