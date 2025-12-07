import 'package:r34_16/src/core/constants/constants.dart';
import 'package:r34_16/src/core/routes/routes.dart';
import 'package:flutter/material.dart';

class DontHaveAccountRow extends StatelessWidget {
  const DontHaveAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't Have Account? ",
          style: TextStyle(
            color: Colors.grey[600],  
            fontSize: 14,
          ),
        ),
        TextButton( 
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.signup); 
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero, 
            minimumSize: Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            "Signup",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColor.primary,
            ),
          ),
        ),
      ],
    );
  }
} 