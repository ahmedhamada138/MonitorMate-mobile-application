
  double roundToTwoDecimalPlaces(var value) {
    double newva = double.parse(value.toString());
    return (newva * 100).round() / 100;
  }