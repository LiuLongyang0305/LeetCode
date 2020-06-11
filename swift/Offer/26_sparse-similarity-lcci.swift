// https://leetcode-cn.com/problems/sparse-similarity-lcci/ 
extension Double {
    func roundTo(_ places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
class Solution {
    func computeSimilarities(_ docs: [[Int]]) -> [String] {
        let N = docs.count
        var map = [Int:[Int]]()
        var counter = [[Int]:Int]()
        for i in 0..<N {
            docs[i].forEach {
                if let indices = map[$0] {
                    for index in indices {
                        counter[[index,i], default:0] += 1
                    }
                }
                map[$0, default: [] ].append(i)
            }
        }
        return counter.map { (arg1) -> String in
            
            let (key, value) = arg1
            let similirity = Double(value) / Double(docs[key[0]].count + docs[key[1]].count - value)
            return "\(key[0]),\(key[1]): \(String(format: "%.4f", similirity.roundTo(4)))"
        }
    }
}

