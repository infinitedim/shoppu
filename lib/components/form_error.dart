import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shoppu/size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length, (index) {
        return Row(
          children: <Widget>[
            const FaIcon(
              FontAwesomeIcons.circleExclamation,
            ),
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            Text(
              errors[index] ?? '',
              style: GoogleFonts.inter(fontWeight: FontWeight.normal),
            ),
          ],
        );
      }),
    );
  }
}
