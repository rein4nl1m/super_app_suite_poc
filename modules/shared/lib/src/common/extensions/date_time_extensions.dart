extension DateTimeExtensions on DateTime {
  String get dateFormatted =>
      this.day.toString().padLeft(2, "0") +
      "/" +
      this.month.toString().padLeft(2, "0") +
      "/" +
      this.year.toString();

  String get weekdayInFull {
    switch (this.weekday) {
      case 1:
        return "Segunda-Feira";
      case 2:
        return "Terça-Feira";
      case 3:
        return "Quarta-Feira";
      case 4:
        return "Quinta-Feira";
      case 5:
        return "Sexta-Feira";
      case 6:
        return "Sábado";
      default:
        return "Domingo";
    }
  }
}
