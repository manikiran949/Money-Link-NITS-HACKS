import 'package:flutter/material.dart';

class SghGroupsPage extends StatelessWidget {
  final List<Map<String, dynamic>> groups = [
    {
      'name': 'Savings Group A',
      'members': ['Alice', 'Bob', 'Charlie'],
    },
    {
      'name': 'Investment Group B',
      'members': ['David', 'Eve', 'Frank'],
    },
    {
      'name': 'Charity Group C',
      'members': ['Grace', 'Heidi', 'Ivan'],
    },
    {
      'name': 'Loan Group D',
      'members': ['Jack', 'Kara', 'Liam'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SGH Groups')),
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          final group = groups[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(groupName: group['name']),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Members: ${group['members'].join(', ')}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  final String groupName;

  ChatPage({required this.groupName});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, dynamic>> messages = [
    {'text': 'Can I borrow 100?', 'isLend': false, 'isUser': false},
    {'text': 'Sure, I can lend you.', 'isLend': true, 'isUser': true},
  ];
  final TextEditingController _controller = TextEditingController();
  bool _isLending = false;

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add({'text': text, 'isLend': _isLending, 'isUser': true});
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.groupName)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment:
                  message['isUser'] ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 8.0,
                    ),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: message['isLend']
                          ? Colors.orange[100]
                          : Colors.blue[100],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      message['text'],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Enter message'),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    _isLending ? Icons.arrow_upward : Icons.arrow_downward,
                    color: _isLending ? Colors.orange : Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      _isLending = !_isLending;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
