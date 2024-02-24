import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/custom_colors.dart';

class Info extends StatelessWidget {
  final double width;
  final double ratio;
  const Info({required this.width, required this.ratio, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width * ratio),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• studying Computer Science at the University Of Nairobi.',
              style: GoogleFonts.getFont('Delius',
                  color: CustomColors.gray, fontSize: 13)),
          const SizedBox(height: 20),
          Text('• am very passionate about AI and Machine Learning.',
              style: GoogleFonts.getFont('Delius',
                  color: CustomColors.gray, fontSize: 13)),
          const SizedBox(height: 20),
          Text(
              '• I like tinkering. Why does it work? How can I make it better?',
              style: GoogleFonts.getFont('Delius',
                  color: CustomColors.gray, fontSize: 13)),
        ],
      ),
    );
  }
}
