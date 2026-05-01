// lib/atoms/app_button.dart
import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

enum ButtonVariant { primary, secondary, outline, text, icon }

class AppButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final IconData? icon;
  final bool isLoading;
  final double? width;
  final double height;
  final double borderRadius;
  final Color? color;

  const AppButton({
    super.key,
    this.label,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.icon,
    this.isLoading = false,
    this.width,
    this.height = 44,
    this.borderRadius = 12,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case ButtonVariant.primary:
        return _buildPrimary();
      case ButtonVariant.secondary:
        return _buildSecondary();
      case ButtonVariant.outline:
        return _buildOutline();
      case ButtonVariant.text:
        return _buildText();
      case ButtonVariant.icon:
        return _buildIcon();
    }
  }

  Widget _buildPrimary() {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 18),
                    const SizedBox(width: 6),
                  ],
                  if (label != null)
                    Text(
                      label!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
      ),
    );
  }

  Widget _buildSecondary() {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenLight,
          foregroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: label != null
            ? Text(label!, style: const TextStyle(fontWeight: FontWeight.w600))
            : null,
      ),
    );
  }

  Widget _buildOutline() {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: color ?? AppColors.primary,
          side: BorderSide(color: color ?? AppColors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: label != null
            ? Text(label!, style: const TextStyle(fontWeight: FontWeight.w600))
            : null,
      ),
    );
  }

  Widget _buildText() {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label ?? '',
        style: TextStyle(
          color: color ?? AppColors.primary,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: height,
        height: height,
        decoration: BoxDecoration(
          color: color?.withOpacity(0.1) ?? AppColors.greenLight,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Icon(
          icon,
          color: color ?? AppColors.primary,
          size: 20,
        ),
      ),
    );
  }
}
