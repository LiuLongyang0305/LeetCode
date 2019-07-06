//https://leetcode.com/problems/boats-to-save-people/
class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        var ans = 0
        var sortedPeople = people.sorted()
        let numberOfPeople = people.count
        var isSaved = Array<Bool>(repeating: false, count: numberOfPeople)
        var i = 0
        var j = numberOfPeople - 1
        while i < numberOfPeople  {
            if !isSaved[i] {
                while i < j && sortedPeople[i] + sortedPeople[j] > limit {
                    j -= 1
                }
                isSaved[i] = true
                if i < j {
                    isSaved[j] = true
                    j -= 1
                }
                ans += 1
            }
            i += 1
        }
        return ans
    }
}