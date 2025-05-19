import 'package:flutter/material.dart';
import '../models/tournament_tab.dart';

class TabManager extends ChangeNotifier {
  final List<TournamentTab> _tabs = [];
  int _activeTabIndex = 0;

  List<TournamentTab> get tabs => List.unmodifiable(_tabs);
  int get activeTabIndex => _activeTabIndex;
  TournamentTab? get activeTab =>
      _tabs.isNotEmpty ? _tabs[_activeTabIndex] : null;

  void openTab(TournamentTab tab) {
    final existingIndex = _tabs.indexWhere((t) => t.id == tab.id);
    if (existingIndex != -1) {
      _activeTabIndex = existingIndex;
    } else {
      _tabs.add(tab);
      _activeTabIndex = _tabs.length - 1;
    }
    notifyListeners();
  }

  void closeTab(int index) {
    if (index < 0 || index >= _tabs.length) return;
    _tabs.removeAt(index);
    if (_activeTabIndex >= _tabs.length) {
      _activeTabIndex = _tabs.length - 1;
    }
    notifyListeners();
  }

  void switchTab(int index) {
    if (index < 0 || index >= _tabs.length) return;
    _activeTabIndex = index;
    notifyListeners();
  }

  void updateTab(int id, {bool? hasUnsavedChanges, String? name}) {
    final index = _tabs.indexWhere((t) => t.id == id);
    if (index != -1) {
      final tab = _tabs[index];
      _tabs[index] = TournamentTab(
        id: tab.id,
        name: name ?? tab.name,
        hasUnsavedChanges: hasUnsavedChanges ?? tab.hasUnsavedChanges,
      );
      notifyListeners();
    }
  }

  void closeAllTabs() {
    _tabs.clear();
    _activeTabIndex = 0;
    notifyListeners();
  }
}
