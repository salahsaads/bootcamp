import 'package:bloc/bloc.dart';
import 'package:bootcamp/Features/Home/data/network.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  Map<String, String> Adan = {};

  void getAdan(String city, String country) async {
    emit(AdanLoading());
    Adan = await getAdanTime(city, country);
    emit(AdanLoaded());
  }
}
