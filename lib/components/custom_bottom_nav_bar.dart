import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppu/routes/routes.dart';
import 'package:shoppu/enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.shop),
              onPressed: () => Navigator.pushNamed(context, home),
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.heart),
              onPressed: () {},
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.message),
              onPressed: () {},
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.userLarge),
              onPressed: () => Navigator.pushNamed(context, profile),
            ),
          ],
        ),
      ),
    );
  }
}
