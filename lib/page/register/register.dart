import 'package:buoi_04/data/model/demo/user.dart';
import 'package:buoi_04/data/model/product_viewmodel.dart';
import 'package:buoi_04/test/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({
    super.key,
  });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool showPass = false;
  bool showConfirm = false;
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirm = TextEditingController();
  List<TextEditingController> lstController = [];
  late Map<String, bool> selectedOptions;
  String? selectedValue = "Male";

  @override
  void initState() {
    super.initState();
    lstController.addAll([fullname, email, pass, confirm]);
    selectedOptions = {for (var option in favourite) option: false};
  }

  @override
  void dispose() {
    for (var controller in lstController) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            // Giúp các widget căn giữa theo chiều ngang
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Information',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.blue.shade600,
                ),
              ),
              const SizedBox(height: 20),
              // Hiển thị các input field bằng Column (không dùng ListView vì đã nằm trong SingleChildScrollView)
              Column(
                children: inputField.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> field = entry.value;
                  return _inputFieldSample(
                    hintText: field['hintText'],
                    icon: field['icon'],
                    textType: field['textType'],
                    controller: lstController[index],
                    iconShowPassword: field['iconShowPassword'],
                    iconHidePassword: field['iconHidePassword'],
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              // Phần lựa chọn giới tính
              const Text(
                "What's your Gender",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              _selectGender(),
              const SizedBox(height: 20),
              // Phần checkbox cho favourite - dùng Column để tránh lỗi layout
              const Text(
                "Select your favourite options:",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 29, // khoảng cách ngang giữa các checkbox
                runSpacing: 5, // khoảng cách dọc giữa các hàng nếu tràn
                children: favourite.map((option) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: selectedOptions[option],
                        onChanged: (bool? newValue) {
                          setState(() {
                            selectedOptions[option] = newValue ?? false;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      Text(option),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              // Ví dụ nút Submit
              Consumer<ProductsVM>(
                builder: (context, value, child) => ElevatedButton(
                  onPressed: () {
                    // Xử lý khi nhấn nút Submit
                    List<String> favs = selectedOptions.entries
                        .where((element) => element.value)
                        .map((e) => e.key)
                        .toList();
                    User user = User(
                        fullname: fullname.text,
                        email: email.text,
                        gender: selectedValue,
                        favourite: favs.toString());
                    value.submit(user);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Thông báo"),
                          content: const Text("Đăng ký thành công."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Đóng dialog
                              },
                              child: const Text("Đóng"),
                            ),
                          ],
                        );
                      },
                    );

                    print(user.fullname);
                    setState(() {});
                    // print("Fullname: ${fullname.text}");
                    // print("Email: ${email.text}");
                    // print('Gender: $selectedValue ');
                    // print("Favourite: $favs");
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Widget lựa chọn giới tính
  Row _selectGender() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: RadioListTile<String>(
            value: "Male",
            contentPadding: EdgeInsets.zero,
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            title: Text(
              gender[0],
              style: const TextStyle(fontSize: 13),
            ),
            activeColor: Colors.blue,
          ),
        ),
        Expanded(
          child: RadioListTile<String>(
            value: "Female",
            contentPadding: EdgeInsets.zero,
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            title: Text(
              gender[1],
              style: const TextStyle(fontSize: 13),
            ),
            activeColor: Colors.blue,
          ),
        ),
        Expanded(
          child: RadioListTile<String>(
            value: "Other",
            contentPadding: EdgeInsets.zero,
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            title: Text(
              gender[2],
              style: const TextStyle(fontSize: 13),
            ),
            activeColor: Colors.blue,
          ),
        ),
      ],
    );
  }

  /// Widget tạo một input field mẫu
  Widget _inputFieldSample({
    required String hintText,
    required IconData icon,
    required TextInputType textType,
    required TextEditingController controller,
    IconData? iconShowPassword,
    IconData? iconHidePassword,
  }) {
    bool isPasswordField = hintText.toLowerCase().contains("password");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        controller: controller,
        keyboardType: textType,
        cursorColor: Colors.blue.shade500,
        style: const TextStyle(fontSize: 15),
        obscureText: isPasswordField
            ? (hintText == 'Password' ? !showPass : !showConfirm)
            : false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.grey.shade600,
          ),
          suffixIcon: isPasswordField
              ? InkWell(
                  child: Icon(
                    hintText == 'Password'
                        ? (showPass
                            ? iconShowPassword ?? Icons.visibility
                            : iconHidePassword ?? Icons.visibility_off)
                        : (showConfirm
                            ? iconShowPassword ?? Icons.visibility
                            : iconHidePassword ?? Icons.visibility_off),
                  ),
                  onTap: () {
                    setState(() {
                      if (hintText == 'Password') {
                        showPass = !showPass;
                      } else {
                        showConfirm = !showConfirm;
                      }
                    });
                  },
                )
              : null,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green.shade100,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade50,
              //
            ),
          ),
          fillColor: Colors.grey.shade50,
          filled: true,
        ),
      ),
    );
  }
}
