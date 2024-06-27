import 'package:flutter/material.dart';

class PracticeFutureScreen extends StatefulWidget {
  @override
  _PracticeFutureScreenState createState() => _PracticeFutureScreenState();
}

class _PracticeFutureScreenState extends State<PracticeFutureScreen> {
  String _result = 'Press the button to start!';

  Future<String> _fetchData() async {
    // Simulate an asynchronous operation (e.g., network request)
    await Future.delayed(const Duration(seconds: 10));
    return 'Data fetched successfully!';
  }

  void _fetchAndDisplayData() async {
    setState(() {
      _result = 'Fetching data...'; // Update UI while data is being fetched
    });
    final data = await _fetchData(); // Wait for the Future to complete
    setState(() {
      _result = data; // Update UI with the fetched data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Async/Await'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_result, style: const TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: _fetchAndDisplayData,
              child: const Text('Fetch Data'),
            ),
          ],
        ),
      ),
    );
  }
}
