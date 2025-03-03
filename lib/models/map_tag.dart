import 'package:dream_mapper/models/journal.dart';
import 'package:isar/isar.dart';

part 'map_tag.g.dart';

@Collection()
class MapTag {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String _name;

  // Enforcing lowercase
  String get name => _name;

  set name(String value) => _name = value.toLowerCase();

  // Backlinking to maps that use this tag
  @Backlink(to: 'mapTags')
  final maps = IsarLinks<Journal>();

  // Tag description
  String? description;

  MapTag({required String name}) {
    this.name = name;
  }
}
