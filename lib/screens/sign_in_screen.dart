// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppu/components/default_button.dart';
import 'package:shoppu/components/no_account_text.dart';
import 'package:shoppu/enums.dart';
import 'package:shoppu/routes/routes.dart';
import 'package:shoppu/service/auth.dart';
import 'package:shoppu/size_config.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordHide = true;

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "Welcome Back",
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          emailController.text = value;
                        });
                      },
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter your email",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        prefixIcon: Container(
                          padding: const EdgeInsets.only(left: 15, top: 10),
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
                          margin: const EdgeInsets.only(top: 10.0, left: 15.0),
                          child: const FaIcon(
                            FontAwesomeIcons.lock,
                          ),
                        ),
                        suffixIcon: IconButton(
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
                    SizedBox(height: getProportionateScreenHeight(30)),
                    Row(
                      children: <Widget>[
                        const Spacer(),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, forgotPassword),
                          child: Text(
                            "Forgot Password",
                            style: GoogleFonts.inter(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    CustomButton(
                      text: "Login",
                      onPressed: () async {
                        final status = await AuthService().signIn(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        if (status == AuthStatus.successful) {
                          Navigator.pushNamed(context, loginSuccess);
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              const NoAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
