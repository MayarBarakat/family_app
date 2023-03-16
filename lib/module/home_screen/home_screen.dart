
import 'package:family/layout/cubit/family_cubit.dart';
import 'package:family/layout/cubit/family_state.dart';
import 'package:family/module/team_details/team_details.dart';
import 'package:family/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FamilyCubit, FamilyState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = FamilyCubit.get(context);


    return cubit.loadTeams? const Center(child: CircularProgressIndicator(),): Container(
      color: const Color(0xff222433),

      child: Scaffold(
        backgroundColor: Colors.transparent,

        appBar: AppBar(
          title: Text(
            "الرئيسية",
            style: GoogleFonts.lalezar(fontSize: 26, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                crossAxisCount: 2,
                childAspectRatio: .6
              ),
              children: [
                buildTeamCard(
                    name: cubit.allTeam.teams!.elementAt(0).teamName!,
                    total: cubit.allTeam.teams!.elementAt(0).score!,
                    color:int.parse(cubit.allTeam.teams!.elementAt(0).score!) > 0? Colors.green:Colors.red,
                    context: context,
                  teamId: cubit.allTeam.teams!.elementAt(0).teamId!,
                  imageOne: "mayar",
                  imageTow: "waleed"
                ),
                buildTeamCard(
                    name: cubit.allTeam.teams!.elementAt(1).teamName!,
                    total: cubit.allTeam.teams!.elementAt(1).score!,
                    color:int.parse(cubit.allTeam.teams!.elementAt(1).score!) > 0? Colors.green:Colors.red,
                    context: context,
                    teamId: cubit.allTeam.teams!.elementAt(1).teamId!,
                  imageOne: "amjad",
                  imageTow: "khaled"

                ),
                buildTeamCard(
                    name: cubit.allTeam.teams!.elementAt(2).teamName!,
                    total: cubit.allTeam.teams!.elementAt(2).score!,
                    color:int.parse(cubit.allTeam.teams!.elementAt(2).score!) > 0? Colors.green:Colors.red,
                    context: context,
                    teamId: cubit.allTeam.teams!.elementAt(2).teamId!,
                  imageOne: "mjd",
                  imageTow: "fouad"
                ),
                buildTeamCard(
                    name: cubit.allTeam.teams!.elementAt(3).teamName!,
                    total: cubit.allTeam.teams!.elementAt(3).score!,
                    color:int.parse(cubit.allTeam.teams!.elementAt(3).score!) > 0? Colors.green:Colors.red,
                    context: context,
                    teamId: cubit.allTeam.teams!.elementAt(3).teamId!,
                  imageOne: "dani",
                  imageTow: "obai"
                ),
                buildTeamCard(
                    name: cubit.allTeam.teams!.elementAt(4).teamName!,
                    total: cubit.allTeam.teams!.elementAt(4).score!,
                    color:int.parse(cubit.allTeam.teams!.elementAt(4).score!) > 0? Colors.green:Colors.red,
                    context: context,
                    teamId: cubit.allTeam.teams!.elementAt(4).teamId!,
                  imageOne: "makram",
                  imageTow: "rani"
                ),
              ],
            ),
        ),
      ),
    );
  },
);
  }

  Widget buildTeamCard(
          {required String name,
          required String total,
          required Color color,
          required String teamId,
            required context,
            required String imageOne,
            required String imageTow,
          }) =>
      InkWell(
        borderRadius: BorderRadius.circular(15),

        onTap: () {
          navigateTo(context, TeamDetails(teamId: teamId,image:imageOne));
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              // color: Color(0xFFF5F5F3),
              color: const Color(0xff2C3144),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Lottie.asset("assets/images/card.json",fit: BoxFit.cover,height: 70,width: double.infinity),
              buildRowOfImages(
                imageOne: imageOne,
                imageTow: imageTow
              ),
              buildTotalSection(
                teamName: name,
                score: total,
                color: color
              ),
            ],
          )
        ),
      );

  Widget buildRowOfImages(
  {
  required String imageOne,
  required String imageTow,
}
      ){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                padding: const EdgeInsets.all(3), // Border width
                decoration: BoxDecoration(color: Colors.black.withOpacity(.8), borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(45),
                      child: Image.asset(
                        "assets/images/$imageOne.jpg",
                        fit: BoxFit.cover,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                padding: const EdgeInsets.all(3), // Border width
                decoration: BoxDecoration(color: Colors.black.withOpacity(.8), borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: ClipRRect(

                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(45),
                      child: Image.asset(
                        "assets/images/$imageTow.jpg",
                        fit: BoxFit.cover,

                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTotalSection({required String teamName,required String score,required Color color}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(teamName,style: GoogleFonts.lalezar(fontSize: 20, color: Colors.white),),
              Text(" : فريق",style: GoogleFonts.lalezar(fontSize: 18, color: Colors.white),),

            ],
          ),
          const Divider(thickness: 3,color: Colors.red,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [

              Text(
                score,
                style: TextStyle(color: color, fontSize: 20),
              ),
              const Text(
                " : المجموع",
                style: TextStyle(fontSize: 22, color: Colors.white,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
