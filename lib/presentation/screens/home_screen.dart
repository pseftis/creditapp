import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<_WorkflowStep> _workflow = [
    _WorkflowStep('Learn', Icons.school_outlined),
    _WorkflowStep('Assess', Icons.fact_check_outlined),
    _WorkflowStep('Prepare', Icons.folder_copy_outlined),
    _WorkflowStep('Verify', Icons.verified_user_outlined),
    _WorkflowStep('Generate', Icons.description_outlined),
    _WorkflowStep('Review', Icons.rate_review_outlined),
    _WorkflowStep('Submit', Icons.rocket_launch_outlined),
  ];

  static const List<_Metric> _metrics = [
    _Metric('IPO readiness', '76/100', 'Preparation Phase', AppTheme.warningColor),
    _Metric('Documents collected', '23/31', '8 pending', AppTheme.primaryColor),
    _Metric('Trust score', '92%', 'Low fraud risk', AppTheme.successColor),
  ];

  static const List<_Module> _modules = [
    _Module(
      'IPO Learning Hub',
      'Interactive roadmap, eligibility guidance, flowcharts, videos, and FAQs for first-time SME promoters.',
      Icons.menu_book_outlined,
    ),
    _Module(
      'Gamified Readiness Assessment',
      'AI-led questions score operations, financials, board structure, shareholding, and disputes from 0-100.',
      Icons.emoji_events_outlined,
    ),
    _Module(
      'AI IPO Assistant',
      'Conversational intake turns promoter answers into offer-document-ready regulatory language.',
      Icons.smart_toy_outlined,
    ),
    _Module(
      'Smart Document Collection',
      'Drag-and-drop uploads, auto-categorization, cloud storage, and missing document alerts.',
      Icons.cloud_upload_outlined,
    ),
    _Module(
      'Document Intelligence Engine',
      'OCR, NLP, and parsing extract revenue, profits, directors, shareholding, litigation, and office details.',
      Icons.document_scanner_outlined,
    ),
    _Module(
      'Compliance Gap Analyzer',
      'Green, yellow, and red status checks surface missing disclosures before merchant banker filing review.',
      Icons.rule_folder_outlined,
    ),
    _Module(
      'Trust Engine',
      'Detects edited PDFs, modified signatures, fake certificates, AI-generated narratives, and data inconsistencies.',
      Icons.shield_outlined,
    ),
    _Module(
      'Automated Prospectus Generator',
      'Generates editable draft sections for business, risks, financials, capital structure, objects, and litigation.',
      Icons.auto_awesome_outlined,
    ),
    _Module(
      'Merchant Banker Review Portal',
      'Professionals comment, approve sections, request corrections, and digitally sign off with full oversight.',
      Icons.groups_outlined,
    ),
    _Module(
      'Audit Trail & Explainable AI',
      'Every generated statement includes source document, confidence score, and producing AI engine.',
      Icons.manage_search_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHero(context),
              const SizedBox(height: 24),
              _buildWorkflow(context),
              const SizedBox(height: 24),
              _buildMetrics(context),
              const SizedBox(height: 24),
              _buildComplianceSnapshot(context),
              const SizedBox(height: 24),
              _buildModuleGrid(context),
              const SizedBox(height: 24),
              _buildImpactPanel(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF123C69), Color(0xFF0A0A0A)],
        ),
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Chip(
            label: Text('IPO Mentor AI + Trust Engine'),
            avatar: Icon(Icons.workspace_premium_outlined, size: 18),
          ),
          const SizedBox(height: 18),
          Text(
            'Guide SMEs from IPO awareness to regulator-ready draft prospectus.',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          Text(
            'An AI-powered ecosystem for learning, readiness scoring, document intelligence, fraud detection, compliance automation, and expert merchant banker review.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppTheme.textSecondary, height: 1.5),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              _Pill('SME IPO education'),
              _Pill('Compliance automation'),
              _Pill('Fraud detection'),
              _Pill('Explainable AI'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWorkflow(BuildContext context) {
    return _SectionCard(
      title: 'Guided IPO Workflow',
      subtitle: 'Learn → Assess → Prepare → Verify → Generate → Review → Submit',
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: _workflow.map((step) => _WorkflowChip(step: step)).toList(),
      ),
    );
  }

  Widget _buildMetrics(BuildContext context) {
    return Column(
      children: _metrics.map((metric) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: _MetricCard(metric: metric),
      )).toList(),
    );
  }

  Widget _buildComplianceSnapshot(BuildContext context) {
    return _SectionCard(
      title: 'Compliance Gap Analyzer',
      subtitle: 'Live issue status before filing review.',
      child: Column(
        children: const [
          _StatusRow(label: 'Financial information', status: 'Complete', color: AppTheme.successColor),
          _StatusRow(label: 'Promoter & shareholding details', status: 'Review needed', color: AppTheme.warningColor),
          _StatusRow(label: 'Litigation disclosures', status: 'Missing requirement', color: AppTheme.errorColor),
        ],
      ),
    );
  }

  Widget _buildModuleGrid(BuildContext context) {
    return _SectionCard(
      title: 'Platform Modules',
      subtitle: 'One connected workspace for promoters, AI systems, and professionals.',
      child: Column(
        children: _modules.map((module) => _ModuleTile(module: module)).toList(),
      ),
    );
  }

  Widget _buildImpactPanel(BuildContext context) {
    return _SectionCard(
      title: 'Expected Impact',
      subtitle: 'Designed to reduce IPO preparation friction while preserving regulatory trust.',
      child: const Column(
        children: [
          _ImpactRow(value: '< 1 week', label: 'Offer document preparation time'),
          _ImpactRow(value: '70%', label: 'Documentation effort reduction'),
          _ImpactRow(value: '80%', label: 'Compliance error reduction'),
          _ImpactRow(value: '60%', label: 'Professional review workload reduction'),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.subtitle, required this.child});
  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(subtitle, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary)),
        const SizedBox(height: 16),
        child,
      ]),
    );
  }
}

