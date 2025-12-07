import 'package:r34_16/src/core/constants/constants.dart';
import 'package:r34_16/src/core/routes/routes.dart';
import 'package:flutter/material.dart';

class IntroPageBodyArea extends StatelessWidget {
  const IntroPageBodyArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Column(
      children: [
        const Spacer(flex: 1),
        Padding(
          padding: const EdgeInsets.all(AppDefaults.padding),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to our',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  'E-Grocery',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700, color: AppColor.primary),
                ),
              ],
            ),
          ),
        ),
        const Spacer(flex: 5),
        Padding(
          padding: const EdgeInsets.all(AppDefaults.padding),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                    Navigator.pushNamed(context, RoutesName.loginmethodpage),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  child: const Text("Continue with Email or Phone",style: TextStyle(color: Colors.white),),
                ),
              ),
              const SizedBox(height: AppDefaults.padding),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                    Navigator.pushNamed(context, RoutesName.signup),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text('Create an account', style: TextStyle(color: Colors.black),),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  }
}