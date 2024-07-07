import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppapp/shared/constants/constants.dart';
import 'package:shoppapp/socailapp/homescreen/cubit/cubit.dart';
import 'package:shoppapp/socailapp/homescreen/cubit/state.dart';
import 'package:shoppapp/socailapp/model/chatmodel.dart';
import 'package:shoppapp/socailapp/model/socailModel.dart';

class ChatDetailsScreen extends StatelessWidget {
  SocialModel ?model;
  ChatDetailsScreen({
    this.model
});
  var textController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        SocialCubit.get(context).GetMessage(reciverId: model!.uid!);
        return  BlocConsumer<SocialCubit,SocialState>(
          listener: (context,SocialState){

          },
          builder: (context,SocialState){
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: (){
                    Navigatepop(context);
                  },
                  icon: Icon(
                    Icons.navigate_before_outlined,
                    color: Colors.black,
                  ),
                ),
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          '${model!.image}'
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '${model!.name}',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
              body: ConditionalBuilder(
                condition: SocialCubit.get(context).messages.length>0,
                builder:(context)=>Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [

                      Expanded(
                        child: ListView.separated
                          (itemBuilder: (context,index){
                            var message=SocialCubit.get(context).messages[index];
                            if(SocialCubit.get(context).socialmodel!.uid==message.senderId)
                              return BuildMyMessage(context,message);
                            return BuildMessage(context,message);
                        },
                            separatorBuilder: (context,index)=>SizedBox(
                              height: 15,
                            ),
                            itemCount: SocialCubit.get(context).messages.length),
                      ),

                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,

                            )

                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: 5
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Type Message Here...',
                                      border: InputBorder.none

                                  ),
                                  controller: textController,

                                ),
                              ),
                            ),
                            Container(
                              height: 59,
                              child: MaterialButton(
                                onPressed: (){
                                  SocialCubit.get(context).sendMessage(
                                      recieverId: model!.uid!,
                                      text:textController.text ,
                                      date: DateTime.now().toString());
                                  textController.text='';

                                },
                                color: Colors.red,
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ),
                            )

                          ],
                        ),
                      )

                    ],
                  ),
                ) ,
                fallback:(context)=>Center(child: CircularProgressIndicator()) ,
              ),
            );
          },
        );
      },

    );
  }
  Widget BuildMessage(context,ChatModel model)=>Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(8),
              topStart:Radius.circular(8) ,
              bottomEnd:Radius.circular(8)

          )
      ),
      padding: EdgeInsetsDirectional.symmetric(
          vertical: 5,
          horizontal: 10
      ),
      child: Text(
        '${model.text}',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 16
        ),
      ),
    ),
  );
  Widget BuildMyMessage(context,ChatModel model)=>Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.red[300],
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(8),
              topStart:Radius.circular(8) ,
              bottomStart:Radius.circular(8)

          )
      ),
      padding: EdgeInsetsDirectional.symmetric(
          vertical: 5,
          horizontal: 10
      ),
      child: Text(
        '${model.text}',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 16
        ),
      ),
    ),
  );
}
