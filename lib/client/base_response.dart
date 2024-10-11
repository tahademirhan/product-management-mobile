abstract class BaseResponse {
  String code = 'OK';
  String message = '';
  var time;
  BaseResponse();
  bool isOK() {
    return code == 'OK';
  }

  fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['messages'] != null) {
      message = json['messages'].map<String>((m) => m.toString()).toList()[0];
    }
  }
}