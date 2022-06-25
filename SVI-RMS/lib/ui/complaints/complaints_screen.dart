import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sv_rms_mobile/blocs/services_bloc.dart';
import 'package:sv_rms_mobile/model/get_complaints/get_complaint_model.dart';
import 'package:sv_rms_mobile/ui/complaints/file_complaint_screen.dart';
import 'package:sv_rms_mobile/ui/complaints/widgets/complaint_tile.dart';
import 'package:sv_rms_mobile/widgets/custom_fab.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({Key? key}) : super(key: key);

  static const String route = "complaintScreen";
  @override
  _ComplaintsScreenState createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  late ScrollController controller;
  bool _isExtended = false;
  final f = DateFormat('yyyy-MM-dd hh:mm');
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          _isExtended = true;
        });
      } else {
        setState(() {
          _isExtended = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: CustomFab(
          onTap: () {
            Navigator.pushNamed(context, FileComplaintScreen.route);
          },
          isExtended: _isExtended,
          label: "File Complaint",
          iconData: Icons.add_comment_outlined,
        ),
        body: Consumer<ServicesBloc>(builder: (context, value, _) {
          return FutureBuilder<GetComplaintModel>(
              future: value.getComplaints("2128"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      const SliverAppBar(
                        pinned: true,
                        title: Text(
                          "Complaints",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        actions: [],
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => ComplaintTile(
                              comment: 'There is a problem with.......',
                              addeddate:
                                  'Filled Date: ${snapshot.data?.data?[index].addedDate ?? ''}',
                              description:
                                  snapshot.data?.data?[index].description ?? '',
                              label: snapshot.data?.data?[index].title ?? '',
                              status: snapshot.data?.data?[index].status ?? '',
                            ),
                            childCount: snapshot.data?.data?.length,
                          ),
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
        }));
  }
}
