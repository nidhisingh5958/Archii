import 'dart:async';
import 'package:flutter/material.dart';
import 'results_screen.dart';

class AILoadingScreen extends StatefulWidget {
  const AILoadingScreen({Key? key}) : super(key: key);

  @override
  State<AILoadingScreen> createState() => _AILoadingScreenState();
}

class _AILoadingScreenState extends State<AILoadingScreen>
    with SingleTickerProviderStateMixin {
  int currentMessageIndex = 0;
  double progress = 0.0;
  Timer? _timer;
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  final List<String> loadingMessages = [
    '🎨 Analyzing your space...',
    '📐 Creating floor plan...',
    '✨ Designing interior layout...',
    '🪑 Selecting furniture...',
    '🎨 Applying color palette...',
    '💡 Optimizing lighting...',
    '💰 Calculating costs...',
    '📝 Generating recommendations...',
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);

    _startLoading();
  }

  void _startLoading() {
    const totalDuration = 8; // seconds
    const intervalDuration = 100; // milliseconds
    const totalIntervals = (totalDuration * 1000) / intervalDuration;
    const progressIncrement = 1.0 / totalIntervals;

    _timer = Timer.periodic(const Duration(milliseconds: intervalDuration), (
      timer,
    ) {
      setState(() {
        progress += progressIncrement;

        // Change message every second
        if ((timer.tick * intervalDuration) % 1000 == 0) {
          currentMessageIndex =
              (currentMessageIndex + 1) % loadingMessages.length;
        }

        if (progress >= 1.0) {
          timer.cancel();
          _navigateToResults();
        }
      });
    });
  }

  void _navigateToResults() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ResultsScreen()),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF2563EB), Color(0xFF4F46E5), Color(0xFF6366F1)],
          ),
        ),
        child: Stack(
          children: [
            // Animated grid background
            Positioned.fill(
              child: Opacity(
                opacity: 0.1,
                child: CustomPaint(
                  painter: AnimatedGridPainter(progress: progress),
                ),
              ),
            ),
            // Content
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    // Animated icon
                    AnimatedBuilder(
                      animation: _rotationAnimation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _rotationAnimation.value * 2 * 3.14159,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(30),
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
                    const SizedBox(height: 40),
                    // Title
                    const Text(
                      'Generating Your Design',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    // Animated message
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 0.2),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                      child: Text(
                        loadingMessages[currentMessageIndex],
                        key: ValueKey<int>(currentMessageIndex),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFFBFDBFE),
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 60),
                    // Progress bar
                    Column(
                      children: [
                        Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: progress,
                              backgroundColor: Colors.transparent,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Info text
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 24,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Our AI is analyzing your space and creating a personalized design just for you',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedGridPainter extends CustomPainter {
  final double progress;

  AnimatedGridPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1;

    const spacing = 50.0;
    final animatedSpacing = spacing * (1 + progress * 0.5);

    for (double i = 0; i < size.width; i += animatedSpacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += animatedSpacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(AnimatedGridPainter oldDelegate) =>
      progress != oldDelegate.progress;
}
