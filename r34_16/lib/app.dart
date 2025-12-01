import 'src/core/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/core/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => DismissKeyboard(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.entryPoint,
          onGenerateRoute: RoutesHandler.generateRoute,
        ),
      ),
    );
  }
}
