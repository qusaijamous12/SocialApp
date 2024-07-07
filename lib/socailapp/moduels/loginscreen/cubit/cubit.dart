import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppapp/shared/casheHelper/sharedPrefernce.dart';
import 'package:shoppapp/socailapp/homescreen/cubit/cubit.dart';
import 'package:shoppapp/socailapp/moduels/loginscreen/cubit/state.dart';

import '../../../../shared/constants/constants.dart';

class LoginCubit extends Cubit<LoginState>{

  LoginCubit():super(InitialLoginState());

  static LoginCubit get(context)=>BlocProvider.of(context);

  IconData icon=Icons.visibility_off;

  bool isShow=true;

  void ChnageIcon(){
    isShow=!isShow;

    if(isShow){
      icon=Icons.visibility_off;
      emit(ChangeIconState());
    }
    else
      {
        icon=Icons.visibility;
        emit(ChangeIconState());
      }
  }

  void LoginWithAccount(context,{
    required String email,
    required String password
}){
    emit(LoadingLoginState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password).then((value) {

          SocialCubit.get(context).GetUserData(uid: uid);
          CasheHelper.SaveData(value: value.user!.uid, key: 'uid');
          uid=CasheHelper.GetData(key: 'uid');
          print(uid);

          emit(LoginSuccessState());


    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState());

    });

  }


}