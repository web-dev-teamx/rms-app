import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sv_rms_mobile/blocs/services_bloc.dart';
import 'package:sv_rms_mobile/model/get_projects/future_intrested_model.dart';
import 'package:sv_rms_mobile/model/get_projects/get_ActiveProjects_model.dart';
import 'package:sv_rms_mobile/model/get_projects/get_CompletedProjects_model.dart';
import 'package:sv_rms_mobile/model/get_projects/get_IntrestedProject_model.dart';
import 'package:sv_rms_mobile/model/get_projects/project.dart';
import 'package:sv_rms_mobile/ui/home/projects/project_screen_store.dart';
import 'package:sv_rms_mobile/ui/home/projects/widgets/ActiveProject_tile.dart';
import 'package:sv_rms_mobile/ui/home/projects/widgets/CompletedProject_tile.dart';
import 'package:sv_rms_mobile/ui/home/projects/widgets/Future_Intrested_tile.dart';
import 'package:sv_rms_mobile/ui/home/projects/widgets/IntrestedProject_tile.dart';
import 'package:sv_rms_mobile/ui/home/projects/widgets/project_tile.dart';
import 'package:sv_rms_mobile/utils/app_theme.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key, required this.store}) : super(key: key);
  final ProjectScreenStore store;
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);

    controller!.addListener(() {
      setState(() {
        selectedIndex = controller!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ServicesBloc>(builder: (context, value, _) {
      return FutureBuilder<List<Project>>(
        future: value.getProject("195"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size(
                  double.infinity,
                  56,
                ),
                child: DefaultTabController(
                  length: 4,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 10, right: 10),
                    color: Colors.white,
                    child: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.white,
                        labelPadding: const EdgeInsets.only(
                          left: 2,
                        ),
                        indicatorPadding: EdgeInsets.zero,
                        labelStyle:
                            const TextStyle(fontSize: 14, color: Colors.white),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(22), // Creates border
                            color: AppTheme.primaryColor),
                        controller: controller,
                        tabs: [
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Colors.grey.withOpacity(0.2)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('New Projects'),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Colors.grey.withOpacity(0.2)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Active Projects'),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Colors.grey.withOpacity(0.2)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Completed Projects'),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Colors.grey.withOpacity(0.2)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Interested Projects'),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Colors.grey.withOpacity(0.2)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Interested In Future'),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              body: TabBarView(
                controller: controller,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            final Project _project = snapshot.data![index];
                            return ProjectTile(
                              project: _project,
                            );
                          })),
                  //////getActiveProject//////////
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: FutureBuilder<GetActiveProjectModel>(
                          future: value.getActiveProjects("195"),
                          builder: (context, snapShot) {
                            if (snapShot.hasData) {
                              return ListView.builder(
                                  itemCount: snapshot.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final GetActiveProjectModel
                                        getActiveProjectModel = snapShot.data!;

                                    return ActiveProjectTile(
                                        getActiveProjectModel:
                                            getActiveProjectModel,
                                        index: index);
                                  });
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          })),
                  ////////////////getCompletedProject///////////

                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: FutureBuilder<GetCompletedProjectModel>(
                          future: value.getCompletedProjects("195"),
                          builder: (context, snapShot) {
                            if (snapShot.hasData) {
                              return ListView.builder(
                                  itemCount: snapshot.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final GetCompletedProjectModel
                                        getCompletedProjectModel =
                                        snapShot.data!;

                                    return CompletedProjectTile(
                                        getCompletedProjectModel:
                                            getCompletedProjectModel,
                                        index: index);
                                  });
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          })),
                  ///////////get intrested Project///////////////////
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: FutureBuilder<IntrestedProjectModel>(
                          future: value.getIntrestProjects("195"),
                          builder: (context, snapShot) {
                            if (snapShot.hasData) {
                              return ListView.builder(
                                  itemCount: snapShot.data?.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final IntrestedProjectModel?
                                        intrestedProjectModel = snapShot.data;

                                    return intrestedProjectModel != null
                                        ? IntrestedProjectTile(
                                            intrestedProjectModel:
                                                intrestedProjectModel,
                                            index: index)
                                        : Container();
                                  });
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          })),

                  //////Future Intrested Project/////////
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: FutureBuilder<FutureIntrestedModel>(
                          future: value.getFutureIntrestProjects("195"),
                          builder: (context, snapShot) {
                            if (snapShot.hasData) {
                              return ListView.builder(
                                  itemCount: snapShot.data?.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final FutureIntrestedModel?
                                        futureIntrestedModel = snapShot.data;

                                    return futureIntrestedModel != null
                                        ? FutureIntrestedTile(
                                            futureIntrestedModel:
                                                futureIntrestedModel,
                                            index: index)
                                        : Container();
                                  });
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          })),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    });
  }
}

class ProjectTabWidget extends StatelessWidget {
  const ProjectTabWidget({
    Key? key,
    required this.index,
    required this.label,
    required this.store,
  }) : super(key: key);
  final int index;
  final String label;
  final ProjectScreenStore store;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () {
          // store.tabIndex = index;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
          decoration: BoxDecoration(
            color: index == store.tabIndex
                ? AppTheme.primaryColor
                : Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30),
          ),
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 100),
            style: TextStyle(
              color: index == store.tabIndex ? Colors.white : Colors.grey,
              fontWeight:
                  index == store.tabIndex ? FontWeight.bold : FontWeight.normal,
            ),
            child: Text(
              label,
            ),
          ),
        ),
      );
    });
  }
}
