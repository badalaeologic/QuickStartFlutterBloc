import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_start_flutter_bloc/bloc/home/home.dart';
import 'package:quick_start_flutter_bloc/networking/models/user_model.dart';
import 'package:quick_start_flutter_bloc/ui/screen/account/accounts_view.dart';
import 'package:quick_start_flutter_bloc/ui/screen/home/widget/nav_drawer_widget.dart';
import 'package:quick_start_flutter_bloc/ui/styles/app_colors.dart';
import 'package:quick_start_flutter_bloc/utils/helper.dart';

class HomePage extends StatelessWidget {
  final UserModel userModel;

  HomePage({this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.settings,
                size: 24.0,
              ),
              onPressed: () {})
        ],
      ),
      drawer: NavDrawer(
        userModel: userModel,
      ),
      body: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeFailure) {
            onWidgetDidBuild(
              () {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "${state.error}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            );
          }
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Scaffold(
              body: _buildPages(state.bottomNavigationIndex),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedItemColor: primary,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                currentIndex: state.bottomNavigationIndex,
                onTap: (index) {
                  context.read<HomeCubit>().onChangeBottomBarIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.star),
                    title: Text(
                      'Featured',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu),
                      title: Text(
                        'Courses',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                        ),
                      )),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.ondemand_video),
                    title: Text(
                      'My Courses',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      title: Text(
                        'Account',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                        ),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPages(int index) {
    switch (index) {
      case 0:
        return Container(color: Colors.red,);
      case 1:
        return Container(color: Colors.green,);
      case 2:
        return Container(color: Colors.blue,);
      case 3:
        return AccountsView();
      default:
        return Container(color: Colors.red,);
    }
  }
}
