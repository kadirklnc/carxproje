import 'package:carxproje/cubit/anasayfa_cubit.dart';
import 'package:carxproje/cubit/araba_guncelle_cubit.dart';
import 'package:carxproje/cubit/araba_kayit_cubit.dart';
import 'package:carxproje/firebase_options.dart';
import 'package:carxproje/views/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ArabaKayitCubit(),
        ),
        BlocProvider(
          create: (context) => AnasayfaCubit(),
        ),
        BlocProvider(
          create: (context) => ArabaGuncelleCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFff8384)),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
