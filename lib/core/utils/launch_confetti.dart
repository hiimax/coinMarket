import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';

void launchConfetti(
  BuildContext context, {
  ConfettiOptions? options,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Confetti.launch(
      context,
      options: options ??
          const ConfettiOptions(
            particleCount: 200,
            spread: 70,
            y: 0.6,
          ),
    );
  });
}

void launchSadConfetti(
  BuildContext context, {
  ConfettiOptions? options,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Confetti.launch(
      context,
      options: options ??
          const ConfettiOptions(
            particleCount: 5,
            // blastDirection: 3.14 / 2, // Downward
            spread: 50, // Narrow spread
            // emissionFrequency: 0.01,
            gravity: 2,
          ),
      particleBuilder: (index) =>
          Emoji(emoji: '😭', textStyle: TextStyle(fontSize: 60)),
    );
  });
}

void launchHappyConfetti(
  BuildContext context, {
  ConfettiOptions? options,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Confetti.launch(
      context,
      options: options ??
          const ConfettiOptions(
            particleCount: 5,
            spread: 50,
            gravity: 2,
          ),
      particleBuilder: (index) =>
          Emoji(emoji: '😄', textStyle: TextStyle(fontSize: 60)),
    );
  });
}
