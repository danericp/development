class Solution:
    def reverse(self, x: int) -> int:
        if ((-1)*(2**31)) <= x <= ((2**31)-1):
            bool_nega = False
            list_answer=[]
            if x < 0:
                bool_nega = True
                x*=-1
            while True:
                list_answer.insert(len(list_answer),str(x%10))
                x=x//10
                if x == 0:
                    break
            while list_answer[0] == 0:
                list_answer.pop(0)
            if (((-1)*(2**31)) <= int("".join(list_answer))*(1 if bool_nega == False else -1) <= ((2**31)-1)) == False:
                return 0
            if bool_nega:
                return int("".join(list_answer))*(-1)
            else:
                return int("".join(list_answer))
        else:
            return 0

int_input=-120
obj_Solution = Solution()
print('Input String is ' + str(int_input))
print('Reverse Integer is ' + str(obj_Solution.reverse(int_input)))