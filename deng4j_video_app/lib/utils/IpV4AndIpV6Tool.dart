import 'dart:io';

Future<String?> getLocalIpAddress() async {
  final interfaces = await NetworkInterface.list(
      type: InternetAddressType.IPv4, includeLinkLocal: true);

  try {
// Try VPN connection first
    NetworkInterface vpnInterface =
        interfaces.firstWhere((element) => element.name == "tun0");
    return vpnInterface.addresses.first.address;
  } on StateError {
// Try wlan connection next
    try {
      NetworkInterface interface =
          interfaces.firstWhere((element) => element.name == "wlan0");
      return interface.addresses.first.address;
    } catch (ex) {
// Try any other connection next
      try {
        NetworkInterface interface = interfaces.firstWhere(
            (element) => !(element.name == "tun0" || element.name == "wlan0"));
        return interface.addresses.first.address;
      } catch (ex) {
        return null;
      }
    }
  }
}



