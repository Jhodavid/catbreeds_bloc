import 'package:dio/dio.dart';

import 'package:catbreeds_bloc/domain/services/abstract_dio_service.dart';



class CatApiDioService extends AbstractDioService {

  static final maiorDio = Dio();
  static String urlService = "https://api.thecatapi.com/v1/";

  @override
  void configureDio() {
    
    maiorDio.options.baseUrl = urlService;

    maiorDio.options.contentType = Headers.jsonContentType;
    maiorDio.options.contentType = Headers.jsonContentType;
    maiorDio.options.responseType = ResponseType.json;
    maiorDio.options.validateStatus = (status) {
      if(status == 401) {//todo: remove
       
      }
      return status! <= 500;
    };

  }

  @override
  void configureApiKey(String apiKey) {
    maiorDio.options.headers = {
      'x-api-key': apiKey
    };
  }

}