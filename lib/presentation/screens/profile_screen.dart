import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';
import '../providers/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final user = userProvider.user;
    final dateFormat = DateFormat('MMM yyyy');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: userProvider.isLoading || user == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                children: [
                  // Profile Header
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppTheme.cardColor,
                      borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: AppTheme.primaryColor,
                          child: Text(
                            user.name[0].toUpperCase(),
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          user.name,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          user.email,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppTheme.textSecondary,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Account Information
                  _buildSection(
                    context,
                    'Account Information',
                    [
                      _buildInfoTile(
                        context,
                        'Phone Number',
                        user.phoneNumber,
                        Icons.phone,
                      ),
                      _buildInfoTile(
                        context,
                        'Member Since',
                        dateFormat.format(user.memberSince),
                        Icons.calendar_today,
                      ),
                      _buildInfoTile(
                        context,
                        'Total Rewards Points',
                        '${user.totalRewardsPoints}',
                        Icons.stars,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Settings
                  _buildSection(
                    context,
                    'Settings',
                    [
                      _buildActionTile(
                        context,
                        'Notifications',
                        Icons.notifications,
                        () {},
                      ),
                      _buildActionTile(
                        context,
                        'Privacy',
                        Icons.privacy_tip,
                        () {},
                      ),
                      _buildActionTile(
                        context,
                        'About',
                        Icons.info,
                        () {},
                      ),
                      _buildActionTile(
                        context,
                        'Logout',
                        Icons.logout,
                        () {
                          // Handle logout
                        },
                        isDestructive: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.cardColor,
            borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildInfoTile(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primaryColor),
      title: Text(label),
      subtitle: Text(
        value,
        style: const TextStyle(
          color: AppTheme.textPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildActionTile(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive ? AppTheme.errorColor : AppTheme.primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive ? AppTheme.errorColor : AppTheme.textPrimary,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

