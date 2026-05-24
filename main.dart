
// ================================
// STELLA AI ULTIMATE UI
// DARTPAD SAFE VERSION
// ================================

import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';

void main() {
  runApp(const StellaAI());
}

class StellaAI extends StatelessWidget {
  const StellaAI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StellaHome(),
    );
  }
}

class StellaHome extends StatefulWidget {
  const StellaHome({super.key});

  @override
  State<StellaHome> createState() => _StellaHomeState();
}

class _StellaHomeState extends State<StellaHome>
    with TickerProviderStateMixin {
  bool cyberpunkMode = false;

  late AnimationController orbController;
  late AnimationController backgroundController;

  int currentPage = 0;

  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    orbController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    backgroundController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    orbController.dispose();
    backgroundController.dispose();
    super.dispose();
  }

  void navigate(int index) {
    setState(() {
      currentPage = index;
    });

    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bg1 = cyberpunkMode
        ? const Color(0xFF070B14)
        : const Color(0xFFEAF6FF);

    final bg2 = cyberpunkMode
        ? const Color(0xFF0E1320)
        : const Color(0xFFFFF5E8);

    return Scaffold(
      body: Stack(
        children: [

          // ======================
          // ANIMATED BACKGROUND
          // ======================

          AnimatedBuilder(
            animation: backgroundController,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(
                      sin(backgroundController.value * pi * 2),
                      -1,
                    ),
                    end: Alignment(
                      1,
                      cos(backgroundController.value * pi * 2),
                    ),
                    colors: [
                      bg1,
                      bg2,
                    ],
                  ),
                ),
              );
            },
          ),

          // ======================
          // MESH CIRCLES
          // ======================

          Positioned(
            top: -80,
            left: -50,
            child: animatedBlob(
              cyberpunkMode
                  ? Colors.cyanAccent.withAlpha(60)
                  : Colors.blue.withAlpha(40),
              220,
            ),
          ),

          Positioned(
            bottom: -100,
            right: -50,
            child: animatedBlob(
              cyberpunkMode
                  ? Colors.purpleAccent.withAlpha(70)
                  : Colors.orange.withAlpha(30),
              260,
            ),
          ),

          // ======================
          // PAGE VIEW
          // ======================

          PageView(
            controller: pageController,
            children: [

              // HOME
              buildHomePage(),

              // CHAT
              buildChatPage(),

              // NOTES
              buildNotesPage(),

              // VOICE
              buildVoicePage(),

              // SETTINGS
              buildSettingsPage(),
            ],
          ),

          // ======================
          // FLOATING DOCK
          // ======================

          Positioned(
            bottom: 25,
            left: 20,
            right: 20,
            child: glassContainer(
              borderRadius: 30,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  dockButton(Icons.home, 0),

                  dockButton(Icons.chat_bubble_rounded, 1),

                  dockButton(Icons.edit_note_rounded, 2),

                  dockButton(Icons.graphic_eq_rounded, 3),

                  dockButton(Icons.settings, 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ======================
  // HOME PAGE
  // ======================

  Widget buildHomePage() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [

                  glassCircle(
                    icon: Icons.auto_awesome,
                    color: cyberpunkMode
                        ? Colors.cyanAccent
                        : Colors.blueAccent,
                  ),

                  const SizedBox(width: 14),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "STELLA AI",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "Next Generation Assistant",
                      ),
                    ],
                  ),
                ],
              ),

              Switch(
                value: cyberpunkMode,
                onChanged: (v) {
                  setState(() {
                    cyberpunkMode = v;
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 30),

          // ======================
          // AI ORB
          // ======================

          Center(
            child: AnimatedBuilder(
              animation: orbController,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1 + (orbController.value * 0.08),
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: cyberpunkMode
                            ? [
                                Colors.cyanAccent,
                                Colors.purpleAccent,
                              ]
                            : [
                                Colors.blueAccent,
                                Colors.white,
                              ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: cyberpunkMode
                              ? Colors.cyanAccent.withAlpha(120)
                              : Colors.blue.withAlpha(80),
                          blurRadius: 40,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.auto_awesome,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            "Ultimate AI Workspace",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            "Vision Pro + Cyberpunk + Glassmorphism",
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),

          const SizedBox(height: 25),

          // ======================
          // SEARCH
          // ======================

          glassContainer(
            borderRadius: 30,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Row(
              children: [

                Icon(
                  Icons.search,
                  color: Colors.grey[700],
                ),

                const SizedBox(width: 10),

                Text(
                  "Search Stella AI...",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // ======================
          // FEATURE GRID
          // ======================

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
            children: [

              featureCard(
                "AI Chat",
                Icons.chat_bubble_rounded,
                Colors.purpleAccent,
              ),

              featureCard(
                "Voice Assistant",
                Icons.mic_rounded,
                Colors.blueAccent,
              ),

              featureCard(
                "Smart Notes",
                Icons.edit_document,
                Colors.green,
              ),

              featureCard(
                "Image Generator",
                Icons.image_rounded,
                Colors.orange,
              ),

              featureCard(
                "Video Generator",
                Icons.video_camera_back_rounded,
                Colors.pinkAccent,
              ),

              featureCard(
                "AI Memory",
                Icons.memory_rounded,
                Colors.teal,
              ),
            ],
          ),

          const SizedBox(height: 120),
        ],
      ),
    );
  }

  // ======================
  // CHAT PAGE
  // ======================

  Widget buildChatPage() {
    return SafeArea(
      child: Column(
        children: [

          pageTitle("AI Chat"),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [

                aiMessage(
                  "Hello Su 👋\nHow can I help you today?",
                ),

                const SizedBox(height: 20),

                userMessage(
                  "Create futuristic cyberpunk UI",
                ),

                const SizedBox(height: 20),

                aiMessage(
                  "Generating premium futuristic UI...",
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: glassContainer(
              borderRadius: 30,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
              child: Row(
                children: [

                  const Icon(Icons.add),

                  const SizedBox(width: 10),

                  const Expanded(
                    child: Text(
                      "Type message...",
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: cyberpunkMode
                          ? Colors.cyanAccent
                          : Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.send,
                      color: cyberpunkMode
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ======================
  // NOTES PAGE
  // ======================

  Widget buildNotesPage() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          pageTitle("Smart Notes"),

          noteCard(
            "Flutter UI",
            "Build futuristic glassmorphism interface.",
            Colors.blueAccent,
          ),

          const SizedBox(height: 16),

          noteCard(
            "AI Ideas",
            "Add memory + voice assistant + AI orb.",
            Colors.purpleAccent,
          ),

          const SizedBox(height: 16),

          noteCard(
            "Cyberpunk Theme",
            "Add neon cyan glow and particles.",
            Colors.cyanAccent,
          ),

          const SizedBox(height: 120),
        ],
      ),
    );
  }

  // ======================
  // VOICE PAGE
  // ======================

  Widget buildVoicePage() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Text(
            "Voice Assistant",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 40),

          AnimatedBuilder(
            animation: orbController,
            builder: (context, child) {
              return Container(
                width: 180 + orbController.value * 20,
                height: 180 + orbController.value * 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: cyberpunkMode
                        ? [
                            Colors.cyanAccent,
                            Colors.purpleAccent,
                          ]
                        : [
                            Colors.blueAccent,
                            Colors.white,
                          ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: cyberpunkMode
                          ? Colors.cyanAccent.withAlpha(120)
                          : Colors.blue.withAlpha(80),
                      blurRadius: 50,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.mic_rounded,
                  size: 70,
                  color: Colors.white,
                ),
              );
            },
          ),

          const SizedBox(height: 40),

          const Text(
            "Listening...",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "Say: Hey Stella",
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  // ======================
  // SETTINGS PAGE
  // ======================

  Widget buildSettingsPage() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          pageTitle("Settings"),

          settingsTile(
            "Cyberpunk Theme",
            Icons.color_lens,
          ),

          settingsTile(
            "AI Memory",
            Icons.memory,
          ),

          settingsTile(
            "Voice Assistant",
            Icons.mic,
          ),

          settingsTile(
            "Animations",
            Icons.animation,
          ),

          settingsTile(
            "Glass Blur",
            Icons.blur_on,
          ),

          settingsTile(
            "Dynamic Wallpapers",
            Icons.wallpaper,
          ),

          settingsTile(
            "Particle Effects",
            Icons.auto_awesome,
          ),

          const SizedBox(height: 120),
        ],
      ),
    );
  }

  // ======================
  // WIDGETS
  // ======================

  Widget featureCard(
    String title,
    IconData icon,
    Color color,
  ) {
    return glassContainer(
      borderRadius: 28,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withAlpha(40),
            ),
            child: Icon(
              icon,
              color: color,
              size: 28,
            ),
          ),

          const Spacer(),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Premium futuristic AI feature.",
          ),
        ],
      ),
    );
  }

  Widget noteCard(
    String title,
    String subtitle,
    Color color,
  ) {
    return glassContainer(
      borderRadius: 25,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [

          Container(
            width: 10,
            height: 70,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(subtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget settingsTile(
    String title,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: glassContainer(
        borderRadius: 24,
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [

            Icon(icon),

            const SizedBox(width: 16),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),

            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  Widget dockButton(
    IconData icon,
    int index,
  ) {
    final selected = currentPage == index;

    return GestureDetector(
      onTap: () {
        navigate(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected
              ? (cyberpunkMode
                  ? Colors.cyanAccent.withAlpha(70)
                  : Colors.white.withAlpha(120))
              : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: cyberpunkMode
              ? Colors.white
              : Colors.black87,
        ),
      ),
    );
  }

  Widget glassCircle({
    required IconData icon,
    required Color color,
  }) {
    return glassContainer(
      width: 55,
      height: 55,
      borderRadius: 100,
      child: Icon(
        icon,
        color: color,
      ),
    );
  }

  Widget glassContainer({
    required Widget child,
    double? width,
    double? height,
    double borderRadius = 24,
    EdgeInsetsGeometry? padding,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: cyberpunkMode
                ? Colors.white.withAlpha(15)
                : Colors.white.withAlpha(120),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: cyberpunkMode
                  ? Colors.cyanAccent.withAlpha(80)
                  : Colors.white.withAlpha(180),
            ),
            boxShadow: [
              BoxShadow(
                color: cyberpunkMode
                    ? Colors.cyanAccent.withAlpha(20)
                    : Colors.black.withAlpha(10),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }

  Widget aiMessage(String text) {
    return Row(
      children: [

        glassCircle(
          icon: Icons.auto_awesome,
          color: Colors.purpleAccent,
        ),

        const SizedBox(width: 10),

        Expanded(
          child: glassContainer(
            borderRadius: 24,
            padding: const EdgeInsets.all(16),
            child: Text(text),
          ),
        ),
      ],
    );
  }

  Widget userMessage(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: glassContainer(
        borderRadius: 24,
        padding: const EdgeInsets.all(16),
        child: Text(text),
      ),
    );
  }

  Widget pageTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 25,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget animatedBlob(
    Color color,
    double size,
  ) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
