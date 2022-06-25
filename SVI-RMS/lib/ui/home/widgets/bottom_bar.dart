import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sv_rms_mobile/utils/app_theme.dart';
import 'package:sv_rms_mobile/utils/icons/custom_filled_icons_icons.dart';
import 'package:sv_rms_mobile/utils/icons/custom_icons_icons.dart';

import '../home_store.dart';

class TALBottomBar extends StatefulWidget {
  final HomeScreenStore homeScreenStore;

  const TALBottomBar({
    Key? key,
    required this.homeScreenStore,
  }) : super(key: key);
  @override
  _TALBottomBarState createState() => _TALBottomBarState();
}

class _TALBottomBarState extends State<TALBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Theme.of(context).shadowColor.withOpacity(0.15),
          ),
        ],
      ),
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Material(
        type: MaterialType.transparency,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TALBBarIcon(
              title: "Dashboard",
              iconData: CustomIcons.fi_rr_subtitles,
              selectedIcon: CustomFilledIcons.fi_sr_subtitles,
              index: 0,
              homeScreenStore: widget.homeScreenStore,
            ),
            TALBBarIcon(
              title: "Projects",
              iconData: CustomIcons.fi_rr_shield_plus,
              selectedIcon: CustomFilledIcons.fi_sr_shield_plus,
              index: 1,
              homeScreenStore: widget.homeScreenStore,
            ),
            TALBBarIcon(
              title: "Bids",
              iconData: CustomIcons.fi_rr_notebook,
              selectedIcon: CustomFilledIcons.fi_sr_notebook,
              index: 2,
              homeScreenStore: widget.homeScreenStore,
            ),
            TALBBarIcon(
              title: "Profile",
              iconData: CustomIcons.fi_rr_user,
              selectedIcon: CustomIcons.fi_rr_user,
              index: 3,
              homeScreenStore: widget.homeScreenStore,
            ),
          ],
        ),
      ),
    );
  }
}

class TALBBarIcon extends StatefulWidget {
  final int index;
  final String title;
  final IconData iconData;
  final IconData selectedIcon;
  final HomeScreenStore homeScreenStore;

  const TALBBarIcon({
    Key? key,
    required this.title,
    required this.iconData,
    required this.selectedIcon,
    required this.index,
    required this.homeScreenStore,
  }) : super(key: key);
  @override
  _TALBBarIconState createState() => _TALBBarIconState();
}

class _TALBBarIconState extends State<TALBBarIcon> {
  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      height: 65,
      child: Observer(builder: (context) {
        return InkResponse(
          onTap: () {
            widget.homeScreenStore.homeIndex = widget.index;
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: widget.index == widget.homeScreenStore.homeIndex
                    ? Icon(
                        widget.selectedIcon,
                        key: const Key("selected"),
                        color:  AppTheme.primaryColor,
                        // size: 22,
                      )
                    : Icon(
                        widget.iconData,
                        key: const Key("unselected"),
                        color: Colors.grey.withOpacity(0.7),
                      ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: widget.index == widget.homeScreenStore.homeIndex
                      ?  AppTheme.primaryColor
                      : Colors.grey.withOpacity(0.7),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
