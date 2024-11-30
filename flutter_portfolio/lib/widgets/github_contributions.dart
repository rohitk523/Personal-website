import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GithubContributions extends StatefulWidget {
  final String username;

  const GithubContributions({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  _GithubContributionsState createState() => _GithubContributionsState();
}

class _GithubContributionsState extends State<GithubContributions> {
  List<int> contributions = [];
  bool isLoading = true;
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchContributions();
  }

  Future<void> fetchContributions() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.github.com/users/${widget.username}/events'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> events = json.decode(response.body);
        final Map<String, int> contributionMap = {};

        // Process last 365 days
        final now = DateTime.now();
        for (int i = 0; i < 365; i++) {
          final date = now.subtract(Duration(days: i));
          contributionMap[date.toString().split(' ')[0]] = 0;
        }

        for (var event in events) {
          if (event['type'] == 'PushEvent') {
            final date =
                DateTime.parse(event['created_at']).toString().split(' ')[0];
            contributionMap[date] = (contributionMap[date] ?? 0) + 1;
          }
        }

        setState(() {
          contributions = contributionMap.values.toList();
          isLoading = false;
        });
      } else {
        setState(() {
          error = 'Failed to fetch contributions';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = 'Error: $e';
        isLoading = false;
      });
    }
  }

  Color _getContributionColor(int count) {
    if (count == 0) return Colors.grey.shade200;
    if (count <= 2) return Colors.green.shade200;
    if (count <= 4) return Colors.green.shade400;
    return Colors.green.shade700;
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (error.isNotEmpty) {
      return Text(error);
    }

    return Container(
      height: 200,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 52,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemCount: contributions.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: _getContributionColor(contributions[index]),
              borderRadius: BorderRadius.circular(2),
            ),
          );
        },
      ),
    );
  }
}
