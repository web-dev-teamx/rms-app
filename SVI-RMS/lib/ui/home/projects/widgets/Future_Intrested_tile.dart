import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';
import 'package:flutter/material.dart';
import 'package:sv_rms_mobile/model/get_projects/future_intrested_model.dart';

class FutureIntrestedTile extends StatelessWidget {
  const FutureIntrestedTile(
      {Key? key, required this.futureIntrestedModel, required this.index})
      : super(key: key);
  final FutureIntrestedModel futureIntrestedModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 4.0,
      ),
      child: Material(
        clipBehavior: Clip.hardEdge,
        shape: SquircleBorder(radius: BorderRadius.circular(24.0)),
        child: InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => IntrestedProjectDetailsScreen(
            //         project: futureIntrestedModel, active_index: index),
            //   ),
            // );
            // Navigator.push(context, ProjectDetailsScreen.route);
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        futureIntrestedModel.data?[index].projectName ??
                            "No Name",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blueGrey,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                        child: Text(
                          "Break-Fix",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 12,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      futureIntrestedModel.data![index].startDateTime ??
                          "No Time",
                      // ": 2021-09-14T09:00",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                    const VerticalDivider(),
                    Text(
                      futureIntrestedModel.data![index].endDateTime ??
                          "No End Data Available",
                      // "Ends: 2021-09-14T17:00",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.my_location_outlined,
                      size: 14,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        futureIntrestedModel.data![index].location ??
                            "No Location",
                        // "Location: Épagny-Metz-Tessy, France",
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.timer,
                      size: 14,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      futureIntrestedModel.data![index].startDateTime ??
                          "No Date Available",
                      // "Duation: Minimum two hours",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.engineering_outlined,
                      size: 14,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "No Skill Available",
                      // "Skills: Level-1 Technician",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_add_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                      label: const Text(
                        "Interested",
                        // "",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => BidNowScreen(
                        //       project: project,
                        //     ),
                        //   ),
                        // );
                      },
                      icon: const Icon(
                        Icons.rate_review,
                        color: Colors.white,
                        size: 18,
                      ),
                      label: const Text(
                        "Bid Now",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
