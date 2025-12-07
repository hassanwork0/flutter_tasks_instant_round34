import 'package:r34_16/src/core/constants/constants.dart';
import 'package:r34_16/src/features/login_or_signup/presentation/widgets/login/login_page_header.dart';
import 'package:r34_16/src/features/login_or_signup/presentation/widgets/login/social_logins.dart';
import 'package:r34_16/src/features/login_or_signup/presentation/widgets/signup/already_have_account.dart';
import 'package:r34_16/src/features/login_or_signup/presentation/widgets/signup/signup_form.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LoginPageHeader(), 
              const SignupForm(), 
              const SizedBox(height: AppDefaults.padding),
              const SocialLogins(), 
              const SizedBox(height: AppDefaults.padding / 2),
              const AlreadyHaveAccount(), 
            ],
          ),
        ),
      ),
    );
  }
}
