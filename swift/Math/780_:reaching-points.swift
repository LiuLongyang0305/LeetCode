// https://leetcode.com/problems/reaching-points/
class Solution {
    
    func reachingPoints(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
        var newTx = tx
        var newTy = ty
        while newTy >= sy && newTx >= sx {
            guard !(newTx == newTy) else {
                break
            }
            if newTx > newTy {
                if newTy > sy {
                    newTx %= newTy
                } else {
                    return (newTx - sx) % newTy == 0
                }
            } else {
                if newTx > sx {
                    newTy %= newTx
                } else {
                    return (newTy - sy) % newTx == 0
                }
            }
        }
        return sy == newTy && sx == newTx
    }
}

