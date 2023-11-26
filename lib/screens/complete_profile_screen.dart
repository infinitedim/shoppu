import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppu/components/default_button.dart';
import 'package:shoppu/components/form_error.dart';
import 'package:shoppu/constants.dart';
import 'package:shoppu/size_config.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text("Complete Profile", style: headingStyle),
                const Text(
                  "Complete your details or continue  \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                const CompleteProfileForm(),
                SizedBox(height: getProportionateScreenHeight(30)),
                Text(
                  "By continuing your confirm that you agree \nwith our Term and Condition",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            onSaved: (newValue) => firstName = newValue,
            onChanged: (value) {},
            decoration: InputDecoration(
              labelText: "First Name",
              hintText: "Enter your first name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: const FaIcon(FontAwesomeIcons.person),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          TextFormField(
            onSaved: (newValue) => lastName = newValue,
            decoration: InputDecoration(
              labelText: "Last Name",
              hintText: "Enter your last name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: const FaIcon(FontAwesomeIcons.person),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            onSaved: (newValue) => phoneNumber = newValue,
            onChanged: (value) {},
            decoration: InputDecoration(
              labelText: "Phone Number",
              hintText: "Enter your phone number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: const FaIcon(FontAwesomeIcons.phone),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          TextFormField(
            onSaved: (newValue) => address = newValue,
            onChanged: (value) {},
            decoration: InputDecoration(
              labelText: "Address",
              hintText: "Enter your phone address",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: const FaIcon(FontAwesomeIcons.locationDot),
              ),
            ),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          CustomButton(
            text: "continue",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
