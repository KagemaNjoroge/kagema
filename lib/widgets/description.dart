import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Description extends StatelessWidget {
  final bool isVertical;
  final double width;
  const Description({required this.isVertical, required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isVertical ? double.infinity : width * 0.29,
      child: Column(
        crossAxisAlignment:
            isVertical ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 135,
              height: 40,
              alignment: Alignment.center,
              color: CustomColors.primary,
              child: Center(
                  child: Text('AI dev',
                      style: GoogleFonts.getFont('Days One',
                          color: Colors.black, fontSize: 10)))),
          SizedBox(height: 0.015 * width),
          Text('Coding with passion &  glee',
              style: GoogleFonts.getFont('Delius',
                  color: Colors.white, fontSize: 30)),
          const SizedBox(height: 5),
          Text('Working on the next big thing',
              style: GoogleFonts.getFont('Delius',
                  color: Colors.white, fontSize: 30)),
          const SizedBox(height: 20),
          SizedBox(
            width: isVertical ? double.infinity : width * 0.29,
            height: 90,
            child: AnimatedTextKit(
              repeatForever: true,
              pause: const Duration(seconds: 2),
              animatedTexts: [
                TyperAnimatedText("Am interested in AI and Machine Learning",
                    textAlign: isVertical ? TextAlign.center : TextAlign.start,
                    textStyle: GoogleFonts.getFont('Delius',
                        color: CustomColors.gray, fontSize: 15)),
              ],
            ),
          ),
          InkWell(
            onTap: () async => !await launchUrl(Uri.parse(
                'https://mail.google.com/mail/u/0/?fs=1&to=reecejames934@gmail.com&tf=cm')),
            child: Text("Let's chat",
                style: GoogleFonts.getFont('Delius',
                    decoration: TextDecoration.underline,
                    color: CustomColors.primary,
                    fontSize: 20)),
          )
        ],
      ),
    );
  }
}
