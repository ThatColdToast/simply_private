import 'package:libsignal_protocol_dart/libsignal_protocol_dart.dart';
import 'package:simply_private/main.dart';

class PreKeyStore_impl implements PreKeyStore {
  @override
  Future<bool> containsPreKey(int preKeyId) async {
    return dataProvider.containsPreKey(preKeyId);
  }

  @override
  Future<PreKeyRecord> loadPreKey(int preKeyId) async {
    return dataProvider.getPreKey(preKeyId);
  }

  @override
  Future<void> removePreKey(int preKeyId) async {
    dataProvider.removePreKey(preKeyId);
  }

  @override
  Future<void> storePreKey(int preKeyId, PreKeyRecord record) {
    dataProvider.setPreKey(preKeyId, record);
  }
}
