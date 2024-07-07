import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppapp/socailapp/homescreen/homescreen.dart';
import 'package:shoppapp/socailapp/moduels/loginscreen/cubit/cubit.dart';
import 'package:shoppapp/socailapp/moduels/loginscreen/cubit/state.dart';
import '../../../shared/constants/constants.dart';
import '../registerscreen/registerScreen.dart';

class LoginScreen extends StatelessWidget{
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginState>(
        listener: (context,LoginState){
          if(LoginState is LoginSuccessState){
            Fluttertoast.showToast(
                msg: "Login Success",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
            NavigateAndFinish(context, widget: HomeScreen());
          }
          else if(LoginState is LoginErrorState)
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
        builder: (context,LoginState){
          var cubit=LoginCubit.get(context);

          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 40
                        ),
                      ),
                      Text(
                        'Login Now To Communicate With Firends',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 18,
                            color: Colors.grey
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      BuildDefaultTextFormField(
                          text: 'Email Address',
                          prefixIcon: Icons.email_outlined,
                          outLineBorder: OutlineInputBorder(),
                          validate: (String ?value){
                            if(value==null || value.isEmpty) {
                              return 'Please enter email';
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
                          sufixIcon: cubit.icon,
                          onpressSufix: (){
                            cubit.ChnageIcon();
                          },
                          ObsecureText: cubit.isShow,
                          outLineBorder: OutlineInputBorder(),
                          validate: (String ?value){
                            if(value==null || value.isEmpty) {
                              return 'Please enter Password';
                            }
                            return null;
                          },
                          controller: passwordController,
                          textInputType: TextInputType.visiblePassword),
                      SizedBox(
                        height: 40,
                      ),
                      ConditionalBuilder(
                          condition: LoginState is! LoadingLoginState,
                          builder: (context)=>BuildDefaultButton(context,
                              onpress: (){
                            cubit.LoginWithAccount(context,
                                email: emailController.text,
                                password:passwordController.text );

                              },
                              text: 'login'),
                          fallback: (context)=>Center(child: CircularProgressIndicator())),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Text('Don\'t have an account?',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontSize: 16
                            ),
                          ),
                          BuildDefaultTextButton(context,
                              onpress: (){
                                NavigatePush(context, widget: RegisterScreen());

                              }, text: 'Register')
                        ],
                      )

                    ],
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