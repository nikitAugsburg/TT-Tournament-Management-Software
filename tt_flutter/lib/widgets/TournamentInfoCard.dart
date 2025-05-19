import 'package:flutter/material.dart';
import '../models/tournament.dart';

class TournamentInfoCard extends StatelessWidget {
  final Tournament tournament;
  final VoidCallback? onDelete;

  const TournamentInfoCard({
    Key? key,
    required this.tournament,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tournament.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                if (onDelete != null)
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    tooltip: 'Delete Tournament',
                    onPressed: onDelete,
                  ),
              ],
            ),
            const SizedBox(height: 8),
            _buildInfoRow('Date', tournament.date),
            if (tournament.location != null)
              _buildInfoRow('Location', tournament.location!),
            if (tournament.description != null)
              _buildInfoRow('Description', tournament.description!),
            _buildInfoRow('Status', tournament.status.toString()),
            _buildInfoRow('Type', tournament.type.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
