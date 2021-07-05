import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:unicons/unicons.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    required this.name,
    Key? key,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) => Container(
        width: Get.width,
        padding: const EdgeInsets.all(16).copyWith(left: 0, bottom: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Ionicons.chevron_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    buildIcon(Icons.call),
                    const SizedBox(width: 12),
                    buildIcon(UniconsLine.ellipsis_v),
                  ],
                ),
                const SizedBox(width: 4),
              ],
            )
          ],
        ),
      );

  Widget buildIcon(IconData icon) => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.2),
        ),
        child: Icon(icon, size: 20, color: Colors.white),
      );
}
