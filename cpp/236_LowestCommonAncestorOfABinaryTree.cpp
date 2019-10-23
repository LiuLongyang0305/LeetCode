//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;

    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};
class Solution {
    vector<TreeNode *> path;
    TreeNode *targetP = nullptr;
    TreeNode *targetQ = nullptr;
    vector<TreeNode *> pathP;
    vector<TreeNode *> pathQ;
    bool findAll = false;
public:
    TreeNode *lowestCommonAncestor(TreeNode *root, TreeNode *p, TreeNode *q) {
        this->targetP = p;
        this->targetQ = q;
        dfs(root);
        if (!findAll) {
            return nullptr;
        }
        int minLength = this->pathP.size();
        if (this->pathQ.size() < minLength) {
            minLength = this->pathQ.size();
        }
        for (int i = 0; i < minLength; ++i) {
            if (pathQ[i] != pathP[i]) {
                return pathP[i - 1];
            }
        }
        return pathP[minLength - 1];
    }

private:
    void dfs(TreeNode *root) {
        if (nullptr == root || findAll) {
            return;
        }
        path.push_back(root);
        if (root == targetP) {
            for (auto &node: path) {
                pathP.push_back(node);
            }
            findAll = !(pathP.empty() || pathQ.empty());
        }
        if (root == targetQ) {
            for (auto &node: path) {
                pathQ.push_back(node);
            }
            findAll = !(pathP.empty() || pathQ.empty());
        }
        dfs(root->left);
        dfs(root->right);
        path.pop_back();
    }

    void printNodes(vector<TreeNode *> nodes) {
        for (auto &node: nodes) {
            cout << node->val << "   ";
        }
        cout << endl;
    }
};