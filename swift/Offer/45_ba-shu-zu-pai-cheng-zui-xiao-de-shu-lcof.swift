// https://leetcode-cn.com/problems/ba-shu-zu-pai-cheng-zui-xiao-de-shu-lcof/
class Solution {
    func minNumber(_ nums: [Int]) -> String {
      return nums.sorted { (x, y) -> Bool in
        if Int("\(x)\(y)")! < Int("\(y)\(x)")! {
          return true
        }
        return false
      }.map {"\($0)"}.reduce("") { $0 + $1 }
    }
}