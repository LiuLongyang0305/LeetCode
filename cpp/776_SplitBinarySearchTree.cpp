//https://leetcode.com/problems/split-bst/
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;

    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Solution {
public:
    vector<TreeNode *> splitBST(TreeNode *root, int V) {
        if (nullptr == root) {
            return vector<TreeNode *>{nullptr, nullptr};
        }
        if (root->val == V) {
            TreeNode *right = root->right;
            root->right = nullptr;
            return vector<TreeNode *>{root, right};
        }
        if (root->val < V) {
            vector<TreeNode *> ans = splitBST(root->right, V);
            root->right = ans.at(0);
            return vector<TreeNode *>{root, ans.at(1)};
        }
        vector<TreeNode *> ans = splitBST(root->left, V);
        root->left = ans.at(1);
        return vector<TreeNode *>{ans.at(0), root};
    }
};