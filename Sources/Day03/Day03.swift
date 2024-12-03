//
// Advent of Code 2024 Day 3
//
// https://adventofcode.com/2024/day/3
//

import AoCTools

final class Day03: AOCDay {

    let input: String

    init(input: String) {
        self.input = input



    }

    func part1() -> Int {
        input.split(separator: "mul(").compactMap { line in
            var leftSide = ""
            var rightSide = ""
            var afterComma = false
            var closed = false

            for char in line {
                if char.isNumber {
                    if !afterComma {
                        leftSide = leftSide + "\(char)"
                    } else {
                        rightSide = rightSide + "\(char)"
                    }
                    continue
                }

                if char == "," {
                    afterComma = true
                    continue
                }

                if char == ")" {
                    closed = true
                }

                break
            }

            if let leftInt = Int(leftSide), let rightInt = Int(rightSide), closed == true {
                print("\(leftInt)*\(rightInt) = \(leftInt * rightInt)")
                return leftInt * rightInt
            }
            return nil
            
        }.sum()
//        return 0
    }

    func part2() -> Int {
        let mulRegex = /mul\(\d+,\d+\)|do\(\)|don't\(\)/

        var inDo = true

        var results: [Int] = []

        for match in input.matches(of: mulRegex) {
            let row = input[match.startIndex..<match.endIndex]

            if row.starts(with: "mul("), inDo {
                results.append(row.dropFirst(4).dropLast().split(separator: ",").map { Int($0)! }.reduce(1, *))
                continue
            }

            if row.starts(with: "do(") {
                inDo = true
                continue
            }

            if row.starts(with: "don't(") {
                inDo = false
            }
        }

        return results.sum()
    }
}
