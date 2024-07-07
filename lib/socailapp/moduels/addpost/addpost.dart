import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppapp/shared/constants/constants.dart';
import 'package:shoppapp/socailapp/homescreen/cubit/cubit.dart';
import 'package:shoppapp/socailapp/homescreen/cubit/state.dart';
import 'package:shoppapp/socailapp/homescreen/homescreen.dart';
import 'package:shoppapp/socailapp/moduels/feed_screen/feed_screen.dart';

class AddPost extends StatelessWidget{
  @override
  var textController=TextEditingController();



  Widget build(BuildContext context) {
   return BlocConsumer<SocialCubit,SocialState>(
     listener: (context,SocialState){

     },
     builder: (context,SocialState){
       var cubit=SocialCubit.get(context);
       var model=SocialCubit.get(context).socialmodel;
      return Scaffold(
         appBar: BuildDefaultAppBar(context,
             icon: Icons.navigate_before_outlined,
             title: 'Create Post',
             onpress: (){
               cubit.curentIndex=0;
               NavigateAndFinish(context, widget: HomeScreen());

             },
           widget: [
             BuildDefaultTextButton(
                 context,
                 onpress: (){
                   if(SocialCubit.get(context).PostImage==null){
                     SocialCubit.get(context).CreatePost(
                         dateTime: DateTime.now().toString(),
                         text: textController.text);
                   }
                   else
                     {
                       SocialCubit.get(context).UploadPostImage(
                           dateTime: DateTime.now().toString(),
                           text: textController.text);
                     }

                 },
                 text: 'Post')
           ]

         ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              if(SocialState is SocialCreatePostLoadingState)
              LinearProgressIndicator(),
              if(SocialState is SocialCreatePostLoadingState)
                SizedBox(height: 8,),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/man-with-santa-s-hat-hand_1194-146.jpg?t=st=1719604418~exp=1719608018~hmac=77b44c01d81320f348c313a479fe8da2a3896ed1c90f861268dc1bb884e35ad6&w=740'
                    ),
                    radius: 30,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${model!.name}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 16,
                            height: 1.4
                        ),

                      ),
                      Text(
                        'public',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 14,
                            color: Colors.grey,
                            height: 1.4
                        ),

                      )
                    ],
                  ),

                ],
              ),
              SizedBox(
                height: 9,
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'What is on your mind ? ',
                    border: InputBorder.none
                  ),
                  controller: textController,
                ),
              ),
              if(SocialCubit.get(context).PostImage!=null)
                Container(
                  height: 260,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Image(
                          image: FileImage(SocialCubit.get(context).PostImage!),
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.red,
                        child: IconButton(
                            onPressed: (){
                              SocialCubit.get(context).removePostImage();
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                        onPressed:(){
                          SocialCubit.get(context).getPostImage();
                        } ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.photo
                            ),
                            Text(
                              'Add photo'
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed:(){} ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                '# Add Tags'
                            )
                          ],
                        )),
                  )
                ],
              ),


            ],
          ),
        ),

       );
     },
   );
  }

}