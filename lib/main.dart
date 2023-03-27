import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newproject/data/auth/logic/login_logic.dart';
import 'package:newproject/data/auth/logic/signup_logic.dart';
import 'package:newproject/data/auth/pages/register.dart';
import 'package:newproject/data/auth/pages/verify_email.dart';
import 'package:newproject/domain/pet_edit.dart';
import 'package:newproject/data/fire_service/firebase_stream.dart';
import 'package:provider/provider.dart';
import 'data/auth/pages/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> LogInLogic()),
        ChangeNotifierProvider(create: (context)=> SignUpLogic()),

      ],
  child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const FirebaseStream(),
          '/main': (context) => const MainMenu(),
          '/login': (context) =>  LoginScreen(),
          '/signup': (context) =>  RegisterScreen(),
          '/verify_email': (context) => const VerifyEmailScreen(),
        },
        initialRoute: '/',
      );
  }
}
