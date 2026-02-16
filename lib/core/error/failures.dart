abstract class Failure {
  final String message;
  const Failure(this.message);
}

class JsonParseFailure extends Failure {
  const JsonParseFailure() : super("Failed to parse JSON data");
}

class CalculationFailure extends Failure {
  const CalculationFailure(String msg) : super(msg);
}