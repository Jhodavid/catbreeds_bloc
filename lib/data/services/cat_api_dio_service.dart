import 'package:dio/dio.dart';

import 'package:catbreeds_bloc/domain/services/abstract_dio_service.dart';



class CatApiDioService extends AbstractDioService {

  static final catApiDio = Dio();
  static String urlService = "https://api.thecatapi.com/v1";

  @override
  void configureDio() {
    
    catApiDio.options.baseUrl = urlService;

    catApiDio.options.contentType = Headers.jsonContentType;
    catApiDio.options.contentType = Headers.jsonContentType;
    catApiDio.options.responseType = ResponseType.json;
    catApiDio.options.validateStatus = (status) {
      if(status == 401) {//todo: remove
       
      }
      return status! <= 500;
    };

  }

  @override
  void configureApiKey(String apiKey) {
    catApiDio.options.headers = {
      'x-api-key': apiKey
    };
  }

}