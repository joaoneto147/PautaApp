
import 'package:minhaspautas/app/interfaces/ierror_interceptor.dart';

class ErrorInterceptor implements IErrorInterceptor {
  @override
  String handleError(String error) {
    switch (error) {
      case 'ERROR_WEAK_PASSWORD':
        return 'A senha informada é muito curta!';
        break;
      case 'ERROR_INVALID_EMAIL':
        return 'O email informado é inválido!';
        break;
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return 'Este email já está em uso!';
        break;
      case 'ERROR_WRONG_PASSWORD':
        return 'Usuário e/ou senha inválidos. Verifique os dados e tente novamente!';
        break;
      default:
        return 'Não foi possível realizar a operação,'
            'tente novamente mais tarde.';
    }
  }
}
