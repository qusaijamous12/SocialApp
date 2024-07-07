import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppapp/shared/casheHelper/sharedPrefernce.dart';
import 'package:shoppapp/shared/constants/constants.dart';
import 'package:shoppapp/socailapp/homescreen/cubit/cubit.dart';
import 'package:shoppapp/socailapp/homescreen/cubit/state.dart';
import 'package:shoppapp/socailapp/moduels/editProfile/edit_profile.dart';
import 'package:shoppapp/socailapp/moduels/loginscreen/loginScreen.dart';

class SettingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialState>(
      listener: (context,SocialState){

      },
      builder: (context,SocialState){
        var model=SocialCubit.get(context).socialmodel;
        return Column(
          children: [
            Container(
              height: 260,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Image(
                      image: NetworkImage(
                          '${model!.cover}'
                      ),
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 62,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          '${model.image}'
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    '${model.name}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '${model.bio}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.grey,
                        fontSize: 16
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: OutlinedButton(
                              onPressed: (){
                                NavigatePush(context, widget: EditProfile());

                              }, child: Text(
                              'Edit Profile'
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        child: OutlinedButton(
                            onPressed: (){
                              NavigatePush(context, widget: EditProfile());
                            },
                            child: Icon(
                                Icons.edit
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  BuildDefaultButton(
                      context,
                      onpress: (){
                        CasheHelper.RemoveData(key: 'uid');
                        SocialCubit.get(context).curentIndex=0;
                        NavigateAndFinish(context, widget: LoginScreen());

                      }, text: 'LOGOUT')
                ],
              ),
            ),


          ],
        );
      },
    );
  }

}