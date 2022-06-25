import 'package:flutter/material.dart';

class CustomFab extends StatefulWidget {
  const CustomFab({
    Key? key,
    required this.onTap,
    required this.isExtended,
    required this.label,
    required this.iconData,
  }) : super(key: key);
  final VoidCallback onTap;
  final bool isExtended;
  final String label;
  final IconData iconData;
  @override
  _CustomFabState createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        height: 56,
        width: !widget.isExtended ? 168 : 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Theme.of(context).primaryColor,
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCirc,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(
                widget.iconData,
                size: 18,
                color: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 44),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 120),
                  child: !widget.isExtended
                      ? Text(
                          widget.label,
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Container(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
