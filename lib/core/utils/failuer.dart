abstract class Failuer {
  final String errMessage;
  Failuer(this.errMessage);
}

class ServerFailure extends Failuer {
  ServerFailure(super.errMessage);
}
