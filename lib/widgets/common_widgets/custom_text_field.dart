import 'package:base_project_flutter/export.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String hintText;
  final TextEditingController controller;
  final bool isRequired;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final List<String>? dropDownList;
  final String? selectedItem;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool obscureText;

  const CustomTextField({
    required this.title,
    required this.hintText,
    required this.controller,
    required this.isRequired,
    this.validator,
    this.textInputType,
    this.inputFormatters,
    this.onChanged,
    this.textInputAction,
    this.dropDownList,
    this.selectedItem,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.obscureText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          RichText(
            text: TextSpan(
              text: title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    height: 18.64 / 16.0, // lineHeight in Flutter is height = lineHeight / fontSize
                  ),
              children: isRequired
                  ? [const TextSpan(text: '*', style: TextStyle(color: ColorConst.kRedColor, fontSize: 15))]
                  : [],
            ),
          ),
        gap8,
        Row(
          children: [
            if (dropDownList != null && selectedItem != null)
              DropdownButton<String>(
                value: selectedItem,
                items: dropDownList!.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Handle dropdown change
                },
              ),
            Expanded(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  contentPadding: const EdgeInsets.all(0),
                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorConst.kGray200Color),
                ),
                keyboardType: textInputType,
                inputFormatters: inputFormatters,
                validator: isRequired
                    ? (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        if (validator != null) {
                          return validator!(value);
                        }
                        return null;
                      }
                    : validator,
                onChanged: onChanged,
                textInputAction: textInputAction,
                readOnly: readOnly,
                obscureText: obscureText,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class StyledDropdownButton extends StatefulWidget {
  const StyledDropdownButton({
    super.key,
    required this.dropDownList,
    required this.selectedItem,
    this.dropdownWidth = 85,
    this.isOnlyDropDown = false,
  });

  final List<String> dropDownList;
  final String selectedItem;
  final double? dropdownWidth;
  final bool isOnlyDropDown;

  @override
  State<StyledDropdownButton> createState() => _StyledDropdownButtonState();
}

class _StyledDropdownButtonState extends State<StyledDropdownButton> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: widget.dropdownWidth,
          height: 48,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey[400]!), // Adjust color to match TextField border
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              items: widget.dropDownList.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: CustomText(text: value, style: Theme.of(context).textTheme.bodyLarge),
                );
              }).toList(),
              onChanged: (String? newValue) => setState(() => dropdownValue = newValue!),
              isExpanded: true,
              dropdownColor: Colors.white,
            ),
          ),
        ),
        if (!widget.isOnlyDropDown) gap8,
      ],
    );
  }
}

class PinInputField extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onChanged;

  const PinInputField({
    super.key,
    required this.length,
    this.onChanged,
  });

  @override
  State<PinInputField> createState() => _PinInputFieldState();
}

class _PinInputFieldState extends State<PinInputField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );

    for (int i = 0; i < widget.length; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.isNotEmpty && i < widget.length - 1) {
          FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.length,
        (index) => SizedBox(
          width: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: TextFormField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              maxLength: 1,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                counterText: '', // Hide character count
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                if (widget.onChanged != null) {
                  widget.onChanged!(_getPin());
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  String _getPin() {
    String pin = '';
    for (var controller in _controllers) {
      pin += controller.text;
    }
    return pin;
  }
}
