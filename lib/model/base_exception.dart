class BaseException {
  String? message;

  BaseException({this.message});

  BaseException.statusCode(int statusCode) {
    switch (statusCode) {
      case 404:
        BaseException(message: "File Not Found");
        break;
      case 500:
        BaseException(message: "Internal Server Error");
        break;

      default: BaseException(message: "Something wrong try again");
    }
  }
}
