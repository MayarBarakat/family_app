

import 'package:family/layout/cubit/family_cubit.dart';
import 'package:family/layout/cubit/family_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:lottie/lottie.dart';

import '../../models/all_team.dart';

class RankScreen extends StatelessWidget {
  const RankScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FamilyCubit, FamilyState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = FamilyCubit.get(context);
    return cubit.loadTeams? const Center(child: CircularProgressIndicator(),): Container(
      decoration: const BoxDecoration(
        color: Color(0xff222433),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow.shade600,
                        Colors.orange,
                        Colors.red

                      ],

                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xff2C3144)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Region",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),),
                            Text("National",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),),
                            Text("Global",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      winnerContainer(
                        isFirst: false,
                        height: 110,
                        team: cubit.allTeam.teams!.where((element){
                          return int.parse(element.rank!) == 3;
                        }).first,
                      ),
                      winnerContainer(
                        height: 180,
                        isFirst: true,
                        team: cubit.allTeam.teams!.where((element){
                          return int.parse(element.rank!) == 1;
                        }).first,
                      ),
                      winnerContainer(
                        isFirst: false,
                        height: 130,
                        team: cubit.allTeam.teams!.where((element){
                          return int.parse(element.rank!) == 2;
                        }).first,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                      ),
                      gradient: LinearGradient(
                          colors: [
                            Colors.yellow.shade600,
                            Colors.orange,
                            Colors.red,
                          ]
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      height: 300,
                      decoration: const BoxDecoration(
                          color: Color(0xff2C3144),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)
                          )
                      ),
                      child: GridView.count(
                        crossAxisCount: 1,
                        childAspectRatio: 3.5,
                        children: [
                          contestantList(
                            team: cubit.allTeam.teams!.where((element){
                              return int.parse(element.rank!) == 1;
                            }).first,
                          ),
                          contestantList(
                            team: cubit.allTeam.teams!.where((element){
                              return int.parse(element.rank!) == 2;
                            }).first,
                          ),
                          contestantList(
                            team: cubit.allTeam.teams!.where((element){
                              return int.parse(element.rank!) == 3;
                            }).first,
                          ),
                          contestantList(
                            team: cubit.allTeam.teams!.where((element){
                              return int.parse(element.rank!) == 4;
                            }).first,
                          ),
                          contestantList(
                            team: cubit.allTeam.teams!.where((element){
                              return int.parse(element.rank!) == 5;
                            }).first,
                          ),
                        ],

                      ),
                    ),
                  ),

                ),

              ],
            ),
          ),
        ),
      ),
    );
  },
);
  }

}
Widget winnerContainer({
   required bool isFirst,
    Color? color,
   required double height,
  required Teams team
})  {
  String image = getImage(team.teamName!);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Center(
              child: Container(
                decoration:  BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow.shade600,
                        Colors.orange,
                        Colors.red
                      ],
                    ),
                    border: Border.all(
                        color: Colors.amber
                    ),
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(40),topLeft:  Radius.circular(40))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    height: height,
                    width: 100,
                    decoration:  const BoxDecoration(

                      color: Color(0xff2C3144),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft:  Radius.circular(40))
                    ),
                  ),
                ),
              ),
            ),
          ),
          Stack(
            children: [
              if(isFirst)
              Lottie.asset(
                  "assets/images/crown.json",
                  width: 100,
                  height: 60
              ),
              Padding(
                padding: const EdgeInsets.only(top: 55 ),
                child: ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.yellow.shade600,
                            Colors.orange,
                            Colors.red
                          ],
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.amber),
                        image: DecorationImage(
                            image: AssetImage("assets/images/$image.jpg"),
                          fit: BoxFit.contain
                        )
                    ),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 110,left: 40),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color??Colors.red,
                  ),
                  child: Center(child: Text(team.rank!,style: const TextStyle(color: Colors.white),)),
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 140,left: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(team.teamName!,textAlign: TextAlign.center,style: GoogleFonts.lalezar(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                  Text(team.score!,textAlign: TextAlign.center,style: GoogleFonts.lalezar(color: color??Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
        ],
      ),
    );

}
String getImage(String name){
  if(name =="Mayar"){
    return "mayar";
  }else if(name == "Amjad"){
    return "amjad";
  }else if(name == "Mjd"){
    return "mjd";
  }else if(name == "Dani"){
    return "dani";
  }else{
    return "makram";
  }
}
Widget contestantList({
  required Teams team,
})  {
  String position = "";
  if(int.parse(team.rank!) == 1){
    position = "الأول";
  }else if(int.parse(team.rank!) == 2){
    position = "الثاني";
  }
  else if(int.parse(team.rank!) == 3){
    position = "الثالث";
  }
  else if(int.parse(team.rank!) == 4){
    position = "الرابع";
  }else{
    position = "الخامس";
  }
  String image = getImage(team.teamName!);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(20),

          border: Border.all(color: Colors.yellow)
        ),
        child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: const Icon(Icons.keyboard_arrow_left_sharp, color: Colors.white, size: 30.0),
            title: Text(
              "${team.teamName} : فريق",
              textAlign: TextAlign.end,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const Icon(Icons.leaderboard_outlined, color: Colors.orange),
                const SizedBox(width: 5,),
                Text(position, style: const TextStyle(color: Colors.white))
              ],
            ),
            trailing:
            FittedBox(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/$image.jpg"),
                radius: 30,
              ),
            )
            )
      ),
    );

}



