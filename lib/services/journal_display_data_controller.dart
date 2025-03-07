import 'package:dream_mapper/models/journal.dart';
import 'package:dream_mapper/services/journal_services.dart';

class JournalDisplayDataController {
  final JournalServices _journalService;

  JournalDisplayDataController(this._journalService);

  // Return the latest 20 journals
  Future<List<Journal>> getLatestTwentyJournals() {
    return _journalService.getFirstTwentyJournals();
  }
}
