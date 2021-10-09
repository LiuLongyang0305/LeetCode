 // https://leetcode.com/problems/random-flip-matrix/
class Solution1 {
    
    private let M:Int
    private let N:Int
    private var k:Int
    private var map = [Int:Int]()
    
    init(_ m: Int, _ n: Int) {
        self.M = m
        self.N = n
        self.k = m * n
    }
    
    func flip() -> [Int] {
        let x = Int.random(in: ClosedRange<Int>.init(uncheckedBounds: (0,k - 1)))
        var y = x
        if let c = map[x] {
            y = c
        }
        if let c = map[k - 1] {
            map[x] = c
            map.removeValue(forKey: k - 1)
        } else {
            map[x] = k - 1
        }
        k -= 1
        return [y / N, y % N]
    }
    
    func reset() {
        self.k = self.M * self.N
        self.map = [:]
    }
}
class Solution {

    private var cols: Int
    private var len: Int
    private var dict: [Int: Bool]

    init(_ n_rows: Int, _ n_cols: Int) {
        self.cols = n_cols
        self.len = n_rows * n_cols
        self.dict = [Int: Bool]()
    }
    
    func flip() -> [Int] {
        var rand = -1
        repeat {
            rand = Int.random(in: 0..<len)
        } while dict[rand, default: false]
        dict[rand] = true
        return([rand / cols, rand % cols])
    }
    
    func reset() {
        dict.removeAll()
    }
}
/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(m, n)
 * let ret_1: [Int] = obj.flip()
 * obj.reset()
 */