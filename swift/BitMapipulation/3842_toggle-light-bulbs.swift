//https://leetcode.cn/problems/toggle-light-bulbs/
    class Solution {
        func toggleLightBulbs(_ bulbs: [Int]) -> [Int] {
            var set = Set<Int>()
            for bulb in bulbs {
                if set.contains(bulb) {
                    set.remove(bulb)
                } else {
                    set.insert(bulb)
                }
            }
            return set.sorted()
        }
    }
