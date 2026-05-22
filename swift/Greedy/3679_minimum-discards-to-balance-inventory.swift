//https://leetcode.com/problems/minimum-discards-to-balance-inventory/
class Solution {
    func minArrivalsToDiscard(_ arrivals: [Int], _ w: Int, _ m: Int) -> Int {
        var counter = [Int:Int]()
        var removed = Set<Int>()
        let M = arrivals.count
        for i in 0..<M {
            if let v = counter[arrivals[i]], v == m {
                removed.insert(i)
            } else {
                counter[arrivals[i],default: 0] += 1
            }
            let left = i - w + 1
            if left >= 0 && !removed.contains(left){
                counter[arrivals[left],default: 0] -= 1
            }
        }
        return removed.count
    }
}
