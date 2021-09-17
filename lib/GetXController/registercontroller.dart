import 'package:dartz/dartz.dart';
import 'package:metrocoffee/exceptions/failures.dart';
import 'package:metrocoffee/models/user.dart';

class RegisterController {
  Either<Failure, User>? newResponse;
  setResponse(Either<Failure, User> response) {
    newResponse = response;
  }

}
