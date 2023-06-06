// states related to internet lost and gained event
abstract class InternetState {}

class InternetInitialState extends InternetState {}

class InternetLostState extends InternetState {}

class InternetGainedState extends InternetState {}
