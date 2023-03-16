import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/all_meet_for_team.dart';

class TeamResults extends StatelessWidget {
  final TeamMeetsWithDate teamMeetsWithDate;
  const TeamResults({super.key, required this.teamMeetsWithDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(teamMeetsWithDate.meet!.date!),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: buildCard(
            teamMeetsWithDate: teamMeetsWithDate
          ),
        ),
      ),
    );
  }
  Widget buildCard({
    required TeamMeetsWithDate teamMeetsWithDate,
  }

      ){
    String team1Score = scoreFormat(int.parse(teamMeetsWithDate.team1Score!));
    String team2Score = scoreFormat(int.parse(teamMeetsWithDate.team2Score!));
    String team3Score = scoreFormat(int.parse(teamMeetsWithDate.team3Score!));
    String team4Score = scoreFormat(int.parse(teamMeetsWithDate.team4Score!));

    Color team1Color = colorFormat(team1Score);
    Color team2Color = colorFormat(team2Score);
    Color team3Color = colorFormat(team3Score);
    Color team4Color = colorFormat(team4Score);
    return Container(
      width: double.infinity,
      height: 400,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(

          children: [
            Center(child: Text(teamMeetsWithDate.teamName!,style: GoogleFonts.aBeeZee(fontSize: 20),),),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("${teamMeetsWithDate.team1Name} : ",style: GoogleFonts.lalezar(fontSize: 17),),
                Text(team1Score,style: GoogleFonts.aBeeZee(color: team1Color,fontSize: 16),),
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("${teamMeetsWithDate.team2Name} : ",style: GoogleFonts.lalezar(fontSize: 17),),
                Text(team2Score,style: GoogleFonts.aBeeZee(color: team2Color,fontSize: 16),),
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("${teamMeetsWithDate.team3Name} : ",style: GoogleFonts.lalezar(fontSize: 17),),
                Text(team3Score,style: GoogleFonts.aBeeZee(color: team3Color,fontSize: 16),),
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("${teamMeetsWithDate.team4Name} : ",style: GoogleFonts.lalezar(fontSize: 17),),
                Text(team4Score,style: GoogleFonts.aBeeZee(color: team4Color,fontSize: 16),),
              ],
            ),
          ],
        ),
      ),
    );
  }
 String scoreFormat(int score){
   if(score==1){
     return "فاز";
   }
   else if(score==0){
     return "لم يلعب";
   }else{
     return "خسر";
   }
 }
  Color colorFormat(String score){
    if(score=="فاز"){
      return Colors.green;
    }
    else if(score=="لم يلعب"){
      return Colors.yellow.shade900;
    }else{
      return Colors.red;
    }
  }
}
