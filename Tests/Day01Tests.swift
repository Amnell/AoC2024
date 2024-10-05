//
// Advent of Code 2024 Day 1 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 1 Tests") 
struct Day01Tests {
    @MainActor @Test("Day 1 Part 1")
    func testDay01_part1() {
        let day = Day01(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 1 Part 1 Solution")
    func testDay01_part1_solution() {
        let day = Day01(input: Day01.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 1 Part 2")
    func testDay01_part2() {
        let day = Day01(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 1 Part 2 Solution")
    func testDay01_part2_solution() {
        let day = Day01(input: Day01.input)
        #expect(day.part2() == 0)
    }
}
