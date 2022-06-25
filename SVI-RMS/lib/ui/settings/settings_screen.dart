import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sv_rms_mobile/app/config_store.dart';
import 'package:sv_rms_mobile/ui/home/profile/profile_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const String route = "settings";
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final ConfigStore _configStore;
  late bool darkMode;
  @override
  void initState() {
    super.initState();
    _configStore = Provider.of<ConfigStore>(context, listen: false);
    darkMode = _configStore.isDarkMode ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text(
              "App Settings",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  ProfileTile(
                    title: "Dark mode",
                    onTap: () {},
                    icon: Icons.nightlight_round,
                    trailing: CupertinoSwitch(
                      value: darkMode,
                      onChanged: (change) {
                        setState(() {
                          darkMode = change;
                        });
                        _configStore.setThemeMode(change);
                      },
                    ),
                  ),
                  const Divider(height: 1),
                  ProfileTile(
                    title: "Rate App",
                    onTap: () {},
                    icon: Icons.rate_review,
                  ),
                  const Divider(height: 1),
                  ProfileTile(
                    title: "Privacy Policy",
                    onTap: () {},
                    icon: Icons.privacy_tip_rounded,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
