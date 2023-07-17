import 'dart:math';
import 'package:home_automation_app/features/landing/data/models/energy_consumption.dart';
import 'package:home_automation_app/features/landing/data/models/energy_consumption_value.dart';
import 'package:intl/intl.dart';

class EnergyConsumptionDataRepository {

  EnergyConsumption getEnergyConsumption() {

    List<EnergyConsumptionValue> consumptionValues = [];

    var date = DateTime.now();
    var random = Random();
    var thresholdValue = 70;

    for(var i = 0; i < 20; i++) {
      double currentValue = random.nextInt(50) + 30;
      consumptionValues.add(EnergyConsumptionValue(
        value: currentValue,
        day: DateFormat.E().format(date).substring(0, 2).toUpperCase(),
        aboveThreshold: currentValue > thresholdValue
      ));

      date = date.add(const Duration(days: 1));
    }

    return EnergyConsumption(
      values: consumptionValues
    );
  }

}