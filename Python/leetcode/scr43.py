# THIS CODE IS NOT YET COMPLETE
class Solution:
    def multiply(self, num1: str, num2: str) -> str:
        if num1 == 0 or num2 == 0 or num1 == "" or num2 == "":
            return "0"
        else:
            dict_snums={'0':0,'1':1,'2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,'9':9}
            dict_nstrs={0:'0',1:'1',2:'2',3:'3',4:'4',5:'5',6:'6',7:'7',8:'8',9:'9'}
            int_multiplier=1
            int_num1=0
            for chr_num in num1[::-1]:
                int_num1+=(dict_snums.get(chr_num)*int_multiplier)
                int_multiplier*=10
            int_multiplier=1
            int_num2=0
            for chr_num in num2[::-1]:
                int_num2+=(dict_snums.get(chr_num)*int_multiplier)
                int_multiplier*=10
            int_multiplier=10
            int_product=int_num1*int_num2
            str_product=""
            print(int_product)
            while True:
                str_product+=dict_nstrs.get(((int_product%int_multiplier)-(int_product%(int_multiplier/10)))//(int_multiplier/10))
                int_multiplier*=10
                if int(str_product[::-1])==int_product:
                    break
            return str_product[::-1]

obj_test = Solution()
obj_test.multiply('648383427', '93073533')