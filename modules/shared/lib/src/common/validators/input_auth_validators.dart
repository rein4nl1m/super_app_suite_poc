class InputAuthValidators {
  static String? validateName(String? name) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'Nome não pode ser vazio';
    }

    if (name.length < 2) {
      return 'Nome deve ter pelo menos 2 caracteres';
    }

    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null) {
      return null;
    }

    if (email.isEmpty) {
      return 'Email não pode ser vazio';
    }

    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (!emailRegExp.hasMatch(email)) {
      return 'Informe um email válido';
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null) {
      return null;
    }

    if (password.isEmpty) {
      return 'Senha não pode ser vazia';
    } else if (password.length > 6 && password.length <= 10) {
      return 'Senha deve ter entre 6 e 10 números';
    }

    return null;
  }
}
