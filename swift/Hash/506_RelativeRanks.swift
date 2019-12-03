//https://leetcode.com/problems/relative-ranks/submissions/ 
class Solution {
     func findRelativeRanks(_ nums: [Int]) -> [String] {
        let medals = ["Gold Medal", "Silver Medal", "Bronze Medal"]
        let sortedNums = nums.sorted {$0 > $1}
        var map = [Int: String]()
        for index in 0..<nums.count {
            if index < 3 {
                map.updateValue(medals[index], forKey: sortedNums[index])
            } else {
                map.updateValue("\(index + 1)", forKey: sortedNums[index])
            }
        }
        return nums.map {map[$0]!}
     }
 }