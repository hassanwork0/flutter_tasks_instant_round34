import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/bloc/auth/auth_bloc.dart';
import 'package:market_app/bloc/auth/auth_event.dart';
import 'package:market_app/bloc/auth/auth_state.dart';
import 'package:market_app/bloc/user/user_bloc.dart';
import 'package:market_app/core/routes/route_name.dart';

class SocialLoginScreen extends StatelessWidget {
  const SocialLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      backgroundColor: const Color(0xfff9f6ff),
      body: BlocProvider(
        create: (_) => AuthBloc(userBloc: userBloc),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushReplacementNamed(context, RouteName.home);
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 3),
                ),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is AuthLoading;

            return SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // IMAGE HEADER
                      SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: Image.network(
                          'https://www.shutterstock.com/image-photo/paper-bag-full-fruits-vegetables-260nw-2501795705.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFF53B175),
                              child: const Center(
                                child: Icon(
                                  Icons.shopping_bag,
                                  size: 80,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),

                      // TITLE
                      const Text(
                        "Get your groceries\nwith Nectar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Connect using social media",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      const SizedBox(height: 40),

                      // GOOGLE BUTTON
                      _buildButton(
                        context: context,
                        text: "Continue with Google",
                        color: const Color(0xFF53B175),
                        textColor: Colors.white,
                        isLoading: isLoading,
                        icon: Icons.g_mobiledata,
                        onTap: () {
                          context.read<AuthBloc>().add(GoogleSignInEvent());
                        },
                      ),
                      const SizedBox(height: 20),

                      // ACCOUNT LOGIN BUTTON
                      _buildButton(
                        context: context,
                        text: "Login with Account",
                        color: const Color(0xFF53B175),
                        textColor: Colors.white,
                        icon: Icons.person_outline,
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.login);
                        },
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String text,
    required Color color,
    required VoidCallback onTap,
    bool isLoading = false,
    Color textColor = Colors.white,
    IconData? icon,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onTap,
        icon: icon != null
            ? Icon(icon, color: textColor)
            : const SizedBox.shrink(),
        label: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: textColor,
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
