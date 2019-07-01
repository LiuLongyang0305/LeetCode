//https://leetcode.com/problems/queue-reconstruction-by-height/
class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        var ans = Array<Array<Int>>(repeating: Array<Int>(), count: people.count)
        let sortedPeopleByHeight = people.sorted { (per1, per2) -> Bool in
            per1[0] < per2[0]
        }
        let numberOfPeople = people.count
        
        for person in sortedPeopleByHeight {
            var count = 0
            var i = 0
            while i < numberOfPeople {
                
                if ans[i].isEmpty || ans[i][0] >= person[0] {
                    count += 1
                    if count == person[1] + 1 {
                        ans[i] = person
                        break
                    }
                }
                i += 1
            }
        }
        return ans
    }
}