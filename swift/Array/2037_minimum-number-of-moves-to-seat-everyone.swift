// https://leetcode.com/problems/minimum-number-of-moves-to-seat-everyone/
class Solution {
    func minMovesToSeat(_ seats: [Int], _ students: [Int]) -> Int {
        let sortedSeats = seats.sorted()
        let sortedStudents = students.sorted()
        let N = seats.count
        return (0..<N).reduce(0) { $0 + abs(sortedSeats[$1] - sortedStudents[$1])}
    }
}