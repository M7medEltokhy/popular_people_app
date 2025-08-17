import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itproject/app/app_consts.dart';
import 'package:itproject/data/cubits/album_cubit/album_cubit.dart';

class AlbumScreen extends StatefulWidget {
  String id;

  AlbumScreen({super.key, required this.id});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  void initState() {
    BlocProvider.of<AlbumCubit>(context).getAlbum(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Text(
          "Album",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
      body: BlocBuilder<AlbumCubit, AlbumState>(
        builder: (context, state) {
          return GridView.builder(
            itemBuilder: (BuildContext context, int index) {
              return state is AlbumLoading
                  ? Center(
                child: CircularProgressIndicator(
                  color: Colors.cyan,
                ),
              )
                  : GestureDetector(
                onTap: () {
                  showImageViewer(
                    context,
                    Image.network(AppConsts.imageBaseUrl +
                        BlocProvider
                            .of<AlbumCubit>(context)
                            .albumModel!
                            .profiles![index]
                            .filePath!).image,
                    useSafeArea: true,
                    swipeDismissible: true,
                    doubleTapZoomable: true,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(AppConsts.imageBaseUrl +
                            BlocProvider
                                .of<AlbumCubit>(context)
                                .albumModel!
                                .profiles![index]
                                .filePath!)),
                  ),
                ),
              );
            },
            itemCount: BlocProvider
                .of<AlbumCubit>(context)
                .albumModel
                ?.profiles
                ?.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
          );
        },
      ),
    );
  }
}
