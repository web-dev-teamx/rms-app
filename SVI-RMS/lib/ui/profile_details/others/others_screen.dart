import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sv_rms_mobile/blocs/services_bloc.dart';
import 'package:sv_rms_mobile/model/get_vendor_detail/coverage_area/coverage_area.dart';

class OthersScreen extends StatefulWidget {
  final List<CoverageArea?> coverageArea;
  const OthersScreen({
    Key? key,
    required this.coverageArea,
  }) : super(key: key);
  static const String route = "othersScreen";
  @override
  _OthersScreenState createState() => _OthersScreenState();
}

class _OthersScreenState extends State<OthersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ServicesBloc>(builder: (context, value, _) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              pinned: true,
              centerTitle: true,
              title: Text(
                "Others",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Availability Time in Certain Bracket",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const OtherTile(
              label: "Specify Availability Time if in certain bracket",
              value: "avail time",
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Notice For Full Day Task",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const OtherTile(
              label: "Notice Time For Full Day Task",
              value: "time notice",
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Consultant Hired / Engaged",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const OtherTile(
              label: "Consultant Hired / Engaged From",
              value: "Recruiter Consultant Kashif - Ali",
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Position Against Hiring",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            const OtherTile(
              label: "Position Against Which Consultant is hired",
              value: "Application On Email",
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Coverage Area",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return CoverageTile(
                    label: "City And Country",
                    value: widget.coverageArea[index]!.city ?? "",
                    country: widget.coverageArea[index]!.country ?? "",
                  );
                },
                childCount: widget.coverageArea.length,
              ),
            ),

            // SliverToBoxAdapter(
            //   child: SliverPadding(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //     sliver: SliverList(
            //       delegate: SliverChildBuilderDelegate(
            //         (BuildContext context, int index) {
            //           return OtherTile(
            //             label: widget.coverageArea[index]!.city ?? "",
            //             value: widget.coverageArea[index]!.country ?? "",
            //           );
            //         },
            //         childCount: widget.coverageArea.length,
            //       ),
            //     ),
            //   ),
            // ),
            // OtherTile(
            //   label: "City & Country",
            //   value: "Kabul, Afghanistan",
            // ),
            // OtherTile(
            //   label: "City & Country",
            //   value: "Taxila, Pakistan",
            // ),
            // OtherTile(
            //   label: "City & Country",
            //   value: "Islamabad, Pakistan",
            // ),
            // OtherTile(
            //   label: "City & Country",
            //   value: "Lahore, Pakistan",
            // ),
            // OtherTile(
            //   label: "City & Country",
            //   value: "Gujranwala, Pakistan",
            // ),
            // OtherTile(
            //   label: "City & Country",
            //   value: "Multan, Pakistan",
            // ),
            // OtherTile(
            //   label: "City & Country",
            //   value: "Peshawar, Pakistan",
            // ),
          ],
        );
      }),
    );
  }
}

class OtherTile extends StatelessWidget {
  const OtherTile({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label, value;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(height: 12),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: const TextStyle(),
            ),
            const Divider(height: 12)
          ],
        ),
      ),
    );
  }
}

class CoverageTile extends StatelessWidget {
  final String label, value, country;
  const CoverageTile(
      {Key? key,
      required this.label,
      required this.value,
      required this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(height: 12),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(),
              ),
              Text(
                "," + country,
                style: const TextStyle(),
              ),
            ],
          ),
          const Divider(height: 12)
        ],
      ),
    );
  }
}
