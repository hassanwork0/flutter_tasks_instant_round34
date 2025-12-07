import 'package:r34_16/src/core/constants/constants.dart';
import 'package:r34_16/src/features/login_or_signup/presentation/widgets/login/dont_have_account_row.dart';
import 'package:r34_16/src/features/login_or_signup/presentation/widgets/login/login_page_form.dart';
import 'package:r34_16/src/features/login_or_signup/presentation/widgets/login/login_page_header.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20), // * optional
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // * ensures full width buttons
            children: [
              const LoginPageHeader(), // logo + welcome texts
              const LoginPageForm(), // phone + password + login button
              const SizedBox(height: AppDefaults.padding),
              const SizedBox(height: AppDefaults.padding / 2),
              const DontHaveAccountRow(), // Signup row
            ],
          ),
        ),
      ),
    );
  }
}