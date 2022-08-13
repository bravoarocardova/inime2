import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://kitsu.io/api/edge';

    // httpClient.addRequestModifier<void>((request) {
    //   request.headers['Authorization'] = '12345678';
    //   return request;
    // });

    httpClient.addResponseModifier((request, response) {
      return response;
    });
  }
}
