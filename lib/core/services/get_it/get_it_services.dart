import 'package:get_it/get_it.dart';
import 'package:malab/core/services/fcm/fcm_services.dart';
import 'package:malab/core/services/fire_base_auth_services/fire_base_aut_ser.dart';
import 'package:malab/core/services/fire_base_storge.dart/data_base_services.dart';
import 'package:malab/core/services/fire_base_storge.dart/fire_base_storage.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FireBaseAutSer>(FireBaseAutSer());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<FCMService>(FCMService());
}
