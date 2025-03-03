import 'package:dream_mapper/models/journal.dart';
import 'package:isar/isar.dart';

part 'dream_tag.g.dart';

@Collection()
class DreamTag {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String _name;

  // Enforce lower case only
  String get name => _name;

  set name(String value) => _name = value.toLowerCase();

  // Backlinking to the journals that use this tag
  @Backlink(to: 'dreamTags')
  final dreams = IsarLinks<Journal>();

  // Tag description
  String? description;

  DreamTag({required String name}) {
    this.name = name;
  }
}
