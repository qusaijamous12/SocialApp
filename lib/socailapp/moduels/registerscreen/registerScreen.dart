import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';

class RegisterScreen extends StatelessWidget{
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var phoneController=TextEditingController();
  var nameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildDefaultAppBar(
          icon: Icons.navigate_before_outlined, onpress: (){
        Navigatepop(context);
      }),
      body:Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'REGISTER',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 40
                  ),
                ),
                Text(
                  'Register Now To Communicate With Firends',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 18,
                      color: Colors.grey
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                BuildDefaultTextFormField(
                    text: 'Name',
                    prefixIcon: Icons.person,
                    outLineBorder: OutlineInputBorder(),
                    validate: (String ?value){
                      if(value==null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    controller: nameController,
                    textInputType: TextInputType.text),
                SizedBox(
                  height: 20,
                ),
                BuildDefaultTextFormField(
                    text: 'Email Address',
                    prefixIcon: Icons.email_outlined,
                    outLineBorder: OutlineInputBorder(),
                    validate: (String ?value){
                      if(value==null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: emailController,
                    textInputType: TextInputType.emailAddress),
                SizedBox(
                  height: 20,
                ),
                BuildDefaultTextFormField(
                    text: 'Password',
                    prefixIcon: Icons.lock_outline,
                    outLineBorder: OutlineInputBorder(),
                    sufixIcon: Icons.visibility,
                    validate: (String ?value){
                      if(value==null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    controller:passwordController,
                    textInputType: TextInputType.emailAddress),
                SizedBox(
                  height: 20,
                ),
                BuildDefaultTextFormField(
                    text: 'Phone',
                    prefixIcon: Icons.phone,

                    outLineBorder: OutlineInputBorder(),
                    validate: (String ?value){
                      if(value==null || value.isEmpty) {
                        return 'Please enter Phone';
                      }
                      return null;
                    },
                    controller: phoneController,
                    textInputType: TextInputType.phone),
                SizedBox(
                  height: 40,
                ),
                BuildDefaultButton(context,
                    onpress: (){

                    },
                    text: 'register'),


              ],
            ),
          ),
        ),
      ),
    );
  }

}