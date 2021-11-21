i = 1
while i <= 15
 if i % 3 == 0 and  i % 5 == 0
    p "Fizz Buzz"
 else
    if i % 3 == 0
        p "Fizz"
    end
    if i % 5 == 0
        p "Buzz"
    end
    if i % 3 != 0 and  i % 5 != 0
        p i
    end
 end
 i = i + 1
end