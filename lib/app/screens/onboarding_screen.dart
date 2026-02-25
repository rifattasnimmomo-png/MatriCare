import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  final Function(String userName, int pregnancyWeek) onComplete;

  const OnboardingScreen({Key? key, required this.onComplete}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _step = 1;
  final _formData = {
    'name': '',
    'age': '',
    'week': '',
    'trimester': '1',
    'riskFlags': <String>[],
    'consent': false,
  };

  void _handleNext() {
    if (_step < 3) {
      setState(() {
        _step++;
      });
    } else {
      final name = _formData['name'] as String;
      final firstName = name.trim().split(' ')[0];
      final weekStr = _formData['week'] as String;
      final week = int.tryParse(weekStr) ?? 18;
      widget.onComplete(firstName, week);
    }
  }

  bool _isStepComplete() {
    switch (_step) {
      case 1:
        final name = _formData['name'] as String?;
        final age = _formData['age'] as String?;
        return (name?.isNotEmpty ?? false) && (age?.isNotEmpty ?? false);
      case 2:
        final week = _formData['week'] as String?;
        return week?.isNotEmpty ?? false;
      case 3:
        return _formData['consent'] == true;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Logo placeholder
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFB6C1).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.favorite,
                      size: 48,
                      color: Color(0xFFFFB6C1),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'MatriCare',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Your trusted companion for a healthy pregnancy journey',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Progress Indicator
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  final step = index + 1;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: step == _step ? 48 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: step == _step
                          ? const Color(0xFFFFB6C1)
                          : const Color(0xFFFFE8F0),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: _buildStepContent(),
              ),
            ),

            // Bottom Button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _isStepComplete() ? _handleNext : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB6C1),
                    disabledBackgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _step < 3 ? 'Continue' : 'Get Started',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_step) {
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Let\'s get started',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tell us a bit about yourself',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            const Text('Your Name', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) => setState(() => _formData['name'] = value),
            ),
            const SizedBox(height: 20),
            const Text('Your Age', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter your age',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) => setState(() => _formData['age'] = value),
            ),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pregnancy Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Help us provide personalized care',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            const Text('Current Pregnancy Week', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'e.g., 18',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) => setState(() => _formData['week'] = value),
            ),
          ],
        );
      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy & Consent',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your data security is our priority',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE8F0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.shield, color: Color(0xFFFFB6C1)),
                      SizedBox(width: 12),
                      Text(
                        'Data Protection',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    '• Your health data is encrypted\n'
                    '• We never share your data without consent\n'
                    '• You can delete your data anytime\n'
                    '• HIPAA compliant security',
                    style: TextStyle(height: 1.6),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => setState(() => _formData['consent'] = !(_formData['consent'] as bool)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _formData['consent'] as bool,
                    onChanged: (value) => setState(() => _formData['consent'] = value ?? false),
                    activeColor: const Color(0xFFFFB6C1),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Text(
                        'I agree to the Terms of Service and Privacy Policy',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }
}
