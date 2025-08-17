import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itproject/data/cubits/details_cubit/details_cubit.dart';

class DetailsScreen extends StatefulWidget {
  String id;

  DetailsScreen({super.key, required this.id});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  @override
  void initState() {
    BlocProvider.of<DetailsCubit>(context).getDetails(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        return state is DetailsLoading
            ? Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: Colors.cyan,
                  ),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.cyan,
                  centerTitle: true,
                  iconTheme: IconThemeData(color: Colors.white),
                  title: Text(
                    "Details about ${BlocProvider.of<DetailsCubit>(context).detailsModel?.name ?? ""}",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Text(
                        BlocProvider.of<DetailsCubit>(context)
                                .detailsModel
                                ?.name ??
                            "",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Divider(),
                      Text(
                        BlocProvider.of<DetailsCubit>(context)
                                .detailsModel
                                ?.alsoKnownAs.toString() ??
                            "",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Divider(),
                      Text(
                        BlocProvider.of<DetailsCubit>(context)
                                .detailsModel
                                ?.birthday ??
                            "",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Divider(),
                      Text(
                        BlocProvider.of<DetailsCubit>(context)
                            .detailsModel
                            ?.knownForDepartment ??
                            "",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Divider(),
                      Text(
                        BlocProvider.of<DetailsCubit>(context)
                                .detailsModel
                                ?.biography ??
                            "",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
