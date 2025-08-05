import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_places_autocomplete_widgets/address_autocomplete_widgets.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prodev/core/extensions/extension.dart';
import 'package:prodev/core/styles/typography/text_styles.dart';
import 'package:prodev/core/utils/spacer.dart';
import 'package:prodev/core/widgets/app_text.dart';
import 'package:prodev/core/widgets/highlighted_text.dart';
import 'package:prodev/resources/colors.dart';

class AppTextField extends StatefulHookConsumerWidget {
  const AppTextField({
    super.key,
    this.label,
    this.style,
    this.hintStyle,
    this.labelColor,
    this.labelImage,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.autofocus = false,
    this.hintText,
    this.errorText,
    this.errorMaxLines,
    this.inputFormatters,
    this.minLines,
    this.maxLines = 1,
    this.enabled = true,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.suffixText,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.inputBorder,
    this.focusedBorder,
    this.onEditingCompleted,
    this.fillColor,
    this.textAlign = TextAlign.start,
    this.contentPadding,
    this.maxLength,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.autoSuggest = true,
    this.cursorColor,
    this.filled = true,
    this.onTap,
    this.validator,
    this.initialValue,
    this.onSaved,
    this.currency,
    this.isCurrencyField = false,
    this.readOnly = false,
    this.isPassword = false,
    this.isAddressSuggestions = false,
    this.onSuggestionClicked,
    this.isMandatory = false,
    this.infoText = "",
    this.countryCode = 'NG',
    this.isAddressSuggestionsWithNoValidation = false,
  });

  final String? label;
  final String? labelImage;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Color? labelColor;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final bool readOnly;
  final bool obscureText;
  final String? hintText;
  final String? countryCode;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? minLines;
  final int? errorMaxLines;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldSetter<String>? onSaved;
  final VoidCallback? onEditingCompleted;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? suffixText;
  final InputBorder? inputBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final TextAlign textAlign;
  final EdgeInsets? contentPadding;
  final int? maxLength;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final bool autoSuggest;
  final bool filled;
  final Color? cursorColor;
  final Function? onTap;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final String? currency;
  final bool isCurrencyField;
  final bool isPassword;
  final bool isAddressSuggestions;
  final Function(Place)? onSuggestionClicked;

  final bool isMandatory;
  final String infoText;
  final bool isAddressSuggestionsWithNoValidation;

  @override
  ConsumerState<AppTextField> createState() => _AppTextFieldState();

