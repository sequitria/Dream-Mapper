import 'dart:async';

import 'package:dream_mapper/models/dream_tag.dart';
import 'package:dream_mapper/models/journal.dart';
import 'package:dream_mapper/models/map_tag.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class JournalServices {
  static late Isar isar;

  // INITIALIZE - DB
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [JournalSchema, DreamTagSchema, MapTagSchema],
      directory: dir.path,
    );
  }

  // CREATE - Create a new journal entry with a date
  Future<Journal> createJournal(DateTime date) async {
    final journal = Journal()
      ..date = date
      ..dreamDescription = '' // Starts with empty description
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    await isar.writeTxn(() async {
      journal.id = await isar.journals.put(journal);
    });

    return journal;
  }

  // READ - Get all journals for a specific date
  Future<List<Journal>> getJournalsByDate(DateTime date) async {
    // Get journals for the day, ignoring time
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

    return await isar.journals
        .filter()
        .dateBetween(startOfDay, endOfDay)
        .findAll();
  }

  // READ - Get a specific journal by ID
  Future<Journal?> getJournalById(int id) async {
    return await isar.journals.get(id);
  }

  // UPDATE - Update dream description
  Future<void> updateDreamDescription(
      int journalId, String dreamDescription) async {
    await isar.writeTxn(() async {
      final journal = await isar.journals.get(journalId);
      if (journal != null) {
        journal.dreamDescription =
            dreamDescription; //TODO: TEST IF THIS WILL DELETE THE WHOLE DESCRIPTION
        journal.updatedAt = DateTime.now();
        await isar.journals.put(journal);
      }
    });
  }

  // UPDATE - Update map description
  Future<void> updateMapDescription(
      int journalId, String mapDescription) async {
    await isar.writeTxn(() async {
      final journal = await isar.journals.get(journalId);
      if (journal != null) {
        journal.mapDescription =
            mapDescription; //TODO: TEST IF THIS WILL DELETE THE WHOLE DESCRIPTION
        journal.updatedAt = DateTime.now();
        await isar.journals.put(journal);
      }
    });
  }

  // UPDATE - Update dream vividness
  Future<void> updateDreamVividness(int journalId, double vividness) async {
    await isar.writeTxn(() async {
      final journal = await isar.journals.get(journalId);
      if (journal != null) {
        journal.dreamVividnessScore = vividness;
        journal.updatedAt = DateTime.now();
        await isar.journals.put(journal);
      }
    });
  }

  // TODO: UPDATE DOMINANT SENSE AND LUCIDITY LEVEL

  // UPDATE - Add a dream tag
  Future<void> addDreamTag(int journalId, String tagName) async {
    await isar.writeTxn(() async {
      // Get or create the tag
      DreamTag? tag =
          await isar.dreamTags.filter().nameEqualTo(tagName).findFirst();

      if (tag == null) {
        tag = DreamTag(name: tagName);
        await isar.dreamTags.put(tag);
      }

      // Add tag to journal -> backlink handles the relationships for each tag
      final journal = await isar.journals.get(journalId);
      if (journal != null) {
        journal.dreamTags.add(tag);
        journal.updatedAt = DateTime.now();
        await isar.journals.put(journal);
      }
    });
  }

  // UPDATE - Add a map tag
  Future<void> addMapTag(int journalId, String tagName) async {
    await isar.writeTxn(() async {
      // Get or create the tag
      MapTag? tag =
          await isar.mapTags.filter().nameEqualTo(tagName).findFirst();

      if (tag == null) {
        tag = MapTag(name: tagName);
        await isar.mapTags.put(tag);
      }

      // Add tag to journal -> backlink handles relationship for each tag
      final journal = await isar.journals.get(journalId);
      if (journal != null) {
        journal.mapTags.add(tag);
        journal.updatedAt = DateTime.now();
        await isar.journals.put(journal);
      }
    });
  }

  // UPDATE - Remove a dream tag -> backlink is auto-updated
  Future<void> removeDreamTag(int journalId, String tagName) async {
    await isar.writeTxn(() async {
      final tag =
          await isar.dreamTags.filter().nameEqualTo(tagName).findFirst();

      if (tag != null) {
        final journal = await isar.journals.get(journalId);
        if (journal != null) {
          journal.dreamTags.remove(tag);
          await isar.journals.put(journal);
        }
      }
    });
  }

  // UPDATE - Remove a map tag -> backlink is auto-updated
  Future<void> removeMapTag(int journalId, String tagName) async {
    await isar.writeTxn(() async {
      final tag = await isar.mapTags.filter().nameEqualTo(tagName).findFirst();

      if (tag != null) {
        final journal = await isar.journals.get(journalId);
        if (journal != null) {
          journal.mapTags.remove(tag);
          await isar.journals.put(journal);
        }
      }
    });
  }

  // DELETE - Delete a journal
  Future<void> deleteJournal(int journalId) async {
    await isar.writeTxn(() async {
      await isar.journals.delete(journalId);
    });
  }

  // QUERY - Get all journals with a specific dream tag
  Future<List<Journal>> getJournalsByDreamTag(String tagName) async {
    final tag = await isar.dreamTags.filter().nameEqualTo(tagName).findFirst();

    if (tag != null) {
      // Load the linked journals
      await tag.dreams.load();
      return tag.dreams.toList();
    }
    return [];
  }

  // QUERY - Get all journals with a specific map tag
  Future<List<Journal>> getJournalsByMapTag(String tagName) async {
    final tag = await isar.mapTags.filter().nameEqualTo(tagName).findFirst();

    if (tag != null) {
      // Load the linked journals
      await tag.maps.load();
      return tag.maps.toList();
    }
    return [];
  }
}
