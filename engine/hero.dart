/// The main player-controlled [Actor]. The player's avatar in the game world.
class Hero extends Actor {
  // TODO(bob): Let user specify.
  final Gender gender = Gender.MALE;

  Action nextAction;

  Hero(Game game, int x, int y) : super(game, x, y, Option.HERO_START_HEALTH);

  // TODO(bob): Hackish.
  get appearance() => 'hero';

  bool get needsInput() => nextAction == null;

  void getAction() {
    final action = nextAction;
    nextAction = null;
    return action;
  }

  Hit getHit(Actor defender) {
    return new Hit(3, 2);
  }

  void takeHit(Hit hit) {
    // TODO(bob): Temp.
    hit.bindDefense(strike: 50);
  }

  Vec changePosition(Vec pos) {
    game.dirtyVisibility();
    game.level.dirtyPathfinding();
    return pos;
  }

  String get nounText() => 'you';
  int get person() => 2;
}