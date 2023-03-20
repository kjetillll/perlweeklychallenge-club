/*
Challenge 198

Task 1: Max Gap
Submitted by: Mohammad S Anwar
You are given a list of integers, @list.

Write a script to find the total pairs in the sorted list where 2 consecutive
elements has the max gap. If the list contains less then 2 elements then
return 0.


Example 1
Input:  @list = (2,5,8,1)
Output: 2

Since the sorted list (1,2,5,8) has 2 such pairs (2,5) and (5,8)
Example 2
Input: @list = (3)
Output: 0
*/

#include <algorithm>
#include <iostream>
#include <vector>

int max_gap(std::vector<int>& nums) {
    std::sort(nums.begin(), nums.end());
    int max_gap=0;
    int gap_count=0;
    int nums_size=static_cast<int>(nums.size());
    for (int i=0; i<nums_size-1; i++) {
        int gap=nums[i+1]-nums[i];
        if (gap>max_gap) {
            max_gap=gap;
            gap_count=1;
        }
        else if (gap==max_gap) {
            gap_count++;
        }
    }
    return gap_count;
}

int main(int argc, char* argv[]) {
    argv++; argc--;
    std::vector<int> nums;
    for (int i = 0; i < argc; i++)
        nums.push_back(atoi(argv[i]));
    std::cout << max_gap(nums) << std::endl;
}
