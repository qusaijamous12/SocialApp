import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppapp/shared/constants/constants.dart';
import 'package:shoppapp/socailapp/homescreen/cubit/state.dart';
import 'package:shoppapp/socailapp/model/chatmodel.dart';
import 'package:shoppapp/socailapp/model/postmodel.dart';
import 'package:shoppapp/socailapp/model/socailModel.dart';
import 'package:shoppapp/socailapp/moduels/addpost/addpost.dart';
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
    AddPost(),
    UserScreen(),
    SettingScreen()
  ];

  List<String> Titels=[
    'Feed Screen',
    'Chat Screen',
    'Add Post',
    'Person Screen',
    'Setting Screen'

  ];

  void ChangeCurentIndex(int index){
    curentIndex=index;
    if(curentIndex==1||curentIndex==3){
      GetAllUsers();
    }

    emit(ChangeCurrentIndexState());
  }
  SocialModel ?socialmodel;
  void GetUserData({
    required String uid
}){
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      socialmodel=SocialModel.fromJson(value.data()!);
      print(socialmodel!.email);
      emit(GetUserDataSuccess());

    }).catchError((error){
      print(error.toString());
      emit(GetUserDataError());

    });
  }

  File ?profileImage;
  var picker=ImagePicker();
  Future<void> getImage()async{
    final image=await picker.pickImage(source: ImageSource.gallery);

    if(image!=null){
      profileImage=File(image.path);
    }
    else
      {
        print('you dont select photo');
      }

  }

  File ?coverImage;

  Future<void> getCoverImage()async{
    final image=await picker.pickImage(source: ImageSource.gallery);

    if(image!=null){
      coverImage=File(image.path);
    }
    else
    {
      print('you dont select photo');
    }

  }


  void uploadProfileImage({
    required String email,
    required String name,
    required String phone,
    required String bio,
}){
    FirebaseStorage.instance.ref().child('users/${Uri.file(profileImage!.path).pathSegments.last}').putFile(profileImage!).then((p0) {
      p0.ref.getDownloadURL().then((value) {
        emit(UploadProfileImageSuccess());
        UpdateData(
            email: email,
            name: name,
            phone: phone,
            bio: bio,
          image: value
        );

      }).catchError((error){
        print(error.toString());
        emit(UploadProfileImageError());
      });


    }).catchError((error){
      emit(UploadProfileImageError());
      print(error.toString());

    });



  }



  void uploadCoverImage({
    required String email,
    required String name,
    required String phone,
    required String bio,
}){
    FirebaseStorage.instance.ref().child('users/${Uri.file(coverImage!.path).pathSegments.last}').putFile(coverImage!).then((p0) {
      p0.ref.getDownloadURL().then((value) {
        emit(UploadCoverImageSuccess());
        UpdateData(
            email: email,
            name: name,
            phone: phone,
            bio: bio,
        cover: value);

      }).catchError((error){
        print(error.toString());
        emit(UploadCoverImageError());
      });


    }).catchError((error){
      print(error.toString());
      emit(UploadCoverImageError());

    });



  }



  void UpdateData({
    required String email,
    required String name,
    required String phone,
    required String bio,
    String ?image,
    String ?cover
  }){
    emit(LoadingUpdateData());
    SocialModel model=SocialModel(
        email: email,
        name: name,
        phone: phone,
        bio: bio,
        image:image??socialmodel!.image ,
        cover: cover??socialmodel!.cover,
        uid: socialmodel!.uid

    );
    FirebaseFirestore.instance.collection('users').doc(model!.uid).update(model.toMap()).then((value) {
      GetUserData(uid: uid);
      emit(UpdateUserDataSuccess());

    }).catchError((error){
      print(error.toString());
      emit(UpdateUserDataError());
    });



  }


  File ?PostImage;
  Future<void> getPostImage()async{
    final image=await picker.pickImage(source: ImageSource.gallery);

    if(image!=null){
      PostImage=File(image.path);
    }
    else
    {
      print('you dont select photo');
    }

  }


  void UploadPostImage({
    required String dateTime,
    required String text
  }){
    emit(SocialCreatePostLoadingState());

    FirebaseStorage.instance.ref().child('posts/${Uri.file(PostImage!.path).pathSegments.last}').putFile(PostImage!).then((p0) {
      p0.ref.getDownloadURL().then((value) {
        CreatePost(
            dateTime: dateTime,
            text: text,
          PostImage: value
        );


      }).catchError((error){
        print(error.toString());
        emit(SocialCreatePostErrorState());
      });


    }).catchError((error){
      print(error.toString());
      emit(SocialCreatePostErrorState());

    });



  }

  void CreatePost({
    required String dateTime,
    required String text,
    String ?PostImage,
  }){
    emit(SocialCreatePostLoadingState());
    PostModel model=PostModel(
        name: socialmodel!.name,
      uid: socialmodel!.uid,
      image: socialmodel!.image,
      date: dateTime,
      text: text,
      PostImage: PostImage??''
    );
    FirebaseFirestore.instance.collection('posts').add(model.toMap()).then((value) {
      GetPosts();
      emit(SocialCreatePostSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(SocialCreatePostSuccessState());
    });



  }


  void removePostImage(){
    PostImage=null;
    emit(RemovePostImageState());
  }

List<PostModel> posts=[];
  List<String> postId=[];
  List<int> likes=[];

  void GetPosts(){
    emit(SocailGetPostLoadingsState());
    FirebaseFirestore
        .instance
        .collection('posts')
        .get().
    then((value) {
      value.docs.forEach((element) {

        element.reference.collection('likes').get().then((value) {
          likes.add(value.docs.length);
          postId.add(element.id);
          posts.add(PostModel.fromJson(element.data()));

        }).catchError((error){

        });


      });
          emit(SocailGetPostSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(SocailGetPostErrorState());
    });

  }

  void LikePost(String postIt){
    
    FirebaseFirestore
        .instance.collection('posts')
        .doc(postIt)
        .collection('likes')
        .doc(socialmodel!.uid)
        .set({
      'like':true

    }).then((value) {
      emit(LikePostSuccessState());

    }).catchError((Error){
      print(Error.toString());
      emit(LikePostErrorState());
    });

  }

  List<SocialModel> allUsers=[];

  void GetAllUsers(){
    if(allUsers.length==0)
    FirebaseFirestore
        .instance.
    collection('users')
        .get()
        .then((value) {
          value.docs.forEach((element){
            if(element.id!=socialmodel!.uid)
            allUsers.add(SocialModel.fromJson(element.data()));
          });


    }).catchError((error){

    });
  }

  void sendMessage({
    required String recieverId,
    required String text,
    required String date
}){
    ChatModel model=ChatModel(
      recieverId: recieverId,
      text: text,
      date: date,
      senderId: socialmodel!.uid
    );
    //My Message

    FirebaseFirestore
        .instance.
    collection('users').doc(
      socialmodel!.uid
    ).collection('chats')
        .doc(recieverId)
        .collection('message')
        .add(model.toMap()).then((value) {
          emit(SendMessgaeSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(SendMessageErrorState());

    });


     //reciever message

    FirebaseFirestore
        .instance.
    collection('users').doc(
        recieverId
    ).collection('chats')
        .doc(socialmodel! .uid)
        .collection('message')
        .add(model.toMap()).then((value) {
      emit(SendMessgaeSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(SendMessageErrorState());

    });

  }

  List<ChatModel> messages=[];

  void GetMessage({
    required String reciverId
}){
    FirebaseFirestore.instance.collection('users').doc(socialmodel!.uid).collection('chats').doc(reciverId).collection('message').orderBy('date').snapshots().listen((event) {
      messages=[];
      event.docs.forEach((element){
        messages.add(ChatModel.fromJson(element.data()));

      });

    });
  }









}