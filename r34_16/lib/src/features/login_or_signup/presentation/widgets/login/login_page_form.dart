import 'package:r34_16/src/core/constants/constants.dart';
import 'package:r34_16/src/core/routes/routes.dart';
import 'package:r34_16/src/core/theme/theme.dart';
import 'package:r34_16/src/core/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginPageForm extends StatefulWidget {
  const LoginPageForm({super.key});

  @override
  State<LoginPageForm> createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  final _key = GlobalKey<FormState>();

   bool isPasswordShown = false;

  void onPassToggle() {
    isPasswordShown = !isPasswordShown;
    setState(() {});
  }

  onLogin() {
    final bool isFormOkay =
        _key.currentState?.validate() ??
        false; 
    if (isFormOkay) {
      Navigator.pushNamed(context, RoutesName.entryPoint); 
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      //Theme
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
              const Text("Phone Number"),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: Validators.requiredWithFieldName(
                  "Phone",
                ).call, 
                textInputAction: TextInputAction
                    .next, 
              ),
              const SizedBox(height: AppDefaults.padding),
              // Password field
              const Text("Password"),
              const SizedBox(height: 8),
              TextFormField(
                validator: Validators
                    .password
                    .call, onFieldSubmitted:
                    (v) => 
                        onLogin(), textInputAction: TextInputAction.done,
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
              // Forget Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, RoutesName.forgotPassword);
                  },
                  child: const Text('Forget Password?',style: TextStyle(color: AppColor.primary)),
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16), // *
                  ),
                  child: const Text(
                    'Login',
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
