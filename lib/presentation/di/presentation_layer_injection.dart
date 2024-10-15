
import 'package:marketwick_assignment/presentation/di/module/store_module.dart';

class PresentationLayerInjection {
  static Future<void> configurePresentationLayerInjection() async {
    await StoreModule.configureStoreModuleInjection();
  }
}
