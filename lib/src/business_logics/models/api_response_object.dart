class ResponseCode {
  static const int noInternetConnection = 0;
  static const int authorizationFailed = 900;
  static const int successful = 200;
  static const int failed = 501;
  static const int notFount = 502;
}

class ResponseObject {
  int id;
  Object object;

  ResponseObject(
      {this.id = ResponseCode.noInternetConnection, required this.object});
}
