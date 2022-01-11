// https://leetcode.com/problems/destroying-asteroids/
class Solution {
    func asteroidsDestroyed(_ mass: Int, _ asteroids: [Int]) -> Bool {
        let sortedAsteroids = asteroids.sorted()
        var curMass = mass
        let N = sortedAsteroids.count
        var idx = 0
        while idx < N && sortedAsteroids[idx] <= curMass {
            curMass += sortedAsteroids[idx]
            idx += 1
        }
        return idx >= N
    }
}