// https://leetcode.com/problems/check-if-numbers-are-ascending-in-a-sentence/
class Solution {
    
    func areNumbersAscending(_ s: String) -> Bool {
        let numbers = s.split(separator: " ").filter {$0.first!.isNumber}.map { String($0)}.map { Int.init($0)!}
        var last = -1
        for num in numbers {
            guard num > last else {return false}
            last = num
        }
        return true
    }
}