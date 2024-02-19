import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:news_app/models/top_headlines_api_response.dart';
import 'package:news_app/services/home_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final HomeServices=HomeServicesImpl();

  void getTopHeadline()async{
    emit(TopHeadlinesLoading());
    try{
      final response=await HomeServices.getTopHeadline();
      emit(TopHeadlinesLoaded(response));
    }catch(e){
      emit(TopHeadlinesError(e.toString()));
    }
  }
}
