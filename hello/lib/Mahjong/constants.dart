// 1 and 9
List<int> terminalIndices = [0, 8, 9, 17, 18, 26];

// dragons and winds
int east = 27;
int south = 28;
int west = 29;
int north = 30;
int haku = 31;
int hatsu = 32;
int chun = 33;

List<int> winds = [east, south, west, north];
List<int> honorIndices = winds + [haku, hatsu, chun];

int fiveRedMan = 16;
int fiveRedPin = 52;
int fiveRedSou = 88;

List akaDoraList = [fiveRedMan, fiveRedPin, fiveRedSou];

Map displayWinds = {east: 'East', south: 'South', west: 'West', north: 'North'};