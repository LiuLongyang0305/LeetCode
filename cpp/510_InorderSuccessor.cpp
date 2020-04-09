//https://leetcode.com/problems/inorder-successor-in-bst-ii/
class Node {
public:
    int val;
    Node *left;
    Node *right;
    Node *parent;
};


class Solution {
public:
    bool flag = false;
    int targetValue = 0;

    Node *inorderSuccessor(Node *node) {
        this->targetValue = node->val;
        while (nullptr != node->parent) {
            node = node->parent;
        }

        return dfs(node);
    }

private:
    Node *dfs(Node *root) {
        if (nullptr == root) {
            return nullptr;
        }
        Node *ans = dfs(root->left);
        if (nullptr != ans) {
            return ans;
        }
        if (root->val == this->targetValue) {
            this->flag = true;
        }
        if (this->flag && root->val > targetValue) {
            return root;
        }
        return dfs(root->right);
    }
};
