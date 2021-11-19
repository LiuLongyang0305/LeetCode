//https://leetcode.com/problems/walking-robot-simulation-ii/
class Robot {
    private typealias Position = (x:Int,y:Int)
    private var moved: Bool = false
    private var idx = 0;
    private var positions = [Position]()
    private var dir = [Int]()
    private let dirToStr:[Int:String] = [0:"East",1:"North",2:"West",3:"South"]
    init(_ width: Int, _ height: Int) {
        var i = 0
        while i < width {
            positions.append((i,0))
            dir.append(0)
            i += 1
        }
        i = 1
        while i < height {
            positions.append((width - 1,i))
            dir.append(1)
            i += 1
        }
        i = width - 2
        while i >= 0 {
            positions.append((i,height - 1))
            dir.append(2)
            i -= 1
        }
        i = height - 2
        while i > 0 {
            positions.append((0,i))
            dir.append(3)
            i -= 1
        }
        dir[0] = 3
    }
    
    func move(_ num: Int) {
        moved = true
        idx = (idx + num) % positions.count
    }
    
    func getPos() -> [Int] {
        return [positions[idx].x,positions[idx].y]
    }
    
    func getDir() -> String {
        guard moved else {
            return "East"
        }
        return dirToStr[dir[idx]] ?? ""
    }
}

/**
 * Your Robot object will be instantiated and called as such:
 * let obj = Robot(width, height)
 * obj.move(num)
 * let ret_2: [Int] = obj.getPos()
 * let ret_3: String = obj.getDir()
 */