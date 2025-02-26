import 'dart:async';
import 'dart:ui';
import 'package:dream_mapper/services/journal_services.dart';
import 'package:dream_mapper/util/description_bloc.dart';
import 'package:dream_mapper/util/horizontal_divider.dart';
import 'package:dream_mapper/util/single_date_picker.dart';
import 'package:dream_mapper/util/tag_housing.dart';
import 'package:dream_mapper/util/ultra_spacer.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CreateJournalPage extends StatefulWidget {

  const CreateJournalPage({
    super.key,
  });

  @override
  State<CreateJournalPage> createState() => _CreateJournalPageState();
}

class _CreateJournalPageState extends State<CreateJournalPage> {
  final JournalServices _journalService = JournalServices();

// CONTINUOUS SAVING
  // Timer? _debounceTimer;
  // void onDreamTextChanged(String newText) {
  //   // Debounce the saving to avoid too many DB writes
  //   if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
  //   _debounceTimer = Timer(Duration(milliseconds: 500), () {
  //     _journalService.updateDreamDescription(currentJournal.id, newText);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Backdrop with blur effect
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              color: const Color.fromARGB(201, 0, 0, 0),
            ),
          ),
        ),

        // MAIN CONTENT
        Scaffold(
          backgroundColor: Colors.transparent,

          // APP BAR STUFF
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'New Journal',
              style: TextStyle(color: Colors.white),
            ),
            leading: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),

            // MAIN CONTAINER WITH ALL LOGIC
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  constraints: BoxConstraints.expand(),

                  // SHAD DATE PICKER HERE
                  child: Column(
                    children: [
                      Container(
                        child: SingleDatePicker(),
                      ),

                      UltraSpacer(),
                      DescriptionBloc(labelTitle: "Dream Description"),
                      UltraSpacer(),
                      TagHousing(tagHouseName: "Dream Tags"),
                      UltraSpacer(),
                      DescriptionBloc(labelTitle: "Map Description"),
                      UltraSpacer(),
                      TagHousing(tagHouseName: "Map Tags")


                    ],
                  ),
                
                ),
              ),
            ),
          ),
      ],
    );
  }
}
