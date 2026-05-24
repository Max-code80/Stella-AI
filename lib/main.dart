// ============================================================================
//                       STELLA ULTRA AI CORE OPERATING SYSTEM
// ============================================================================
// Version: Ultimate Edition Alpha v4.0 (Custom App Launcher, Editable Notes, 12H Clock)
// Architecture: Monolithic Full-State Native Core (No Truncations)
// ============================================================================

import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(const StellaAI());
}

class StellaAI extends StatelessWidget {
  const StellaAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.cyanAccent,
      ),
      home: const StellaHome(),
    );
  }
}

// ============================================================================
//                               DATA STRUCTURE MODELS
// ============================================================================
class ChatMessage {
  final String text;
  final bool isAI;
  final DateTime timestamp;
  ChatMessage({
    required this.text, 
    required this.isAI, 
    required this.timestamp,
  });
}

class StellaNote {
  String title;
  String content;
  String category;
  Color color;
  DateTime creationTime;
  StellaNote({
    required this.title, 
    required this.content, 
    required this.category,
    required this.color,
    required this.creationTime,
  });
}

class StellaTask {
  String description;
  bool isCompleted;
  String priority;
  StellaTask({
    required this.description, 
    this.isCompleted = false,
    this.priority = "MEDIUM",
  });
}

class AppModel {
  final String title;
  final IconData icon;
  final Color activeColor;
  final String packageIdentifier;
  AppModel({
    required this.title, 
    required this.icon, 
    required this.activeColor,
    required this.packageIdentifier,
  });
}

class MemoryLog {
  final String logType;
  final String metadata;
  final DateTime recordedAt;
  MemoryLog({
    required this.logType, 
    required this.metadata, 
    required this.recordedAt,
  });
}

// ============================================================================
//                             MAIN APPLICATION CONTROLLER
// ============================================================================
class StellaHome extends StatefulWidget {
  const StellaHome({super.key});

  @override
  State<StellaHome> createState() => _StellaHomeState();
}

class _StellaHomeState extends State<StellaHome> with TickerProviderStateMixin {
  // System State Control Variables
  bool cyberpunkMode = true;
  int currentNavigationIndex = 0;
  final PageController structuralPageController = PageController();
  
  // Custom Performance Micro-Engine Core Controllers
  late AnimationController globalOrbAnimationController;
  late AnimationController atmosphericBackgroundController;
  late AnimationController dynamicWaveformController;
  late Timer telemetryMetricsTimer;

  // Real-Time System Properties (Dynamic State Diagnostics)
  String liveSystemTime = "00:00";
  String liveSystemAMPM = "AM";
  String liveSystemDate = "00/00/2026";
  double diagnosticCpuUsage = 42.8;
  double diagnosticRamUsage = 4.12;
  int internalNetworkLatency = 32;
  double internalBatteryLevel = 0.88;

  // Timer/Alarm Properties
  int activeTimerSeconds = 0;
  bool isTimerRunning = false;
  Timer? stopwatchTimer;

  // Persistent Runtime Memory Architecture State
  String authenticatedUserIdentity = "Su";
  String stellaCurrentOperationalMood = "OPTIMIZED";
  
  // Structural Components Core Content Arrays
  final List<MemoryLog> coreMemoryRegistry = [
    MemoryLog(logType: "BOOT_SEQUENCE", metadata: "Kernel compilation stable.", recordedAt: DateTime.now().subtract(const Duration(minutes: 45))),
  ];

  final List<ChatMessage> liveChatConversationsRegistry = [
    ChatMessage(text: "Hello Su 👋\nHow can I help you today?", isAI: true, timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
  ];

  final List<StellaNote> structuralNotesRepository = [
    StellaNote(title: "Computer 🖥️ Keyboard", content: "Advanced Modifier Key Combinations (Coding & Productivity)\nCtrl + A : Select All\nCtrl + F : Find", category: "PRODUCTIVITY", color: Colors.cyanAccent, creationTime: DateTime.now()),
  ];

  final List<StellaTask> operationalChecklistsRegistry = [
    StellaTask(description: "Initialize Monolithic Architecture", isCompleted: true, priority: "CRITICAL"),
  ];

  final List<String> terminalOutputLiveStreamsRegistry = [];
  
  // UPDATED CUSTOM APP LAUNCHER LIST
  final List<AppModel> installedApplicationsCatalog = [
    AppModel(title: "Termux", icon: Icons.terminal_rounded, activeColor: Colors.greenAccent, packageIdentifier: "com.termux"),
    AppModel(title: "Acode", icon: Icons.code_rounded, activeColor: Colors.blueAccent, packageIdentifier: "com.foxdebug.acode"),
    AppModel(title: "ChatGPT", icon: Icons.chat_bubble_rounded, activeColor: Colors.tealAccent, packageIdentifier: "com.openai.chatgpt"),
    AppModel(title: "Gemini", icon: Icons.auto_awesome, activeColor: Colors.purpleAccent, packageIdentifier: "com.google.gemini"),
    AppModel(title: "YouTube", icon: Icons.play_circle_filled_rounded, activeColor: Colors.redAccent, packageIdentifier: "com.google.youtube"),
    AppModel(title: "Instagram", icon: Icons.camera_alt_rounded, activeColor: Colors.pinkAccent, packageIdentifier: "com.instagram.android"),
    AppModel(title: "Chrome", icon: Icons.language_rounded, activeColor: Colors.yellowAccent, packageIdentifier: "com.android.chrome"),
    AppModel(title: "WhatsApp", icon: Icons.message_rounded, activeColor: Colors.green, packageIdentifier: "com.whatsapp"),
    AppModel(title: "Settings", icon: Icons.settings_rounded, activeColor: Colors.blueGrey, packageIdentifier: "stella.sys.config"),
  ];

  // Dynamic Focus Controllers
  final TextEditingController chatInputPipelineController = TextEditingController();
  final ScrollController chatScrollLayoutController = ScrollController();
  final ScrollController terminalViewScrollController = ScrollController();
  final TextEditingController shellTerminalInputController = TextEditingController();

  // Dialog Add State Holders
  String transientNoteDialogTitleProperty = "";
  String transientNoteDialogContentProperty = "";
  String transientNoteDialogCategoryProperty = "GENERAL";
  String transientTaskDialogDescriptionProperty = "";
  String transientTaskDialogPriorityProperty = "MEDIUM";

  // Simulation View Management Switches
  bool isAISystemCurrentlySimulatingThinkingState = false;
  String currentActiveSimulatedAppTargetPackage = "";
  bool isAudioPlayerCurrentlySimulatingPlayback = false;

  final List<String> coldBootAutonomousSystemLogsList = [
    "ST_OS: Starting Core Kernel Initialization Matrix...",
    "ST_OS: Allocating virtual page registers inside VFS sub-layers...",
    "ST_OS: Hooking operational thread states into main structural runtime loop...",
    "ST_OS: System execution state verified. Security clearance: LEVEL-9 OMNI",
    "ST_OS: Stella AI active execution stack completely listening... Welcome Su."
  ];

  @override
  void initState() {
    super.initState();
    _initializeSystemTimeTelemetryLoop();
    _executeAsynchronousColdBootTerminalSequence();

    globalOrbAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);

    atmosphericBackgroundController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    dynamicWaveformController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    telemetryMetricsTimer.cancel();
    stopwatchTimer?.cancel();
    globalOrbAnimationController.dispose();
    atmosphericBackgroundController.dispose();
    dynamicWaveformController.dispose();
    chatInputPipelineController.dispose();
    chatScrollLayoutController.dispose();
    terminalViewScrollController.dispose();
    shellTerminalInputController.dispose();
    structuralPageController.dispose();
    super.dispose();
  }

