import 'package:flutter/material.dart';

/// SideBar widget for the application, providing navigation buttons.
class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 220,
      color: colorScheme.surfaceContainerHighest,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          _SideBarButton(label: 'Settings', onPressed: () {}),
          _SideBarButton(label: 'Players', onPressed: () {}),
          _SideBarButton(label: 'Matches', onPressed: () {}),
          _SideBarButton(label: 'Tournament details', onPressed: () {}),
          Divider(
            color: Theme.of(context).dividerColor,
            height: 32,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          _SideBarButton(label: 'Create new Tournament', onPressed: () {}),
          _SideBarButton(label: "Tournament's list", onPressed: () {}),
          const Spacer(),
        ],
      ),
    );
  }
}

class _SideBarButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const _SideBarButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextButton(
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          foregroundColor: colorScheme.onSurface,
          textStyle: const TextStyle(fontSize: 12),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
