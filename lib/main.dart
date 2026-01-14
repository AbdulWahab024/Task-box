import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_box/provider/complete_task_provider.dart';
import 'package:task_box/provider/hide_password.dart';
import 'package:task_box/provider/theme_provider.dart';
import 'package:task_box/utils/theme.dart';
import 'package:task_box/view/splash_view.dart';
import 'package:task_box/view_mdel/authVM.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> HidePassword()), 
      ChangeNotifierProvider(create: (_)=> ThemeProvider()),
      ChangeNotifierProvider(create: (_) => AuthVM()), 
      ChangeNotifierProvider(create: (_) => CompleteTaskProvider()),
    ], 
    child: const MyApp(),
    ), 
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); 
    final theme = MaterialTheme(ThemeData.light().textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: themeProvider.themeMode,
      home: SplashView(),
    );
  }
}

