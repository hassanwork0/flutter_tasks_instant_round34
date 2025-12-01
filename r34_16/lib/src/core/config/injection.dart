part of 'config.dart';
    class DependencyInjection {
        static Future<void> init() async {
            WidgetsFlutterBinding.ensureInitialized();
        }
    }