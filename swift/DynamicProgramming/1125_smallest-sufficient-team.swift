// https://leetcode.com/problems/smallest-sufficient-team/
class Solution {
    typealias Info = (cnt:Int,included:[Int])
    func smallestSufficientTeam(_ req_skills: [String], _ people: [[String]]) -> [Int] {
        var skillMask = [String:Int]()
        var requiredSkills: Int = 0
        for idx in 0..<req_skills.count {
            if nil == skillMask[req_skills[idx]] {
                skillMask[req_skills[idx]] = 1 << idx
            }
            requiredSkills |= (1 << idx)
        }
        let peopleSkills = people.map { (skills) -> Int in
            skills.reduce(0) { $0 | (skillMask[$1] ?? 0 )}
        }
        var memo = [Int:Info]()
        for idx in 0..<people.count {
            for (skills,info) in memo {
                let currentSkills = peopleSkills[idx] | skills
                if let tempInfo = memo[currentSkills], tempInfo.cnt < 1 + info.cnt {
                    continue
                }
                memo[currentSkills] = (1 + info.cnt,info.included + [idx])
                
            }
            memo[peopleSkills[idx]] = (1,[idx])
        }
        return memo[requiredSkills]?.included ?? []
    }
}