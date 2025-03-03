import 'dart:async';

import 'package:dream_mapper/models/journal.dart';
import 'package:dream_mapper/services/journal_services.dart';
import 'package:flutter/material.dart';

class JournalEditingController {
  final JournalServices _journalService;

  // The current journal thats being edited
  Journal? _currentJournal;

  // Text controllers
  final TextEditingController dreamController = TextEditingController();
  final TextEditingController mapController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  // State notifiers
  final ValueNotifier<bool> isSaving = ValueNotifier<bool>(false);
  final ValueNotifier<DateTime> journalDate =
      ValueNotifier<DateTime>(DateTime.now());
  final ValueNotifier<String> appBarTitle =
      ValueNotifier<String>('New Dream Journal');

  // Timer for debounce saves
  Timer? _saveDebounceTimer;

  // Constructor
  JournalEditingController(this._journalService) {
    // Set Listeners
    dreamController.addListener(_onDreamTextChanged);
    mapController.addListener(_onMapTextChanged);
    titleController.addListener(_onTitleTextChanged);
  }

  // Initialise with new journal
  Future<void> createJournal() async {
    _currentJournal = await _journalService.createJournal(journalDate.value);

    // Initialise controllers
    dreamController.text = '';
    mapController.text = '';
  }

  // Load existing journal
  Future<void> loadJournal(int journalId) async {
    _currentJournal = await _journalService.getJournalById(journalId);

    if (_currentJournal != null) {
      // Update the value
      journalDate.value = _currentJournal!.date;

      // Set controllers WITHOUT triggering listeners
      dreamController.removeListener(_onDreamTextChanged);
      mapController.removeListener(_onMapTextChanged);
      titleController.removeListener(_onTitleTextChanged);

      dreamController.text = _currentJournal!.dreamDescription;
      mapController.text = _currentJournal!.mapDescription ?? '';

      // Reattach listeners
      dreamController.addListener(_onDreamTextChanged);
      mapController.addListener(_onMapTextChanged);
      titleController.addListener(_onTitleTextChanged);
    }
  }

  // Handle title text changes
  void _onTitleTextChanged() {
    _debounceSave(() {
      if (_currentJournal != null) {
        _journalService.updateDreamDescription(
            _currentJournal!.id, titleController.text);

        // Change the value of the app bar title notifier
        if (titleController.text.trim().isNotEmpty) {
          appBarTitle.value = titleController.text;
        } else {
          appBarTitle.value = "New Dream Journal";
        }
      }
    });
  }

  // Handle dream text changes
  void _onDreamTextChanged() {
    _debounceSave(() {
      if (_currentJournal != null) {
        _journalService.updateDreamDescription(
            _currentJournal!.id, dreamController.text);
      }
    });
  }

  // Handle map text changes
  void _onMapTextChanged() {
    _debounceSave(() {
      if (_currentJournal != null) {
        _journalService.updateMapDescription(
            _currentJournal!.id, mapController.text);
      }
    });
  }

  // Update the journal date
  Future<void> updateDate(DateTime newDate) async {
    if (_currentJournal != null && newDate != journalDate.value) {
      journalDate.value = newDate;

      // Update in memory
      _currentJournal!.date = newDate;
      _currentJournal!.updatedAt = DateTime.now();

      // Persist to database
      await _journalService.updateJournalDate(_currentJournal!.id, newDate);
    }
  }

  // Debounce save operations
  void _debounceSave(Function saveFunction) {
    // Cancel previous timer if it exists
    if (_saveDebounceTimer?.isActive ?? false) {
      _saveDebounceTimer!.cancel();
    }

    // Show saving indicator
    isSaving.value = true;

    // Set a new timer
    _saveDebounceTimer = Timer(Duration(milliseconds: 800), () {
      // Perform the save
      saveFunction();

      // Hide saving indicator after a short delay to ensure it's visible
      Future.delayed(Duration(milliseconds: 200), () {
        isSaving.value = false;
      });
    });
  }

  // Check if the journal has any content
  bool hasContent() {
    return dreamController.text.trim().isNotEmpty ||
        mapController.text.trim().isNotEmpty;
  }

  // Delete the journal if empty
  Future<void> deleteIfEmpty() async {
    if (_currentJournal != null && !hasContent()) {
      await _journalService.deleteJournal(_currentJournal!.id);
      _currentJournal = null;
    }
  }

  // Clean up resources
  void dispose() {
    _saveDebounceTimer?.cancel();
    titleController.removeListener(_onTitleTextChanged);
    dreamController.removeListener(_onDreamTextChanged);
    mapController.removeListener(_onMapTextChanged);
    titleController.dispose();
    dreamController.dispose();
    mapController.dispose();
    appBarTitle.dispose();
    isSaving.dispose();
    journalDate.dispose();
  }
}
