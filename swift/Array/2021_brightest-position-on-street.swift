//https://leetcode.com/problems/brightest-position-on-street/
class Solution {
    private typealias Pair = (pos:Int,lights:Int)
    func brightestPosition(_ lights: [[Int]]) -> Int {
        var map = [Int:Int]()
        for light in lights {
            map[light[0] - light[1],default: 0] += 1
            map[light[0] + light[1] + 1,default: 0] -= 1
        }
        let sortedMap = map.sorted { $0.key < $1.key}
        var pre = sortedMap[0].value
        var maxLights = sortedMap[0].value
        var ans = sortedMap[0].key
        for (p,l) in sortedMap.dropFirst() {
            pre += l
            if pre > maxLights {
                maxLights = pre
                ans = p
            }
        }
        return ans
    }
}