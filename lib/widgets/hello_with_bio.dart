import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/custom_colors.dart';

class HelloWithBio extends StatelessWidget {
  final double width;
  final double ratio;
  const HelloWithBio({required this.width, required this.ratio,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width * ratio),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bonjour!  I’m James Njoroge',
              style: GoogleFonts.getFont('Delius',
                  color: Colors.white, fontSize: 26)),
          const SizedBox(height: 5),
          Text(
              'AI is the new buzz word! Am researching AI',
              style: GoogleFonts.getFont('Delius',
                  color: CustomColors.gray, fontSize: 16)),
        ],
      ),
    );
  }
}
