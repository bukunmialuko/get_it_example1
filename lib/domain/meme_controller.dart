import 'package:get_it_example1/repository/meme_repo.dart';

import '../locator.dart';

class MemeDomainController {
  getNextMeme() async {
    return await getIt.get<MemeRepo>().getMeme();
  }
}
