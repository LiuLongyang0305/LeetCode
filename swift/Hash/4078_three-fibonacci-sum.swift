// https://leetcode.cn/problems/three-fibonacci-sum/
let mx = 1_000_000_000
func getFibonacciSet() -> Set<Int> {
    var sb = Set<Int>()
    sb.insert(0)
    var f = 0
    var s = 1
    while s <= mx {
        sb.insert(s)
        (f,s) = (s,f + s)
    }
    return sb
}
let set = getFibonacciSet()
class Solution {
    func threeFibonacciSum(_ n: Int) -> Bool {
        guard n % 2 == 0 else {
            return false
        }
        return set.contains(n / 2)
    }
}

