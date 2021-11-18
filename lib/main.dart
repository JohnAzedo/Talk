import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:talk/ui/auth/auth_screen.dart';
import 'package:talk/ui/auth/auth_viewmodel.dart';
import 'package:talk/ui/chats/chats_screen.dart';
import 'package:talk/ui/chats/chats_viewmodel.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => ChatsViewModel())
      ],
      child: MaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: CustomColors.backgroundColor,
          colorScheme: Theme.of(context).colorScheme.copyWith(secondary: CustomColors.secondaryColor),
          fontFamily: Strings.fontFamily,
        ),
        home: const ChatsScreen(),
      ),
    );
  }
}
