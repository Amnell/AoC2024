//
// Advent of Code 2024 Day 2
//
// https://adventofcode.com/2024/day/2
//

import AoCTools

final class Day02: AOCDay {

    let lines: [String]

    init(input: String) {
        self.lines = input.lines
    }

    func part1() -> Int {
        let result = lines.compactMap {
            let list = $0.split(separator: " ").map { Int($0)! }
            if list.sorted(by: >) == list || list.sorted(by: <) == list {
                let distances = zip(list, list.dropFirst()).map { abs($0 - $1) >= 1 && abs($0 - $1) <= 3 }
                if distances.allSatisfy({ $0 }) {
                    return 1
                }
                return nil
            }
            return nil
        }
        return result.count
    }

    func part2() -> Int {
        let result = lines.compactMap {
            let list = $0.split(separator: " ").map { Int($0)! }

            var index = -1
            while index < list.count {
                var droppedList = list
                if index >= 0 {
                    droppedList.remove(at: index)
                }

                if droppedList.sorted(by: >) == droppedList || droppedList.sorted(by: <) == droppedList {
                    let distances = zip(droppedList, droppedList.dropFirst()).map { abs($0 - $1) >= 1 && abs($0 - $1) <= 3 }
                    if distances.allSatisfy({ $0 }) {
                        return 1
                    }
                }

                index += 1
            }

            return nil
        }
        return result.count
    }
}
