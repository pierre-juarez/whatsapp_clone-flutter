import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants/colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset(
                "assets/images/circle.png",
                color: AppColors.PRIMARY,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Column(
              children: [
                Text(
                  "Welcome to WhatsApp",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(text: "Read our ", style: TextStyle(color: AppColors.TEXT_GRAY, height: 1.5), children: [
                        TextSpan(
                          text: "Privacy policy ",
                          style: TextStyle(color: AppColors.UNDERLINE),
                        ),
                        TextSpan(text: 'Tap "Agree and continue" to accept the '),
                        TextSpan(
                          text: "Terms of Services.",
                          style: TextStyle(color: AppColors.UNDERLINE),
                        )
                      ])),
                ),
                SizedBox(
                  height: 42,
                  width: MediaQuery.of(context).size.width - 100,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.PRIMARY,
                        foregroundColor: AppColors.BACKGROUND,
                        splashFactory: NoSplash.splashFactory,
                        elevation: 0,
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text("AGREE AND CONTINUE")),
                ),
                const SizedBox(height: 50),
                Material(
                  color: const Color(0xFF182229),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(20),
                    splashFactory: NoSplash.splashFactory,
                    highlightColor: const Color(0xFF09141A),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Icon(Icons.language, color: AppColors.PRIMARY),
                        SizedBox(width: 10),
                        Text("English"),
                        SizedBox(width: 10),
                        Icon(Icons.keyboard_arrow_down, color: AppColors.PRIMARY),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
