part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

//sinup state
final class SingUPLoading extends AuthState {
  
}

final class SingUPLoaded extends AuthState {
  final String re;
  SingUPLoaded(this.re);
}

final class SingUPerror extends AuthState {}

//singin state
final class SingInLoading extends AuthState {}

final class SingInLoaded extends AuthState {
   final String re;
 SingInLoaded(this.re);
}

final class SingInerror extends AuthState {}
// states for forgetPassword
final class ForgetPasswordLoading extends AuthState {}
final class ForgetPasswordLoaded extends AuthState {
  final String response;
  ForgetPasswordLoaded(this.response);
}
final class ForgetPasswordFailed extends AuthState {}