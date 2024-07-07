import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppapp/shared/constants/constants.dart';
import 'package:shoppapp/socailapp/moduels/chat_details_screen/chatdetailsscreen.dart';

import '../../homescreen/cubit/cubit.dart';
import '../../homescreen/cubit/state.dart';
import '../../model/socailModel.dart';

class ChatScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SocialCubit,SocialState>(
      listener: (context,SocialState){

      },
      builder: (context,SocialState){
        return ConditionalBuilder(
            condition: SocialCubit.get(context).allUsers.length>0,
            builder: (context)=>Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index)=>BuildChatItem(context,SocialCubit.get(context).allUsers[index]),
                        separatorBuilder: (context,index)=>SizedBox(
                          height: 20,
                        ),
                        itemCount: SocialCubit.get(context).allUsers.length),
                  )
                ],
              ),
            ),
            fallback: (context)=>Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget BuildChatItem(context,SocialModel model)=>InkWell(
    onTap: (){
      NavigatePush(context, widget:ChatDetailsScreen(model: model,) );
          },
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  '${model.image}'
              ),
              radius: 50,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                '${model.name}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          ],
        )
      ],
    ),
  );

}