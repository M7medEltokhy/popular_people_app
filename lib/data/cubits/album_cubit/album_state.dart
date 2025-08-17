part of 'album_cubit.dart';

@immutable
sealed class AlbumState {}

final class AlbumInitial extends AlbumState {}
final class AlbumLoading extends AlbumState {}
final class AlbumSuccess extends AlbumState {}
final class AlbumError extends AlbumState {}
