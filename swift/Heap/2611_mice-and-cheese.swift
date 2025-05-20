//https://leetcode.com/problems/mice-and-cheese/
class Solution {
    func miceAndCheese(_ reward1: [Int], _ reward2: [Int], _ k: Int) -> Int {
        var heap = Heap<Int>()
        for i in 0..<reward1.count {
            heap.insert(reward1[i] - reward2[i])
            if heap.count > k {
               let _ =  heap.popMin()
            }
        }
        var ans = reward2.reduce(0) {$0 + $1}
        while !heap.isEmpty {
            ans += heap.popMax()!
        }
        return  ans
    }
}