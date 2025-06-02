import 'package:flutter/material.dart';

class ChatWithUs extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {
      'sender': 'bot',
      'message':
      'Hello !\n\nWelcome to FNP, India\'s largest gifting destination.\n\nI am Muskaan., your gifting assistant. How may I help you today?',
      'time': '10:25 am'
    },
    {
      'sender': 'user',
      'message': 'Query about my order',
      'time': '10:25 am'
    },
    {
      'sender': 'bot',
      'message': 'Please enter your registered email address.',
      'time': '10:25 am'
    },
  ];

  ChatWithUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enquiry about existing o..."),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(child: Text("Currently replying in 3 minutes")),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isBot = msg['sender'] == 'bot';
                return Align(
                  alignment:
                  isBot ? Alignment.centerLeft : Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: isBot
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isBot
                              ? Colors.blue.shade100
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          msg['message'],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        msg['time'],
                        style:
                        const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: Colors.white,
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter email',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
