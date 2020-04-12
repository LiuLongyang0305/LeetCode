// https://leetcode.com/problems/queries-on-a-permutation-with-key/
class Solution {
    func processQueries(_ queries: [Int], _ m: Int) -> [Int] {
        var ans = [Int]()
        var arr = Array<Int>(1...m)
        for q in queries {
            let index = arr.firstIndex(of: q)!
            let num = arr[index]
            arr.remove(at: index)
            arr.insert(num, at: 0)
            ans.append(index)
        }
        return ans
    }
}

