import 'package:family/layout/cubit/family_cubit.dart';
import 'package:family/layout/family_layout.dart';
import 'package:family/shared/network/local/cache_helper.dart';
import 'package:family/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'layout/cubit/family_state.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FamilyCubit()..getAllTeam(),
        ),
      ],
      child: BlocConsumer<FamilyCubit, FamilyState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            title: 'Filey',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,

            ),
            home:  const FamilyLayout(),
          );
        },
      ),
    );
  }
}

