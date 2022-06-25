import 'package:flutter/material.dart';
import 'package:sv_rms_mobile/ui/home/notifications/widgets/notification_tile.dart';
import 'package:sv_rms_mobile/utils/icons/custom_icons_icons.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "New",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => const NotificationsTile(
              label: "New Project Posted",
              description:
                  "Three days Support - FE required in Cologne Germany - 2 10 and 13 Dec",
              timeStamp: "2021-12-01 15:56:53",
              iconData: CustomIcons.fi_rr_shuffle,
            ),
            childCount: 3,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Older",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => const NotificationsTile(
              label: "New Project Posted",
              description:
                  "Three days Support - FE required in Cologne Germany - 2 10 and 13 Dec",
              timeStamp: "2021-12-01 15:56:53",
              iconData: Icons.design_services,
            ),
            childCount: 8,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_downward_rounded,
                    size: 18.0,
                    
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Load More",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
