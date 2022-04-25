// https://leetcode.com/problems/number-of-flowers-in-full-bloom/
class Solution {
    func fullBloomFlowers(_ flowers: [[Int]], _ persons: [Int]) -> [Int] {
        var counter = [Int:Int]()
        for flower in flowers {
            counter[flower[0], default: 0] += 1
            counter[flower[1] + 1, default: 0] -= 1
        }

        counter[-1] = 0
        counter[1_000_000_007] = 0

        var sorterCounter = counter.sorted { p1, p2 in
            p1.key < p2.key
        }
        let M = sorterCounter.count

        for i in 1..<M {
            sorterCounter[i].value += sorterCounter[i - 1].value
        }


        func binarySearch(of target: Int) -> Int {
            var left = 0
            var right = sorterCounter.count - 1


            while left < right {

                let mid = (right + left + 1) >> 1
                if sorterCounter[mid].key > target {
                    right = mid - 1
                } else {
                    left = mid
                }
            }

            return sorterCounter[left].value
        }

        return persons.map { binarySearch(of: $0)}
    }
}