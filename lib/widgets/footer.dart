import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/custom_colors.dart';

class Footer extends StatelessWidget {
  final double width;
  final ScrollController scrollController;
  const Footer({required this.width, required this.scrollController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: CustomColors.darkBackground,
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: GoogleFonts.getFont('Montserrat',
                  color: Colors.greenAccent,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            width > Breakpoints.sm
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Copyright © ${DateTime.now().year} $name',
                          style: GoogleFonts.getFont('Delius',
                              color: CustomColors.gray, fontSize: 14)),
                      Text('All rights reserved',
                          style: GoogleFonts.getFont('Delius',
                              color: CustomColors.gray, fontSize: 14)),
                      Text(email,
                          style: GoogleFonts.getFont('Delius',
                              color: CustomColors.gray, fontSize: 14)),
                    ],
                  )
                : Column(
                    children: [
                      Text('Copyright © ${DateTime.now().year} $name',
                          style: GoogleFonts.getFont('Delius',
                              color: CustomColors.gray, fontSize: 14)),
                      const SizedBox(height: 10),
                      Text(' All rights reserved',
                          style: GoogleFonts.getFont('Delius',
                              color: CustomColors.gray, fontSize: 14)),
                      const SizedBox(height: 10),
                      Text(email,
                          style: GoogleFonts.getFont('Delius',
                              color: CustomColors.purple, fontSize: 10)),
                    ],
                  ),
          ],
        ));
  }
}
