import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';

class Footer extends StatelessWidget {
  final double width;
  final ScrollController scrollController;
  const Footer({required this.width,required this.scrollController, Key? key}) : super(key: key);

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
              "James Njoroge",
              style: GoogleFonts.getFont('Montserrat',
                  color: Colors.greenAccent,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),

          width > Breakpoints.sm
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   Text('Copyright © 2023 Kagema Njoroge',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                  Text('All rights reserved',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                  Text('reecejames934@gmail.com',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                ],
              )
            : Column(
                children: [
                  Text('Copyright © 2023 James Njoroge',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                          const SizedBox(height: 10),
                          Text(' All rights reserved',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                  const SizedBox(height: 10),
                  Text('https://njoroge.tomorrow.co.ke',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.purple,
                          fontSize: 10)),
                          

                ],
              ),
             
        ],)
              );
  }
}
