import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itproject/data/cubits/popular_people_cubit/popular_people_cubit.dart';
import 'package:itproject/data/models/popular_people_model.dart';
import 'package:itproject/prisentation/components/home_screen_item.dart';
import 'package:itproject/prisentation/screens/profile_screen.dart';
import '../../data/remote_data_source/popular_people_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<PopularPeopleCubit>(context).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<PopularPeopleCubit, PopularPeopleState>(
            builder: (context, state) {
              return state is PopularPeopleLoading
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.cyan,
                        ),
                      ),
                    )
                  : Expanded(
                      flex: 5,
                      child: GridView.builder(
                        itemBuilder: (context, index) {
                          return HomeScreenItem(
                            id: BlocProvider.of<PopularPeopleCubit>(context)
                                .popularPeopleModel!
                                .results![index]
                                .id
                                .toString(),
                            name: BlocProvider.of<PopularPeopleCubit>(context)
                                    .popularPeopleModel!
                                    .results?[index]
                                    .name ??
                                "",
                            field: BlocProvider.of<PopularPeopleCubit>(context)
                                    .popularPeopleModel!
                                    .results?[index]
                                    .knownForDepartment ??
                                "",
                          );
                        },
                        itemCount: BlocProvider.of<PopularPeopleCubit>(context)
                            .popularPeopleModel
                            ?.results
                            ?.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 210,
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.cyan,
                    backgroundImage: AssetImage("assets/images/me.jpg"),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mohamed Eltokhy",
                          style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "01060052583",
                          style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () {},
                title: Text(
                  "notifications",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                leading: Icon(
                  Icons.notifications,
                  color: Colors.cyan,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => ProfileScreen()));
                },
                title: Text(
                  "profile",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                leading: Icon(
                  Icons.person,
                  color: Colors.cyan,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () {},
                title: Text(
                  "Dashboard",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                leading: Icon(
                  Icons.dashboard,
                  color: Colors.cyan,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () {},
                title: Text(
                  "Language",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                leading: Icon(
                  Icons.language,
                  color: Colors.cyan,
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.cyan,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () {},
                title: Text(
                  "Log Out",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                leading: Icon(
                  Icons.logout,
                  color: Colors.cyan,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
