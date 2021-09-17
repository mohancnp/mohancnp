import 'package:metrocoffee/enums/httperrors.dart';

class Failure {
  String? message;

  void getFailureMessage(HttpErrorType errorType) {
    switch (errorType) {
      case HttpErrorType.ClientError:
        this.message =
            "(4xx)This category of error status codes points the finger at clients";
        break;
      case HttpErrorType.Informational:
        this.message =
            "(1xx)This category of error status codes points the finger at clients";
        break;
      case HttpErrorType.Redirectional:
        this.message =
            "(3xx)Indicates that the client must take some additional action in order to complete their request";
        break;
      case HttpErrorType.ServerError:
        this.message =
            "(5xx)The server takes responsibility for these error status codes";
        break;
    }
  }
}
