import 'package:clean_arch_data/src/services/data_service.dart';
import 'package:clean_arch_data/device_info.g.dart';

class InformationService implements DataService {
  DeviceInfo deviceInfo = DeviceInfo();
  InformationService();
  @override
  String getData() {
    return 'Runtime Date: ${DateTime.now().toString().split('.')[0]}';
  }

  @override
  Future<String> getInfo() async {
    await deviceInfo.init();
    await Future.delayed(const Duration(seconds: 1));
    return deviceInfo.getInfoAsText();
  }
}
