import ArgumentParser
import SpyPuzzleGameState
import SpyPuzzleSolver

@main
struct SpyPuzzleCLI: ParsableCommand {
  @Flag(name: .shortAndLong, help: "Print verbose status messages.")
  var verbose = false

  @Option(name: .shortAndLong, help: "Exit objective.")
  var exitObjective = "LevelComplete"

  @Option(name: .shortAndLong, help: "Status objectives.")
  var statusObjectives = ""

  @Argument(help: "The spy puzzle level to load.")
  var level: String

  mutating func run() {
    if verbose {
      print("Loading level \(level)")
    }
    do {
      let parsedExitObjective = try SpyPuzzleGameState.parse(objectives:exitObjective).first!
      if verbose {
        print("Exit objective: \(parsedExitObjective)")
      }
      let parsedStatusObjectives = statusObjectives.isEmpty ? [] : try SpyPuzzleGameState.parse(objectives:statusObjectives)
      if verbose {
        print("Status objectives: \(parsedStatusObjectives)")
      }
      let levelContents = try String(contentsOfFile: level)
        .trimmingCharacters(in: .whitespacesAndNewlines)
      if verbose {
        print(levelContents)
      }
      let state = try SpyPuzzleGameState.parse(level:levelContents)
      if verbose {
        print("Solving...")
      }
      let solution = try SpyPuzzleSolver.solve(
        state:state,
        exitObjective: parsedExitObjective,
        statusObjectives: parsedStatusObjectives)
      if verbose {
        print("Solution:")
      }
      let solutionText = solution?.map(\.description).joined(separator:", ") ?? ""
      print(solutionText)
    } catch {
      print("Error: \(error)")
    }
  }
}
