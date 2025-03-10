import 'package:dream_mapper/models/journal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JournalPreviewCard extends StatelessWidget {
  final Journal journal;
  final VoidCallback? onTap;

  const JournalPreviewCard({
    super.key,
    required this.journal,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Format date
    final dateFormat = DateFormat('dd MMM yyyy');
    final formattedDate = dateFormat.format(journal.date);

    // Get dream and map tag names
    List<String> dreamTagNames = [];
    List<String> mapTagNames = [];

    // This would need to be implemented based on your data structure
    // Assume these are empty for now
    
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        color: const Color(0xFF121212),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date and indicator
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 2),
              child: Row(
                children: [
                  // Colorful dream indicator
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.purple, Colors.blue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withValues(alpha: 0.3),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
                  ),
                  const Spacer(),
                  // Show vividness if available
                  if (journal.dreamVividnessScore != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 14,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            journal.dreamVividnessScore!.toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            // Dream content preview
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dream title or first line
                    Text(
                      _getDreamTitle(journal.journalTitle),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // Dream description preview
                    Expanded(
                      child: Text(
                        journal.dreamDescription,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                          height: 1.4,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Tags section
            if (dreamTagNames.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: dreamTagNames.take(3).map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.blue.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

            // "Read more" section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Color(0xFF1A1A1A),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.auto_stories,
                    size: 16,
                    color: Color.fromARGB(255, 222, 221, 208),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Read full dream',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color.fromARGB(255, 222, 221, 208),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  if (journal.mapDescription != null &&
                      journal.mapDescription!.isNotEmpty)
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.map,
                          size: 16,
                          color: Colors.purple,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Map',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDreamTitle(String description) {
    if (description.isEmpty) return 'Untitled Dream';

    // Get first line or first 40 characters
    final firstLine = description.split('\n').first;
    if (firstLine.length <= 40) return firstLine;

    return '${firstLine.substring(0, 37)}...';
  }
}
