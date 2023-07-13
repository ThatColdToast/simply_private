import 'package:libsignal_protocol_dart/libsignal_protocol_dart.dart';

class SessionStore_impl implements SessionStore {
  @override
  Future<bool> containsSession(SignalProtocolAddress address) {
    // TODO: implement containsSession
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAllSessions(String name) {
    // TODO: implement deleteAllSessions
    throw UnimplementedError();
  }

  @override
  Future<void> deleteSession(SignalProtocolAddress address) {
    // TODO: implement deleteSession
    throw UnimplementedError();
  }

  @override
  Future<List<int>> getSubDeviceSessions(String name) {
    // TODO: implement getSubDeviceSessions
    throw UnimplementedError();
  }

  @override
  Future<SessionRecord> loadSession(SignalProtocolAddress address) {
    // TODO: implement loadSession
    throw UnimplementedError();
  }

  @override
  Future<void> storeSession(
      SignalProtocolAddress address, SessionRecord record) {
    // TODO: implement storeSession
    throw UnimplementedError();
  }
}
