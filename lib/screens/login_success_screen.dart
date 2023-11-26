import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppu/components/default_button.dart';
import 'package:shoppu/routes/routes.dart';
import 'package:shoppu/size_config.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // SizedBox(height: SizeConfig.screenHeight * 0.04),
          const Spacer(),
          Image.asset(
            "assets/success.png",
            height: SizeConfig.screenHeight * 0.4,
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text(
            "Login Success",
            style: GoogleFonts.inter(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: CustomButton(
              text: "Back to home",
              onPressed: () {
                Navigator.pushNamed(context, home);
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
