import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/model/blocs/cart/cart_bloc.dart';
import 'package:flutter_application_1/model/blocs/cart/cart_event.dart';
import 'package:flutter_application_1/model/blocs/wishList/wishList_bloc.dart';
import 'package:flutter_application_1/model/blocs/wishList/wishList_event.dart';
import 'package:flutter_application_1/screens/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/screens/route.dart';
import 'package:flutter_application_1/screens/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter chat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Splashscreen();
          }
          if (snapshot.hasData) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (_) => WishListBloc()..add(StartWishList())),
                BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
              ],
              child: const MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: Routemanger.homePage,
                onGenerateRoute: Routemanger.generateRoute,
              ),
            );
          }
          return const AuthScreen();
        },
      ),
    );
  }
}
