import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreenComplete extends StatefulWidget {
  final Function(String userName, int pregnancyWeek) onComplete;

  const OnboardingScreenComplete({Key? key, required this.onComplete}) : super(key: key);

  @override
  State<OnboardingScreenComplete> createState() => _OnboardingScreenCompleteState();
}

class _OnboardingScreenCompleteState extends State<OnboardingScreenComplete> {
  int _step = 1;
  late TextEditingController _weekController;
  final _formData = {
    'name': '',
    'age': '',
    'week': '',
    'trimester': '',
    'riskFlags': <String>[],
    'consent': false,
  };

  @override
  void initState() {
    super.initState();
    _weekController = TextEditingController();
  }

  @override
  void dispose() {
    _weekController.dispose();
    super.dispose();
  }

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

  void _toggleRiskFlag(String flag) {
    setState(() {
      final List<String> flags = _formData['riskFlags'] as List<String>;
      if (flags.contains(flag)) {
        flags.remove(flag);
      } else {
        flags.add(flag);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Main content
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                children: [
                  // Header with Logo
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
                    child: Column(
                      children: [
                        // Logo
                        Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFB6C1).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'MatriCare',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
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
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        final isActive = index + 1 == _step;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: isActive ? 48 : 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: isActive ? const Color(0xFFFFB6C1) : const Color(0xFFFFE8F0),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),
                  ),

                  // Step Content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: _buildStepContent(),
                  ),
                ],
              ),
            ),

            // Bottom Action Button
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: _isStepComplete() ? _handleNext : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isStepComplete() ? const Color(0xFFFFB6C1) : Colors.grey.withOpacity(0.3),
                    disabledBackgroundColor: Colors.grey.withOpacity(0.3),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _step == 3 ? 'Get Started' : 'Continue',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, size: 20),
                    ],
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
        return _buildStep1();
      case 2:
        return _buildStep2();
      case 3:
        return _buildStep3();
      default:
        return Container();
    }
  }

  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Let\'s get started',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Tell us a bit about yourself',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 32),

        // Name field
        const Text(
          'Your Name',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter your name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFFFB6C1), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          onChanged: (value) {
            setState(() {
              _formData['name'] = value;
            });
          },
        ),
        const SizedBox(height: 24),

        // Age field
        const Text(
          'Age',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Your age',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFFFB6C1), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          onChanged: (value) {
            setState(() {
              _formData['age'] = value;
            });
          },
        ),
        const SizedBox(height: 32),

        // Trimester selection
        const Text(
          'Which trimester are you in?',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        _buildTrimesterOption('1', 'First Trimester', 'Weeks 1-12'),
        const SizedBox(height: 12),
        _buildTrimesterOption('2', 'Second Trimester', 'Weeks 13-26'),
        const SizedBox(height: 12),
        _buildTrimesterOption('3', 'Third Trimester', 'Weeks 27-40'),
      ],
    );
  }

  Widget _buildTrimesterOption(String value, String title, String subtitle) {
    final isSelected = _formData['trimester'] == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _formData['trimester'] = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? const Color(0xFFFFB6C1) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? const Color(0xFFFFB6C1).withOpacity(0.05) : Colors.white,
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFFFFB6C1) : Colors.grey.shade400,
                  width: 2,
                ),
                color: isSelected ? const Color(0xFFFFB6C1) : Colors.white,
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(
                        Icons.circle,
                        size: 10,
                        color: Colors.white,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep2() {
    final riskFactors = [
      {'id': 'first', 'label': 'First pregnancy'},
      {'id': 'age', 'label': 'Age over 35'},
      {'id': 'diabetes', 'label': 'Gestational diabetes'},
      {'id': 'bp', 'label': 'High blood pressure'},
      {'id': 'multiple', 'label': 'Multiple pregnancy (twins/triplets)'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pregnancy details',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Help us personalize your experience',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 32),

        // Current pregnancy week
        const Text(
          'Current pregnancy week',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _weekController,
          keyboardType: TextInputType.number,
          maxLength: 2,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            hintText: 'e.g., 18',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFFFB6C1), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            counterText: '',
          ),
          onChanged: (value) {
            setState(() {
              _formData['week'] = value;
            });
          },
        ),
        const SizedBox(height: 6),
        Text(
          'If you\'re unsure, you can update this later',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 32),

        // Risk factors
        const Text(
          'Any risk factors? (optional)',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        ...riskFactors.map((risk) {
          final flags = _formData['riskFlags'] as List<String>;
          final isChecked = flags.contains(risk['id']);
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: () => _toggleRiskFlag(risk['id'] as String),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isChecked ? const Color(0xFFFFB6C1) : Colors.grey.shade400,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                        color: isChecked ? const Color(0xFFFFB6C1) : Colors.white,
                      ),
                      child: isChecked
                          ? const Icon(
                              Icons.check,
                              size: 14,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        risk['label'] as String,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildStep3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Privacy & consent',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Your data security is our priority',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 32),

        // Security features
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFFFE8F0),
            border: Border.all(color: const Color(0xFFFFB6C1).withOpacity(0.3)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFB6C1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.shield,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End-to-end encryption',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'All your health data is encrypted and stored securely',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFB6C1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.people,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You control access',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Choose who can view your data - only share what you\'re comfortable with',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Data usage description
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'MatriCare collects and processes your health data to provide personalized pregnancy monitoring and insights. Your data will be:',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              ...[ 
                '• Stored securely with medical-grade encryption',
                '• Never sold to third parties',
                '• Only accessible to your designated healthcare providers with your consent',
                '• Deletable at any time upon request',
              ].map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                        height: 1.4,
                      ),
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Consent checkbox
        GestureDetector(
          onTap: () {
            setState(() {
              _formData['consent'] = !(_formData['consent'] as bool);
            });
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: _formData['consent'] as bool 
                    ? const Color(0xFFFFB6C1) 
                    : Colors.grey.shade300,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _formData['consent'] as bool 
                          ? const Color(0xFFFFB6C1) 
                          : Colors.grey.shade400,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4),
                    color: _formData['consent'] as bool 
                        ? const Color(0xFFFFB6C1) 
                        : Colors.white,
                  ),
                  child: _formData['consent'] as bool
                      ? const Icon(
                          Icons.check,
                          size: 14,
                          color: Colors.white,
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'I understand and agree to the privacy policy and terms of service. I consent to the collection and processing of my health data as described above.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Disclaimer
        Text(
          'MatriCare is not a diagnostic tool and does not replace professional medical care',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
