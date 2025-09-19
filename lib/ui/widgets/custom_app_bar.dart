import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final double height;
  const CustomAppBar({
    super.key,
    required this.title,
    this.height = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      toolbarHeight: height,
      titleSpacing: 2,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        side: BorderSide(color: theme.colorScheme.primary, width: 2),
      ),
      backgroundColor: theme.colorScheme.primary,
      centerTitle: true,
      elevation: 12,
      title: title,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