  factory AppTextField.tappable({
    required String label,
    required Function onTap,
    InputBorder? inputBorder,
    InputBorder? focusedBorder,
    Color? fillColor,
    bool? filled,
    Widget? suffixIcon,
    String? initialValue,
    TextEditingController? controller,
    String infoText = "",
    String? hintText,
    FormFieldValidator<String>? validator,
  }) {
    return AppTextField(
      label: label,
      onTap: onTap,
      initialValue: initialValue,
      controller: controller,
      hintText: hintText,
      enabled: false,
      focusedBorder: focusedBorder,
      inputBorder: inputBorder,
      fillColor: fillColor,
      filled: filled ?? true,
      infoText: infoText,
      validator: validator,
      suffixIconConstraints: const BoxConstraints.tightFor(height: 18),
      suffixIcon: Padding(
        padding: const EdgeInsets.only(left: 16, right: 10),
        child:
            suffixIcon == null
                ? Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 24,
                  color: AppColors.neutral600,
                )
                : suffixIcon,
      ),
    );
  }

  factory AppTextField.numeric({
    String? label,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
    String? hintText,
    int? maxLength,
    bool isMandatory = false,
    bool enabled = true,
    Function(String)? onChanged,
    String infoText = "",
  }) {
    return AppTextField(
      enabled: enabled,
      label: label,
      hintText: hintText,
      validator: validator,
      controller: controller,
      maxLength: maxLength,
      keyboardType: TextInputType.number,
      isMandatory: isMandatory,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
      onChanged: onChanged,
      infoText: infoText,
    );
  }

  factory AppTextField.amount({
    String? label,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
    String? hintText,
    FormFieldSetter<String>? onSaved,
    ValueChanged<String>? onChanged,
    String? currency,
    bool isMandatory = false,
    String infoText = "",
  }) {
    return AppTextField(
      label: label,
      hintText: hintText,
      validator: validator,
      controller: controller,
      keyboardType: TextInputType.number,
      onSaved: onSaved,
      onChanged: onChanged,
      currency: currency,
      isCurrencyField: true,
      isMandatory: isMandatory,
      infoText: infoText,
    );
  }

  factory AppTextField.password({
    String? label,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
    String? hintText,
    int? maxLength,
    String infoText = "",
    Widget? prefixIcon,
  }) {
    return AppTextField(
      label: label ?? "Password",
      hintText: hintText,
      validator: validator,
      controller: controller,
      maxLength: maxLength,
      isPassword: true,
      infoText: infoText,
      prefixIcon: prefixIcon,
    );
  }

  factory AppTextField.phoneNumber({
    String? initialValue,
    String? label,
    String? labelImage,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
    String? hintText,
    int? maxLength,
    GestureTapCallback? onCountryTapped,
    bool enabled = true,
    Widget? suffix,
    bool isMandatory = false,
    BoxConstraints? suffixIconConstraints,
    String infoText = "",
    String countryCode = 'NG',
  }) {
    return AppTextField(
      initialValue: initialValue,
      enabled: enabled,
      label: label ?? "Phone Number",
      hintText: hintText,
      labelImage: labelImage,
      validator: validator,
      controller: controller,
      maxLength: maxLength,
      isMandatory: isMandatory,
      keyboardType: TextInputType.phone,
      infoText: infoText,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: suffix,
      ),
      suffixIconConstraints:
          suffixIconConstraints ??
          const BoxConstraints.tightFor(height: 34, width: 34),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
    );
  }

  factory AppTextField.price({
    String? label,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
    String? hintText,
    int? maxLength,
    GestureTapCallback? onCountryTapped,
    InputBorder? inputBorder,
    InputBorder? focusedBorder,
    Color? fillColor,
    bool? filled,
    bool isMandatory = false,
    String? currency,
    String? initialValue,
    Function(String)? onChanged,
    Function()? onEditingCompleted,
    String infoText = "",
    bool? readOnly,
    bool showDropDown = true,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return AppTextField(
      label: label ?? "Price",
      hintText: hintText,
      readOnly: readOnly ?? false,
      onChanged: onChanged,
      initialValue: initialValue,
      validator: validator,
      controller: controller,
      maxLength: maxLength,
      focusedBorder: focusedBorder,
      inputBorder: inputBorder,
      fillColor: fillColor,
      filled: filled ?? true,
      isMandatory: isMandatory,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onEditingCompleted: onEditingCompleted,
      infoText: infoText,
      inputFormatters: inputFormatters ??
          [
            
          ],
      prefixIconConstraints: const BoxConstraints.tightFor(height: 18),
      prefixIcon: GestureDetector(
        onTap: onCountryTapped,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                currency ?? 'NGN',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.neutral600,
                  fontSize: 14,
                ),
              ),
              if (showDropDown) ...[
                const SizedBox(width: 8),
                const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: AppColors.neutral600,
                  size: 16,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  factory AppTextField.address({
    String? label,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
    String? hintText,
    int? maxLines,
    bool enabled = true,
    String infoText = "",
    Function(Place)? onSuggestionClicked,
    ValueChanged<String>? onChanged,
  }) {
    return AppTextField(
      label: label ?? "Address",
      hintText: hintText,
      validator: validator,
      controller: controller,
      isAddressSuggestions: true,
      maxLines: maxLines,
      enabled: enabled,
      infoText: infoText,
      onChanged: onChanged,
      onSuggestionClicked: onSuggestionClicked,
    );
  }
}

class _AppTextFieldState extends ConsumerState<AppTextField> {
  FocusNode? _focusNode;

  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());

  @override
  void initState() {
    super.initState();
    _effectiveFocusNode.addListener(_handleFocusChanged);
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_handleFocusChanged);
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final obscure = useState<bool>(false);
    final displayInfoText = useState<bool>(false);
    const borderRadius = 30.0;

    const focusedBorderColor = AppColors.primaryColor;
    const inputBorderColor = AppColors.primaryColor;
    const errorBorderColor = AppColors.error;

    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(color: errorBorderColor),
    );

    final inputBorder =
        widget.inputBorder ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: inputBorderColor, width: 0.5),
        );

    final focusedBorder =
        widget.focusedBorder ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: focusedBorderColor, width: 0.5),
        );

    final suffixIcon =
        widget.isPassword
            ? GestureDetector(
              onTap: () {
                obscure.value = !obscure.value;
              },
              child: Icon(
                obscure.value ? Icons.visibility : Icons.visibility_off,
                color: AppColors.neutral600,
              ),
            )
            : widget.suffixIcon;

    return GestureDetector(
      onTap: widget.onTap != null ? () => widget.onTap!() : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null && widget.label!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    if (widget.labelImage != null) ...[
                      SvgPicture.asset(widget.labelImage!),
                      const XMargin(4),
                    ],

                    Expanded(
                      child: HighlightedText(
                        FlutterI18n.translate(context, "${widget.label!}") +
                            "${widget.isMandatory ? "*** * ***" : ""}",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: _labelColor(context),
                          fontSize: 14.sp,
                          height: 20 / 14,
                          fontWeight: FontWeight.w500,
                        ),
                        highlightColor: AppColors.error,
                      ),
                    ),
                    const YMargin(10),
                    if (widget.infoText.isNotEmpty)
                      GestureDetector(
                        onTap: () {
                          displayInfoText.value = !displayInfoText.value;
                        },
                        child: const Icon(
                          Icons.info_outline,
                          color: Color(0xFFF29F05),
                          size: 17,
                        ),
                      ),
                  ],
                ),
              ),
            if (widget.infoText.isNotEmpty && displayInfoText.value)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  FlutterI18n.translate(context, widget.infoText),
                  style: AppTextStyles.bodySmall.copyWith(
                    color: const Color(0xFF3D3D3D),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            if (widget.isAddressSuggestionsWithNoValidation)
              AddressAutocompleteTextField(
                // Todo Barry add maps api key
                mapsApiKey: '',
                controller: widget.controller,
                debounceTime: 400,
                prepareQuery: (query) => query.toLowerCase(),
                //TODO (Barry): handle this when we expand to other countries
                componentCountry: 'ng',
                language: 'en-NG',
                onSuggestionClick: (place) {
                  widget.onSuggestionClicked?.call(place);
                  final addr = place.formattedAddress;

                  widget.controller?.text = addr ?? "";
                  widget.controller?.selection = TextSelection.fromPosition(
                    TextPosition(offset: addr?.length ?? 0),
                  );
                },
                maxLines: widget.maxLines,
                onChanged: widget.onChanged,
                style: widget.style ?? _foregroundTextStyle(context),
                textAlign: widget.textAlign,
                maxLength: widget.maxLength,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  fillColor: widget.fillColor ?? AppColors.white,
                  filled: widget.filled,
                  contentPadding:
                      widget.contentPadding ??
                      EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: widget.label != null ? 14 : 14,
                      ),
                  hintStyle: widget.hintStyle ?? _hintTextStyle(context),
                  border: inputBorder,
                  focusedBorder: focusedBorder,
                  disabledBorder: inputBorder,
                  enabledBorder: inputBorder,
                  prefix: widget.prefix,
                  prefixIcon: widget.prefixIcon,
                  prefixIconConstraints:
                      widget.prefixIconConstraints ??
                      const BoxConstraints(maxHeight: 20, maxWidth: 20),
                  suffix: _suffix(context),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        widget.controller?.clear();
                      },
                      child: const Icon(
                        Icons.cancel,
                        size: 16,
                        color: AppColors.neutral600,
                      ),
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    maxWidth: 30,
                    maxHeight: 30,
                  ),
                  hintText: FlutterI18n.translate(
                    context,
                    widget.hintText ?? widget.label ?? "",
                  ),
                  errorText: widget.errorText,
                  errorMaxLines: widget.errorMaxLines,
                  counter: const SizedBox.shrink(),
                  errorStyle: _foregroundTextStyle(context, isError: true),
                  errorBorder: errorBorder,
                ),
              )
            else if (widget.isAddressSuggestions)
              GooglePlacesAutoCompleteTextFormField(
                textEditingController: widget.controller,
                // Todo Barry add maps api key
                googleAPIKey: '',
                debounceTime: 400, // defaults to 600 ms
                countries: const ["ng"],
                fetchCoordinates: true,
                maxLines: widget.maxLines,
                enabled: widget.enabled,
                onChanged: widget.onChanged,
                onFieldSubmitted: widget.onSubmitted,
                onEditingComplete: widget.onEditingCompleted,
                validator: widget.validator,
                style: widget.style ?? _foregroundTextStyle(context),
                textAlign: widget.textAlign,
                maxLength: widget.maxLength,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                cursorColor: widget.cursorColor ?? AppColors.neutral600,
                overlayContainerBuilder: (c) {
                  return Material(
                    color: AppColors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: c,
                    ),
                  );
                },

                onPlaceDetailsWithCoordinatesReceived: (v) async {},
                onSuggestionClicked: (v) async {
                  widget.controller?.text = v.description ?? "";
                  widget.controller?.selection = TextSelection.fromPosition(
                    TextPosition(offset: v.description?.length ?? 0),
                  );

                  // widget.onSuggestionClicked?.call(place);
                },
                minInputLength: 3,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  fillColor: widget.fillColor ?? AppColors.transparent,
                  filled: widget.filled,
                  contentPadding:
                      widget.contentPadding ??
                      EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: widget.label != null ? 14 : 14,
                      ),
                  hintStyle: widget.hintStyle ?? _hintTextStyle(context),
                  border: inputBorder,
                  focusedBorder: focusedBorder,
                  disabledBorder: inputBorder,
                  enabledBorder: inputBorder,
                  prefix: widget.prefix,
                  prefixIcon: widget.prefixIcon,
                  prefixIconConstraints:
                      widget.prefixIconConstraints ??
                      const BoxConstraints(maxHeight: 20, maxWidth: 20),
                  suffix: _suffix(context),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        widget.controller?.clear();
                      },
                      child: const Icon(
                        Icons.cancel,
                        size: 16,
                        color: AppColors.neutral600,
                      ),
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    maxWidth: 30,
                    maxHeight: 30,
                  ),
                  hintText: FlutterI18n.translate(
                    context,
                    widget.hintText ?? widget.label ?? "",
                  ),
                  errorText: widget.errorText,
                  errorMaxLines: widget.errorMaxLines,
                  counter: const SizedBox.shrink(),
                  errorStyle: _foregroundTextStyle(context, isError: true),
                  errorBorder: errorBorder,
                ),
              )
            else
              TextFormField(
                onSaved: widget.onSaved,
                initialValue: widget.initialValue,
                enableIMEPersonalizedLearning: widget.autoSuggest,
                enableSuggestions: widget.autoSuggest,
                controller: widget.controller,
                focusNode: widget.focusNode ?? _effectiveFocusNode,
                keyboardType: widget.keyboardType,
                textCapitalization: widget.textCapitalization,
                textInputAction: widget.textInputAction,
                autofocus: widget.autofocus,
                readOnly: widget.readOnly,
                obscureText:
                    widget.isPassword ? !obscure.value : widget.obscureText,
                obscuringCharacter: '*',
                inputFormatters: widget.inputFormatters,
                autocorrect: false,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                enabled: widget.enabled,
                onChanged: widget.onChanged,
                onFieldSubmitted: widget.onSubmitted,
                onEditingComplete: widget.onEditingCompleted,
                validator: widget.validator,
                style: widget.style ?? _foregroundTextStyle(context),
                textAlign: widget.textAlign,
                maxLength: widget.maxLength,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                cursorColor: widget.cursorColor ?? AppColors.neutral600,
                onTapOutside: (event) {
                  // dismissKeyboard();
                },
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  fillColor: widget.fillColor ?? AppColors.transparent,
                  filled: widget.filled,
                  contentPadding:
                      widget.contentPadding ??
                      EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: widget.label != null ? 14 : 14,
                      ),
                  hintStyle: widget.hintStyle ?? _hintTextStyle(context),
                  border: inputBorder,
                  focusedBorder: focusedBorder,
                  disabledBorder: inputBorder,
                  enabledBorder: inputBorder,
                  prefix: widget.prefix,
                  prefixIcon: widget.prefixIcon?.paddingOnly(left: 8),
                  prefixIconConstraints:
                      widget.prefixIconConstraints ??
                      const BoxConstraints(maxHeight: 30, maxWidth: 30),
                  suffix: _suffix(context),
                  suffixIcon: suffixIcon,
                  suffixIconConstraints: widget.suffixIconConstraints,
                  hintText: FlutterI18n.translate(
                    context,
                    widget.hintText ?? widget.label ?? "",
                  ),
                  errorText: widget.errorText,
                  errorMaxLines: widget.errorMaxLines,
                  counter: const SizedBox.shrink(),
                  errorStyle: _foregroundTextStyle(context, isError: true),
                  errorBorder: errorBorder,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _handleFocusChanged() {
    // ignore: no-empty-block
    setState(() {});
  }

  TextStyle _foregroundTextStyle(BuildContext context, {bool isError = false}) {
    return AppTextStyles.bodySmall.copyWith(
      color: isError ? AppColors.error : AppColors.neutral600,
      fontSize: 14,
      height: 0.8,
    );
  }

  TextStyle _hintTextStyle(BuildContext context) {
    return AppTextStyles.bodySmall.copyWith(
      color: AppColors.customColor3,
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
    );
  }

  Color _labelColor(BuildContext context) {
    final labelColor = widget.labelColor ?? AppColors.grey;

    return (widget.errorText ?? '').isNotEmpty ? AppColors.error : labelColor;
  }

  Widget? _suffix(BuildContext context) {
    if (widget.suffixText != null) {
      return Text(widget.suffixText!, style: _foregroundTextStyle(context));
    }

    return widget.suffix;
  }
}
