import 'package:drone/core/core.dart';
import 'package:flutter/material.dart';

class DroneAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DroneAppBar({
    super.key,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.leading,
    this.title,
    this.backgroundColor = Colors.white,
  });

  final Widget? leading;
  final Widget? title;
  final Widget? flexibleSpace;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.canPop ?? false;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: AppBar(
        backgroundColor: backgroundColor,
        titleTextStyle: context.headline5,
        flexibleSpace: flexibleSpace,
        title: title,
        elevation: 0,
        leading: canPop && leading == null ? const DroneBackBtn() : leading,
        actions: actions,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        bottom == null
            ? kToolbarHeight
            : kToolbarHeight + bottom!.preferredSize.height,
      );

}
