//
// Advent of Code 2024 Day 4
//
// https://adventofcode.com/2024/day/4
//

import AoCTools

extension Character: @retroactive Drawable {
    public var draw: Character {
        if "XMAS".contains(self) {
            return self
        }
        return Character(".")
    }
    
    public static func value(for ch: Character) -> Character {
        ch
    }
    

}

final class Day04: AOCDay {

    let lines: [String]

    init(input: String) {
        self.lines = input.lines
    }

    func part1() -> Int {

        var matrix: [[Character]] = Array(repeating: Array(repeating: ".", count: lines.count), count: lines.first!.count)

        let points = lines.enumerated().flatMap { (y, line) in
            line.enumerated().map { (x, char) in
                matrix[y][x] = char
                return (Point(x, y), char)
            }
        }

        let rowCount = lines.count
        let colCount = lines.first!.count

        var results: [[Point]] = []

        var gridData: [Point: Character] = [:]

        points.forEach { point in
            if point.1 == "X" {

                if point.0.x == 4 && point.0.y == 1 {
                    print("Found: \(point)")
                }

                let right = point.0.line(to: point.0.moved(to: .right, steps: 4))
                let left = point.0.line(to: point.0.moved(to: .left, steps: 4))
                let up = point.0.line(to: point.0.moved(to: .up, steps: 4))
                let down = point.0.line(to: point.0.moved(to: .down, steps: 4))
                let diagonalNE = point.0.line(to: point.0.moved(to: .ne, steps: 4))
                let diagonalNW = point.0.line(to: point.0.moved(to: .nw, steps: 4))
                let diagonalSE = point.0.line(to: point.0.moved(to: .se, steps: 4))
                let diagonalSW = point.0.line(to: point.0.moved(to: .sw, steps: 4))

                [right, left, up, down, diagonalNE, diagonalNW, diagonalSE, diagonalSW].forEach {
                    let characters: [(Point, Character)] = $0.compactMap { point in
                        guard (0..<colCount).contains(point.x) && (0..<rowCount).contains(point.y) else {
                            return (point, Character("."))
                        }
                        return (point, matrix[point.y][point.x])
                    }

                    let result = String(characters.map(\.1))
                    assert(result != "SAMX", "Should never ")

                    if result == "XMAS" {
                        print("Found: \(result), \(results.count)")
                        characters.forEach { point, character in
                            gridData[point] = matrix[point.y][point.x]
                        }
                        results.append($0)
                    }
                }
            }
        }

        let grid = Grid(points: gridData)
        grid.draw()

        return results.count
    }

    func part2() -> Int {
        var matrix: [[Character]] = Array(repeating: Array(repeating: ".", count: lines.count), count: lines.first!.count)

        let points = lines.enumerated().flatMap { (y, line) in
            line.enumerated().map { (x, char) in
                matrix[y][x] = char
                return (Point(x, y), char)
            }
        }

        let rowCount = lines.count
        let colCount = lines.first!.count

        var xCount = 0

        var gridData: [Point: Character] = [:]

        points.forEach { point in
            if point.1 == "A" {

                if point.0.x == 4 && point.0.y == 1 {
                    print("Found: \(point)")
                }

                let neighbors = point.0.neighbors(adjacency: .ordinal)

                let neighborString = neighbors.compactMap { point -> Character? in
                    guard (0..<colCount).contains(point.x) && (0..<rowCount).contains(point.y) else {
                        return nil
                    }
                    return matrix[point.y][point.x]
                }.map(String.init).joined()

                if neighborString == "MSMS" || neighborString == "SMSM" || neighborString == "MMSS" || neighborString == "SSMM" {
                    neighbors.forEach { neighborPoint in
                        gridData[neighborPoint] = matrix[neighborPoint.y][neighborPoint.x]
                    }
                    gridData[point.0] = matrix[point.0.y][point.0.x]
                    xCount += 1
                }
            }
        }

        let grid = Grid(points: gridData)
        grid.draw()

        return xCount
    }
}
