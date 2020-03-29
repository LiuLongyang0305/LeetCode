// https://leetcode.com/problems/find-lucky-integer-in-an-array/
class Solution {
    func findLucky(_ arr: [Int]) -> Int {
        var ans = -1
        var counter = [Int:Int]()
        arr.forEach {counter.updateValue((counter[$0] ?? 0) + 1, forKey: $0)}
        counter.forEach { (arg0) in
            
            let (key, val) = arg0
            if key == val && key > ans{
                ans = key
            }
        }
        return ans
    }
}