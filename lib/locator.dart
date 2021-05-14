import 'package:get_it/get_it.dart';

import 'domain/meme_controller.dart';
import 'repository/meme_repo.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<MemeRepo>(
    () => MemeRepo(),
  );
  getIt.registerLazySingleton<MemeDomainController>(
    () => MemeDomainController(),
  );
}
