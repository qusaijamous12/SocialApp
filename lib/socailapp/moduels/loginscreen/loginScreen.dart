import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../shared/constants/constants.dart';
import '../registerscreen/registerScreen.dart';

class LoginScreen extends StatelessWidget{
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {

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
                    sufixIcon: Icons.visibility,
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
                BuildDefaultButton(context,
                    onpress: (){

                    },
                    text: 'login'),
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
  }

}