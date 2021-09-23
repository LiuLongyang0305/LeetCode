// https://leetcode.com/problems/detect-squares/
class DetectSquares {
    private var counter = [[Int]](repeating: [Int](repeating: 0, count: 1005), count: 1005)
    init() {
        
    }
    
    func add(_ point: [Int]) {
        counter[point[0]][point[1]] += 1
    }
    
    func count(_ point: [Int]) -> Int {
        let x = point[0]
        let y = point[1]
        //        guard counter[x][y] > 0 else {return 0}
        return getSquresCnt(x, y, 0) + getSquresCnt(x, y, 1) + getSquresCnt(x, y, 2) + getSquresCnt(x, y, 3)
    }
    
    private func getSquresCnt(_ x: Int, _ y: Int, _ direction: Int) -> Int {
        
        var cnt = 0
        var maxLength = 0
        
        switch direction {
        case 0:
            //leftUp
            maxLength = min(1000 - x,y)
            guard maxLength >= 1 else {break}
            for length in 1...maxLength {
                cnt += counter[x + length][y - length] * counter[x + length][y] * counter[x][y - length]
            }
            break
        case 1:
            //rightUp
            
            maxLength = min(y,x)
            guard maxLength >= 1 else {break}
            
            for length in 1...maxLength {
                cnt += counter[x][y - length] * counter[x - length][y - length] * counter[x - length][y]
            }
            break
        case 2:
            //leftDown
            maxLength = min(1000 - y,1000 - x)
            guard maxLength >= 1 else {break}
            
            for length in 1...maxLength {
                cnt += counter[x + length][y] * counter[x][y + length] * counter[x + length][y + length]
            }
            break
        case 3:
            //rightDown
            maxLength = min(x,1000 -  y)
            guard maxLength >= 1 else {break}
            for length in 1...maxLength {
                cnt += counter[x - length][y] * counter[x][y + length] * counter[x - length][y + length]
            }
            break
        default:
            break
        }
//        print("\(x)  \(y)   \(direction)   \(maxLength)   \(cnt)")
        
        return cnt
    }
}

/**
 * Your DetectSquares object will be instantiated and called as such:
 * let obj = DetectSquares()
 * obj.add(point)
 * let ret_2: Int = obj.count(point)
 */