  // ============================================================================
  //                         TELEMETRY & STATE MOTORS (12H CLOCK ADDED)
  // ============================================================================
  void _initializeSystemTimeTelemetryLoop() {
    telemetryMetricsTimer = Timer.periodic(const Duration(seconds: 1), (Timer operationalTimer) {
      final DateTime rightNowInstance = DateTime.now();
      final randomDataGenerator = Random();
      
      if (mounted) {
        setState(() {
          // 12-Hour Clock Logic
          int currentHour = rightNowInstance.hour;
          String ampm = currentHour >= 12 ? "PM" : "AM";
          currentHour = currentHour % 12;
          if (currentHour == 0) currentHour = 12;

          liveSystemTime = "${currentHour.toString()}:${rightNowInstance.minute.toString().padLeft(2, '0')}";
          liveSystemAMPM = ampm;
          liveSystemDate = "${rightNowInstance.day.toString().padLeft(2, '0')}/${rightNowInstance.month.toString().padLeft(2, '0')}/${rightNowInstance.year}";
          
          diagnosticCpuUsage = 35.0 + randomDataGenerator.nextDouble() * 20.0;
          diagnosticRamUsage = 4.05 + randomDataGenerator.nextDouble() * 0.25;
          internalNetworkLatency = 25 + randomDataGenerator.nextInt(15);
          internalBatteryLevel = max(0.0, internalBatteryLevel - 0.00005);
        });
      }
    });
  }

