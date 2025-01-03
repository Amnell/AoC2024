//
// Advent of Code 2024 Day 19 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 19 Tests")
struct Day19Tests {
    @MainActor @Test("Day 19 Part 1")
    func testDay19_part1() {
        let day = Day19(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 19 Part 1 Solution")
    func testDay19_part1_solution() {
        let day = Day19(input: Day19.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 19 Part 2")
    func testDay19_part2() {
        let day = Day19(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 19 Part 2 Solution")
    func testDay19_part2_solution() {
        let day = Day19(input: Day19.input)
        #expect(day.part2() == 0)
    }
}
