#include<bits/stdc++.h>
using namespace std;
typedef long double ld;
string toBool(int n,bool state){
    string ans = "";
    while(n){
        if(n % 2 == 0)
            ans = "0" + ans;
        else
            ans = "1" + ans;
        n/=2;
    }
    if(state){
        int size = ans.size();
        for(int i = 31-size;i>0;i--)
            ans = "0" + ans;
    }
    return ans;   
}
string toBoolFrac(ld val){
    string ans = "";
    while(ans.length() < 30){
        val = val * 2;
        if(floor(val) == 1){
            ans+="1";
            val = val - 1;
        }            
        else{
            ans+="0";
        }
    }
    return ans;
}

int main(){
    string ans1="";
    string ans2="";
    int n = -10;
    int val = pow(2,31)+1;
    if(n>0)
        ans1 = "0" + toBool(n,true);
    else
        ans1 = "1" + toBool(val-n,false);
    cout<<"32 bit representation of "<<n<<" is "<<ans1<<endl;
    ld m = 0.3;
    if(m >= 0)
        ans2+="0";
    else
        ans2+="1";
    int temp = floor(m);
    ld temp1 = m - temp; 
    string tt = toBool(temp,false);
    string tt1 = toBoolFrac(temp1);
    int exponent;
    if(tt.size()>1){
        exponent = 127 + tt.size() - 1;
        string x = toBool(exponent,false);
        ans2+=x;
        for(int i = 1;i<tt.size();i++){
            if(ans2.size() == 32){
                break;
            }
            if(tt[i] == '0')
                ans2+="0";
            else
                ans2+="1";
        }
        if(ans2.size()!=32){
            for(int j = 0;j<tt1.size();j++){
                if(ans2.size() == 32){
                break;
            }
            if(tt1[j] == '0')
                ans2+="0";
            else
                ans2+="1";
            }
        }
    }
    else if(tt.size() == 1 && tt[0] == '1'){
        exponent = 127;
        ans2+="0"+toBool(exponent,false);
        for(int j = 0;j<tt1.size();j++){
            if(ans2.size() == 32){
                break;
            }
            if(tt1[j] == '0')
                ans2+="0";
            else
                ans2+="1";
        }
    }
    else{
        int index;
        for(int i = 0; i < tt1.size();i++){
            if(tt1[i] == '1'){
                index = i;
                break;
            }
        }
        index++;
        exponent = -index + 127;
        ans2+="0"+toBool(exponent,false);
        for(int j = index;j<tt1.size();j++){
                if(ans2.size() == 32){
                break;
            }
            if(tt1[j] == '0')
                ans2+="0";
            else
                ans2+="1";
        }
    }
    cout<<"32 bit representation of "<<m<<" is "<<ans2<<endl;
    return 0;
}
