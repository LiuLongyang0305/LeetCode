
//https://leetcode.com/problems/longest-uploaded-prefix/ 
class LUPrefix {

    private var uploaded: [Bool]
    private var cur = 0
    private var videoCnt = -1
    init(_ n: Int) {
        self.uploaded = [Bool](repeating: false, count: n + 5)
//        self.uploaded[0] = true
        self.videoCnt = n
    }

    func upload(_ video: Int) {
        self.uploaded[video] = true
        while  self.cur <= self.videoCnt && uploaded[cur + 1] {
            cur += 1
        }
    }

    func longest() -> Int {
        return self.cur
    }
}
/**
 * Your LUPrefix object will be instantiated and called as such:
 * let obj = LUPrefix(n)
 * obj.upload(video)
 * let ret_2: Int = obj.longest()
 */