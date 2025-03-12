import 'package:dream_mapper/services/journal_display_data_controller.dart';
import 'package:dream_mapper/util/journal_preview_card.dart.dart';
import 'package:flutter/material.dart';

class JournalScroll extends StatefulWidget {
  final JournalDisplayDataController controller;
  final Function(int)? onPageChanged;

  const JournalScroll({
    super.key,
    required this.controller,
    this.onPageChanged,
  });

  @override
  State<JournalScroll> createState() => _JournalScrollState();
}

class _JournalScrollState extends State<JournalScroll> {
  late Stream<bool> _journalStream;
  
  @override
  void initState() {
    super.initState();
    // Get the stream once and store it
    _journalStream = widget.controller.watchJournalCreation();
  }
  
  @override
  Widget build(BuildContext context) {
    // Use StreamBuilder to rebuild UI when stream emits a value
    return StreamBuilder<bool>(
      stream: _journalStream,
      builder: (context, streamSnapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Dreams',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            
            // Journal previews
            Expanded(
              child: FutureBuilder(
                // This will be re-executed when the StreamBuilder rebuilds
                future: widget.controller.getLatestTwentyJournals(),
                builder: (context, snapshot) {
                  // Show loading when waiting
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  }
                  
                  // Handle error gracefully
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error Loading in Journals: ${snapshot.error}',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  
                  // Show this when no data available
                  final journals = snapshot.data ?? [];
                  if (journals.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.auto_stories,
                              size: 48, color: Colors.grey[400]),
                          const SizedBox(height: 16),
                          const Text(
                            'No dream journals yet',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Tap the edit button to create your first entry',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    );
                  }
                  
                  // Page view of journal previews
                  return PageView.builder(
                    controller: PageController(viewportFraction: 0.95),
                    itemCount: journals.length,
                    onPageChanged: widget.onPageChanged,
                    itemBuilder: (context, index) {
                      final journal = journals[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1.0),
                        child: JournalPreviewCard(journal: journal),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
