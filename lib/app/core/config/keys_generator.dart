import 'package:encrypt/encrypt.dart';

class KeyGenerator{

  static final key = Key.fromUtf8('ABCDEF12!E&456EA*CDEF1&3ERD45@#'); //32 chars
  static final iv = IV.fromUtf8('1#345as87io%32@'); //16 chars

  static String generateAPIKey(){
    return encrypt("HEHE@2021.${DateTime.now().millisecondsSinceEpoch.toString().substring(0,10)}");
  }

  static  String encrypt(String text) {

    final e = Encrypter(AES(key, mode: AESMode.cbc));
    final encryptedData = e.encrypt(text, iv: iv);
    return encryptedData.base64;
  }

  static String decrypt(String text) {
    final e = Encrypter(AES(key, mode: AESMode.cbc));
    final decryptedData = e.decrypt(Encrypted.fromBase64(text), iv: iv);
    return decryptedData;
  }

}