type Person = String
type Number = Integer
type Phonebook = [(Person, Number)]

pb = [("Bob",2771234),("Allen",2772345),("Bob",2770123)]

addEntry:: Phonebook -> Person -> Number ->Phonebook
addEntry pb p n = [(p,n)]++pb

deleteEntry:: Phonebook -> Person -> Number ->Phonebook
deleteEntry pb p n = [entry | entry <- pb, entry /=  (p,n)] 

main = do
       print pb
       print(addEntry pb "Jane" 1223345)
       print(deleteEntry pb "Bob" 2770123)