import 'package:http/http.dart' as http;

class ReqHttpModel {
  // http를 외부에 노출 안시키기 위함. 왜냐면 ReqHttp만 사면 받는 곳에서, res.http를 타입으로 지정 하고 있어야 함.
  // 근데 그렇게 하면 나중에 http를 안 쓸 때는 그 것도 다 바꿔줘야 함.
  final String body;
  final int code;
  final Map<String, String> headers;
  const ReqHttpModel(
      {required this.body, required this.code, required this.headers});

  ReqHttpModel.res(http.Response response)
      : body = response.body,
        code = response.statusCode,
        headers = response.headers;

}


class ReqHttp{

  // Getter 아님
  Future<ReqHttpModel> get({required Uri uri, Map<String, String>? headers}) async {
    // try...catch는 timeout이 아닌 다른 에러릉 위함. TimeOut은 Future는 리턴이 되야 끝이 나는데, 그 리턴되는 값 까지의 걸리는 시간을 기다리는 것
    // 호출이 잘 가긴 한 것.
    try{
      return ReqHttpModel.res(await http.get(uri, headers: headers)
          .timeout(
          Duration(seconds: 10),
          onTimeout: () async => http.Response(
              "{}", 404
          ))
      ); // get함수 자체와 동일하게 타입을 잡아줘야 한다.

    } catch(e){
        return ReqHttpModel.res(http.Response("{}", 500));
    }
  }
}

