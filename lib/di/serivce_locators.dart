
import 'package:get_it/get_it.dart';
import 'package:marketwick_assignment/presentation/di/presentation_layer_injection.dart';

final getIt = GetIt.instance;

class ServiceLocator {

  static Future<void> configureDependencies() async {

    await PresentationLayerInjection.configurePresentationLayerInjection();
  }
}
