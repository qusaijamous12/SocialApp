import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppapp/shared/observer/observerbloc.dart';
import 'package:shoppapp/shared/themes/theme.dart';
import 'package:shoppapp/socailapp/homescreen/cubit/cubit.dart';
import 'package:shoppapp/socailapp/homescreen/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main()async {
  //asa
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>SocialCubit()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
        theme: lightTheme(),
        debugShowCheckedModeBanner: false,

      ),
    );
  }

}
