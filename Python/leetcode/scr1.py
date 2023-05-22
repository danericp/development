class Solution:
    def twoSum(self, nums, target):
        int_counter1=0
        int_counter2=1
        if nums[int_counter1] + nums[int_counter2] == target:
            return [int_counter1, int_counter2]
        else:
            while int_counter1 < len(nums)-1:
                while int_counter2 <= len(nums)-1:
                    if nums[int_counter1] + nums[int_counter2] == target:
                        return [int_counter1, int_counter2]
                    else:
                        int_counter2+=1
                int_counter1+=1
                int_counter2=int_counter1+1

list1 = [2,7,11,15]
int1 = 9
obj_Solution = Solution()
print('Example List is ' + str(list1))
print('Example Target is ' + str(int1))
print("\nreturn indices of the two numbers such that they add up to target\nSolution: " +
      str(obj_Solution.twoSum(list1, int1)))