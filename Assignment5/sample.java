import java.io.*;
import java.lang.*;
class sample{
    public static int factorial(int val){
        int f = 1;
        int i = 1;
        while(i<val){
            i++;
            f = f * i;
        }
        return f;
    }
    public static void swap(int arr[],int i,int j){
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
    public static void main(String[] args){
        int valv = 10;
        int b = valv;
        valv+=1;
        System.out.println(b+valv);
        int val = (int)Math.pow(2,30) + 65534;
        System.out.println(val);
        float vv = (float)val;
        System.out.println(vv);
        int vvv = (int)vv-1;
        System.out.println(vvv);
        char s = (char)2;
        System.out.println((float)1/0);
        System.out.println(factorial(18));
        int[] arr = new int[3];
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        swap(arr,1,2);
        for(int i =0;i<3;i++)
            System.out.println(arr[i]);
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        int count = 0;
        int sum = 0;
        float avg = 0;
        int number;
        while(true){
            try{
                System.out.println("Enter number: ");
                number = Integer.parseInt(in.readLine());
                if(number >= 0){
                    sum+=number;
                    count++;
                }
                else{
                    if(count != 0)
                        avg=(float)sum / count;
                    break;
                }
            }
            catch(NumberFormatException e){
                System.out.println("Invalid number,please re-enter");
            }
            catch(IOException e){
                System.out.println("Input error,please re-enter");
            }
        }
        System.out.println("SUM : " + sum);
        System.out.println("AVERAGE : " + avg);
    }
}
