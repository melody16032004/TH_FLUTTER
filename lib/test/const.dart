import 'package:flutter/material.dart';

const urlAssets = 'assets/images/';
const url_img =
    'https://scr.vn/wp-content/uploads/2020/07/Avt-Anime-c%C3%B4-g%C3%A1i-cute-1024x1024.jpg';

List<Map<String, dynamic>> drawerItem = [
  {"icon": Icons.home_rounded, "title": "Home"},
  {"icon": Icons.contact_emergency_rounded, "title": "Contact"},
  {"icon": Icons.person_pin_rounded, "title": "Info"},
  {"icon": Icons.app_registration_rounded, "title": "Register"},
  {"icon": Icons.logout_rounded, "title": "Logout"},
];

List<Map<String, dynamic>> inputField = [
  {
    "hintText": 'Fullname',
    "icon": Icons.person,
    "textType": TextInputType.name,
    "iconShowPassword": null,
    "iconHidePassword": null
  },
  {
    "hintText": 'Email',
    "icon": Icons.email_rounded,
    "textType": TextInputType.emailAddress,
    "iconShowPassword": null,
    "iconHidePassword": null
  },
  {
    "hintText": 'Password',
    "icon": Icons.lock_rounded,
    "textType": TextInputType.visiblePassword,
    "iconShowPassword": Icons.check_box,
    "iconHidePassword": Icons.check_box_outline_blank_rounded
  },
  {
    "hintText": 'Confirm Password',
    "icon": Icons.lock_rounded,
    "textType": TextInputType.visiblePassword,
    "iconShowPassword": Icons.check_box,
    "iconHidePassword": Icons.check_box_outline_blank_rounded
  },
];

List<String> gender = ["Male", "Female", "Other"];
List<String> favourite = ["Music", "Movie", "Book"];
