import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class ShortcutsOverlayMenu extends StatefulWidget {
  const ShortcutsOverlayMenu(
      {Key? key, required this.controller, required this.onTap})
      : super(key: key);
  final AnimationController controller;
  final VoidCallback onTap;
  @override
  _ShortcutsOverlayMenuState createState() => _ShortcutsOverlayMenuState();
}

class _ShortcutsOverlayMenuState extends State<ShortcutsOverlayMenu>
    with SingleTickerProviderStateMixin {
  late SequenceAnimation animation;
  @override
  void initState() {
    animation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0.0, end: 60)
              .chain(CurveTween(curve: Curves.ease)),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 400),
          tag: 'bgBlur',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0.0, end: 0.3)
              .chain(CurveTween(curve: Curves.ease)),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 400),
          tag: 'bgOpacity',
        )
        .animate(widget.controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedBuilder(
        animation: widget.controller,
        builder: (context, _animation) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: animation['bgBlur'].value,
              sigmaY: animation['bgBlur'].value,
            ),
            child: GestureDetector(
              onTap: widget.onTap,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black.withOpacity(animation['bgOpacity'].value)
                      : Colors.white.withOpacity(animation['bgOpacity'].value),
                ),
                child: Center(
                  child: GridView(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    children: const [
                      OverlayIcon(
                        title: "Leave Request",
                        iconData: Icons.time_to_leave,
                        delayInMilisecond: 20,
                      ),
                      OverlayIcon(
                        title: "Leave Request",
                        iconData: Icons.time_to_leave,
                        delayInMilisecond: 20,
                      ),
                      OverlayIcon(
                        title: "Leave Request",
                        iconData: Icons.time_to_leave,
                        delayInMilisecond: 20,
                      ),
                      OverlayIcon(
                        title: "Leave Request",
                        iconData: Icons.time_to_leave,
                        delayInMilisecond: 20,
                      ),
                      OverlayIcon(
                        title: "Leave Request",
                        iconData: Icons.time_to_leave,
                        delayInMilisecond: 20,
                      ),
                      OverlayIcon(
                        title: "Leave Request",
                        iconData: Icons.time_to_leave,
                        delayInMilisecond: 20,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class OverlayIcon extends StatefulWidget {
  const OverlayIcon({
    Key? key,
    required this.title,
    required this.iconData,
    required this.delayInMilisecond,
  }) : super(key: key);
  final String title;
  final IconData iconData;
  final int delayInMilisecond;
  @override
  _OverlayIconState createState() => _OverlayIconState();
}

class _OverlayIconState extends State<OverlayIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SequenceAnimation _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _animation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.elasticOut)),
          from: Duration(milliseconds: 0 + widget.delayInMilisecond),
          to: Duration(milliseconds: 1500 + widget.delayInMilisecond),
          tag: "scale",
        )
        .animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, animation) {
          return Transform.scale(
            scale: _animation["scale"].value,
            child: Column(
              children: [
                Material(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(30.0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      widget.iconData,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(widget.title),
              ],
            ),
          );
        });
  }
}
