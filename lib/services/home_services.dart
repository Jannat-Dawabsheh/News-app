import 'package:dio/dio.dart';
import 'package:news_app/models/top_headlines_api_response.dart';
import 'package:news_app/utils/app_constants.dart';

abstract class HomeServices{
  Future <TopHeadlinesApiResponse> getTopHeadline();
}

class HomeServicesImpl implements HomeServices{
  final dio=Dio();
  @override
  Future <TopHeadlinesApiResponse> getTopHeadline() async{
    dio.options.baseUrl=AppConstants.baseUrl;
    Response<Map<String,dynamic>>response=await dio.get(
      AppConstants.topHeadlines,
      queryParameters: {
        'country':'us',
      },
      options: Options(
        headers: {
          'Authorization':'Bearer 71a392c3ca4f40659ebb3128960800ee'
        }
      )
    );
    if(response.statusCode!=200){
      throw Exception('Faild to load top headlines');
    }
    return TopHeadlinesApiResponse.fromJson(response.data!);
  }
}

