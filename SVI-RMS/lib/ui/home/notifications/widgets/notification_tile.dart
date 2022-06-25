import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';
import 'package:flutter/material.dart';
import 'package:sv_rms_mobile/utils/app_theme.dart';

class NotificationsTile extends StatelessWidget {
  const NotificationsTile({
    Key? key,
    required this.label,
    required this.description,
    required this.timeStamp,
    required this.iconData,
  }) : super(key: key);

  final String label;
  final String description;
  final String timeStamp;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 4.0,
      ),
      child: Material(
        shape: SquircleBorder(radius: BorderRadius.circular(18.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                child: Icon(iconData, size: 18,),
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
              ),
              const SizedBox(width: 8.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      endIndent: 24,
                      height: 8,
                    ),
                    Text(
                      description,
                      style: const TextStyle(),
                    ),
                    Text(
                      timeStamp,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
