import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/signup_screen.dart';

import 'colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyDUkI-y3E2nAUZUzYn3FasbFMPKdDNzvm8',
            appId: '1:739521776138:web:fe402145b2fd0ef9b72df3',
            messagingSenderId: '739521776138',
            projectId: 'instagram-clone-8801e',
            storageBucket: 'instagram-clone-8801e.appspot.com'));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: SignupScreen(),
    );

    // home: StreamBuilder(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.active) {
    //       if (snapshot.hasData) {
    //         return const ResponsiveLayout(
    //             webScreenLayout: WebScreenLayout(),
    //             mobileScreenLayout: MobileScreenLayout());
    //       } else if (snapshot.hasError) {
    //         return Center(
    //           child: Text('${snapshot.hasError}'),
    //         );
    //       }
    //     }
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //         child: CircularProgressIndicator(
    //           color: primaryColor,
    //         ),
    //       );
    //     }
    //     return const LoginScreen();
    //   },
    // ));
  }
}
