import 'package:flutter/material.dart';

class MydrawerTiles extends StatelessWidget {
  final String tileName;
  final IconData icon;
  final void Function()? onTap;
  const MydrawerTiles({
    super.key,
    required this.tileName,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tileName),
      leading: Icon(icon),
      onTap: onTap,
    );
  }
}
