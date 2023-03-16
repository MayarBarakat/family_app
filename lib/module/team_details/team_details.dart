import 'package:family/layout/cubit/family_state.dart';
import 'package:family/module/team_results/team_results.dart';
import 'package:family/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../layout/cubit/family_cubit.dart';

class TeamDetails extends StatefulWidget {
  final String teamId;
  final String image;
  const TeamDetails({super.key, required this.teamId, required this.image});

  @override
  State<TeamDetails> createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {
  @override
  void initState() {
    context.read<FamilyCubit>().getMeetsForOneTeam(widget.teamId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FamilyCubit, FamilyState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = FamilyCubit.get(context);
    return Scaffold(

      appBar: AppBar(
        title: Text("تفاصيل الفريق",style: GoogleFonts.lalezar(),),
        centerTitle: true,
      ),
      body:cubit.loadMeetForTeam?const Center(child: CircularProgressIndicator(),): Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemBuilder: (context,index){
               return Container(
                   decoration: BoxDecoration(
                     color: const Color(0xff2C3144),
                       borderRadius: BorderRadius.circular(20),

                       border: Border.all(color: Colors.yellow)
                   ),
                   child: ListTile(
                     onTap: (){
                       navigateTo(context, TeamResults(teamMeetsWithDate: cubit.allMeetForTeam.teamMeetsWithDate!.elementAt(index)));
                     },
                       contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                       leading: const Icon(Icons.keyboard_arrow_left_sharp, color: Colors.white, size: 30.0),
                       title: Text(
                         "التاريخ : ${cubit.allMeetForTeam.teamMeetsWithDate!.elementAt(index).meet!.date} ",
                         textAlign: TextAlign.end,
                         style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
                       ),
                       // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                       trailing:
                       FittedBox(
                         child: CircleAvatar(
                           backgroundImage: AssetImage("assets/images/${widget.image}.jpg"),
                           radius: 30,
                         ),
                       )
                   )
               );
              },
              separatorBuilder: (context,index){
                return const SizedBox(height: 10,);
              },
              itemCount: cubit.allMeetForTeam.teamMeetsWithDate!.length,
          ),
        ),
      ),
    );
  },
);
  }
}
