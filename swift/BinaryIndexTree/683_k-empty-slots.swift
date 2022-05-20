// https://leetcode.com/problems/k-empty-slots/
class Solution {
    private var c = [Int]()
    private var N = 0
    func kEmptySlots(_ bulbs: [Int], _ k: Int) -> Int {
        self.N = bulbs.count
        self.c = [Int](repeating: 0, count: N + 1)
        var lightedBulbs = [Bool](repeating: false, count: N + 1)
        for i in 1...N {
            let bulbIdx = bulbs[i - 1]
            add(bulbIdx)
            lightedBulbs[bulbIdx] = true
            // print(lightedBulbs)
            let left = bulbIdx - 1 - k
            if left > 0 && lightedBulbs[left]{
                guard query(left,bulbIdx - 1) != 0 else {
                    return i
                }
            }
            let right = k + 1 + bulbIdx
            if right <= N  && lightedBulbs[right] {
                guard query(bulbIdx,right - 1) != 0 else {return i}
            }
        }
        return -1
    }
    private func lowBit(_ x: Int) -> Int{
        return x & (-x)
    }

    private func getPreffixNode(_ x: Int) -> Int {
        return x - lowBit(x)
    }

    private func getParentNode(_ x: Int) -> Int {
        return x + lowBit(x)
    }
    private func add(_ pos: Int, _ delta: Int = 1) {
        var x = pos
        while x <= N {
            c[x] += delta
            x = getParentNode(x)
        }
    }

    private func query(_ left: Int, _ right: Int) -> Int {
//        print("\(left)  \(right) \(query(right) - query(left))")
        return query(right) - query(left)
    }
    private func query(_ pos: Int) -> Int {

        var x = pos
        var ans = 0
        while x > 0 {
            ans += c[x]
            x = getPreffixNode(x)
        }
//        defer {
//            print("\(#function)   pos = \(pos)  ans = \(ans)")
//        }
        return ans
    }
}
