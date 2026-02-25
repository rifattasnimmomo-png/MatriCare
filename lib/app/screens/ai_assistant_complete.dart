import 'package:flutter/material.dart';

class AIAssistantComplete extends StatefulWidget {
  const AIAssistantComplete({Key? key}) : super(key: key);

  @override
  State<AIAssistantComplete> createState() => _AIAssistantCompleteState();
}

class _AIAssistantCompleteState extends State<AIAssistantComplete> {
  final List<Map<String, dynamic>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<String> _suggestedQuestions = [
    'What does my heart rate trend mean?',
    'Is it normal to feel tired?',
    'Tips for better sleep',
    'When should I contact my doctor?',
  ];

  @override
  void initState() {
    super.initState();
    _messages.add({
      'type': 'ai',
      'content': 'Hello! 👋 I\'m your MatriCare AI assistant. I\'m here to help you understand your health readings and answer questions about your pregnancy journey. How can I help you today?',
      'time': DateTime.now(),
    });
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'type': 'user',
        'content': text,
        'time': DateTime.now(),
      });
    });

    _controller.clear();

    // Scroll to bottom
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });

    // Simulate AI response
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.add({
          'type': 'ai',
          'content': _getAIResponse(text),
          'time': DateTime.now(),
        });
      });

      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    });
  }

  String _getAIResponse(String text) {
    final lowerText = text.toLowerCase();
    
    if (lowerText.contains('heart') || lowerText.contains('rate')) {
      return 'Your heart rate has been consistently between 68-73 bpm this week, which is perfectly normal for your stage of pregnancy. A slightly elevated heart rate is expected as your body works harder to support you and your baby. The stable trend shows your cardiovascular system is adapting well.';
    } else if (lowerText.contains('tired') || lowerText.contains('fatigue') || lowerText.contains('energy')) {
      return 'Feeling tired during pregnancy, especially in the second trimester, is very common. Your body is working hard to support your growing baby. Here are some tips:\n\n• Try to rest when you can, even short 15-20 minute naps help\n• Stay hydrated - dehydration can increase fatigue\n• Light exercise like walking can actually boost energy\n• Ensure you\'re getting enough iron and protein\n\nIf fatigue is severe or sudden, please consult your doctor.';
    } else if (lowerText.contains('sleep')) {
      return 'Better sleep during pregnancy can be challenging, but here are some evidence-based tips:\n\n• Sleep on your left side to optimize blood flow\n• Use pillows between your knees and under your belly\n• Avoid large meals 2-3 hours before bed\n• Keep your room cool and dark\n• Try prenatal yoga or gentle stretching before bed\n• Limit screen time in the evening\n\nYour sleep patterns are important for both you and baby!';
    } else if (lowerText.contains('doctor') || lowerText.contains('contact') || lowerText.contains('emergency')) {
      return 'You should contact your healthcare provider if you experience:\n\n⚠️ Heavy bleeding or fluid leakage\n⚠️ Severe abdominal pain\n⚠️ Reduced fetal movements (after week 28)\n⚠️ Severe headaches with vision changes\n⚠️ Persistent nausea/vomiting\n⚠️ Signs of infection (fever, chills)\n\nFor urgent concerns, don\'t wait - call immediately or visit the emergency department. Your health and baby\'s safety come first!';
    } else {
      return 'I\'m here to help you understand your health data better. Your current vitals are all within healthy ranges, which is wonderful! Remember, I provide general information and insights, but any concerns should be discussed with your healthcare provider.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      child: Column(
        children: [
          // Header
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFB6C1), Color(0xFFFF9BB5), Color(0xFFFF9BB5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AI Health Assistant',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Always here to help',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Disclaimer
          Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE8F0),
              border: Border.all(color: const Color(0xFFFFD4E5)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info,
                  size: 20,
                  color: const Color(0xFFFFB6C1),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '💡 Note: This AI assistant provides general information and explanations about your health data. It is not a diagnostic tool and does not replace professional medical advice.',
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xFFFF9BB5),
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Messages
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              itemCount: _messages.length + (_messages.isEmpty ? 1 : 0),
              itemBuilder: (context, index) {
                if (_messages.isEmpty && index == 0) {
                  return _buildSuggestedQuestions();
                }

                final message = _messages[index];
                final isUser = message['type'] == 'user';

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isUser) ...[
                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFB6C1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.auto_awesome,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                      Flexible(
                        child: Column(
                          crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: isUser ? const Color(0xFFFFB6C1) : Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: isUser ? null : Border.all(color: Colors.grey.shade200),
                              ),
                              child: Text(
                                message['content'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: isUser ? Colors.white : Colors.black87,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _formatTime(message['time']),
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Suggested Questions (if no messages)
          if (_messages.length == 1) _buildSuggestedQuestions(),

          // Input area
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Ask me anything...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: Color(0xFFFFB6C1)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                    ),
                    onSubmitted: _sendMessage,
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => _sendMessage(_controller.text),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFB6C1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 20,
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

  Widget _buildSuggestedQuestions() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Suggested questions:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _suggestedQuestions.map((question) {
              return GestureDetector(
                onTap: () => _sendMessage(question),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFFFB6C1)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    question,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFFFFB6C1),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 1) {
      return 'Just now';
    } else if (diff.inHours < 1) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    } else {
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
