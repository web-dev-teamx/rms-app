import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sv_rms_mobile/blocs/services_bloc.dart';
import 'package:sv_rms_mobile/model/get_bids_details/get_accepted_bids.model.dart';
import 'package:sv_rms_mobile/model/get_bids_details/get_technicianbid_model.dart';
import 'package:sv_rms_mobile/model/get_bids_details/yourbids.dart';
import 'package:sv_rms_mobile/ui/home/manage_bids/widgets/accepted_bids_tile.dart';
import 'package:sv_rms_mobile/ui/home/manage_bids/widgets/technician_bid_tile.dart';
import 'package:sv_rms_mobile/utils/app_theme.dart';

import 'manage_bids_store.dart';
import 'widgets/bid_tile.dart';

class BidsScreen extends StatefulWidget {
  const BidsScreen({
    Key? key,
    required this.store,
  }) : super(key: key);

  final BidsScreenStore store;
  @override
  _BidsScreenState createState() => _BidsScreenState();
}

class _BidsScreenState extends State<BidsScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);

    controller!.addListener(() {
      setState(() {
        selectedIndex = controller!.index;
      });
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ServicesBloc>(builder: (context, value, _) {
      return FutureBuilder<BidModel>(
          future: value.getbids("195"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                  appBar: PreferredSize(
                    preferredSize: const Size(
                      double.infinity,
                      56,
                    ),
                    child: DefaultTabController(
                      length: 3,
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 10),
                        color: Colors.white,
                        child: TabBar(
                            isScrollable: true,
                            unselectedLabelColor: Colors.grey,
                            labelColor: Colors.white,
                            labelPadding: const EdgeInsets.only(
                              left: 2,
                            ),
                            indicatorPadding: EdgeInsets.zero,
                            labelStyle: const TextStyle(
                                fontSize: 14, color: Colors.white),
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(22), // Creates border
                                color: AppTheme.primaryColor),
                            controller: controller,
                            tabs: [
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color: Colors.grey.withOpacity(0.2)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Your Bids'),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color: Colors.grey.withOpacity(0.2)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Technicians Bids'),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color: Colors.grey.withOpacity(0.2)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(' Accepted Bids'),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  body: TabBarView(
                    controller: controller,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: ListView.builder(
                              itemCount: snapshot.data!.data!.length,
                              itemBuilder: (context, index) {
                                final BidModel? _yourbids = snapshot.data;
                                return BidTile(
                                    yourbids: _yourbids!, index: index);
                              })),

                      ////getTechnician Data
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: FutureBuilder<GetTechnicianBidModel>(
                              future: value.getTechnicianbids("195"),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      itemCount: snapshot.data!.data!.length,
                                      itemBuilder: (context, index) {
                                        final GetTechnicianBidModel?
                                            getTechnicianBidModel =
                                            snapshot.data;
                                        return TechnicianBidTile(
                                            getTechnicianBidModel:
                                                getTechnicianBidModel!,
                                            index: index);
                                      });
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              })),
                      /////get accepted bids///////////
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: FutureBuilder<AcceptedBidsModel>(
                              future: value.getAcceptedbids("195"),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      itemCount:
                                          snapshot.data?.data?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        final AcceptedBidsModel?
                                            acceptedBidsModel = snapshot.data;
                                        return AcceptedBidTile(
                                            acceptedBidsModel:
                                                acceptedBidsModel!,
                                            index: index);
                                      });
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              })),
                    ],
                  ));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    });
  }
}

class BidsTabWidget extends StatelessWidget {
  const BidsTabWidget({
    Key? key,
    required this.index,
    required this.label,
    required this.store,
  }) : super(key: key);
  final int index;
  final String label;
  final BidsScreenStore store;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () {
          store.tabIndex == index;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
          decoration: BoxDecoration(
            color: index == store.tabIndex
                ? AppTheme.primaryColor
                : Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30),
          ),
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 100),
            style: TextStyle(
              color: index == store.tabIndex ? Colors.white : Colors.grey,
              fontWeight:
                  index == store.tabIndex ? FontWeight.bold : FontWeight.normal,
            ),
            child: Text(
              label,
            ),
          ),
        ),
      );
    });
  }
}
