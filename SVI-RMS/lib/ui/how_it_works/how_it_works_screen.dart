import 'package:flutter/material.dart';

class HowItWorksScreen extends StatefulWidget {
  const HowItWorksScreen({Key? key}) : super(key: key);
  static const String route = "howItWorks";
  @override
  _HowItWorksScreenState createState() => _HowItWorksScreenState();
}

class _HowItWorksScreenState extends State<HowItWorksScreen> {
  late TransformationController _controller;
  double zoomValue = 1;
  int pageNo = 1;
  @override
  void initState() {
    _controller = TransformationController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "How it Works",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: InteractiveViewer(
              transformationController: _controller,
              child: Image.asset("assets/howItWorks/$pageNo.png"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (pageNo > 1) {
                          setState(() {
                            pageNo--;
                          });
                        }
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                         if (pageNo < 3) {
                          setState(() {
                            pageNo++;
                          });
                        }
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                    const VerticalDivider(
                      endIndent: 30,
                      indent: 30,
                      color: Colors.grey,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (zoomValue < 4) {
                          setState(() {
                            zoomValue++;
                          });
                          _controller.value = Matrix4.identity()
                            ..scale(zoomValue);
                        }
                      },
                      child: const Icon(
                        Icons.zoom_in_rounded,
                        color: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (zoomValue > 1) {
                          setState(() {
                            zoomValue--;
                          });
                          _controller.value = Matrix4.identity()
                            ..scale(zoomValue);
                        }
                      },
                      child: const Icon(
                        Icons.zoom_out_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
