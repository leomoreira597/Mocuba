import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Carregando....",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            LinearProgressIndicator()
          ],
        ),
      ),
    );
  }
}
