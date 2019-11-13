//https://leetcode.com/problems/prison-cells-after-n-days/
class Solution {
    func prisonAfterNDays(_ cells: [Int], _ N: Int) -> [Int] {
        var set = Set<[Int]>()
        var arr = Array<[Int]>()
        var last = nextDayState(today: cells)
        while !set.contains(last) {
            set.insert(last)
            arr.append(last)
            last = nextDayState(today: last)
        }
        let k = (N - 1) % arr.count
        return arr[k]
    }
    private func nextDayState(today state: [Int]) -> [Int] {
        var nextDayState = state
        nextDayState[0] = 0
        nextDayState[7] = 0
        for i in 1...6 {
            nextDayState[i] = 1 - state[i - 1] ^ state[i  + 1]
        }
        return nextDayState
    }
}