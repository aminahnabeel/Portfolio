import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';

class CtaSection extends StatefulWidget {
  const CtaSection({super.key});

  @override
  State<CtaSection> createState() => _CtaSectionState();
}

class _CtaSectionState extends State<CtaSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSending = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _showSuccessSnackbar() {
    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars();
    messenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF18121F),
                AppColors.purple.withValues(alpha: 0.88),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
            boxShadow: [
              BoxShadow(
                color: AppColors.purple.withValues(alpha: 0.24),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Message sent',
                      style: GoogleFonts.kanit(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Thanks for reaching out. I will get back to you soon.',
                      style: GoogleFonts.kanit(
                        color: Colors.white.withValues(alpha: 0.78),
                        fontSize: 13,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendEmail() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSending = true;
    });

    try {
      final response = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: const {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'service_id': 'service_1ue6pes',
          'template_id': 'template_8mqtzwk',
          'user_id': 'f4nc99a08Gz86Zeol',
          'template_params': {
            'name': _nameController.text.trim(),
            'email': _emailController.text.trim(),
            'message': _messageController.text.trim(),
          },
        }),
      );

      if (!mounted) {
        return;
      }

      if (response.statusCode == 200) {
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();

        _showSuccessSnackbar();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to send message'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (_) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to send message'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSending = false;
        });
      }
    }
  }

  InputDecoration _inputDecoration({
    required String label,
    required String hint,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: GoogleFonts.kanit(color: AppColors.textSecondary),
      hintStyle: GoogleFonts.kanit(color: AppColors.textSecondary),
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.06),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.10)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.orange, width: 1.4),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1024;
    final horizontalPadding = isDesktop ? 64.0 : 20.0;
    final cardMaxWidth = isDesktop ? 920.0 : 760.0;

    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 48,
            left: isDesktop ? 100 : -30,
            child: IgnorePointer(
              child: Container(
                width: isDesktop ? 240 : 160,
                height: isDesktop ? 240 : 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.purple.withValues(alpha: 0.24),
                      AppColors.purple.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: isDesktop ? 120 : -20,
            child: IgnorePointer(
              child: Container(
                width: isDesktop ? 280 : 180,
                height: isDesktop ? 280 : 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.orange.withValues(alpha: 0.20),
                      AppColors.orange.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 68,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: cardMaxWidth),
                child: GlassCard(
                  borderRadius: 34,
                  padding: EdgeInsets.symmetric(
                    vertical: isDesktop ? 42 : 32,
                    horizontal: isDesktop ? 52 : 22,
                  ),
                  child: Column(
                    children: [
                      Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withValues(alpha: 0.14),
                                  Colors.white.withValues(alpha: 0.05),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(999),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.12),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    gradient: AppColors.accentGradient,
                                    borderRadius: BorderRadius.circular(14),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.orange.withValues(
                                          alpha: 0.28,
                                        ),
                                        blurRadius: 20,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.send_rounded,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'Contact Me',
                                  style: GoogleFonts.kanit(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                          .animate()
                          .fadeIn(duration: 500.ms)
                          .scale(begin: const Offset(0.9, 0.9)),
                      const SizedBox(height: 24),
                      ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) => AppColors
                                .horizontalGradient
                                .createShader(bounds),
                            child: Text(
                              "Let's Build Something\nBeautiful",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.kanit(
                                fontSize: isDesktop ? 42 : 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 1.08,
                                letterSpacing: -0.6,
                              ),
                            ),
                          )
                          .animate()
                          .fadeIn(delay: 150.ms, duration: 600.ms)
                          .slideY(begin: 0.2),
                      const SizedBox(height: 14),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 560),
                        child: Text(
                          'Tell me what you are building, what you need, and the kind of experience you want to create.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kanit(
                            fontSize: 15,
                            color: AppColors.textSecondary,
                            height: 1.65,
                          ),
                        ),
                      ).animate().fadeIn(delay: 300.ms, duration: 600.ms),
                      const SizedBox(height: 32),
                      ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 680),
                            child: Container(
                              padding: EdgeInsets.all(isDesktop ? 24 : 18),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.035),
                                borderRadius: BorderRadius.circular(28),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.08),
                                ),
                              ),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: _nameController,
                                      style: GoogleFonts.kanit(
                                        color: Colors.white,
                                      ),
                                      decoration: _inputDecoration(
                                        label: 'Name',
                                        hint: 'Enter your full name',
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Name is required';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      style: GoogleFonts.kanit(
                                        color: Colors.white,
                                      ),
                                      decoration: _inputDecoration(
                                        label: 'Email',
                                        hint: 'Enter your email address',
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Email is required';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      controller: _messageController,
                                      maxLines: 5,
                                      style: GoogleFonts.kanit(
                                        color: Colors.white,
                                      ),
                                      decoration: _inputDecoration(
                                        label: 'Message',
                                        hint: 'Tell me about your project',
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Message is required';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 22),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: _isSending
                                            ? null
                                            : sendEmail,
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 18,
                                          ),
                                          backgroundColor: AppColors.orange,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          textStyle: GoogleFonts.kanit(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        child: _isSending
                                            ? const SizedBox(
                                                width: 22,
                                                height: 22,
                                                child:
                                                    CircularProgressIndicator(
                                                      strokeWidth: 2.2,
                                                      color: Colors.white,
                                                    ),
                                              )
                                            : const Text('Send Message'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .animate()
                          .fadeIn(delay: 450.ms, duration: 600.ms)
                          .slideY(begin: 0.2),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
