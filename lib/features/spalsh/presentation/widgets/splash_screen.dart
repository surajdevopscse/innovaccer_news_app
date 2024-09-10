import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovaccer_news_app/core/constants/constants.dart';
import 'package:innovaccer_news_app/core/utils/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SvgPicture.asset(
                AppConstants.SPLASHIMAGESVG,
                fit: BoxFit.fitHeight,
                theme:
                    SvgTheme(currentColor: Theme.of(context).iconTheme.color!),
                height: SizeConfig.height(0.6),
              ),
              SizedBox(
                height: SizeConfig.height(0.08),
              ),
              Text(
                AppConstants.APPTITLE,
                style: GoogleFonts.afacad(
                  letterSpacing: .6,
                  color: Colors.grey.shade700,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: SizeConfig.height(0.08),
              ),
              const LinearProgressIndicator(
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
