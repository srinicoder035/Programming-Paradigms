def func(arr,i,j):
    temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
    print(arr)

arr = [1,2,3,4,5]
print(arr)
func(arr,3,4)
print(arr)