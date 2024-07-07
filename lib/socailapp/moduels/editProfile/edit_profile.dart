import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppapp/shared/constants/constants.dart';
import 'package:shoppapp/socailapp/homescreen/cubit/cubit.dart';
import 'package:shoppapp/socailapp/homescreen/cubit/state.dart';

class EditProfile extends StatelessWidget{

  var emailController=TextEditingController();
  var nameController=TextEditingController();
  var phoneController=TextEditingController();
  var bioController=TextEditingController();



  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SocialCubit,SocialState>(
      listener: (context,SocialState){

      },
      builder: (context,SocialState){
        emailController.text=SocialCubit.get(context).socialmodel!.email!;
        nameController.text=SocialCubit.get(context).socialmodel!.name!;
        phoneController.text=SocialCubit.get(context).socialmodel!.phone!;
        bioController.text=SocialCubit.get(context).socialmodel!.bio!;
        return Scaffold(
          appBar: BuildDefaultAppBar(context,
              icon: Icons.navigate_before_outlined,
              onpress: (){
                Navigatepop(context);
              },
              title: 'Edit Profile',
              widget: [
                BuildDefaultTextButton(
                    context,
                    onpress: (){
                      SocialCubit.get(context).UpdateData(
                          email: emailController.text,
                          name: nameController.text,
                          phone: phoneController.text,
                          bio: bioController.text);

                    },
                    text: 'UPDATE')
              ]
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                if(SocialState is LoadingUpdateData)
                  LinearProgressIndicator(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 260,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Image(
                              image: NetworkImage(
                                  '${SocialCubit.get(context).profileImage==null?SocialCubit.get(context).socialmodel!.cover:FileImage(SocialCubit.get(context).coverImage!)}'
                              ),
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
                                SocialCubit.get(context).getCoverImage();

                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 62,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                  '${SocialCubit.get(context).profileImage==null?SocialCubit.get(context).socialmodel!.image:FileImage(SocialCubit.get(context).profileImage!)}'
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.red,
                            child: IconButton(
                              onPressed: (){
                                SocialCubit.get(context).getImage();

                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                if(SocialCubit.get(context).profileImage!=null ||SocialCubit.get(context).coverImage!=null )
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      if(SocialCubit.get(context).profileImage!=null)
                      Expanded(
                        child: BuildDefaultButton(context,
                            onpress: (){
                          SocialCubit.get(context).uploadProfileImage(email: emailController.text, name: nameController.text, phone: phoneController.text, bio: bioController.text);

                            },
                            text: 'Upload Image'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      if(SocialCubit.get(context).coverImage!=null)
                      Expanded(
                        child: BuildDefaultButton(context,
                            onpress: (){
                          SocialCubit.get(context).uploadCoverImage(email: emailController.text, name: nameController.text, phone: phoneController.text, bio: bioController.text);

                            },
                            text: 'Upload Cover'),
                      )

                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      BuildDefaultTextFormField(
                          text: 'Name',
                          prefixIcon: Icons.person,
                          outLineBorder: OutlineInputBorder(),
                          validate: (String ?value){
                            if(value==null || value.isEmpty){
                              return 'Please enter name';
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
                          prefixIcon: Icons.email,
                          outLineBorder: OutlineInputBorder(),
                          validate: (String ?value){
                            if(value==null || value.isEmpty){
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
                          text: 'Phone',
                          prefixIcon: Icons.phone,
                          outLineBorder: OutlineInputBorder(),
                          validate: (String ?value){
                            if(value==null || value.isEmpty){
                              return 'Please enter phone';
                            }
                            return null;
                          },
                          controller: phoneController,
                          textInputType: TextInputType.phone),
                      SizedBox(
                        height: 20,
                      ),
                      BuildDefaultTextFormField(
                          text: 'Bio',
                          prefixIcon: Icons.text_decrease,
                          outLineBorder: OutlineInputBorder(),
                          validate: (String ?value){
                            if(value==null || value.isEmpty){
                              return 'Please enter bio';
                            }
                            return null;
                          },
                          controller: bioController,
                          textInputType: TextInputType.text),
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }

}