# Michael Peters
# Advent of Code: Day 5
# Language: Julia

idmax = 0
idmin = 1000
curr = 0
data = []

function determineID(str)
    max = 127
    min = -1

    max2 = 7
    min2 = -1

    remaining = 128
    remaining2 = 8
    
    result = 0
    result2 = 0

    substr_fb = SubString(str, 1, 7)
    substr_lr = SubString(str, 8, 10)

    for ltr in substr_fb
        remaining /= 2
        if ltr == 'B'
            min = max - remaining
            result = max
        else
            max = min + remaining
            result = min + remaining
        end
    end
    #-------------------------

    for ltr in substr_lr
        remaining2 /= 2
       if ltr == 'R'
            min2 = max2 - remaining2
            result2 = max2
        else
            max2 = min2 + remaining2
            result2 = min2 + remaining2
        end
    end

    newresult = (result * 8) + result2
    push!(data, newresult)
    return newresult
end

f = open("five.txt", "r")
while !eof(f)
    global curr
    global idmax
    global idmin
    line = readline(f)
    curr = determineID(line)

    if curr > idmax
        idmax = curr
    end
    if curr < idmin
        idmin = curr
    end
end 

close(f)
println("$idmax is the maximum value")
println("$idmin is the minimum value")

data = sort(data)
tmp = idmin - 1

for num in data
    global tmp
    if (num - 1) == tmp      
        tmp = num
    else
        val = num - 1
        println("$val is your seat")
        break
    end
end