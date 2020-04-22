// https://leetcode.com/problems/zigzag-iterator/
class ZigzagIterator {
    private var v1: [Int]
    private var v2: [Int]
    private var flag: Bool = true
    init(_ v1: [Int], _ v2: [Int]) {
        self.v1 = v1
        self.v2 = v2
    }
    
    func next() -> Int {
        if v1.isEmpty {
            return v2.removeFirst()
        }
        if v2.isEmpty {
            return v1.removeFirst()
        }
        if flag {
            flag = false
            return v1.removeFirst()
        } else {
            flag = true
            return v2.removeFirst()
        }
    }
    
    func hasNext() -> Bool {
        return !v1.isEmpty || !v2.isEmpty
    }
}


// Your ZigzagIterator object will be instantiated and called as such:
// var i = ZigzagIterator(v1, v2)
// var ret = [Int]()
// while i.hasNext() {
// 		ret.append(i.next())
// }