import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sv_rms_mobile/ui/invoices/invoices_store.dart';
import 'package:sv_rms_mobile/ui/invoices/widget/invoice_tile.dart';
import 'package:sv_rms_mobile/utils/app_theme.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({
    Key? key,
    required this.store,
  }) : super(key: key);

  final InvoicesScreenStore store;
  static const String route = "invoicesScreeen";
  @override
  _InvoicesScreenState createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Invoices",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.help,
              ))
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).cardColor,
            elevation: 5,
            floating: true,
            snap: true,
            toolbarHeight: 0,
            bottom: PreferredSize(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InvoiceTabWidget(
                      index: 0,
                      label: "Invoices",
                      store: widget.store,
                    ),
                    InvoiceTabWidget(
                      index: 1,
                      label: "Sent Invoices",
                      store: widget.store,
                    ),
                    InvoiceTabWidget(
                      index: 2,
                      label: "Paid Invoices",
                      store: widget.store,
                    ),
                  ],
                ),
              ),
              preferredSize: const Size(
                double.infinity,
                56,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => const InvoiceTile(),
                childCount: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InvoiceTabWidget extends StatelessWidget {
  const InvoiceTabWidget({
    Key? key,
    required this.index,
    required this.label,
    required this.store,
  }) : super(key: key);
  final int index;
  final String label;
  final InvoicesScreenStore store;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () {
          store.tabIndex = index;
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
