import 'package:filesharewithfirebase/auths/login.dart';
import 'package:filesharewithfirebase/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auths/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: MaterialApp(
        title: 'Flutter Firebase Auth',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Consumer<AuthService>(
          builder: (context, auth, _) {
            return auth.isAuthenticated ? HomePage() : LoginScreen();
          },
        ),
      ),
    );
  }
}

















// import 'package:filesharewithfirebase/auths/login.dart';
// import 'package:filesharewithfirebase/homepage.dart';
// // import 'package:filesharewithfirebase/onboarding_screen.dart';
// import 'package:filesharewithfirebase/screens/onboard_screen.dart';
// import 'package:filesharewithfirebase/screens/splash_screen.dart';
// // import 'package:filesharewithfirebase/splash_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'auths/auth_service.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   Future<bool> _checkSeenOnboarding() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool('seenOnboarding') ?? false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => AuthService(),
//       child: MaterialApp(
//         title: 'Flutter Firebase Auth',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         debugShowCheckedModeBanner: false,
//         home: FutureBuilder<bool>(
//           future: _checkSeenOnboarding(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return SplashScreen();
//             } else {
//               if (snapshot.data == false) {
//                 return OnboardingScreen();
//               } else {
//                 return Consumer<AuthService>(
//                   builder: (context, auth, _) {
//                     return auth.isAuthenticated ? HomePage() : LoginScreen();
//                   },
//                 );
//               }
//             }
//           },
//         ),
//         routes: {
//           '/home': (context) => Consumer<AuthService>(
//                 builder: (context, auth, _) {
//                   return auth.isAuthenticated ? HomePage() : LoginScreen();
//                 },
//               ),
//         },
//       ),
//     );
//   }
// }
