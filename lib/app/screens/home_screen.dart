import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import 'onboarding_screen_complete.dart';
import 'home_dashboard_complete.dart';
import 'alerts_screen_complete_v2.dart';
import 'ai_assistant_complete.dart';
import 'daily_health_screen_complete.dart';
import 'reports_screen_complete_v2.dart';
import 'fetal_health_screen_complete_v2.dart';
import 'more_screen_complete_v2.dart';
import 'partner_access_screen.dart';
import 'emergency_screen.dart';
import 'privacy_security_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        if (!appState.hasCompletedOnboarding) {
          return OnboardingScreenComplete(
            onComplete: (name, week) {
              appState.completeOnboarding(name, week);
            },
          );
        }
        
        // Show AI Assistant if toggled
        if (appState.showAssistant) {
          return Scaffold(
            body: Stack(
              children: [
                const AIAssistantComplete(),
                Positioned(
                  top: 48,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => appState.toggleAssistant(),
                  ),
                ),
              ],
            ),
          );
        }

        // Handle sub-screens
        if (appState.activeScreen != null) {
          return _buildSubScreen(context, appState.activeScreen!);
        }

        return Scaffold(
          body: Stack(
            children: [
              _buildMainContent(context, appState),
              
              // Bottom Navigation
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.only(bottom: 20, top: 8, left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavItem(context, Icons.home, 'Home', 'home', appState),
                      _buildNavItem(context, Icons.notifications, 'Alerts', 'alerts', appState),
                      _buildNavItem(context, Icons.favorite, 'Fetal Health', 'fetal', appState),
                      _buildNavItem(context, Icons.description, 'Reports', 'reports', appState),
                      _buildNavItem(context, Icons.more_horiz, 'More', 'more', appState),
                    ],
                  ),
                ),
              ),
              
              // Floating AI Assistant Button
              Positioned(
                right: 24,
                bottom: 100,
                child: FloatingActionButton(
                  onPressed: () {
                    appState.toggleAssistant();
                  },
                  backgroundColor: const Color(0xFFFFB6C1),
                  child: const Icon(Icons.chat, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMainContent(BuildContext context, AppState appState) {
    switch (appState.activeTab) {
      case 'home':
        return HomeDashboardComplete(
          userName: appState.userName,
          pregnancyWeek: appState.pregnancyWeek,
          onNavigate: () => appState.setActiveScreen('daily'),
        );
      case 'alerts':
        return const AlertsScreenCompleteV2();
      case 'fetal':
        return const FetalHealthScreenCompleteV2();
      case 'reports':
        return const ReportsScreenCompleteV2();
      case 'more':
        return MoreScreenCompleteV2(userName: appState.userName);
      default:
        return HomeDashboardComplete(
          userName: appState.userName,
          pregnancyWeek: appState.pregnancyWeek,
          onNavigate: () => appState.setActiveScreen('daily'),
        );
    }
  }

  Widget _buildSubScreen(BuildContext context, String screen) {
    final appState = Provider.of<AppState>(context, listen: false);
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => appState.setActiveScreen(null),
        ),
        title: Text(_getScreenTitle(screen)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: _getScreenWidget(screen),
    );
  }

  String _getScreenTitle(String screen) {
    switch (screen) {
      case 'vitals':
      case 'daily':
        return 'Daily Health';
      case 'partner':
        return 'Partner Access';
      case 'emergency':
        return 'Emergency Contacts';
      case 'privacy':
        return 'Privacy & Security';
      case 'settings':
        return 'Settings';
      default:
        return '';
    }
  }

  Widget _getScreenWidget(String screen) {
    switch (screen) {
      case 'vitals':
      case 'daily':
        return const DailyHealthScreenComplete();
      case 'partner':
        return const PartnerAccessScreen();
      case 'emergency':
        return const EmergencyScreen();
      case 'privacy':
        return const PrivacySecurityScreen();
      case 'settings':
        return const SettingsScreen();
      default:
        return const Center(child: Text('Screen not found'));
    }
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, String tabId, AppState appState) {
    final isActive = appState.activeTab == tabId;
    
    return GestureDetector(
      onTap: () => appState.setActiveTab(tabId),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFFFE8F0) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? const Color(0xFFFFB6C1) : Colors.grey,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: isActive ? const Color(0xFFFFB6C1) : Colors.grey,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
