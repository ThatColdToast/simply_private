import 'package:libsignal_protocol_dart/libsignal_protocol_dart.dart';
import 'package:simply_private/main.dart';
import 'package:simply_private/util/eq.dart';

class IdentityKeyStore_impl implements IdentityKeyStore {
  IdentityKeyStore_impl(this.identityKeyPair, this.localRegistrationId);

  // final IdentityKeyPair identityKeyPair;
  // final int localRegistrationId;

  @override
  Future<IdentityKey?> getIdentity(SignalProtocolAddress address) async {
    return dataProvider.getIdentity(address);
  }

  @override
  Future<IdentityKeyPair> getIdentityKeyPair() async {
    // TODO: implement getIdentityKeyPair
    throw UnimplementedError();
  }

  @override
  Future<int> getLocalRegistrationId() async {
    // TODO: implement getLocalRegistrationId
    throw UnimplementedError();
  }

  @override
  Future<bool> isTrustedIdentity(SignalProtocolAddress address,
      IdentityKey? identityKey, Direction direction) async {
    final trusted = dataProvider.getIdentity(address);
    if (identityKey == null) {
      return false;
    }
    return trusted == null || eq(trusted.serialize(), identityKey.serialize());
  }

  @override
  Future<bool> saveIdentity(
      SignalProtocolAddress address, IdentityKey? identityKey) async {
    final existing = dataProvider.getIdentity(address);
    if (identityKey == null) {
      return false;
    }
    if (identityKey != existing) {
      dataProvider.setIdentity(address, identityKey);
      return true;
    } else {
      return false;
    }
  }
}
