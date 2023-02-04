// 172.30.1.55

import 'package:http/http.dart' as http;

class ReqHttpModel {
  final String body;
  final int code;
  final Map<String, String> headers;
  const ReqHttpModel({
    required this.body, required this.code, required this.headers });

  ReqHttpModel.res(http.Response response)
    : body = response.body,
      code = response.statusCode,
      headers = response.headers;
}

class ReqHttp{
  Future<ReqHttpModel> get({required Uri uri, Map<String, String>? headers}) async{
    try{
      return ReqHttpModel.res(
          await http.get(uri, headers: headers)
              .timeout(Duration(seconds:10),
              onTimeout: () async => http.Response(
                  "{}", 404
              ))
      );
    } catch(e){
      return ReqHttpModel.res(http.Response("{}", 500));
    }
  }
}