type Person = String
type Number = Integer
type Phonebook = [(Person, Number)]

pb = [("Bob",2771234),("Allen",2772345),("Bob",2770123)]

addEntry:: Phonebook -> Person -> Number ->Phonebook
addEntry pb p n = [(p,n)]++pb

deleteEntry:: Phonebook -> Person ->Phonebook
deleteEntry pb p= [entry | entry <- pb, fst(entry) /= p] 

main = do
       print pb
       print(deleteEntry pb "Bob")