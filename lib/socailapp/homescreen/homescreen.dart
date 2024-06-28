import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialState>(
      listener: (context,SocialState){

      },
      builder: (context,SocialState){
        var cubit=SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${cubit.Titels[cubit.curentIndex]}',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 20
              ),
            ),
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: (){},
                  icon: Icon(
                      Icons.search_rounded,
                    color: Colors.black,
                  ))
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GNav(
              selectedIndex: cubit.curentIndex,
              onTabChange: (index){
                cubit.ChangeCurentIndex(index);
              },
              gap: 8,
              padding: EdgeInsetsDirectional.all(10),
              tabBackgroundColor: Colors.red,
              activeColor: Colors.white,
              tabs: [
                GButton(
                  icon:Icons.home,
                  text: 'Home',),
                GButton(
                  icon:Icons.message,
                  text: 'Chats',),
                GButton(
                  icon:Icons.person,
                  text: 'Users',),
                GButton(
                  icon:Icons.settings,
                  text: 'Setting',)
              ],
            ),
          ),
          body: cubit.Screens[cubit.curentIndex],
        );
      },

    );
  }

}