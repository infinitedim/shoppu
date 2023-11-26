import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppu/size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  final IconData? icon;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(12),
        ),
        child: FaIcon(icon ?? FontAwesomeIcons.exclamation),
      ),
    );
  }
}
