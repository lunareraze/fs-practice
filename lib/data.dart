import 'package:flutter/material.dart';
import 'package:fs_practice/models/user.dart';

final ctrl1 = TextEditingController();
final ctrl2 = TextEditingController();

var isLoading = false;
var selectedId = '';

var isShowClear1 = false;

var isShowClear2 = false;

List<UserX> userList = [];
