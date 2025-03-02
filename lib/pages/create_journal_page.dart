import 'dart:async';
import 'dart:ui';
import 'package:dream_mapper/services/journal_editing_controller.dart';
import 'package:dream_mapper/services/journal_services.dart';
import 'package:dream_mapper/util/single_date_picker.dart';
import 'package:dream_mapper/util/sunken_text_field.dart';
import 'package:dream_mapper/util/tag_housing.dart';
import 'package:dream_mapper/util/ultra_spacer.dart';
import 'package:flutter/material.dart';

class CreateJournalPage extends StatefulWidget {
  const CreateJournalPage({super.key});

  @override
  State<CreateJournalPage> createState() => _CreateJournalPageState();
}

class _CreateJournalPageState extends State<CreateJournalPage> {
  late JournalEditingController _controller;
  

  @override
  void initState() {
    super.initState();
    _controller = JournalEditingController(JournalServices());
    _initializeJournal();
  }

  Future<void> _initializeJournal() async {
    // Create a new journal entry
    await _controller.createJournal();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      canPop: true, // Added comma here
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        // This runs AFTER the pop has already happened
        // The didPop parameter tells you if the pop actually occurred
        if (didPop) {
          _controller.deleteIfEmpty();
        }
      },

      child: Stack(
        children: [
          // Backdrop with blur effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                color: const Color.fromARGB(221, 0, 0, 0),
              ),
            ),
          ),

          // Main content
          Scaffold(
            backgroundColor: const Color.fromARGB(255, 15, 14, 14),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              title: Text(
                'New Journal',
                style: TextStyle(color: theme.colorScheme.primary),
              ),
              leading: IconButton(
                icon: Icon(Icons.close, color: theme.colorScheme.primary),
                onPressed: () async {
                  await _controller.deleteIfEmpty();
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
              ),
              actions: [
                // Show saving indicator
                ValueListenableBuilder<bool>(
                  valueListenable: _controller.isSaving,
                  builder: (context, isSaving, child) {
                    return isSaving
                        ? Padding(
                            padding: EdgeInsets.all(16),
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          )
                        : SizedBox.shrink();
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    // Date Picker
                    SingleDatePicker(
                      dateNotifier: _controller.journalDate,
                      onDateChanged: (newDate) {
                        _controller.updateDate(newDate);
                      },
                    ),

                    SizedBox(height: 40),

                    // Dream description - connect to controller
                    SunkenTextField(
                      controller: _controller.dreamController,
                      labelText: "Dream Description",
                      hintText: "Describe your dream experience...",
                      minLines: 5,
                      maxLines: null,
                      backgroundColor: Color(0xFF121212), // Very dark gray
                      textColor: Colors.white,
                    ),

                    

                    SizedBox(height: 40),
                    TagHousing(tagHouseName: "Dream Tags"),
                    SizedBox(height: 40),

                    SunkenTextField(
                      controller: _controller.mapController,
                      labelText: "Map Description",
                      hintText: "Describe your map experience...",
                      minLines: 5,
                      maxLines: null,
                      backgroundColor: Color(0xFF121212), // Very dark gray
                      textColor: Colors.white,
                    ),


                    SizedBox(height: 40),
                    TagHousing(tagHouseName: "Map Tags"),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
