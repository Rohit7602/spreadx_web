// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

void openVirtualKeyboard() {
  final shell32 = DynamicLibrary.open('shell32.dll');
  final shellExecute = shell32.lookupFunction<
      IntPtr Function(IntPtr, Pointer<Utf16>, Pointer<Utf16>, Pointer<Utf16>,
          Pointer<Utf16>, Int32),
      int Function(int, Pointer<Utf16>, Pointer<Utf16>, Pointer<Utf16>,
          Pointer<Utf16>, int)>('ShellExecuteW');

  final operation = 'open'.toNativeUtf16();
  final file = 'osk.exe'.toNativeUtf16();

  shellExecute(
    0,
    operation,
    file,
    nullptr,
    nullptr,
    SW_SHOWNORMAL,
  );

  malloc.free(operation);
  malloc.free(file);
}
