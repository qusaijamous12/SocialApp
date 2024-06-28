import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
                    'https://img.freepik.com/free-photo/concept-winter-holidays-christmas-lifestyle-excited-handsome-man-white-sweater-smiling-loo_1258-108477.jpg?t=st=1719524914~exp=1719528514~hmac=ac8a90e4d5e9bb231ca569dd14b520ecff078b05203595d49b61bbd19ac4b9d9&w=1380'
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
                    'https://img.freepik.com/free-photo/man-with-santa-s-hat-hand_1194-146.jpg?t=st=1719604418~exp=1719608018~hmac=77b44c01d81320f348c313a479fe8da2a3896ed1c90f861268dc1bb884e35ad6&w=740'
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
                'Qusai Jamous',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Write your bio...',
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
                        onPressed: (){},
                        child: Icon(
                          Icons.edit
                        )),
                  )
                ],
              ),
            ],
          ),
        )

      ],
    );
  }

}