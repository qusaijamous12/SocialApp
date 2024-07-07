import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppapp/socailapp/moduels/registerscreen/cubit/cubit.dart';
import 'package:shoppapp/socailapp/moduels/registerscreen/cubit/state.dart';

import '../../../shared/constants/constants.dart';

class RegisterScreen extends StatelessWidget{
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var phoneController=TextEditingController();
  var nameController=TextEditingController();

  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterState>(
        listener: (context,RegisterState){
          if(RegisterState is CreateAccountFireStoreSuccess){
            Fluttertoast.showToast(
                msg: "Create Account Success",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
          else if(RegisterState is CreateAccountFireStoreError)
            {
              Fluttertoast.showToast(
                  msg: "Error",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }

        },
        builder: (context,RegisterState){
          var cubit=RegisterCubit.get(context);
          return Scaffold(
            appBar: BuildDefaultAppBar(
                context,
                icon: Icons.navigate_before_outlined, onpress: (){
              Navigatepop(context);
            },
              title: ''
            ),
            body:Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
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
                       ConditionalBuilder(
                           condition: RegisterState is! LoadingCreateAccount,
                           builder: (context)=> BuildDefaultButton(context,
                               onpress: (){
                             if(formKey.currentState!.validate()) {
                               cubit.CreateAccountAuth(
                                   email: emailController.text,
                                   password: passwordController.text,
                                   name: nameController.text,
                                   phone: phoneController.text);
                             }

                               },
                               text: 'register'),
                           fallback: (context)=>Center(child: CircularProgressIndicator()))


                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}