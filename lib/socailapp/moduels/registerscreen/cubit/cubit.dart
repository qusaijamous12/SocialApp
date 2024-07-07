import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppapp/socailapp/model/socailModel.dart';
import 'package:shoppapp/socailapp/moduels/registerscreen/cubit/state.dart';

class RegisterCubit extends Cubit<RegisterState>{


  RegisterCubit():super(InitailRegisterState());


  static RegisterCubit get(context)=>BlocProvider.of(context);

  void CreateAccountAuth({
    required String email,
    required String password,
    required String name,
    required String phone
}){
    emit(LoadingCreateAccount());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password).then((value) {
          CreateAccountFireStore(
              uid: value.user!.uid,
              email: email,
              name:name,
              phone: phone);

    }).catchError((error){
      print(error.toString());
      emit(CreateAccountError());
    });

  }

  void CreateAccountFireStore({
    required String uid,
    required String email,
    required String name,
    required String phone
}){
    SocialModel socialModel=SocialModel(
      uid: uid,
      email: email,
      name: name,
      phone: phone,
      image: 'https://img.freepik.com/free-photo/man-with-santa-s-hat-hand_1194-146.jpg?t=st=1719604418~exp=1719608018~hmac=77b44c01d81320f348c313a479fe8da2a3896ed1c90f861268dc1bb884e35ad6&w=740',
      cover: 'https://img.freepik.com/free-photo/concept-winter-holidays-christmas-lifestyle-excited-handsome-man-white-sweater-smiling-loo_1258-108477.jpg?t=st=1719524914~exp=1719528514~hmac=ac8a90e4d5e9bb231ca569dd14b520ecff078b05203595d49b61bbd19ac4b9d9&w=1380',
      bio: 'Write your bio...'

    );
    FirebaseFirestore.instance.collection('users').doc(uid).set(socialModel.toMap()).then((value) {
      emit(CreateAccountFireStoreSuccess());

    }).catchError((error){
      print(error.toString());
      emit(CreateAccountFireStoreError());


    });

  }



}