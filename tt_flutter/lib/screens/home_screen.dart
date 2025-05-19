import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: Colors.grey[900],
      child: Row(
        children: [
          PopupMenuButton<String>(
            color: Colors.grey[850],
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('File', style: TextStyle(color: Colors.white)),
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
          const Expanded(
            child: Center(
              child: Text(
                'TT-tournament manager',
                style: TextStyle(
                  color: Colors.grey,
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

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: Colors.grey[850],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          _SideBarButton(label: 'Settings', onPressed: () {}),
          _SideBarButton(label: 'Players', onPressed: () {}),
          _SideBarButton(label: 'Matches', onPressed: () {}),
          _SideBarButton(label: 'Tournament details', onPressed: () {}),
          const Divider(
              color: Colors.grey,
              height: 32,
              thickness: 1,
              indent: 16,
              endIndent: 16),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextButton(
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Use the TopBar component
          const TopBar(),
          // Main content area with SideBar and MainArea
          Expanded(
            child: Row(
              children: [
                // SideBar component
                const SideBar(),
                // MainArea placeholder
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: const Center(
                      child: Text(
                        'Main Area',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeMenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const HomeMenuButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
