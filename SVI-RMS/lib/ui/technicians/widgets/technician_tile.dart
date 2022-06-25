import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';
import 'package:flutter/material.dart';
import 'package:sv_rms_mobile/model/get_technicians/get_technicians_model.dart';
import 'package:sv_rms_mobile/ui/technician_details/technician_details_screen.dart';

class TechnicianTile extends StatefulWidget {
  final GetTechnicianModel? gettechnicains;
  final int index;
  const TechnicianTile(
      {Key? key, required this.gettechnicains, required this.index})
      : super(key: key);

  @override
  _TechnicianTileState createState() => _TechnicianTileState();
}

class _TechnicianTileState extends State<TechnicianTile> {
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
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TechnicianDetailsScreen(
                      getTechnician: widget.gettechnicains,
                      index: widget.index),
                ));
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color: Theme.of(context).cardColor,
                          ),
                          child: Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              color: Colors.blueGrey,
                              image: const DecorationImage(
                                image: AssetImage("assets/images/profile1.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          widget.gettechnicains?.data?[widget.index]
                                  .firstName ??
                              '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blueGrey,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                              child: Text(
                                widget.gettechnicains?.data?[widget.index]
                                            .vendorTypeId ==
                                        "2"
                                    ? 'Recruiter Consultant'
                                    : 'Individual Consultant',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          widget.gettechnicains?.data?[widget.index].city ?? '',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  height: 12,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.email,
                      size: 14,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Email:  ${widget.gettechnicains?.data?[widget.index].emailAddress}",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.phone,
                      size: 14,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Phone #:  ",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.payment_rounded,
                      size: 14,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Work Experience: ",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 18,
                    )
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
