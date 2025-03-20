import 'package:dream_mapper/models/dream_tag.dart';
import 'package:dream_mapper/models/map_tag.dart';
import 'package:dream_mapper/services/journal_editing_controller.dart';
import 'package:dream_mapper/services/journal_services.dart';
import 'package:flutter/material.dart';
import 'dart:async';

// Enum for tag types to make code more readable
enum TagType {
  dream,
  map,
}

class TagContainment extends StatefulWidget {
  final TagType tagType;
  final JournalEditingController controller;
  final Color glowColor;

  const TagContainment({
    super.key,
    required this.tagType,
    required this.controller,
    required this.glowColor,
  });

  @override
  State<TagContainment> createState() => _TagContainmentState();
}

class _TagContainmentState extends State<TagContainment> {
  late Stream<bool> _tagStream;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  bool _isSearching = false;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();

    // Convert stream to broadcast stream to allow multiple listeners
    _tagStream = widget.tagType == TagType.dream
        ? JournalServices().newDreamTagCreated().asBroadcastStream()
        : JournalServices().newMapTagCreated().asBroadcastStream();

    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  // Helper method to get the appropriate tag list future for a particular journal
  Future<List<dynamic>> _getTagsFuture() {
    return widget.tagType == TagType.dream
        ? widget.controller.getDreamTags()
        : widget.controller.getMapTags();
  }

  // Helper method to get all available tags future
  Future<List<dynamic>> _getAllTagsFuture() {
    return widget.tagType == TagType.dream
        ? widget.controller.getAllDreamTags()
        : widget.controller.getAllMapTags();
  }

  // Helper method to add a tag based on type
  void _addTag(String tagName) {
    if (tagName.trim().isEmpty) return;

    if (widget.tagType == TagType.dream) {
      widget.controller.addDreamTagToJournal(tagName.trim());
    } else {
      widget.controller.addMapTagToJournal(tagName.trim());
    }

    // Clear search after adding
    _searchController.clear();
  }

  // Helper to remove a tag
  void _removeTag(String tagName) {
    if (widget.tagType == TagType.dream) {
      // Implement remove dream tag
      if (widget.controller.currentJournal != null) {
        JournalServices()
            .removeDreamTag(widget.controller.currentJournal!.id, tagName);
      }
    } else {
      // Implement remove map tag
      if (widget.controller.currentJournal != null) {
        JournalServices()
            .removeMapTag(widget.controller.currentJournal!.id, tagName);
      }
    }
  }

  // Get title based on tag type
  String get _getTitle {
    return widget.tagType == TagType.dream ? "Dream Tags" : "Map Tags";
  }

  // Get icon based on tag type
  IconData get _getIcon {
    return widget.tagType == TagType.dream ? Icons.cloud : Icons.map;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row
        Row(
          children: [
            Icon(
              _getIcon,
              color: widget.glowColor.withAlpha(200),
              size: 18,
            ),
            const SizedBox(width: 12),
            Text(
              _getTitle,
              style: TextStyle(
                color: widget.glowColor.withAlpha(200),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => _showTagBottomSheet(context),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: widget.glowColor.withAlpha(40),
                      blurRadius: 8,
                      spreadRadius: -2,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.add,
                  color: widget.glowColor,
                  size: 16,
                ),
              ),
            )
          ],
        ),

        const SizedBox(height: 12),

        // Tags list wrapped in StreamBuilder for live updates
        SizedBox(
          height: 40, // Fixed height for the tag container
          child: StreamBuilder<void>(
            stream: _tagStream,
            builder: (context, _) {
              return FutureBuilder<List<dynamic>>(
                future: _getTagsFuture(),
                builder: (context, snapshot) {
                  // Show loading when waiting
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error loading tags: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    );
                  }

                  final tags = snapshot.data ?? [];

                  if (tags.isEmpty) {
                    return Opacity(
                      opacity: 0.5,
                      child: Center(
                        child: Text(
                          'No ${widget.tagType == TagType.dream ? "dream" : "map"} tags yet',
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    );
                  }

                  // Horizontal scrolling list of tags
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tags.length,
                    itemBuilder: (context, index) {
                      final tag = tags[index];
                      final tagName =
                          tag.name; // Works for both DreamTag and MapTag

                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Chip(
                          label: Text(
                            tagName,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor:
                              widget.glowColor.withValues(alpha: 0.15),
                          side: BorderSide(
                            color: widget.glowColor.withValues(alpha: 0.3),
                            width: 1,
                          ),
                          deleteIcon: const Icon(
                            Icons.close,
                            size: 14,
                          ),
                          onDeleted: () => _removeTag(tagName),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  // Show bottom sheet for tag management
  void _showTagBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A2130), // Match app background
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true, // Make it take up to 90% of screen height
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context)
                    .viewInsets
                    .bottom, // Account for keyboard
              ),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.9,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with close button
                    Row(
                      children: [
                        Text(
                          "Manage ${widget.tagType == TagType.dream ? "Dream" : "Map"} Tags",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white70),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Search/Add input field
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: widget.glowColor.withValues(alpha: 0.2),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: widget.glowColor.withValues(alpha: 0.1),
                            blurRadius: 10,
                            spreadRadius: -2,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        focusNode: _searchFocus,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Search or create tag...",
                          hintStyle: TextStyle(color: Colors.white38),
                          prefixIcon: Icon(
                            Icons.search,
                            color: widget.glowColor.withValues(alpha: 0.5),
                          ),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: widget.glowColor,
                                  ),
                                  onPressed: () {
                                    _addTag(_searchController.text);
                                    setSheetState(() {});
                                  },
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 5,
                          ),
                        ),
                        onChanged: (_) {
                          setSheetState(() {
                            _isSearching = _searchController.text.isNotEmpty;
                          });
                        },
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            _addTag(value);
                            setSheetState(() {
                              _isSearching = false;
                            });
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Existing tags section
                    const Text(
                      "Existing Tags",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // List of existing tags
                    Flexible(
                      child: StreamBuilder<bool>(
                        stream: _tagStream,
                        builder: (context, _) {
                          return FutureBuilder<List<dynamic>>(
                            future: _getAllTagsFuture(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                    'Error: ${snapshot.error}',
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                );
                              }

                              final tags = snapshot.data ?? [];

                              // Filter tags based on search query
                              final filteredTags = _searchQuery.isEmpty
                                  ? tags
                                  : tags
                                      .where((tag) => tag.name
                                          .toString()
                                          .toLowerCase()
                                          .contains(_searchQuery))
                                      .toList();

                              if (filteredTags.isEmpty) {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      _searchQuery.isEmpty
                                          ? "No tags yet. Create your first tag!"
                                          : "No matching tags found. Add \"$_searchQuery\" as a new tag.",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white54,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                );
                              }

                              return Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: filteredTags.map((tag) {
                                  final tagName = tag.name;
                                  return ActionChip(
                                    label: Text(
                                      tagName,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor:
                                        widget.glowColor.withValues(alpha: 0.2),
                                    side: BorderSide(
                                      color: widget.glowColor
                                          .withValues(alpha: 0.3),
                                    ),
                                    onPressed: () {
                                      // Add the tag and pop
                                      _addTag(tagName);
                                    },
                                  );
                                }).toList(),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ).then((_) {
      // Clear search when sheet is closed
      _searchController.clear();
    });
  }
}
