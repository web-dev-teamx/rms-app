import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sv_rms_mobile/model/get_projects/project.dart';
import 'package:sv_rms_mobile/utils/app_theme.dart';

class BidNowScreen extends StatefulWidget {
  const BidNowScreen({
    Key? key,
    required this.project,
  }) : super(key: key);

  static const String route = "bidNow";
  final Project project;

  @override
  _BidNowScreenState createState() => _BidNowScreenState();
}

class _BidNowScreenState extends State<BidNowScreen> {
  String icValue = "None";
  List<String> icList = [
    "None",
    "IC Approved",
    "IC Germany",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Bid Now",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // actions: [
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.help,
        //   ),
        // )
        // ],
      ),
      body: Stack(
        children: [
          CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: Theme.of(context).cardColor,
                elevation: 5,
                floating: true,
                snap: true,
                toolbarHeight: 0,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text(
                            "Project Details",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ProjectDetailTile(
                            label: "Project Name",
                            description: widget
                                    .project.projectDetail!.projectName ??
                                "Rack and Cable Installation - Kerpen, Germany - 10th Dec",
                          ),
                          ProjectDetailTile(
                            label: "Project Number:",
                            description:
                                widget.project.projectDetail!.id ?? "971",
                          ),
                          ProjectDetailTile(
                            label: "Project Type:",
                            description:
                                widget.project.projectDetail!.retainerType ??
                                    "T&M",
                          ),
                          ProjectDetailTile(
                            label: "Project Category:",
                            description:
                                widget.project.projectDetail!.category ??
                                    "Break-Fix",
                          ),
                          ProjectDetailTile(
                            label: "End Client Location:",
                            description:
                                widget.project.projectDetail!.clientLocation ??
                                    "Kerpen, Germany",
                          ),
                          const ProjectDetailTile(
                            label: "Language Required:",
                            description: "  ",
                          ),
                          const ProjectDetailTile(
                            label: "No of FEs Required:",
                            description: "2",
                          ),
                          ProjectDetailTile(
                              label: "Booking Type:",
                              description:
                                  widget.project.projectDetail!.retainerType ??
                                      "Hourly - Without Travel"),
                          ProjectDetailTile(
                            label: "Start / End Date / Time:",
                            description:
                                widget.project.projectDetail!.startDateTime! +
                                    ("     ") +
                                    (widget.project.projectDetail!.endDateTime)
                                        .toString(),
                            // "2021-12-10T09:00 2021-12-10T11:00",
                          ),
                          const ProjectDetailTile(
                            label: "Duration:",
                            description: "2 hours",
                            isLast: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Material(
                    elevation: 12,
                    shadowColor: Colors.white24,
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.teal.shade100
                        : Colors.teal.shade900,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Note : Fill these fields accordingly in case you want to work yourself on this project as a Technician.",
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.teal.shade900
                                  : Colors.teal.shade100,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const BidPramsTile(
                isRemoveable: false,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Material(
                    elevation: 12,
                    shadowColor: Colors.white24,
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.teal.shade100
                        : Colors.teal.shade900,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Note : Select a Tech from your approved Technicians List. In case you have a New Technician which is not in the list, please go to Manage Technicians.",
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.teal.shade900
                                  : Colors.teal.shade100,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: const Text(
                          "Add More Technicians",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      CupertinoSwitch(
                        value: true,
                        onChanged: (cvalue) {},
                      ),
                    ],
                  ),
                ),
              ),
              const BidPramsTile(isRemoveable: true),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: DropdownButton<String>(
                              itemHeight: 72,
                              icon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_drop_down),
                              ),
                              alignment: Alignment.centerLeft,
                              elevation: 1,
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(4),
                              onChanged: (cValue) {
                                setState(() {
                                  icValue = cValue!;
                                });
                              },
                              underline: Container(
                                height: 64,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(0.6),
                                    ),
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              value: icValue,
                              hint: const Text("Payment Type"),
                              items: icList.map(
                                (String item) {
                                  return DropdownMenuItem<String>(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height: 56,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(item),
                                      ),
                                    ),
                                    value: item,
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            label: const Text(
                              "ADD IC",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 96,
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoButton.filled(
                      pressedOpacity: 0.9,
                      child: const Text(
                        "Bid Now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
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

class BidPramsTile extends StatefulWidget {
  const BidPramsTile({
    Key? key,
    required this.isRemoveable,
  }) : super(key: key);

  final bool isRemoveable;

  @override
  _BidPramsTileState createState() => _BidPramsTileState();
}

class _BidPramsTileState extends State<BidPramsTile> {
  late TextEditingController callOutRateController;
  late TextEditingController additionalHourRateController;
  late TextEditingController travelExpenseController;
  late TextEditingController purchaseExpenseController;
  late TextEditingController bidDescriptionController;
  String paymentTypeValue = "All payments to my account";
  List<String> paymentOptions = [
    "All payments to my account",
    "To me & Tech Separately"
  ];

  @override
  void initState() {
    super.initState();
    callOutRateController = TextEditingController();
    additionalHourRateController = TextEditingController();
    travelExpenseController = TextEditingController();
    purchaseExpenseController = TextEditingController();
    bidDescriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            widget.isRemoveable
                ? Divider(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black54
                        : Colors.white54,
                  )
                : Container(),
            widget.isRemoveable
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: const Text(
                            "Remove \nThis IC",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Remove",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(height: 24),
            DropdownButton<String>(
              itemHeight: 72,
              alignment: Alignment.centerLeft,
              elevation: 1,
              isExpanded: false,
              borderRadius: BorderRadius.circular(4),
              onChanged: (cValue) {
                setState(() {
                  paymentTypeValue = cValue!;
                });
              },
              underline: Container(
                height: 64,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.6),
                    ),
                    borderRadius: BorderRadius.circular(6)),
              ),
              value: paymentTypeValue,
              hint: const Text("Payment Type"),
              items: paymentOptions.map(
                (String item) {
                  return DropdownMenuItem<String>(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 56,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(item),
                      ),
                    ),
                    value: item,
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 8),
            paymentTypeValue == "To me & Tech Separately" && widget.isRemoveable
                ? Column(
                    children: [
                      TextField(
                        controller: callOutRateController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text("My Service Charges %"),
                          hintText:
                              "Call out rate is as per the booking type mentioned ablove",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: callOutRateController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text("Technician Service Charges %"),
                          hintText:
                              "Call out rate is as per the booking type mentioned ablove",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  )
                : Container(),
            TextField(
              controller: callOutRateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text("Call Out Rate"),
                hintText:
                    "Call out rate is as per the booking type mentioned ablove",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: additionalHourRateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text("Additional Hour Rate"),
                hintText: "Pay per hour if activity exceed call out time",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: const Text(
                    "Choose Travel & Purchase Expense",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                CupertinoSwitch(
                  value: true,
                  onChanged: (cvalue) {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: travelExpenseController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text("Travel Expense Rate"),
                hintText: "Only applicable in genuine and approved cases",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: purchaseExpenseController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text("Purchase Expense Rate"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: bidDescriptionController,
              maxLines: null,
              minLines: null,
              decoration: const InputDecoration(
                label: Text("Describe Your Bid"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class ProjectDetailTile extends StatelessWidget {
  const ProjectDetailTile({
    Key? key,
    required this.label,
    required this.description,
    this.isLast,
  }) : super(key: key);
  final String label, description;
  final bool? isLast;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        isLast ?? true ? const Divider(height: 12) : Container()
      ],
    );
  }
}
