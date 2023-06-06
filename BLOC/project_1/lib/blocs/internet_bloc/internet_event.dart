abstract class InternetEvent {}
// to make a connection between lost and gained classes we have extended them with this class

class InternetLostEvent extends InternetEvent {}

class InternetGainedEvent extends InternetEvent {}

// There is no user interactions, thats why events are empty, but these are events only