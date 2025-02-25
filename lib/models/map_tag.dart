import 'package:dream_mapper/models/journal.dart';
import 'package:isar/isar.dart';

part 'map_tag.g.dart';

@Collection()
class MapTag {
  Id? id;

  @Index(unique: true)
  late String name;

  // Backlinking to maps that use this tag
  @Backlink(to: 'mapTags')
  final maps = IsarLinks<Journal>();
  
  // TODO: ADD A DESCRIPTION

  MapTag({required this.name});
}
