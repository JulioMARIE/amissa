import 'package:flutter/material.dart';
import 'package:missa/ui/data_layer/widgets/components/custom_text_field.dart';

var accentColor = const Color.fromARGB(255, 7, 153, 197);

var textEditing = (Size size, TextEditingController controller, String hintText,isObscured,validator,
        [hintTextStyleColor = Colors.white]) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Opacity(
        opacity: 0.9,
        child: Container(
          width: size.width,
          height: size.width > 500.0 ? size.height * 0.15 : size.height * 0.065,
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            children: [
              Expanded(
                  child: CustomTextField(
                    obscureText: isObscured != true ?false: true,
                onSaved: (str) {},
                onChanged: (str) {
                  
                },
                // ignore: prefer_if_null_operators
                validator: validator != null ? validator : (str) {
                  return null;
                },
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    alignLabelWithHint: true,
                    hintStyle: TextStyle(
                        color: hintTextStyleColor, fontWeight: FontWeight.w600),
                    contentPadding:
                        const EdgeInsets.only(left: 20.0, top: 10.0)),
              )),
            ],
          ),
        ),
      ),
    );

var btn = (Size size, String text, onPress) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Opacity(
        opacity: 0.9,
        child: ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size(size.width * 0.4,
                size.width > 500.0 ? size.height * 0.14 : size.height * 0.07)),
            elevation: MaterialStateProperty.all(4.0),
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          onPressed: onPress(),
          child: Container(
            alignment: Alignment.center,
            height: 50.0,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
          ),
        ),
      ),
    );
