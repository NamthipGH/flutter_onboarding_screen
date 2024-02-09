import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'Talk In A New Way',
        body:
            'Open your new speaking experience here. Then you will find more colorful meetings.',
        footer: Column(
          children: [
            SizedBox(
              height: 45,
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                  ),
                  onPressed: () {},
                  child: const Text("Let's begin")),
            ),
          ],
        ),
        image: Image.network(
            'https://github.com/CODEHOMIE/Flutter-Onboarding-UI-Concept/blob/master/assets/images/slider_1.png?raw=true'),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        title: 'Colorful Meeting',
        body:
            'Open your new speaking experience here. Then you will find more colorful meetings.',
        footer: Column(
          children: [
            SizedBox(
              height: 45,
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                  ),
                  onPressed: () {},
                  child: const Text("Let's begin")),
            ),
          ],
        ),
        image: Image.network(
            'https://media.istockphoto.com/id/1411321556/video/office-workers-characters-animation-co-working-space-team-work-colleagues-woman-working-at.jpg?s=640x640&k=20&c=cg-gkSbw6ceoVyYuiSVq86I1LYnU5eVfxJPrDhnSxGQ='),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        title: "Let's Get Started !",
        body:
            'Open your new speaking experience here. Then you will find more colorful meetings.',
        footer: Column(
          children: [
            SizedBox(
              height: 45,
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                  ),
                  onPressed: () {},
                  child: const Text("Let's begin")),
            ),
          ],
        ),
        image: Image.network(
            'https://t3.ftcdn.net/jpg/03/72/28/14/360_F_372281485_OI5JwznrbNokXFmLjEpAfGsZiN7sj7Kx.jpg'),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On Boarding'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: pages,
        showSkipButton: true,
        skip: const Text('Skip'),
        showDoneButton: true,
        done: Text('Done'),
        showNextButton: true,
        next: const Icon(
          Icons.arrow_forward,
          size: 25,
        ),
        onDone: () => onDone(context),
        curve: Curves.bounceOut,
        dotsDecorator: const DotsDecorator(
          size: Size(15, 15),
          color: Colors.blue,
          activeColor: Colors.orange,
          activeSize: Size.square(20),
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }
}
