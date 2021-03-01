// https://leetcode.com/problems/count-items-matching-a-rule/
class Solution {
    func countMatches(_ items: [[String]], _ ruleKey: String, _ ruleValue: String) -> Int {
        let idx = ruleKey == "type" ? 0 : (ruleKey == "color" ? 1 : 2)
        return items.reduce(0) { $0 + ($1[idx] == ruleValue ? 1 : 0)}
    }
}