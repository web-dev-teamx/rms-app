import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sv_rms_mobile/ui/payment_details/payment_details_screen.dart';
import 'package:sv_rms_mobile/ui/view_invoice/widgets/view_invoice_tile.dart';

class ViewInvoicesScreen extends StatefulWidget {
  const ViewInvoicesScreen({Key? key, required this.isEdit}) : super(key: key);
  final bool isEdit;
  static const String route = "viewInvoice";
  @override
  _ViewInvoicesScreenState createState() => _ViewInvoicesScreenState();
}

class _ViewInvoicesScreenState extends State<ViewInvoicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                title: Text(
                  widget.isEdit ? "Edit Invoice" : "Invoice Details",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ViewInvoicesScreen(
                            isEdit: true,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  )
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const ViewInvoiceTile(
                        label: "Project Name",
                        description: "NIC Card Replacement 13 Oct France",
                      ),
                      const ViewInvoiceTile(
                        label: "Booking Type",
                        description: "2 Hours Without Travel",
                      ),
                      const ViewInvoiceTile(
                        label: "Task Date",
                        description: "23/10/2021",
                      ),
                      const ViewInvoiceTile(
                        label: "Task Completion Date",
                        description: "24/10/2021",
                      ),
                      const ViewInvoiceTile(
                        label: "Month",
                        description: "Oct 2021",
                      ),
                      const ViewInvoiceTile(
                        label: "Time In",
                        description: "9:00 AM",
                      ),
                      const ViewInvoiceTile(
                        label: "Time Out",
                        description: "9:00 AM",
                      ),
                      const ViewInvoiceTile(
                        label: "Actual Time",
                        description: "2 Hours",
                      ),
                      const ViewInvoiceTile(
                        label: "Booking Hour",
                        description: "2 Hours",
                      ),
                      const ViewInvoiceTile(
                        label: "Extra Hour Charges",
                        description: "70",
                      ),
                      const ViewInvoiceTile(
                        label: "Call Out Rate",
                        description: "150",
                      ),
                      const ViewInvoiceTile(
                        label: "Purchase Expense",
                        description: "None",
                      ),
                      const ViewInvoiceTile(
                        label: "Your Service Charges",
                        description: "150",
                      ),
                      const ViewInvoiceTile(
                        label: "Travel Expense",
                        description: "None",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
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
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, PaymentDetailsScreen.route);
                              },
                              child: const Text(
                                "View Payment Details",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 80,
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoButton.filled(
                      pressedOpacity: 0.9,
                      child: Text(
                        widget.isEdit ? "Save Changes" : "Send Invoice",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
