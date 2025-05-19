import 'package:flutter/material.dart';
import '../models/tournament_tab.dart';

class TournamentTabBar extends StatelessWidget {
  final List<TournamentTab> tabs;
  final int activeTabIndex;
  final void Function(int) onTabSelected;
  final void Function(int) onTabClosed;

  const TournamentTabBar({
    Key? key,
    required this.tabs,
    required this.activeTabIndex,
    required this.onTabSelected,
    required this.onTabClosed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor ??
          Theme.of(context).primaryColor,
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final tab = tabs[index];
          final isActive = index == activeTabIndex;
          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: isActive
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.15)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isActive
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  Text(
                    tab.name + (tab.hasUnsavedChanges ? ' *' : ''),
                    style: TextStyle(
                      color: isActive
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).textTheme.bodyLarge?.color,
                      fontWeight:
                          isActive ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      onTabClosed(index);
                    },
                    child: const Icon(Icons.close, size: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
