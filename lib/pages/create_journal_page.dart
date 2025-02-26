import 'dart:async';
import 'dart:ui';
import 'package:dream_mapper/services/journal_editing_controller.dart';
import 'package:dream_mapper/services/journal_services.dart';
import 'package:dream_mapper/util/single_date_picker.dart';
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
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              title: Text(
                'New Journal',
                style: TextStyle(color: Colors.white),
              ),
              leading: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () async {
                  await _controller.deleteIfEmpty();
                  Navigator.of(context).pop();
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
                                color: Colors.white,
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
                    // Date picker (you'll need to connect this to the controller)
                    SingleDatePicker(
                      dateNotifier: _controller.journalDate,
                      onDateChanged: (newDate) {
                        _controller.updateDate(newDate);
                      },
                    ),
                    UltraSpacer(),

                    // Dream description - connect to controller
                    TextField(
                      controller: _controller.dreamController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Dream Description",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Describe your dream experience...",
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 3),
                        ),
                      ),
                      minLines: 5,
                      maxLines: null,
                    ),

                    UltraSpacer(),
                    TagHousing(tagHouseName: "Dream Tags"),
                    UltraSpacer(),

                    // Map description - connect to controller
                    TextField(
                      controller: _controller.mapController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Map Description",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Describe your map experience...",
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 3),
                        ),
                      ),
                      minLines: 5,
                      maxLines: null,
                    ),

                    UltraSpacer(),
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
