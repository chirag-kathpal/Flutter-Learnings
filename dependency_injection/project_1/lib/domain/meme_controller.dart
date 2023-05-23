import 'package:project_1/locator.dart';
import 'package:project_1/repository/meme_repo.dart';

class MemeDomainController {
  getNextMeme() async {
    return locator.get<MemeRepo>().getMeme();
  }
}
