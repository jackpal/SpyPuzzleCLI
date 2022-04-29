# SpyPuzzleCLI

A command line interface for a spy puzzle game.

This can be used to solve game levels for games like
[Hitman Go](https://en.wikipedia.org/wiki/Hitman_Go).

# Usage

First, create a text-based level file. See the
[SpyPuzzleGameState](https://github.com/jackpal/SpyPuzzleGameState) package
for the specification of the text file format used to define spy puzzle levels.

An example simple level file is:

```bash
A-1-X

1:e(b,e)
```

Save that as a text file, say `1-1.txt`.

Then, run the command line app to solve the level:

```bash
swift run -c release SpyPuzzleCLI 1-1.txt
```

# Parameters

The first part of the command, `swift run -c release SpyPuzzleCLI`, tells swift to build
and run the command line executable. The rest of the parameters are arguments to the
executable. The only required parameter is the level argument. But there are several
optional parameters:

The `--verbose` flag prints verbose status information.

The `--exit-objective` option sets the level's exit objective. There are three
choices:

`LevelComplete`: This is the default. The assassin must make their way to the exit.

`LevelCompleteWithin(N)`. This is like `LevelComplete`, but requires that the level
is solved within `N` steps. Using the subway counts as a step, but neither firing a gun
nor tossing a rock count as steps.

`KillYourMark`. The goal is to kill the "Mark" enemy.

The `--status-objectives` option sets the level's status objectives. This is a
comma-separated-list. There are several possible status objectives:

`CollectBriefcase`: Collect a briefcase before finishing the level.

`DontKillDogs`: Don't kill any "dog" enemies.

`KillAllEnemies`: Kill all the enemies.

`NoKill`: Don't kill any enemies.

`SpeedKill`: Kill an enemy by traveling to the end of a walkway.

# Performance

Depending on the complexity of the level, it can take anywhere from a fraction of a
second to many days to solve a level. See the
[SpyPuzzleSolver](https://github.com/jackpal/SpyPuzzleGameState) package for discussion
of the limitations of the solver.
