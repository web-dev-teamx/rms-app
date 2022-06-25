import 'package:flutter/material.dart';
import 'package:sv_rms_mobile/utils/app_theme.dart';

class ViewInvoiceTile extends StatefulWidget {
  const ViewInvoiceTile({
    Key? key,
    required this.label,
    required this.description,
  }) : super(key: key);

  final String label, description;

  @override
  _ViewInvoiceTileState createState() => _ViewInvoiceTileState();
}

class _ViewInvoiceTileState extends State<ViewInvoiceTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        // vertical: 6,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white,
            foregroundColor: AppTheme.primaryColor,
            child: const Icon(
              Icons.description,
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: const  TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.blueGrey,
                ),
              ),
              Text(
                widget.description,
              ),
              const Divider(
                height: 12,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
