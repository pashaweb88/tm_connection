class Server {
  final String coyntry;
  final String flag;
  final String ip;
  final String username;
  final String password;

  const Server(
      {required this.coyntry,
      required this.flag,
      required this.ip,
      required this.username,
      required this.password});

  static List<Server> allServers() {
    return [
      new Server(
          coyntry: 'Nederlands',
          flag: 'f_nl',
          password: 'cvgeRto9artD',
          username: 'vpnuser',
          ip: 'topvpnnl1.site'),
      new Server(
          coyntry: 'England',
          flag: 'f_uk',
          password: 'cvgeRto9artD',
          username: 'vpnuser',
          ip: 'topvpnen1.site'),
      new Server(
          coyntry: 'United States',
          flag: 'f_us',
          password: 'EsJx84Fqr8cAEba',
          username: 'vpnuser',
          ip: 'topvpnus1.site'),
    ];
  }
}
