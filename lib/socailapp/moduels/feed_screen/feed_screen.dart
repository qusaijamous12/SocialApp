import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppapp/socailapp/homescreen/cubit/cubit.dart';
import 'package:shoppapp/socailapp/homescreen/cubit/state.dart';
import 'package:shoppapp/socailapp/model/postmodel.dart';

class FeedScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialState>(
      listener: (context,SocialState){

      },
        builder: (context,SocialState){
        return ConditionalBuilder(
            condition: SocialCubit.get(context).posts.length>0,
            builder:(context)=>SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Card(
                        elevation: 8,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.all(Radius.circular(8))
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image(
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                            image:NetworkImage(
                                'https://img.freepik.com/free-photo/concept-winter-holidays-christmas-lifestyle-excited-handsome-man-white-sweater-smiling-loo_1258-108477.jpg?t=st=1719524914~exp=1719528514~hmac=ac8a90e4d5e9bb231ca569dd14b520ecff078b05203595d49b61bbd19ac4b9d9&w=1380'
                            ) ,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            end: 15,
                            bottom: 10
                        ),
                        child: Text(
                          'communicate with freinds',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 17,
                              color: Colors.white
                          ),
                        ),
                      )
                    ],
                  ),
                  ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index)=>BuildPost(context,SocialCubit.get(context).posts[index],index),
                      separatorBuilder:(context,index)=>SizedBox(
                        height: 20,
                      ) ,
                      itemCount: SocialCubit.get(context).posts.length)

                ],
              ),
            ),
            fallback:(context)=>Center(child: CircularProgressIndicator()));
        }

      );

  }

  Widget BuildPost(context,PostModel model,index)=>Padding(
    padding: EdgeInsetsDirectional.only(
        top: 15
    ),
    child: Card(
      elevation:8 ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      '${model.image}'
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
                      '${model.name}',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16,
                          height: 1.4
                      ),

                    ),
                    Text(
                      '${model.date}',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 14,
                          color: Colors.grey,
                          height: 1.4
                      ),

                    )
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: (){

                    },
                    icon: Icon(
                        Icons.edit
                    ))
              ],
            ),
            Padding(
              padding:EdgeInsetsDirectional.only(
                top: 10,
              ),
              child: Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '${model.text}',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 16,
                  height: 1.4,

              ),
            ),
            if(model.PostImage!=null&& model.PostImage!='')
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: 10
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8)
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                    image: NetworkImage(
                        '${model.PostImage}'
                    )),
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: (){

                        }, icon: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    )),
                    Text(
                        '${SocialCubit.get(context).likes[index]}'
                    )
                  ],
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      end: 8
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: (){

                          }, icon: Icon(
                        Icons.comment,
                        color: Colors.red,
                      )),
                      Text(
                          '0 comment'
                      )
                    ],
                  ),
                ),

              ],
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      '${SocialCubit.get(context).socialmodel!.image}'
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
                      'write a comment',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16,
                          color: Colors.grey,
                          height: 1.4
                      ),

                    ),

                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    IconButton(
                        onPressed: (){
                          SocialCubit.get(context).LikePost(SocialCubit.get(context).postId[index]);


                        },
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        )),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          end: 8
                      ),
                      child: Text(
                          'Like'
                      ),
                    )
                  ],
                )
              ],
            ),


          ],
        ),
      ),
    ),
  );

}