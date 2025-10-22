import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_kavalar_app/view_models/auth/auth_view_model.dart';
import 'package:smart_kavalar_app/views/auth/dashboard/home_screen.dart';
import 'package:smart_kavalar_app/views/auth/screen/login_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ],
      child: Consumer<LoginViewModel>(
        builder: (context, loginViewModel, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginScreen(),
            '/home': (context) => const HomeScreen(),
            // Add other routes here
          },
        ),
      ),
    );
  }
}
