import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Const/color_theme.dart';
import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leading;
  final IconData trailing;
  final Function() onPressed;
  const CustomListTile({
    Key? key,
    required this.title,
    this.subtitle = '',
    required this.leading,
    this.trailing = IconlyLight.arrowRight2,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = ColorTheme(context).color;
    return ListTile(
      onTap: onPressed,
      leading: Icon(leading),
      title: CustomText(
isTitle: true,
        title: title,
        color: color,
        fontSize: 22.sp,
      ),
      subtitle: Text(subtitle),
      trailing: Icon(trailing),
    );
  }
}
