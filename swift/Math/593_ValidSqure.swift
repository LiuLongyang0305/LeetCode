//https://leetcode.com/problems/valid-square/
class Solution {

    struct Vector {
        var x: Int
        var y: Int
        var squreDistance: Int {
            return x * x +  y * y
        }
        init(p1:[Int],p2: [Int]) {
            x = p2[0] - p1[0]
            y = p2[1] - p1[1]
        }
        func multiply(vector other: Vector) -> Int {
            return x * other.x + y * other.y
        }
    }
    func validSquare(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
        let p1P2 = Vector(p1: p1, p2: p2)
        let p1P3 = Vector(p1: p1, p2: p3)
        let p1P4 = Vector(p1: p1, p2: p4)
        let maxDis = max(p1P2.squreDistance, p1P3.squreDistance, p1P4.squreDistance)
        var vectors = [Vector]()
        if maxDis == p1P2.squreDistance && p1P4.squreDistance == p1P3.squreDistance {
            vectors.append(p1P3)
            vectors.append(Vector(p1: p3, p2: p2))
            vectors.append(Vector(p1: p2, p2: p4))
            vectors.append(p1P4)
        }
        if maxDis == p1P3.squreDistance && p1P2.squreDistance == p1P4.squreDistance {
            vectors.append(p1P2)
            vectors.append(Vector(p1: p2, p2: p3))
            vectors.append(Vector(p1: p3, p2: p4))
            vectors.append(p1P4)
        }
        if maxDis == p1P4.squreDistance && p1P2.squreDistance == p1P3.squreDistance {
            vectors.append(p1P2)
            vectors.append(Vector(p1: p2, p2: p4))
            vectors.append(Vector(p1: p3, p2: p4))
            vectors.append(p1P3)
        }
        guard vectors.count == 4 else {
            return false
        }
        return valid(vectors: vectors)
    }
    
    private func valid(vectors: [Vector]) -> Bool {
        let distances = vectors.map{ $0.squreDistance}
        guard distances.max()! == distances.min()! else {
            return false
        }
        return vectors[0].multiply(vector: vectors[1]) == 0
    }
}