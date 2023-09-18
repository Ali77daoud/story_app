import '../constants/failure_messages.dart';
import '../errors/failures.dart';

class FailureHandling {
  static String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return FailureMessages.serverFailureMessage;
      case OfflineFailure:
        return FailureMessages.offlineFailureMessage;
      default:
        return FailureMessages.unExpectedFailureMessage;
    }
  }
}
