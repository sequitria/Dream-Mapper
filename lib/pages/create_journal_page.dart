import 'dart:async';
import 'dart:ui';
import 'package:dream_mapper/services/journal_editing_controller.dart';
import 'package:dream_mapper/services/journal_services.dart';
import 'package:dream_mapper/util/elegant_text_field.dart';
import 'package:dream_mapper/util/glowing_date_picker.dart';
import 'package:dream_mapper/util/glowing_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateJournalPage extends StatefulWidget {
  const CreateJournalPage({super.key});

  @override
  State<CreateJournalPage> createState() => _CreateJournalPageState();
}

class _CreateJournalPageState extends State<CreateJournalPage> with SingleTickerProviderStateMixin {
  late JournalEditingController _controller;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  String _heroTag = '';
  
  // Focus nodes for text fields
  final FocusNode _titleFocus = FocusNode();
  final FocusNode _dreamFocus = FocusNode();
  final FocusNode _mapFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = JournalEditingController(JournalServices());
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    _initializeJournal();
    
    // Start entrance animation
    _animationController.forward();
  }

  Future<void> _initializeJournal() async {
    // Create a new journal entry
    await _controller.createJournal();
    if (_controller.currentJournal != null) {
      setState(() {
        _heroTag = 'journal-${_controller.currentJournal!.id}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) {
          _controller.deleteIfEmpty();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF141A24),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: _buildAppBarButton(
            icon: Icons.arrow_back_ios_new,
            onPressed: () async {
              await _controller.deleteIfEmpty();
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
          title: ValueListenableBuilder(
            valueListenable: _controller.appBarTitle,
            builder: (context, value, child) {
              return Text(
                value,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              );
            },
          ),
          actions: [
            ValueListenableBuilder<bool>(
              valueListenable: _controller.isSaving,
              builder: (context, isSaving, child) {
                return AnimatedOpacity(
                  opacity: isSaving ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withValues(alpha: 0.15),
                          blurRadius: 12,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.purpleAccent,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: Hero(
          tag: _heroTag,
          child: Stack(
            children: [
              // Gradient background with enhanced aesthetics
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF1A2130),
                      Color(0xFF0F1622),
                    ],
                    stops: [0.3, 0.9],
                  ),
                ),
              ),
            
              // Multiple ambient glow effects for depth
              Positioned(
                top: -150,
                right: -180,
                child: Container(
                  width: 450,
                  height: 450,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFB24BF3).withValues(alpha: 0.08),
                        blurRadius: 200,
                        spreadRadius: 80,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                left: -150,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF4BBFF3).withValues(alpha: 0.08),
                        blurRadius: 200,
                        spreadRadius: 80,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.4,
                right: -100,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 230, 220, 188).withValues(alpha: 0.06),
                        blurRadius: 150,
                        spreadRadius: 50,
                      ),
                    ],
                  ),
                ),
              ),
              
              // Subtle noise overlay for texture
              Opacity(
                opacity: 0.02,
                child: Image.network(
                  'https://www.transparenttextures.com/patterns/noise-pattern-with-subtle-cross-lines.png',
                  repeat: ImageRepeat.repeat,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            
              // Main content with backdrop filter for glass effect
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SafeArea(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24, 8, 24, 140),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            
                            // Date Picker
                            GlowingDatePicker(
                              dateNotifier: _controller.journalDate,
                              onDateChanged: (date) => _controller.updateDate(date),
                              glowColor: const Color(0xFFB24BF3),
                            ),
                            
                            const SizedBox(height: 48),
                            
                            // Title Field
                            ElegantTextField(
                              controller: _controller.titleController,
                              focusNode: _titleFocus,
                              labelText: "Title",
                              hintText: "Give your dream a memorable title...",
                              icon: Icons.title,
                              iconColor: const Color.fromARGB(255, 230, 220, 188),
                              glowColor: const Color.fromARGB(255, 230, 220, 188),
                              minLines: 1,
                              maxLines: 2,
                            ),
                            
                            const SizedBox(height: 48),
                            
                            // Dream Description Field
                            ElegantTextField(
                              controller: _controller.dreamController,
                              focusNode: _dreamFocus,
                              labelText: "Dream Description",
                              hintText: "Describe your dream in detail...",
                              icon: Icons.cloud,
                              iconColor: const Color.fromARGB(255, 208, 142, 249),
                              glowColor: const Color.fromARGB(255, 208, 142, 249),
                              minLines: 8,
                              maxLines: null,
                            ),
                            
                            const SizedBox(height: 48),
                            
                            // Map Description Field
                            ElegantTextField(
                              controller: _controller.mapController,
                              focusNode: _mapFocus,
                              labelText: "Map Description",
                              hintText: "Describe the scene or setting...",
                              icon: Icons.map,
                              iconColor: const Color.fromARGB(255, 93, 231, 243),
                              glowColor: const Color.fromARGB(255, 93, 231, 243),
                              minLines: 8,
                              maxLines: null,
                            ),
                            
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: GlowingFAB(
          onPressed: () {
            // Save and return to previous screen
            _controller.deleteIfEmpty();
            Navigator.of(context).pop();
          },
          label: "SAVE JOURNAL",
          glowColor: const Color(0xFFB24BF3),
        ),
      ),
    );
  }

  Widget _buildAppBarButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: IconButton(
        icon: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.02),
                blurRadius: 10,
                spreadRadius: -2,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white.withValues(alpha: 0.8),
            size: 16,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _titleFocus.dispose();
    _dreamFocus.dispose();
    _mapFocus.dispose();
    _controller.dispose();
    super.dispose();
  }
}