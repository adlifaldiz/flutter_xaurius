import 'package:flutter_xaurius/resources/repositories/repository.dart';

class Bloc {
  final _repository = Repository();

  addSaveEmail(email) async {
    await _repository.addSaveEmail(email);
  }

  addSaveCode(email, otp) async {
    _repository.addVerifCode(email, otp);
  }

  dispose() {}
}

final bloc = Bloc();
