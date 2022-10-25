// https://leetcode.com/problems/check-for-contradictions-in-equations/
class Solution {


    private var fa = [String:String]()
    private var weights = [String:Double]()

    private func find(_ x: String) -> String {
        if x != fa[x]! {
            let t = fa[x]!
            fa[x] = find(t)
            weights[x, default: 1.0] *= weights[t]!
        }
        return fa[x]!
    }
    private func union(_ x: String,_ y: String, _ v: Double) {
        let fx = find(x)
        let fy = find(y)
        guard fx != fy else {return}
        fa[fx] = fy
        weights[fx,default: 1.0] = v * (weights[y] ?? 1.0)  / (weights[x] ?? 0)
    }
    func checkContradictions(_ equations: [[String]], _ values: [Double]) -> Bool {
        for equation in equations {
            if nil == fa[equation[0]] {
                fa[equation[0]] = equation[0]
                weights[equation[0]] = 1.0
            }
            if nil == fa[equation[1]] {
                fa[equation[1]] = equation[1]
                weights[equation[1]] = 1.0
            }
        }
        let N = equations.count
        for i in 0..<N {
            let l = equations[i][0]
            let r = equations[i][1]

            if find(l) == find(r) {
                if abs(values[i] - (weights[l] ?? 1.0) / (weights[r] ?? 1.0)) > 0.001 {
                    return true
                }
            }
            union(l, r, values[i])

        }
        return false
    }
}



