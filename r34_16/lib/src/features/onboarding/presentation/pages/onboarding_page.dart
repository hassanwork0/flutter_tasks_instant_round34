import 'package:r34_16/src/core/constants/constants.dart';
import 'package:r34_16/src/core/routes/routes.dart';
import 'package:r34_16/src/features/onboarding/presentation/pages/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:r34_16/src/features/onboarding/presentation/pages/onboarding_model.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  late PageController _pageController;
  List<OnboardingModel> items = onboardingData;

  onPageChange(int value) {
    currentPage = value;
    setState(() {});
  }

  _gotoNextPage() {
    if (currentPage < items.length - 1) {
      _pageController.nextPage(
        duration: AppDefaults.duration,
        curve: Curves.easeIn,
      );
    } else {
      _gotoLoginSignUp();
    }
  }

  _gotoLoginSignUp() {
    Navigator.pushNamed(
      context,
      RoutesName.intrologin,
    ); //it was AppRoutes.intrologin
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 300,
              color: Colors.transparent,
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: items.map((item) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(item.image, height: 200, fit: BoxFit.contain),
                      const SizedBox(height: 20),
                      Text(
                        item.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item.description,
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }).toList(), // convert map to list
              ),
            ),

            const SizedBox(height: 40),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                TweenAnimationBuilder(
                  duration: AppDefaults.duration,
                  tween: Tween<double>(
                    begin: 0,
                    end: (1 / items.length) * (currentPage + 1),
                  ),
                  curve: Curves.easeInOutBack,
                  builder: (context, double value, _) => SizedBox(
                    height: 70,
                    width: 70,
                    child: CircularProgressIndicator(
                      value: value,
                      strokeWidth: 6,
                      backgroundColor: Colors.grey,
                      color: Colors.green,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _gotoNextPage,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.green,
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
