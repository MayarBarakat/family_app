

import 'package:family/models/all_meet_for_team.dart';
import 'package:family/models/all_team.dart';
import 'package:family/shared/network/end_points.dart';
import 'package:family/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../module/home_screen/home_screen.dart';
import '../../module/rank_screen/rank_screen.dart';
import 'family_state.dart';

class FamilyCubit extends Cubit<FamilyState> {
  FamilyCubit() : super(FamilyInitial());
  static FamilyCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreen = [
    const HomeScreen(),
    const RankScreen()
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(FamilyChangeBottomState());
  }

  
  late AllTeam allTeam = AllTeam();
  bool loadTeams = false;
  Future<void> getAllTeam()async {
    loadTeams = true;
    emit(FamilyGetAllTeamLoadingState());
    DioHelper.getData(url: GET_ALL_TEAM)
        .then((value){
          allTeam = AllTeam.fromJson(value.data);
          loadTeams = false;


          emit(FamilyGetAllTeamSuccessState());
    }).onError((error, stackTrace){
      loadTeams = false;
      print(error.toString());
      emit(FamilyGetAllTeamErrorState());
    });
  }
  late AllMeetForTeam allMeetForTeam;
  bool loadMeetForTeam = false;
  Future<void> getMeetsForOneTeam(String teamId)async{
    loadMeetForTeam = true;
    emit(FamilyGetAllMeetForTeamLoadingState());
    DioHelper.postData(
        url: GET_ALL_MEET_FOR_TEAM,
        data: {
          "teamId":teamId,
        }
    ).then((value) {
      allMeetForTeam = AllMeetForTeam.fromJson(value.data);

      loadMeetForTeam = false;
      emit(FamilyGetAllMeetForTeamSuccessState());
    }).onError((error, stackTrace){
      loadMeetForTeam = false;
      print(error.toString());
      emit(FamilyGetAllMeetForTeamErrorState());
    });
  }
}
