import 'package:dream_mapper/models/dream_tag.dart';
import 'package:dream_mapper/models/map_tag.dart';
import 'package:isar/isar.dart';

part 'journal.g.dart';

@Collection()
class Journal {
  Id id = Isar.autoIncrement;

  // Date reference
  late DateTime date;

  // Dream content
  late String dreamDescription;
  double? dreamVividnessScore;
  String? dominantSense;
  String? lucidityLevel; // How concious was it?

  // Map content
  String? mapDescription;

  // Tags (using links for many-to-many relationships)
  final dreamTags = IsarLinks<DreamTag>();
  final mapTags = IsarLinks<MapTag>();

  // Metadata
  late DateTime createdAt;
  late DateTime updatedAt;
}
