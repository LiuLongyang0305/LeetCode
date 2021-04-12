// https://leetcode.com/problems/find-the-winner-of-the-circular-game/
class Solution1 {
    func findTheWinner(_ n: Int, _ k: Int) -> Int {
        guard k != 1 else {
            return n
        }
        var arr = Array<Int>(1...n)
        while arr.count > 1 {
            // print(arr)
            let delta = k % arr.count
            if delta == 0 {
                arr.removeLast()
            } else {
                arr = [Int](arr[delta...]) + [Int](arr[0..<(delta - 1)])
            }
        }
        return arr[0]
    }
}

class Solution {
    func findTheWinner(_ n: Int, _ k: Int) -> Int {
        var ans = 0
        for i in 1...n {
            ans = (ans + k) % i
        }
        return ans + 1
    }
}


