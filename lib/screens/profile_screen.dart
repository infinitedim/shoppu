// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppu/components/custom_bottom_nav_bar.dart';
import 'package:shoppu/constants.dart';
import 'package:shoppu/enums.dart';
import 'package:shoppu/routes/routes.dart';
import 'package:shoppu/service/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: <Widget>[
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: FontAwesomeIcons.user,
              onPressed: () {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: FontAwesomeIcons.bell,
              onPressed: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: FontAwesomeIcons.gears,
              onPressed: () {
                Navigator.pushNamed(context, completeProfile);
              },
            ),
            ProfileMenu(
              text: "Help Center",
              icon: FontAwesomeIcons.circleQuestion,
              onPressed: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: FontAwesomeIcons.arrowRightFromBracket,
              onPressed: () async {
                final status = await AuthService().signOut();

                if (status == AuthStatus.successful) {
                  Navigator.pushReplacementNamed(context, login);
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
            FaIcon(
              icon,
              color: kPrimaryColor,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: <Widget>[
          FirebaseAuth.instance.currentUser?.photoURL == null
              ? const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/default_user.png',
                  ),
                )
              : CircleAvatar(
                  backgroundImage: NetworkImage(
                    FirebaseAuth.instance.currentUser?.photoURL ?? '',
                  ),
                ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: const FaIcon(FontAwesomeIcons.camera),
              ),
            ),
          )
        ],
      ),
    );
  }
}
