// https://leetcode.com/problems/correct-a-binary-tree/
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    TreeNode *correctBinaryTree(TreeNode *root) {
        TreeNode *invalidNode = findInvalidNode(root);
        if (invalidNode == nullptr) {
            return root;
        }
        dfs(root, invalidNode);
        return root;
    }

private:
    TreeNode *findInvalidNode(TreeNode *root) {
        if (nullptr == root) {
            return nullptr;
        }
        deque<TreeNode *> queue = deque<TreeNode *>();
        queue.push_back(root);
        while (!queue.empty()) {
            set<TreeNode *> lastLevel = set<TreeNode *>(queue.begin(), queue.end());
            int length = queue.size();
            for (int i = 0; i < length; ++i) {
                TreeNode *node = queue.front();
                queue.pop_front();
                if (nullptr != node->left) {
                    if (lastLevel.count(node->left) == 1) {
                        return node;
                    }
                    queue.push_back(node->left);
                }
                if (nullptr != node->right) {
                    if (lastLevel.count(node->right) == 1) {
                        return node;
                    }
                    queue.push_back(node->right);
                }

            }
        }
        return nullptr;
    }

    void dfs(TreeNode *root, TreeNode *invalidNode) {
        if (nullptr == root) {
            return;
        }
        if (root->left == invalidNode) {
            root->left = nullptr;
            return;
        }
        if (root->right == invalidNode) {
            root->right = nullptr;
            return;
        }
        dfs(root->left, invalidNode);
        dfs(root->right, invalidNode);
    }
};