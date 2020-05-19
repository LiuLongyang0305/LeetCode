// https://leetcode.com/problems/build-an-array-with-stack-operations/
class Solution {
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var ans = [String]()
        let targetSets = Set<Int>(target)
        for i in 1...target.last! {
            if targetSets.contains(i) {
                ans.append("Push")
            } else {
                ans.append("Push")
                ans.append("Pop")
            }
        }
        return ans
    }
}