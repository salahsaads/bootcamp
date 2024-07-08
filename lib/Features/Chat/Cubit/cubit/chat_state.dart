part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}
// getallusers
final class getusersloading extends ChatState {}
final class getusersloaded extends ChatState {}
final class getusersfailed extends ChatState {}