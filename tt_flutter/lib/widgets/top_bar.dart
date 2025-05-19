import 'package:flutter/material.dart';

/// TopBar widget for the application, providing the main menu and title.
class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 48,
      color: colorScheme.surface,
      child: Row(
        children: [
          PopupMenuButton<String>(
            color: colorScheme.surfaceContainerHighest,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  Text('File', style: TextStyle(color: colorScheme.onSurface)),
            ),
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'open', child: Text('Open')),
              PopupMenuItem(value: 'save', child: Text('Save')),
              PopupMenuItem(value: 'exit', child: Text('Exit')),
              PopupMenuItem(value: 'new', child: Text('New')),
            ],
            onSelected: (value) {
              // TODO: Handle menu actions
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                'TT-tournament manager',
                style: TextStyle(
                  color: colorScheme.onSurface.withOpacity(0.7),
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
