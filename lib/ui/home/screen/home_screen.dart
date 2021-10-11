import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_radixweb/constant/index.dart';
import 'package:flutter_radixweb/ui/authenticaiton/bloc/authentication_bloc.dart';
import 'package:flutter_radixweb/ui/home/bloc/home_bloc.dart';
import 'package:flutter_radixweb/ui/home/bloc/home_event.dart';
import 'package:flutter_radixweb/ui/home/bloc/home_state.dart';
import 'package:flutter_radixweb/ui/home/model/profile_model.dart';
import 'package:flutter_radixweb/ui/home/widget/user_item_view.dart';
import 'package:flutter_radixweb/ui_component/loading_indicator/loading_indicator.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _homeBloc;
  List<ProfileModel> profileDetails = [];

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    WidgetsBinding.instance!.addPostFrameCallback(_onLayoutDone);
  }

  void _onLayoutDone(Duration timeStamp) {
    _handleSearch();
  }

  void _handleSearch() {
    _homeBloc.add(HomeGetUserListEvent());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.kWhite,
        appBar: AppBar(
          leading: SizedBox(),
          backgroundColor: AppColors.kMain,
          title: Text("Home"),
          actions: [
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
              ),
              onPressed: () => BlocProvider.of<AuthenticationBloc>(context).add(
                AuthenticationExited(),
              ),
            ),
          ],
        ),
        body: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
          if (state is HomeGetUserListSuccess) {
            setState(() {
              profileDetails = state.userDetails ?? [];
            });
          }
          if (state is HomeGetUserListFail) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Something went wrong!"),
              backgroundColor: AppColors.kRed,
            ));
          }
        }, builder: (context, state) {
          if (state is HomeStateLoading) {
            return LoadingIndicator();
          }
          if (state is HomeGetJobListEmptySuccess) {
            return Expanded(
              child: Text(RadixStrings.message.kNoUser),
            );
          }
          return Padding(
            padding: EdgeInsets.all(AppFontSize.value8),
            child: AnimationLimiter(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  shrinkWrap: true,
                  itemCount: profileDetails.length,
                  itemBuilder: (context, index) =>
                      AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 400),
                        child: SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: UserItemView(
                              name: profileDetails[index].name,
                              email: profileDetails[index].email,
                              thumbnail: profileDetails[index].profileImage,
                            ),
                          ),
                        ),
                      )),
            ),
          );
        }),
      );
}
