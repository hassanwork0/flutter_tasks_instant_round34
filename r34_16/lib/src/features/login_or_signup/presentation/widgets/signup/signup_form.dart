import 'package:r34_16/src/core/constants/constants.dart';
import 'package:r34_16/src/core/routes/routes.dart';
import 'package:r34_16/src/core/theme/theme.dart';
import 'package:r34_16/src/core/utils/utils.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _key = GlobalKey<FormState>();
  bool isPasswordShown = false;

  void onPassToggle() {
    isPasswordShown = !isPasswordShown;
    setState(() {});
  }

  void onSignup() {
    final bool isFormOkay = _key.currentState?.validate() ?? false;
    if (isFormOkay) {
      Navigator.pushNamed(context, RoutesName.entryPoint);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.defaultTheme.copyWith(
        inputDecorationTheme: AppTheme.secondaryInputDecorationTheme,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDefaults.padding),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Name
              Text("First Name", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 8),
              TextFormField(
                validator: Validators.name.call,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppDefaults.padding),

              // Last Name
              Text("Last Name", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 8),
              TextFormField(
                validator: Validators.name.call,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppDefaults.padding),

              // Age
              Text("Age", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: Validators.age.call,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppDefaults.padding),

              // Email field
              Text(
                "Email Or Username",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: Validators.email.call,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: AppDefaults.padding,
              ), 
              Text("Password", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 8),
              TextFormField(
                validator: Validators.password.call,
                onFieldSubmitted: (v) => onSignup(),
                textInputAction: TextInputAction.done,
                obscureText: !isPasswordShown,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: onPassToggle,
                    icon: Icon(
                      isPasswordShown ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppDefaults.padding),

              // Signup Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_key.currentState?.validate() ?? false) {
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Signup',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
