import 'package:libsignal_protocol_dart/libsignal_protocol_dart.dart';

class SignedPreKeyStore_impl implements SignedPreKeyStore {
  @override
  Future<bool> containsSignedPreKey(int signedPreKeyId) {
    // TODO: implement containsSignedPreKey
    throw UnimplementedError();
  }

  @override
  Future<SignedPreKeyRecord> loadSignedPreKey(int signedPreKeyId) {
    // TODO: implement loadSignedPreKey
    throw UnimplementedError();
  }

  @override
  Future<List<SignedPreKeyRecord>> loadSignedPreKeys() {
    // TODO: implement loadSignedPreKeys
    throw UnimplementedError();
  }

  @override
  Future<void> removeSignedPreKey(int signedPreKeyId) {
    // TODO: implement removeSignedPreKey
    throw UnimplementedError();
  }

  @override
  Future<void> storeSignedPreKey(
      int signedPreKeyId, SignedPreKeyRecord record) {
    // TODO: implement storeSignedPreKey
    throw UnimplementedError();
  }
}
