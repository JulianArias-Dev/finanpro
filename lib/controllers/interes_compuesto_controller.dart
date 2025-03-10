import '../models/tiempo.dart';
import 'dart:math';

class InteresCompuestoController {
  InteresCompuestoController();

  double calcularInteresCompuesto(
    double capital,
    double interes,
    Tiempo duree,
    String type,
  ) {
    _validateArguments(
      capital <= 0,
      interes <= 0,
      duree.isEmpty(),
      type.isEmpty,
    );
    switch (type) {
      case 'monthly':
        int cicles = duree.years * 12 + duree.months;
        return capital * pow((1 + interes), (cicles));
      case 'annual':
        return capital * pow((1 + interes), (duree.years));
      default:
        throw ArgumentError("Tipo no válido. Debe ser 'monthly' o 'annual'.");
    }
  }

  double calcularTasaInteresCompuesto(
    double capital,
    double generatedInteres,
    Tiempo duree,
    String type,
  ) {
    if (capital <= 0 ||
        generatedInteres <= 0 ||
        duree.isEmpty() ||
        type.isEmpty) {
      throw ArgumentError(
        "Todos los argumentos deben ser mayores que cero y el tipo no debe estar vacío.",
      );
    }
    int cicles;
    switch (type) {
      case 'monthly':
        cicles = duree.years * 12 + duree.months;
        break;
      case 'annual':
        cicles = duree.years;
        break;
      default:
        throw ArgumentError("Tipo no válido. Debe ser 'monthly' o 'annual'.");
    }
    return pow((generatedInteres / capital), (1 / cicles)) - 1;
  }

  double calcularCapitalCompuesto(
    double interes,
    double generatedInteres,
    Tiempo duree,
    String type,
  ) {
    if (interes <= 0 || interes <= 0 || duree.isEmpty() || type.isEmpty) {
      throw ArgumentError(
        "Todos los argumentos deben ser mayores que cero y el tipo no debe estar vacío.",
      );
    }
    int cicles;
    switch (type) {
      case 'monthly':
        cicles = duree.years * 12 + duree.months;
        break;
      case 'annual':
        cicles = duree.years;
        break;
      default:
        throw ArgumentError("Tipo no válido. Debe ser 'monthly' o 'annual'.");
    }
    return generatedInteres / pow((1 + interes), cicles);
  }

  Tiempo calcularTiempoInteresCompuesto(
    double capital,
    double interes,
    double montoCompuesto,
    String type,
  ) {
    if (capital <= 0 || interes <= 0 || montoCompuesto <= 0 || type.isEmpty) {
      throw ArgumentError(
        "Todos los argumentos deben ser mayores que cero y el tipo no debe estar vacío.",
      );
    }

    int cicles =
        ((log(montoCompuesto) - log(capital)) / log(1 + interes)).toInt();

    switch (type) {
      case 'monthly':
        int years = cicles ~/ 12;
        int months = cicles % 12;
        return Tiempo(years, months, 0);
      case 'annual':
        return Tiempo(cicles, 0, 0);
      default:
        throw ArgumentError("Tipo no válido. Debe ser 'monthly' o 'annual'.");
    }
  }

  void _validateArguments(bool one, bool two, bool three, bool four) {
    if (one || two || three || four) {
      throw ArgumentError(
        "Todos los argumentos deben ser mayores que cero y el tipo no debe estar vacío.",
      );
    }
  }
}
