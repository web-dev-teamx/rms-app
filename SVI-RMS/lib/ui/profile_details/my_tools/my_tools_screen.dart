import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sv_rms_mobile/blocs/services_bloc.dart';
import 'package:sv_rms_mobile/model/get_vendor_detail/tool/tool.dart';

class MyToolsScreen extends StatefulWidget {
  final List<Tool?> tool;
  const MyToolsScreen({
    Key? key,
    required this.tool,
  }) : super(key: key);
  static const String route = "toolsScreen";
  @override
  _MyToolsScreenState createState() => _MyToolsScreenState();
}

class _MyToolsScreenState extends State<MyToolsScreen> {
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
                "Tools",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SliverToBoxAdapter(
              child: AdvanceToolsTile(
                label: "End User Computing",
                status: "Incomplete",
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ToolsTile(
                      isAcheived: true,
                      //  label: "Laptop Chargers",
                      label: widget.tool[index]!.name ?? "",
                    );
                  },
                  childCount: widget.tool.length,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class AdvanceToolsTile extends StatelessWidget {
  const AdvanceToolsTile({
    Key? key,
    required this.label,
    required this.status,
  }) : super(key: key);
  final String label, status;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Material(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(6),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ToolsTile extends StatelessWidget {
  const ToolsTile({
    Key? key,
    required this.isAcheived,
    required this.label,
  }) : super(key: key);

  final bool isAcheived;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          isAcheived
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                )
              : Icon(
                  Icons.circle,
                  color: Colors.teal.shade100,
                ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