  void _toggleStopwatchTimer() {
    if (isTimerRunning) {
      stopwatchTimer?.cancel();
      setState(() => isTimerRunning = false);
    } else {
      setState(() => isTimerRunning = true);
      stopwatchTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          activeTimerSeconds++;
        });
      });
    }
  }

  void _resetStopwatchTimer() {
    stopwatchTimer?.cancel();
    setState(() {
      isTimerRunning = false;
      activeTimerSeconds = 0;
    });
  }

  String _formatTimerDisplay() {
    int minutes = activeTimerSeconds ~/ 60;
    int seconds = activeTimerSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  void _executeAsynchronousColdBootTerminalSequence() async {
    for (String individualLogString in coldBootAutonomousSystemLogsList) {
      await Future.delayed(Duration(milliseconds: 300 + Random().nextInt(400)));
      if (mounted) {
        setState(() {
          terminalOutputLiveStreamsRegistry.add(individualLogString);
        });
        _forceTerminalViewScrollToLowestBoundary();
      }
    }
  }

  void _forceTerminalViewScrollToLowestBoundary() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (terminalViewScrollController.hasClients) {
        terminalViewScrollController.animateTo(
          terminalViewScrollController.position.maxScrollExtent + 60,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _forceChatViewScrollToLowestBoundary() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (chatScrollLayoutController.hasClients) {
        chatScrollLayoutController.animateTo(
          chatScrollLayoutController.position.maxScrollExtent + 120,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void triggerSystemNavigationInterception(int targetNavigationRouteIndex) {
    // Unfocus keyboard if navigating away
    FocusScope.of(context).unfocus();
    setState(() {
      currentNavigationIndex = targetNavigationRouteIndex;
    });
    structuralPageController.animateToPage(
      targetNavigationRouteIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.slowMiddle,
    );
  }

  // ============================================================================
  //                         CORE CONTEXT LOGIC ENGINES
  // ============================================================================
  void executeUserChatInputSubmissionPipeline() {
    final String cleanSanitizedUserInput = chatInputPipelineController.text.trim();
    if (cleanSanitizedUserInput.isEmpty) return;

    chatInputPipelineController.clear();
    setState(() {
      liveChatConversationsRegistry.add(
        ChatMessage(text: cleanSanitizedUserInput, isAI: false, timestamp: DateTime.now()),
      );
      isAISystemCurrentlySimulatingThinkingState = true;
      stellaCurrentOperationalMood = "PROCESSING";
    });
    _forceChatViewScrollToLowestBoundary();

    if (cleanSanitizedUserInput.startsWith("/")) {
      _processInternalShellCommandDirective(cleanSanitizedUserInput, contextSource: "CHAT");
      return;
    }

    Future.delayed(const Duration(milliseconds: 1800), () {
      if (!mounted) return;
      String simulatedResponsePayload = "Stella Core: I am processing your request regarding '$cleanSanitizedUserInput'. System nodes are operating nominally.";

      final String lowerCaseInputReference = cleanSanitizedUserInput.toLowerCase();
      if (lowerCaseInputReference.contains("hello") || lowerCaseInputReference.contains("hey")) {
        simulatedResponsePayload = "Hello Su! Ready to build something amazing today?";
      }

      setState(() {
        isAISystemCurrentlySimulatingThinkingState = false;
        stellaCurrentOperationalMood = "OPTIMIZED";
        liveChatConversationsRegistry.add(
          ChatMessage(text: simulatedResponsePayload, isAI: true, timestamp: DateTime.now()),
        );
        coreMemoryRegistry.add(
          MemoryLog(logType: "PROMPT_PROCESSED", metadata: "Handled user instruction token vector block perfectly.", recordedAt: DateTime.now()),
        );
      });
      _forceChatViewScrollToLowestBoundary();
    });
  }

  void executeShellTerminalInputSubmissionEngine() {
    final String terminalInputBufferToken = shellTerminalInputController.text.trim();
    if (terminalInputBufferToken.isEmpty) return;

    shellTerminalInputController.clear();
    setState(() {
      terminalOutputLiveStreamsRegistry.add("root@stella-os:~# $terminalInputBufferToken");
    });
    _processInternalShellCommandDirective(terminalInputBufferToken, contextSource: "TERMINAL");
    _forceTerminalViewScrollToLowestBoundary();
  }

  void _processInternalShellCommandDirective(String commandRawString, {required String contextSource}) {
    final List<String> multiTokenSplitArray = commandRawString.split(" ");
    final String rootInstructionToken = multiTokenSplitArray[0].toLowerCase();

    String coreFeedbackPayloadString = "";

    switch (rootInstructionToken) {
      case "/clear":
        if (contextSource == "TERMINAL") {
          setState(() {
            terminalOutputLiveStreamsRegistry.clear();
            terminalOutputLiveStreamsRegistry.add("ST_OS: Shell viewport registers completely flushed and allocated.");
          });
        } else {
          setState(() {
            liveChatConversationsRegistry.clear();
            liveChatConversationsRegistry.add(ChatMessage(text: "Chat historical runtime view completely cleared.", isAI: true, timestamp: DateTime.now()));
          });
          coreFeedbackPayloadString = "Chat buffer flushed.";
        }
        break;
      case "/matrix":
        setState(() {
          cyberpunkMode = true;
          stellaCurrentOperationalMood = "CYBER_WARRIOR";
        });
        coreFeedbackPayloadString = "Warning: Injecting high-intensity cyber-grid styling values into running presentation buffers.";
        break;
      default:
        coreFeedbackPayloadString = "Instruction target identifier mismatch. Token '$rootInstructionToken' failed to parse.";
    }

    if (coreFeedbackPayloadString.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!mounted) return;
        setState(() {
          if (contextSource == "TERMINAL") {
            terminalOutputLiveStreamsRegistry.add("ST_OS_RESPONSE: $coreFeedbackPayloadString");
            _forceTerminalViewScrollToLowestBoundary();
          } else {
            isAISystemCurrentlySimulatingThinkingState = false;
            liveChatConversationsRegistry.add(
              ChatMessage(text: coreFeedbackPayloadString, isAI: true, timestamp: DateTime.now()),
            );
            _forceChatViewScrollToLowestBoundary();
          }
        });
      });
    }
  }

  // UPDATED: Note saving and Editing logic
  void processNoteSaveOrUpdate(int? existingNoteIndex) {
    if (transientNoteDialogTitleProperty.trim().isEmpty || transientNoteDialogContentProperty.trim().isEmpty) return;
    
    setState(() {
      if (existingNoteIndex != null) {
        // Edit Existing Note
        structuralNotesRepository[existingNoteIndex].title = transientNoteDialogTitleProperty;
        structuralNotesRepository[existingNoteIndex].content = transientNoteDialogContentProperty;
        structuralNotesRepository[existingNoteIndex].category = transientNoteDialogCategoryProperty;
        coreMemoryRegistry.add(MemoryLog(logType: "NOTE_EDITED", metadata: "Updated note: $transientNoteDialogTitleProperty", recordedAt: DateTime.now()));
      } else {
        // Add New Note
        final fallbackRandomColorWheel = [Colors.cyanAccent, Colors.purpleAccent, Colors.orangeAccent, Colors.greenAccent, Colors.pinkAccent];
        structuralNotesRepository.add(
          StellaNote(
            title: transientNoteDialogTitleProperty, 
            content: transientNoteDialogContentProperty, 
            category: transientNoteDialogCategoryProperty, 
            color: fallbackRandomColorWheel[Random().nextInt(fallbackRandomColorWheel.length)], 
            creationTime: DateTime.now(),
          ),
        );
        coreMemoryRegistry.add(MemoryLog(logType: "NOTE_CREATED", metadata: "Added note: $transientNoteDialogTitleProperty", recordedAt: DateTime.now()));
      }
      transientNoteDialogTitleProperty = "";
      transientNoteDialogContentProperty = "";
      transientNoteDialogCategoryProperty = "GENERAL";
    });
  }

  void removeTargetSmartNoteFromRepository(int internalIndexTarget) {
    setState(() {
      structuralNotesRepository.removeAt(internalIndexTarget);
    });
  }

  void appendNewTaskToChecklistRegistry() {
    if (transientTaskDialogDescriptionProperty.trim().isEmpty) return;
    setState(() {
      operationalChecklistsRegistry.add(
        StellaTask(description: transientTaskDialogDescriptionProperty, isCompleted: false, priority: transientTaskDialogPriorityProperty),
      );
      transientTaskDialogDescriptionProperty = "";
      transientTaskDialogPriorityProperty = "MEDIUM";
    });
  }

  void toggleTaskCompletionStatusState(int checklistTargetIndex) {
    setState(() {
      operationalChecklistsRegistry[checklistTargetIndex].isCompleted = !operationalChecklistsRegistry[checklistTargetIndex].isCompleted;
    });
  }

  void purgeTargetTaskFromChecklistRegistry(int itemTargetIndex) {
    setState(() {
      operationalChecklistsRegistry.removeAt(itemTargetIndex);
    });
  }

  // ============================================================================
  //                         LAYOUT RENDERING COMPONENT PIECES
  // ============================================================================
  @override
  Widget build(BuildContext context) {
    final resolvedThemeBackgroundGradientColorStart = cyberpunkMode ? const Color(0xFF03060B) : const Color(0xFFEDF4FC);
    final resolvedThemeBackgroundGradientColorEnd = cyberpunkMode ? const Color(0xFF090D1A) : const Color(0xFFFFF9F2);
    
    // Auto-Hide Dock Logic
    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Dynamic Atmospheric Composition Background Layer
          AnimatedBuilder(
            animation: atmosphericBackgroundController,
            builder: (BuildContext context, Widget? childComponentInstance) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(sin(atmosphericBackgroundController.value * pi * 2), -1.0),
                    end: Alignment(1.0, cos(atmosphericBackgroundController.value * pi * 2)),
                    colors: [resolvedThemeBackgroundGradientColorStart, resolvedThemeBackgroundGradientColorEnd],
                  ),
                ),
              );
            },
          ),

          // High-Intensity Blur Blobs Vectors
          Positioned(
            top: -120,
            left: -60,
            child: renderInterpolatedVisualBlobMeshElement(targetColorVector: cyberpunkMode ? Colors.cyanAccent.withAlpha(45) : Colors.blueAccent.withAlpha(30), structuralPixelDiameter: 280),
          ),
          Positioned(
            bottom: -140,
            right: -70,
            child: renderInterpolatedVisualBlobMeshElement(targetColorVector: cyberpunkMode ? Colors.purpleAccent.withAlpha(55) : Colors.orangeAccent.withAlpha(25), structuralPixelDiameter: 340),
          ),

          // Central Unified Viewport Page Navigation Router Hub
          PageView(
            controller: structuralPageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              buildHomeDashboardViewLayout(),
              buildChatTerminalInterfaceViewLayout(), // Reverted to Phase 2 style
              buildWorkspaceProductivityHubViewLayout(), // Added Timers and Editable Notes
              buildApplicationsLauncherGridDirectoryViewLayout(), // Custom Apps Added
              buildHardwareDiagnosticTerminalConsoleViewLayout(),
              buildAcousticLinkVoiceAssistantViewLayout(),
              buildCoreConfigurationSettingsViewLayout(),
            ],
          ),

          // Modular Applications Simulation Active Window Sandbox Overlay Frame
          if (currentActiveSimulatedAppTargetPackage.isNotEmpty)
            buildSimulatedAppSandboxOverlayModalContainer(),

          // Horizontal Floating Navigation Dock Dock System (WITH AUTO-HIDE)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: isKeyboardVisible ? -100 : 22, // Auto-hides when keyboard opens
            left: 16,
            right: 16,
            child: renderGlassmorphicStructuralContainerBlock(
              targetBorderRadiusValue: 28,
              innerPaddingParameters: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              childComponent: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    renderDockNavigationActionButtonElement(Icons.home_rounded, 0, "DASHBOARD"),
                    const SizedBox(width: 12),
                    renderDockNavigationActionButtonElement(Icons.chat_bubble_rounded, 1, "CHAT"),
                    const SizedBox(width: 12),
                    renderDockNavigationActionButtonElement(Icons.edit_document, 2, "WORKSPACE"),
                    const SizedBox(width: 12),
                    renderDockNavigationActionButtonElement(Icons.grid_view_rounded, 3, "APPS"),
                    const SizedBox(width: 12),
                    renderDockNavigationActionButtonElement(Icons.terminal_rounded, 4, "SHELL"),
                    const SizedBox(width: 12),
                    renderDockNavigationActionButtonElement(Icons.mic_rounded, 5, "VOICE"),
                    const SizedBox(width: 12),
                    renderDockNavigationActionButtonElement(Icons.settings_rounded, 6, "CONFIG"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================================
  //                         1. HOME SYSTEM DASHBOARD VIEW
  // ============================================================================
  Widget buildHomeDashboardViewLayout() {
    final textStyleColorInversionVector = cyberpunkMode ? Colors.white : Colors.black87;
    final secondaryTextStyleColorInversionVector = cyberpunkMode ? Colors.white60 : Colors.black54;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  renderGlassmorphicActionCircleFrame(targetIconData: Icons.auto_awesome, accentColorVector: cyberpunkMode ? Colors.cyanAccent : Colors.blueAccent),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("STELLA OS", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 1.5, color: textStyleColorInversionVector)),
                      Text("QUANTUM SYSTEM", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: cyberpunkMode ? Colors.cyanAccent : Colors.blueAccent, letterSpacing: 1.0)),
                    ],
                  ),
                ],
              ),
              Switch(
                value: cyberpunkMode,
                activeColor: Colors.cyanAccent,
                inactiveThumbColor: Colors.blueAccent,
                onChanged: (v) => setState(() => cyberpunkMode = v),
              ),
            ],
          ),

          const SizedBox(height: 25),

          // Central Telemetry Analytics Widget Card (UPDATED TO 12 HOUR FORMAT)
          renderGlassmorphicStructuralContainerBlock(
            targetBorderRadiusValue: 26,
            innerPaddingParameters: const EdgeInsets.all(22),
            colorOverrideParameter: cyberpunkMode ? Colors.black.withAlpha(60) : Colors.white.withAlpha(40),
            childComponent: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      liveSystemTime,
                      style: TextStyle(fontSize: 54, fontWeight: FontWeight.w300, fontFamily: 'monospace', letterSpacing: 2, color: textStyleColorInversionVector, shadows: cyberpunkMode ? [const Shadow(color: Colors.cyanAccent, blurRadius: 15)] : null),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      liveSystemAMPM,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: cyberpunkMode ? Colors.cyanAccent : Colors.blueAccent),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Text(liveSystemDate, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 2.0, color: secondaryTextStyleColorInversionVector)),
                const Padding(padding: EdgeInsets.symmetric(vertical: 16.0), child: Divider(color: Colors.white12, thickness: 1.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    renderHomeDiagnosticSensorItemMetricsBlock(Icons.bolt_rounded, "${(internalBatteryLevel * 100).toStringAsFixed(0)}%", "BATTERY", Colors.greenAccent),
                    renderHomeDiagnosticSensorItemMetricsBlock(Icons.memory_rounded, "${diagnosticRamUsage.toStringAsFixed(2)} GB", "V_RAM", Colors.purpleAccent),
                    renderHomeDiagnosticSensorItemMetricsBlock(Icons.speed_rounded, "$internalNetworkLatency ms", "LATENCY", Colors.cyanAccent),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 35),

          // AI ORB
          GestureDetector(
            onTap: () => setState(() => stellaCurrentOperationalMood = stellaCurrentOperationalMood == "OPTIMIZED" ? "HYPER_DRIVE" : "OPTIMIZED"),
            child: Center(
              child: AnimatedBuilder(
                animation: globalOrbAnimationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.0 + (globalOrbAnimationController.value * 0.08),
                    child: Container(
                      width: 140, height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(colors: cyberpunkMode ? [Colors.cyanAccent, Colors.purpleAccent, Colors.transparent] : [Colors.blueAccent, Colors.tealAccent, Colors.transparent], stops: const [0.2, 0.6, 1.0]),
                        boxShadow: [BoxShadow(color: cyberpunkMode ? Colors.cyanAccent.withAlpha(90) : Colors.blueAccent.withAlpha(70), blurRadius: 45, spreadRadius: 4)],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.blur_circular_rounded, size: 48, color: Colors.white),
                          const SizedBox(height: 6),
                          Text(stellaCurrentOperationalMood, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: Colors.white, fontFamily: 'monospace')),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 120),
        ],
      ),
    );
  }

  Widget renderHomeDiagnosticSensorItemMetricsBlock(IconData metricIcon, String structuralDisplayValue, String structuralDisplayLabel, Color diagnosticColorTheme) {
    return Column(
      children: [
        Icon(metricIcon, color: cyberpunkMode ? diagnosticColorTheme : Colors.black87, size: 26),
        const SizedBox(height: 6),
        Text(structuralDisplayValue, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: cyberpunkMode ? Colors.white : Colors.black87, fontFamily: 'monospace')),
        Text(structuralDisplayLabel, style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: cyberpunkMode ? Colors.white38 : Colors.black38)),
      ],
    );
  }

  // ============================================================================
  //                         2. CHAT VIEW (REVERTED TO PHASE 2 CLEAN STYLE)
  // ============================================================================
  Widget buildChatTerminalInterfaceViewLayout() {
    final systemTextStyleInversionColor = cyberpunkMode ? Colors.white : Colors.black87;

    return SafeArea(
      child: Column(
        children: [
          renderStructuralSectionHeaderTitleBanner("AI Chat"),
          
          Expanded(
            child: ListView.builder(
              controller: chatScrollLayoutController,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: liveChatConversationsRegistry.length + (isAISystemCurrentlySimulatingThinkingState ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == liveChatConversationsRegistry.length && isAISystemCurrentlySimulatingThinkingState) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: renderGlassmorphicStructuralContainerBlock(
                        targetBorderRadiusValue: 20,
                        innerPaddingParameters: const EdgeInsets.all(15),
                        childComponent: const Text("Stella is typing...", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey)),
                      ),
                    ),
                  );
                }

                final msg = liveChatConversationsRegistry[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Align(
                    alignment: msg.isAI ? Alignment.centerLeft : Alignment.centerRight,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                      child: renderGlassmorphicStructuralContainerBlock(
                        targetBorderRadiusValue: 20,
                        innerPaddingParameters: const EdgeInsets.all(16),
                        colorOverrideParameter: msg.isAI 
                           ? null 
                           : (cyberpunkMode ? Colors.cyanAccent.withAlpha(40) : Colors.blueAccent.withAlpha(40)),
                        childComponent: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              msg.text,
                              style: TextStyle(color: systemTextStyleInversionColor, fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "${msg.timestamp.hour > 12 ? msg.timestamp.hour - 12 : (msg.timestamp.hour == 0 ? 12 : msg.timestamp.hour)}:${msg.timestamp.minute.toString().padLeft(2, '0')} ${msg.timestamp.hour >= 12 ? 'PM' : 'AM'}",
                                style: TextStyle(fontSize: 10, color: cyberpunkMode ? Colors.white54 : Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // CHAT INPUT FIELD
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: MediaQuery.of(context).viewInsets.bottom + 15), // Auto-hides dock gives more room here
            child: renderGlassmorphicStructuralContainerBlock(
              targetBorderRadiusValue: 30,
              innerPaddingParameters: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              childComponent: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add_circle_outline_rounded, color: cyberpunkMode ? Colors.cyanAccent : Colors.blueAccent),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: chatInputPipelineController,
                      style: TextStyle(color: systemTextStyleInversionColor),
                      decoration: InputDecoration(
                        hintText: "Type message...",
                        hintStyle: TextStyle(color: cyberpunkMode ? Colors.white54 : Colors.grey[600]),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) => executeUserChatInputSubmissionPipeline(),
                    ),
                  ),
                  GestureDetector(
                    onTap: executeUserChatInputSubmissionPipeline,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: cyberpunkMode ? Colors.cyanAccent : Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.send_rounded, color: cyberpunkMode ? Colors.black : Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Extra padding if dock is hidden but keyboard is not
          if (MediaQuery.of(context).viewInsets.bottom == 0) const SizedBox(height: 80),
        ],
      ),
    );
  }

  // ============================================================================
  //                         3. PRODUCTIVITY WORKSPACE HUB (EDITABLE NOTES + TIMER)
  // ============================================================================
  Widget buildWorkspaceProductivityHubViewLayout() {
    final inversionTextStyleColor = cyberpunkMode ? Colors.white : Colors.black87;
    final secondaryTextStyleColor = cyberpunkMode ? Colors.white60 : Colors.black54;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          renderStructuralSectionHeaderTitleBanner("Workspace"),
          
          // ALARM / TIMER COMPONENT
          Text("Time & Focus Core", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.pinkAccent, letterSpacing: 1.2)),
          const SizedBox(height: 10),
          renderGlassmorphicStructuralContainerBlock(
            targetBorderRadiusValue: 22,
            innerPaddingParameters: const EdgeInsets.all(20),
            childComponent: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("STOPWATCH ACTIVE", style: TextStyle(fontSize: 10, color: Colors.pinkAccent, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(_formatTimerDisplay(), style: TextStyle(fontSize: 32, fontFamily: 'monospace', fontWeight: FontWeight.w300, color: inversionTextStyleColor)),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(isTimerRunning ? Icons.pause_circle_filled_rounded : Icons.play_circle_fill_rounded, color: Colors.pinkAccent, size: 40),
                      onPressed: _toggleStopwatchTimer,
                    ),
                    IconButton(
                      icon: const Icon(Icons.stop_circle_rounded, color: Colors.white54, size: 30),
                      onPressed: _resetStopwatchTimer,
                    ),
                  ],
                )
              ],
            ),
          ),

          const SizedBox(height: 25),
          
          // CHECKLIST BLOCK
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Checklist Tasks", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.orangeAccent)),
              IconButton(icon: const Icon(Icons.add_box_rounded, color: Colors.orangeAccent), onPressed: () => _displayTaskInsertionInteractiveDialogPanel())
            ],
          ),
          const SizedBox(height: 6),
          
          renderGlassmorphicStructuralContainerBlock(
            targetBorderRadiusValue: 22,
            innerPaddingParameters: const EdgeInsets.symmetric(vertical: 8),
            childComponent: operationalChecklistsRegistry.isEmpty
                ? Padding(padding: const EdgeInsets.all(16.0), child: Center(child: Text("All tasks completed.", style: TextStyle(color: secondaryTextStyleColor))))
                : Column(
                    children: List.generate(operationalChecklistsRegistry.length, (int checklistIndexIterator) {
                      final task = operationalChecklistsRegistry[checklistIndexIterator];
                      return Dismissible(
                        key: UniqueKey(),
                        background: Container(color: Colors.redAccent.withAlpha(100), alignment: Alignment.centerRight, padding: const EdgeInsets.only(right: 16), child: const Icon(Icons.delete, color: Colors.white)),
                        onDismissed: (_) => purgeTargetTaskFromChecklistRegistry(checklistIndexIterator),
                        child: CheckboxListTile(
                          title: Text(task.description, style: TextStyle(color: inversionTextStyleColor, decoration: task.isCompleted ? TextDecoration.lineThrough : null)),
                          value: task.isCompleted,
                          activeColor: Colors.orangeAccent,
                          checkColor: Colors.black,
                          onChanged: (_) => toggleTaskCompletionStatusState(checklistIndexIterator),
                        ),
                      );
                    }),
                  ),
          ),

          const SizedBox(height: 25),

          // EDITABLE SMART NOTES REPOSITORY
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Secure Notes", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.cyanAccent)),
              IconButton(icon: const Icon(Icons.note_add_rounded, color: Colors.cyanAccent), onPressed: () => _displayNoteInsertionInteractiveDialogPanel(editIndex: null))
            ],
          ),
          const SizedBox(height: 6),

          structuralNotesRepository.isEmpty
              ? Center(child: Padding(padding: const EdgeInsets.all(22.0), child: Text("No notes saved.", style: TextStyle(color: secondaryTextStyleColor))))
              : Column(
                  children: List.generate(structuralNotesRepository.length, (int index) {
                    final note = structuralNotesRepository[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: renderGlassmorphicStructuralContainerBlock(
                        targetBorderRadiusValue: 20,
                        innerPaddingParameters: const EdgeInsets.all(16),
                        childComponent: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(width: 6, height: 60, decoration: BoxDecoration(color: note.color, borderRadius: BorderRadius.circular(4))),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(note.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: inversionTextStyleColor)),
                                  const SizedBox(height: 6),
                                  Text(note.content, style: TextStyle(fontSize: 13, color: secondaryTextStyleColor), maxLines: 3, overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                            // EDIT AND DELETE ACTION BUTTONS
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit_rounded, color: Colors.amberAccent, size: 20),
                                  onPressed: () => _displayNoteInsertionInteractiveDialogPanel(editIndex: index),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete_sweep_rounded, color: Colors.redAccent.withAlpha(200), size: 20),
                                  onPressed: () => removeTargetSmartNoteFromRepository(index),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }

  // UPDATED DIALOG TO SUPPORT EDITING
  void _displayNoteInsertionInteractiveDialogPanel({int? editIndex}) {
    if (editIndex != null) {
      // Load existing data for editing
      transientNoteDialogTitleProperty = structuralNotesRepository[editIndex].title;
      transientNoteDialogContentProperty = structuralNotesRepository[editIndex].content;
      transientNoteDialogCategoryProperty = structuralNotesRepository[editIndex].category;
    } else {
      // Clear data for new note
      transientNoteDialogTitleProperty = "";
      transientNoteDialogContentProperty = "";
      transientNoteDialogCategoryProperty = "GENERAL";
    }

    final TextEditingController titleController = TextEditingController(text: transientNoteDialogTitleProperty);
    final TextEditingController contentController = TextEditingController(text: transientNoteDialogContentProperty);

    showDialog(
      context: context,
      builder: (BuildContext dialogContextBlock) {
        return AlertDialog(
          backgroundColor: cyberpunkMode ? const Color(0xFF0F1322) : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(editIndex != null ? "EDIT NOTE" : "NEW NOTE", style: TextStyle(color: cyberpunkMode ? Colors.white : Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: "Note Title"),
                  style: TextStyle(color: cyberpunkMode ? Colors.white : Colors.black),
                  onChanged: (value) => transientNoteDialogTitleProperty = value,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: contentController,
                  decoration: const InputDecoration(labelText: "Note Content", alignLabelWithHint: true),
                  style: TextStyle(color: cyberpunkMode ? Colors.white : Colors.black),
                  maxLines: 5,
                  onChanged: (value) => transientNoteDialogContentProperty = value,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: transientNoteDialogCategoryProperty,
                  dropdownColor: cyberpunkMode ? const Color(0xFF0F1322) : Colors.white,
                  items: ["GENERAL", "DEVELOPMENT", "PRODUCTIVITY", "ASSETS"].map((categoryToken) {
                    return DropdownMenuItem(value: categoryToken, child: Text(categoryToken, style: TextStyle(color: cyberpunkMode ? Colors.white : Colors.black)));
                  }).toList(),
                  onChanged: (value) => setState(() => transientNoteDialogCategoryProperty = value ?? "GENERAL"),
                )
              ],
            ),
          ),
          actions: [
            TextButton(child: const Text("CANCEL"), onPressed: () => Navigator.pop(dialogContextBlock)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.cyanAccent),
              child: Text("SAVE", style: TextStyle(color: cyberpunkMode ? Colors.black : Colors.white)),
              onPressed: () {
                processNoteSaveOrUpdate(editIndex);
                Navigator.pop(dialogContextBlock);
              },
            )
          ],
        );
      },
    );
  }

  void _displayTaskInsertionInteractiveDialogPanel() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContextBlock) {
        return AlertDialog(
          backgroundColor: cyberpunkMode ? const Color(0xFF0F1322) : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text("NEW TASK", style: TextStyle(color: cyberpunkMode ? Colors.white : Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Task Description"),
                style: TextStyle(color: cyberpunkMode ? Colors.white : Colors.black),
                onChanged: (value) => transientTaskDialogDescriptionProperty = value,
              ),
              DropdownButtonFormField<String>(
                value: transientTaskDialogPriorityProperty,
                dropdownColor: cyberpunkMode ? const Color(0xFF0F1322) : Colors.white,
                items: ["LOW", "MEDIUM", "HIGH", "CRITICAL"].map((rankToken) {
                  return DropdownMenuItem(value: rankToken, child: Text(rankToken, style: TextStyle(color: cyberpunkMode ? Colors.white : Colors.black)));
                }).toList(),
                onChanged: (value) => setState(() => transientTaskDialogPriorityProperty = value ?? "MEDIUM"),
              )
            ],
          ),
          actions: [
            TextButton(child: const Text("CANCEL"), onPressed: () => Navigator.pop(dialogContextBlock)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
              child: Text("ADD", style: TextStyle(color: cyberpunkMode ? Colors.black : Colors.white)),
              onPressed: () {
                appendNewTaskToChecklistRegistry();
                Navigator.pop(dialogContextBlock);
              },
            )
          ],
        );
      },
    );
  }

  // ============================================================================
  //                         4. APPLICATIONS LAUNCHER GRID SCREEN (CUSTOM APPS)
  // ============================================================================
  Widget buildApplicationsLauncherGridDirectoryViewLayout() {
    return SafeArea(
      child: Column(
        children: [
          renderStructuralSectionHeaderTitleBanner("Installed Apps"),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 22,
                crossAxisSpacing: 22,
                childAspectRatio: 0.85,
              ),
              itemCount: installedApplicationsCatalog.length,
              itemBuilder: (context, index) {
                final app = installedApplicationsCatalog[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentActiveSimulatedAppTargetPackage = app.packageIdentifier;
                      coreMemoryRegistry.add(MemoryLog(logType: "APP_LAUNCHED", metadata: "Opened ${app.title}", recordedAt: DateTime.now()));
                    });
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: renderGlassmorphicStructuralContainerBlock(
                          targetBorderRadiusValue: 22,
                          innerPaddingParameters: const EdgeInsets.all(14),
                          colorOverrideParameter: cyberpunkMode ? app.activeColor.withAlpha(20) : Colors.white.withAlpha(150),
                          childComponent: Center(
                            child: Icon(app.icon, size: 36, color: cyberpunkMode ? app.activeColor : Colors.black87),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        app.title,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: cyberpunkMode ? Colors.white70 : Colors.black87),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  // Sandbox Simulated Context Overlay Container Component UI Block Builder
  Widget buildSimulatedAppSandboxOverlayModalContainer() {
    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: renderGlassmorphicStructuralContainerBlock(
        targetBorderRadiusValue: 26,
        innerPaddingParameters: const EdgeInsets.all(16),
        colorOverrideParameter: cyberpunkMode ? const Color(0xFF0A0E1A) : Colors.white,
        childComponent: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.shield_rounded, color: Colors.greenAccent),
                    const SizedBox(width: 8),
                    Text("SECURE SANDBOX ENVIRONMENT", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: cyberpunkMode ? Colors.greenAccent : Colors.blueAccent)),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.cancel_presentation_rounded, color: Colors.redAccent),
                  onPressed: () => setState(() => currentActiveSimulatedAppTargetPackage = ""),
                )
              ],
            ),
            const Divider(color: Colors.white24),
            Expanded(child: _renderSimulatedAppContentContextBranch()),
          ],
        ),
      ),
    );
  }

  Widget _renderSimulatedAppContentContextBranch() {
    final textInversionColor = cyberpunkMode ? Colors.white : Colors.black87;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.launch_rounded, size: 64, color: Colors.blueAccent.withAlpha(150)),
          const SizedBox(height: 14),
          Text("Target Application Hook Requested", style: TextStyle(fontWeight: FontWeight.bold, color: textInversionColor)),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Package Name:\n$currentActiveSimulatedAppTargetPackage\n\nExternal app launching requires native Android Intents or 'url_launcher' package. In this core UI environment, this represents the trigger gateway.", 
              textAlign: TextAlign.center, 
              style: const TextStyle(fontSize: 12, color: Colors.grey)
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            child: const Text("CLOSE SANDBOX", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            onPressed: () => setState(() => currentActiveSimulatedAppTargetPackage = ""),
          )
        ],
      ),
    );
  }

  // ============================================================================
  //                         5. INTERACTIVE HACKER TERMINAL CONSOLE
  // ============================================================================
  Widget buildHardwareDiagnosticTerminalConsoleViewLayout() {
    return SafeArea(
      child: Column(
        children: [
          renderStructuralSectionHeaderTitleBanner("Terminal Console"),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(235),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.greenAccent.withAlpha(90), width: 1.5),
                boxShadow: [BoxShadow(color: Colors.greenAccent.withAlpha(30), blurRadius: 15)]
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(color: Colors.greenAccent.withAlpha(25), borderRadius: const BorderRadius.vertical(top: Radius.circular(18))),
                    child: const Row(
                      children: [
                        Icon(Icons.terminal_rounded, color: Colors.greenAccent, size: 16),
                        SizedBox(width: 8),
                        Text("root@stella-quantum-node:~#", style: TextStyle(color: Colors.greenAccent, fontFamily: 'monospace', fontSize: 11, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: terminalViewScrollController,
                      padding: const EdgeInsets.all(14),
                      itemCount: terminalOutputLiveStreamsRegistry.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(terminalOutputLiveStreamsRegistry[index], style: const TextStyle(color: Colors.greenAccent, fontFamily: 'monospace', fontSize: 12, height: 1.3)),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? MediaQuery.of(context).viewInsets.bottom + 15 : 95),
            child: renderGlassmorphicStructuralContainerBlock(
              targetBorderRadiusValue: 24,
              innerPaddingParameters: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              childComponent: Row(
                children: [
                  const Text(">", style: TextStyle(color: Colors.greenAccent, fontFamily: 'monospace', fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: shellTerminalInputController,
                      style: const TextStyle(color: Colors.greenAccent, fontFamily: 'monospace', fontSize: 14),
                      decoration: const InputDecoration(hintText: "Enter command...", hintStyle: TextStyle(color: Colors.white24, fontSize: 13), border: InputBorder.none),
                      onSubmitted: (val) => executeShellTerminalInputSubmissionEngine(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.subdirectory_arrow_left_rounded, color: Colors.greenAccent),
                    onPressed: executeShellTerminalInputSubmissionEngine,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // ============================================================================
  //                         6. ACOUSTIC LINK VOICE ASSISTANT VIEW
  // ============================================================================
  Widget buildAcousticLinkVoiceAssistantViewLayout() {
    final systemInversionTextColor = cyberpunkMode ? Colors.white : Colors.black87;

    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("VOICE LINK ACTIVE", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, letterSpacing: 2.0, color: systemInversionTextColor)),
            const SizedBox(height: 8),
            Text("WAKE WORD DETECTOR: 'HEY STELLA'", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: cyberpunkMode ? Colors.cyanAccent : Colors.blueAccent, letterSpacing: 1.0)),
            const SizedBox(height: 50),
            AnimatedBuilder(
              animation: globalOrbAnimationController,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    ...List.generate(3, (index) {
                      final scale = 1.0 + (globalOrbAnimationController.value * (0.25 * (index + 1)));
                      final opacity = max(0.0, 1.0 - globalOrbAnimationController.value);
                      return Container(
                        width: 130 * scale, height: 130 * scale,
                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: (cyberpunkMode ? Colors.cyanAccent : Colors.blueAccent).withOpacity(opacity * 0.4), width: 2.0)),
                      );
                    }),
                    Container(
                      width: 110, height: 110,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: cyberpunkMode ? Colors.cyanAccent.withAlpha(40) : Colors.blueAccent.withAlpha(30)),
                      child: Icon(Icons.mic_none_rounded, size: 44, color: cyberpunkMode ? Colors.cyanAccent : Colors.blueAccent),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 60),
            Text("LISTENING...", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: cyberpunkMode ? Colors.cyanAccent : Colors.blueAccent, letterSpacing: 1.5)),
          ],
        ),
      ),
    );
  }

  // ============================================================================
  //                         7. CORE SYSTEM CONFIGURATION SETTINGS VIEW
  // ============================================================================
  Widget buildCoreConfigurationSettingsViewLayout() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          renderStructuralSectionHeaderTitleBanner("Settings"),
          renderGlassmorphicStructuralContainerBlock(
            targetBorderRadiusValue: 22,
            innerPaddingParameters: const EdgeInsets.all(16),
            childComponent: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.fingerprint_rounded, color: Colors.orangeAccent),
                    SizedBox(width: 8),
                    Text("CORE IDENTITY CONFIGURATION", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: authenticatedUserIdentity,
                  style: TextStyle(color: cyberpunkMode ? Colors.white : Colors.black87, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(labelText: "Operator Name", border: OutlineInputBorder()),
                  onChanged: (value) => setState(() => authenticatedUserIdentity = value),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          renderStructuralInteractiveConfigurationItemTileElement("Cyberpunk Matrix Theme", Icons.color_lens_rounded, structuralTrailingWidgetInstance: Switch(
            value: cyberpunkMode, activeColor: Colors.cyanAccent, onChanged: (v) => setState(() => cyberpunkMode = v),
          )),
          renderStructuralInteractiveConfigurationItemTileElement("Memory Core Logs", Icons.memory_rounded),
          renderStructuralInteractiveConfigurationItemTileElement("Speech Synthesis (TTS)", Icons.volume_up_rounded),
          renderStructuralInteractiveConfigurationItemTileElement("Glassmorphism Effects", Icons.blur_on_rounded),
          renderStructuralInteractiveConfigurationItemTileElement("API Keys (Gemini)", Icons.vpn_key_rounded),
          const SizedBox(height: 25),
          Text("SYSTEM LOGS", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: cyberpunkMode ? Colors.cyanAccent : Colors.blueAccent)),
          const SizedBox(height: 8),
          renderGlassmorphicStructuralContainerBlock(
            targetBorderRadiusValue: 18,
            innerPaddingParameters: const EdgeInsets.all(14),
            childComponent: Column(
              children: List.generate(coreMemoryRegistry.length, (index) {
                final log = coreMemoryRegistry[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("[${log.logType}] ", style: const TextStyle(fontFamily: 'monospace', fontSize: 10, color: Colors.purpleAccent, fontWeight: FontWeight.bold)),
                      Expanded(child: Text(log.metadata, style: TextStyle(fontSize: 11, color: cyberpunkMode ? Colors.white70 : Colors.black87))),
                    ],
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 130),
        ],
      ),
    );
  }

  Widget renderStructuralInteractiveConfigurationItemTileElement(String settingLabelIdentifierText, IconData settingItemIcon, {Widget? structuralTrailingWidgetInstance}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: renderGlassmorphicStructuralContainerBlock(
        targetBorderRadiusValue: 20,
        innerPaddingParameters: const EdgeInsets.all(14),
        childComponent: Row(
          children: [
            Icon(settingItemIcon, color: cyberpunkMode ? Colors.cyanAccent : Colors.blueAccent),
            const SizedBox(width: 14),
            Expanded(child: Text(settingLabelIdentifierText, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: cyberpunkMode ? Colors.white : Colors.black87))),
            structuralTrailingWidgetInstance ?? Icon(Icons.arrow_forward_ios_rounded, size: 14, color: cyberpunkMode ? Colors.white38 : Colors.black38),
          ],
        ),
      ),
    );
  }

  // ============================================================================
  //                         SHARED CORE HELPER WIDGETS
  // ============================================================================
  Widget renderStructuralSectionHeaderTitleBanner(String operationalViewTitleText) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(operationalViewTitleText, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, letterSpacing: 1.5, color: cyberpunkMode ? Colors.white : Colors.black87)),
      ),
    );
  }

  Widget renderDockNavigationActionButtonElement(IconData displayIconTemplate, int designatedPageIndexTarget, String telemetryLabelTag) {
    final bool isSelected = currentNavigationIndex == designatedPageIndexTarget;
    return GestureDetector(
      onTap: () => triggerSystemNavigationInterception(designatedPageIndexTarget),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? (cyberpunkMode ? Colors.cyanAccent.withAlpha(70) : Colors.black.withAlpha(30)) : Colors.transparent,
        ),
        child: Icon(displayIconTemplate, size: 24, color: isSelected ? (cyberpunkMode ? Colors.cyanAccent : Colors.blueAccent) : (cyberpunkMode ? Colors.white54 : Colors.black54)),
      ),
    );
  }

  Widget renderGlassmorphicActionCircleFrame({required IconData targetIconData, required Color accentColorVector}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(shape: BoxShape.circle, color: accentColorVector.withAlpha(30), border: Border.all(color: accentColorVector.withAlpha(60), width: 1.5)),
      child: Icon(targetIconData, color: accentColorVector, size: 22),
    );
  }

  Widget renderGlassmorphicStructuralContainerBlock({required Widget childComponent, required double targetBorderRadiusValue, required EdgeInsets innerPaddingParameters, Color? colorOverrideParameter}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(targetBorderRadiusValue),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
        child: Container(
          padding: innerPaddingParameters,
          decoration: BoxDecoration(
            color: colorOverrideParameter ?? (cyberpunkMode ? Colors.white.withAlpha(15) : Colors.white.withAlpha(140)),
            borderRadius: BorderRadius.circular(targetBorderRadiusValue),
            border: Border.all(color: cyberpunkMode ? Colors.white.withAlpha(25) : Colors.white.withAlpha(180), width: 1.5),
          ),
          child: childComponent,
        ),
      ),
    );
  }

  Widget renderInterpolatedVisualBlobMeshElement({required Color targetColorVector, required double structuralPixelDiameter}) {
    return Container(
      width: structuralPixelDiameter, height: structuralPixelDiameter,
      decoration: BoxDecoration(shape: BoxShape.circle, color: targetColorVector),
      child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 55.0, sigmaY: 55.0), child: Container(color: Colors.transparent)),
    );
  }
}
