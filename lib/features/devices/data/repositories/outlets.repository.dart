import 'package:home_automation_app/features/devices/data/models/outlet.model.dart';

class OutletsRepository {

  Future<List<OutletModel>> getAvailableOutlets() {

    return Future.value([
      OutletModel(
        id: '0',
        label: 'Outlet #0',
        ip: '192.168.68.117',
      ),
      OutletModel(
        id: '1',
        label: 'Outlet #1',
        ip: '192.168.68.118'
      ),
      OutletModel(
        id: '2',
        label: 'Outlet #2',
        ip: '192.168.68.119'
      )
    ]);
  }
}