import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppapp/socailapp/homescreen/cubit/state.dart';
import '../../moduels/chatScreen/chatScreen.dart';
import '../../moduels/feed_screen/feed_screen.dart';
import '../../moduels/settingscreen/settingScreen.dart';
import '../../moduels/userscreen/userScreen.dart';

class SocialCubit extends Cubit<SocialState>{

  SocialCubit():super(InitialSocailState());

  static SocialCubit get(context)=>BlocProvider.of(context);

  int curentIndex=0;

  List<Widget> Screens=[
    FeedScreen(),
    ChatScreen(),
    UserScreen(),
    SettingScreen()
  ];

  List<String> Titels=[
    'Feed Screen',
    'Chat Screen',
    'Person Screen',
    'Setting Screen'

  ];

  void ChangeCurentIndex(int index){
    curentIndex=index;
    emit(ChangeCurrentIndexState());
  }




}