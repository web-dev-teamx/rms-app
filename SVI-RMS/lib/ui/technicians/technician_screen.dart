import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sv_rms_mobile/blocs/services_bloc.dart';
import 'package:sv_rms_mobile/model/get_technicians/get_technicians_model.dart';
import 'package:sv_rms_mobile/ui/add_technician/add_technician_screen.dart';
import 'package:sv_rms_mobile/ui/technicians/technician_store.dart';
import 'package:sv_rms_mobile/ui/technicians/widgets/technician_tile.dart';
import 'package:sv_rms_mobile/utils/app_theme.dart';
import 'package:sv_rms_mobile/widgets/custom_fab.dart';

class TechniciansScreen extends StatefulWidget {
  const TechniciansScreen({
    Key? key,
    required this.store,
  }) : super(key: key);

  final TechniciansScreenStore store;
  static const String route = "techniciansScreeen";
  @override
  _TechniciansScreenState createState() => _TechniciansScreenState();
}

class _TechniciansScreenState extends State<TechniciansScreen> {
  late ScrollController controller;
  bool _isExtended = false;
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
          Navigator.pushNamed(context, AddTechniciansScreen.route);
        },
        isExtended: _isExtended,
        label: "Add Technician",
        iconData: Icons.add,
      ),
      appBar: AppBar(
        title: const Text(
          "Manage Technicians",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<ServicesBloc>(builder: (context, value, _) {
        return FutureBuilder<GetTechnicianModel>(
            future: value.getTechnicians(id: "195", vendorid: "2"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: controller,
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final GetTechnicianModel? getTechnicianModel =
                                snapshot.data;
                            return TechnicianTile(
                                gettechnicains: getTechnicianModel!,
                                index: index);
                          },
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
      }),
    );
  }
}

// class TechnicianTabWidget extends StatelessWidget {
//   const TechnicianTabWidget({
//     Key? key,
//     required this.index,
//     required this.label,
//     required this.store,
//   }) : super(key: key);
//   final int index;
//   final String label;
//   final TechniciansScreenStore store;
//   @override
//   Widget build(BuildContext context) {
//     return Observer(builder: (context) {
//       return GestureDetector(
//         onTap: () {
//           store.tabIndex = index;
//         },
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 400),
//           curve: Curves.ease,
//           decoration: BoxDecoration(
//             color: index == store.tabIndex
//                 ? AppTheme.primaryColor
//                 : Colors.grey.withOpacity(0.2),
//             borderRadius: BorderRadius.circular(30),
//           ),
//           margin: const EdgeInsets.all(8.0),
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           child: AnimatedDefaultTextStyle(
//             duration: const Duration(milliseconds: 100),
//             style: TextStyle(
//               color: index == store.tabIndex ? Colors.white : Colors.grey,
//               fontWeight:
//                   index == store.tabIndex ? FontWeight.bold : FontWeight.normal,
//             ),
//             child: Text(
//               label,
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