class _WorkflowChip extends StatelessWidget {
  const _WorkflowChip({required this.step});
  final _WorkflowStep step;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(step.icon, size: 18, color: AppTheme.primaryColor),
      label: Text(step.label),
      backgroundColor: AppTheme.backgroundColor,
      side: BorderSide(color: AppTheme.primaryColor.withOpacity(0.25)),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.metric});
  final _Metric metric;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
        border: Border(left: BorderSide(color: metric.color, width: 4)),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(metric.label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary)),
          const SizedBox(height: 8),
          Text(metric.value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        ])),
        Text(metric.detail, style: TextStyle(color: metric.color, fontWeight: FontWeight.w700)),
      ]),
    );
  }
}

class _ModuleTile extends StatelessWidget {
  const _ModuleTile({required this.module});
  final _Module module;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CircleAvatar(backgroundColor: AppTheme.primaryColor.withOpacity(0.14), child: Icon(module.icon, color: AppTheme.primaryColor)),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(module.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(module.description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary, height: 1.4)),
        ])),
      ]),
    );
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({required this.label, required this.status, required this.color});
  final String label;
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(children: [
        Icon(Icons.circle, color: color, size: 12),
        const SizedBox(width: 10),
        Expanded(child: Text(label)),
        Text(status, style: TextStyle(color: color, fontWeight: FontWeight.w700)),
      ]),
    );
  }
}

class _ImpactRow extends StatelessWidget {
  const _ImpactRow({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(children: [
        SizedBox(width: 92, child: Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppTheme.successColor, fontWeight: FontWeight.bold))),
        Expanded(child: Text(label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary))),
      ]),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}

class _WorkflowStep {
  const _WorkflowStep(this.label, this.icon);
  final String label;
  final IconData icon;
}

class _Metric {
  const _Metric(this.label, this.value, this.detail, this.color);
  final String label;
  final String value;
  final String detail;
  final Color color;
}

class _Module {
  const _Module(this.title, this.description, this.icon);
  final String title;
  final String description;
  final IconData icon;
}
