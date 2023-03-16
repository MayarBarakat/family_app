import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'cubit/family_cubit.dart';
import 'cubit/family_state.dart';

class FamilyLayout extends StatefulWidget {
  const FamilyLayout({Key? key}) : super(key: key);

  @override
  State<FamilyLayout> createState() => _FamilyLayoutState();
}

class _FamilyLayoutState extends State<FamilyLayout> {
  @override
  Widget build(BuildContext context) {
    var cubit = FamilyCubit.get(context);
    return BlocConsumer<FamilyCubit, FamilyState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
              extendBody: true,
              bottomNavigationBar: Container(

                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 15,
                  ),
                  child: GNav(
                    rippleColor: Colors.red[900]!,
                    iconSize: 35,
                    // tabBorderRadius: 15,

                    tabActiveBorder:
                        Border.all(color: Colors.white, width: 1.5),
                    tabBorder: Border.all(color: Colors.grey, width: 1),
                    color: Colors.white,
                    activeColor: Colors.white,
                    tabBackgroundColor: Colors.red[900]!,
                    padding: const EdgeInsets.all(10),
                    gap: 20,
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: "الرئيسية",
                        textStyle: GoogleFonts.lalezar(
                            fontSize: 20, color: Colors.white),
                      ),
                      GButton(
                        icon: Icons.account_tree_outlined,
                        text: "الترتيب",
                        textStyle: GoogleFonts.lalezar(
                            fontSize: 20, color: Colors.white),
                      ),
                    ],
                    selectedIndex: cubit.currentIndex,
                    onTabChange: (index) {
                      cubit.changeBottom(index);
                    },
                  ),
                ),
              ),
              body: IndexedStack(
                index: cubit.currentIndex,
                children: cubit.bottomScreen,
              )),
        );
      },
    );
  }
}
