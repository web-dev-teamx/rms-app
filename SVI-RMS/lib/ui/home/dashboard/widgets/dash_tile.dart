import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class DashTile extends StatefulWidget {
  const DashTile({
    Key? key,
    required this.alignmentGeometry,
    required this.color,
    required this.label,
    required this.amount,
  }) : super(key: key);
  final AlignmentGeometry alignmentGeometry;
  final Color? color;
  final String label;
  final String amount;
  @override
  _DashTileState createState() => _DashTileState();
}

class _DashTileState extends State<DashTile> {
  double _height = 10;
  double _width = 10;
  bool _show = false;

  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        setState(() {
          _height = 100;
          _width = (MediaQuery.of(context).size.width / 2) - 16;
        });
      },
    );
    Future.delayed(
      const Duration(milliseconds: 600),
      () {
        setState(() {
          _show = true;
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width / 2,
      child: Stack(
        children: [
          Align(
            alignment: widget.alignmentGeometry,
            child: GestureDetector(
              onTap: () {},
              child: AnimatedContainer(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.all(12),
                duration: const Duration(milliseconds: 1200),
                curve: Sprung.criticallyDamped,
                height: _height,
                width: _width,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: _show
                      ? Stack(
                          children: [
                            const Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.amount,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    widget.label,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
