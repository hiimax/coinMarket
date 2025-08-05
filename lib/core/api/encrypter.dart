// import 'package:encrypt/encrypt.dart' as crypt;

// class AESCryptoSystem {
//   const AESCryptoSystem({
//     required this.key,
//     required this.vector,
//   });
//   final String key;
//   final String vector;

//   String encrypt(String? input) {
//     try {
//       final encrypter = crypt.Encrypter(
//         crypt.AES(crypt.Key.fromUtf8(key), mode: crypt.AESMode.cbc),
//       );
//       return input == null
//           ? ''
//           : encrypter.encrypt(input, iv: crypt.IV.fromUtf8(vector)).base64;
//     } catch (e) {
//       return '';
//     }
//   }

//   String decrypt(String? input) {
//     try {
//       final deckey = crypt.Key.fromUtf8(key);
//       final decrypter =
//           crypt.Encrypter(crypt.AES(deckey, mode: crypt.AESMode.cbc));
//       final deciv = crypt.IV.fromUtf8(vector);
//       return input == null ? '' : decrypter.decrypt64(input, iv: deciv);
//     } catch (e) {
//       return '';
//     }
//   }
// }
