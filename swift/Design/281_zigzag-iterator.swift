// https://leetcode.com/problems/zigzag-iterator/
class ZigzagIterator {
    private var data = [Int]()
    private var curIndex = 0
    init(_ v1: [Int], _ v2: [Int]) {
        var i = 0
        var j = 0
        while i < v1.count || j < v2.count {
            if i < v1.count {
                data.append(v1[i])
                i += 1
            }
            if j < v2.count {
                data.append(v2[j])
                j += 1
            }
        }
    }
    
    func next() -> Int {
        curIndex += 1
        return data[curIndex - 1]
    }
    
    func hasNext() -> Bool {
        return curIndex < data.count
    }
}


// Your ZigzagIterator object will be instantiated and called as such:
// var i = ZigzagIterator(v1, v2)
// var ret = [Int]()
// while i.hasNext() {
// 		ret.append(i.next())
// }