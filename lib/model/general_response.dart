class GeneralResponse {
  String message;
  int status;

  GeneralResponse(this.message, this.status);
  GeneralResponse.fromJsonMap(Map<String, dynamic> map)
      : status = map["status"],
        message = map["message"];
}
