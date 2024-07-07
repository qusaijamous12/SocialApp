import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppapp/shared/casheHelper/sharedPrefernce.dart';
import 'package:shoppapp/shared/constants/constants.dart';
import 'package:shoppapp/shared/observer/observerbloc.dart';
import 'package:shoppapp/shared/themes/theme.dart';
import 'package:shoppapp/socailapp/homescreen/cubit/cubit.dart';
import 'package:shoppapp/socailapp/homescreen/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shoppapp/socailapp/moduels/loginscreen/loginScreen.dart';
import 'firebase_options.dart';
void main()async {
  //asa
  WidgetsFlutterBinding.ensureInitialized();

  await CasheHelper.init();

  uid=CasheHelper.GetData(key: 'uid');
  print(uid);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Widget ?StartWidget;

  if(uid!=null){
    StartWidget=HomeScreen();

  }
  else if(uid==null){
    StartWidget=LoginScreen();
  }

  Bloc.observer = MyBlocObserver();
  runApp(MyApp(widget: StartWidget,));
}

class MyApp extends StatelessWidget{
  @override

  Widget ?widget;
  MyApp({
    this.widget
});

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>SocialCubit()..GetUserData(uid: uid)..GetPosts()..GetAllUsers()),
      ],
      child: MaterialApp(
        home: widget,
        theme: lightTheme(),
        debugShowCheckedModeBanner: false,

      ),
    );
  }

}
