import 'package:action_slider/action_slider.dart';
import 'package:black_beatz/screens/common_widgets/welcomescreen_2.dart';
import 'package:flutter/material.dart';

class WelcomeScreen1 extends StatelessWidget {
  const WelcomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 10, 67),
      body: SingleChildScrollView(
        child: Column(
          children: [
            firstImage(context),
            musicWelcomeScreen1(context),
            const SizedBox(
              height: 20,
            ),
            thirdImage(context),
            const SizedBox(
              height: 20,
            ),
            welcomeText(),
            const SizedBox(
              height: 35,
            ),
            slideToContinue(context),
          ],
        ),
      ),
    );
  }

  ActionSlider slideToContinue(BuildContext context) {
    return ActionSlider.standard(
        backgroundColor: const Color.fromARGB(255, 60, 7, 93),
        toggleColor: const Color.fromARGB(255, 159, 5, 255),
        icon: const Icon(
          Icons.navigate_next,
          color: Colors.white,
        ),
        successIcon: const Icon(
          Icons.check_rounded,
          color: Colors.white,
        ),
        failureIcon: const Icon(
          Icons.close_rounded,
          color: Colors.white,
        ),
        width: 250,
        actionThresholdType: ThresholdType.release,
        child: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            'Slide to Continue',
            style: TextStyle(color: Colors.white),
          ),
        ),
        action: (controller) async {
          controller.loading(); //starts loading animation
          await Future.delayed(const Duration(seconds: 2));

          controller.success(); //starts success animation
          await Future.delayed(const Duration(seconds: 2));
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => const WelcomeScreen2()));
        });
  }

  Row welcomeText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: const [
            Text(
              'MUSIC CAN',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  height: 1,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'CHANGE THE WORLD',
              style: TextStyle(
                  height: 1,
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 22),
            Text(
              'THIS APP ALLOWS TO PLAY,ORGANIZE AND',
              style: TextStyle(
                  height: 1,
                  color: Colors.yellow,
                  fontFamily: 'Peddana',
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'RETREIVE MUSIC EASLY & QUICKLY',
              style: TextStyle(
                  height: .3,
                  color: Colors.yellow,
                  fontFamily: 'Peddana',
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'IDENTIFY THE MUSIC PLAYING AROUND YOU',
              style: TextStyle(
                  height: 1,
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ],
    );
  }

  SizedBox thirdImage(BuildContext context) {
    return SizedBox(
        height: 250,
        width: MediaQuery.of(context).size.width * 0.85,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/photo-1544785349-c4a5301826fd.jpeg',
            fit: BoxFit.cover,
          ),
        ));
  }

  SizedBox musicWelcomeScreen1(BuildContext context) {
    return SizedBox(
      height: 110,
      width: MediaQuery.of(context).size.width * 0.90,
      child: Image.asset(
        'assets/images/music_welcomescreeen1.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Padding firstImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 55, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.55,
            child: Image.asset(
              'assets/images/blackbeatz.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
