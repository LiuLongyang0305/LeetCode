// https://leetcode.com/problems/flatten-2d-vector/
class Vector2D {
    private var data = [Int]()
    init(_ v: [[Int]]) {
        for arr in v {
            for num in arr {
                data.append(num)
            }
        }
    }
    func next() -> Int {
        return data.removeFirst()
    }
    
    func hasNext() -> Bool {
        return !data.isEmpty
    }
    
}


/**
 * Your Vector2D object will be instantiated and called as such:
 * let obj = Vector2D(v)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */