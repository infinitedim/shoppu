// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppu/components/default_button.dart';
import 'package:shoppu/constants.dart';
import 'package:shoppu/enums.dart';
import 'package:shoppu/routes/routes.dart';
import 'package:shoppu/service/auth.dart';
import 'package:shoppu/size_config.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 16),
              Text("Register Account", style: headingStyle),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              const SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Text(
                'By continuing your confirm that you agree \nwith our Term and Condition',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Have an Account?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, login);
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPasswordHide = true;
  bool isConfirmPasswordHide = true;

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          onChanged: (value) {
            setState(() {
              emailController.text = value;
            });
          },
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Container(
              padding: const EdgeInsets.only(top: 10.0, left: 15.0),
              child: const FaIcon(FontAwesomeIcons.envelope),
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(30),
        ),
        TextFormField(
          obscureText: isPasswordHide ? true : false,
          onChanged: (value) {
            setState(() {
              passwordController.text = value;
            });
          },
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Container(
              padding: const EdgeInsets.only(top: 10.0, left: 15.0),
              child: const FaIcon(FontAwesomeIcons.lock),
            ),
            suffixIcon: Container(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordHide = !isPasswordHide;
                  });
                },
                icon: FaIcon(
                  isPasswordHide
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(30)),
        TextFormField(
          obscureText: isConfirmPasswordHide ? true : false,
          onChanged: (value) {
            setState(() {
              confirmPasswordController.text = value;
            });
          },
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          controller: confirmPasswordController,
          decoration: InputDecoration(
            labelText: "Confirm Password",
            hintText: "Re-enter your password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Container(
              padding: const EdgeInsets.only(top: 10.0, left: 15.0),
              child: const FaIcon(FontAwesomeIcons.lock),
            ),
            suffixIcon: Container(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: FaIcon(
                  isConfirmPasswordHide
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                ),
                onPressed: () {
                  setState(() {
                    isConfirmPasswordHide = !isConfirmPasswordHide;
                  });
                },
              ),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(40)),
        CustomButton(
          text: "Register",
          onPressed: () async {
            if (passwordController.text == confirmPasswordController.text) {
              final status = await AuthService().signUp(
                email: emailController.text,
                password: passwordController.text,
              );
              if (status == AuthStatus.successful) {
                FocusScope.of(context).unfocus();
                Navigator.pushReplacementNamed(context, loginSuccess);
              }
            }
            if (passwordController.text != confirmPasswordController.text) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Password Tidak Sesuai',
                    style: GoogleFonts.inter(fontWeight: FontWeight.normal),
                  ),
                  backgroundColor: Colors.red,
                  action: SnackBarAction(
                    label: 'Tutup',
                    onPressed: () {},
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
