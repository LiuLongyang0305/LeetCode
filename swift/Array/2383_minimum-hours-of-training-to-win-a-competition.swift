// https://leetcode.com/problems/minimum-hours-of-training-to-win-a-competition/
class Solution {
    func minNumberOfHours(_ initialEnergy: Int, _ initialExperience: Int, _ energy: [Int], _ experience: [Int]) -> Int {
        var ans = 0
        let N = energy.count
        var curEnergy = initialEnergy
        var curExperience = initialExperience
        for i in 0..<N {
            if curEnergy <= energy[i] {
                ans += energy[i] - curEnergy + 1
                curEnergy = energy[i] + 1
            }
            if curExperience <= experience[i] {
                ans += experience[i] - curExperience + 1
                curExperience = experience[i] + 1
            }
            curEnergy -= energy[i]
            curExperience += experience[i]
        }
        return ans
    }
}