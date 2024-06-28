import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 15
            ),
            child: Card(
              elevation:8 ,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
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
                              'Qusai Jamous',
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontSize: 16,
                                height: 1.4
                              ),

                            ),
                            Text(
                              'January 21,2021 at 11:00 pm',
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
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 16,
                        height: 1.4
                      ),
                    ),
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
                          'https://img.freepik.com/free-photo/concept-winter-holidays-christmas-lifestyle-excited-handsome-man-white-sweater-smiling-loo_1258-108477.jpg?t=st=1719524914~exp=1719528514~hmac=ac8a90e4d5e9bb231ca569dd14b520ecff078b05203595d49b61bbd19ac4b9d9&w=1380'
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
                              '120'
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
                                  '120 comment'
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
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }

}