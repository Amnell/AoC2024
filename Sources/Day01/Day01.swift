//
// Advent of Code 2024 Day 1
//
// https://adventofcode.com/2024/day/1
//

import AoCTools

final class Day01: AOCDay {
    let title = "Day 1"

    let leftValues: [Int]
    let rightValues: [Int]

    init(input: String) {
        var leftValues: [Int] = []
        var rightValues: [Int] = []

        input.lines.forEach { row in
            let values = row.split(separator: "   ").map { Int($0)! }
            leftValues.append(values[0])
            rightValues.append(values[1])
        }

        self.leftValues = leftValues
        self.rightValues = rightValues
    }

    func part1() -> Int {
        zip(leftValues.sorted(), rightValues.sorted()).reduce(0) { acc, pair in
            acc + abs(pair.1 - pair.0)
        }
    }

    func part2() -> Int {
        let occurencies: [Int: Int] = rightValues.reduce(into: [:]) { acc, value in
            acc[value, default: 0] += 1
        }

        return leftValues.reduce(0) { acc, value in
            acc + value * occurencies[value, default: 0]
        }

    }
}
