import 'package:dream_mapper/models/journal.dart';
import 'package:isar/isar.dart';

part 'dream_tag.g.dart';

@Collection()
class DreamTag {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;

  // Backlinking to the journals that use this tag
  @Backlink(to: 'dreamTags')
  final dreams = IsarLinks<Journal>();

  //TODO: ADD A DESCRIPTION

  DreamTag({required this.name});
}
