# Michael Peters
# Advent of Code: Day 3
# Language: Julia

f = open("three.txt", "r")

data = []
results = []
part2 = [1,3,5,7]
while !eof(f)
    line = readline(f)
    append!(data, line)
end 

length = 31
arr_len = size(data, 1)
lines = trunc(Int64, (arr_len / length)) 

count = 0
right = 1
for num in 1:size(part2, 1)
    global count = 0
    global right = 1
    for line in 1:lines
        global count
        offset = (line - 1) * length
        global right = (right) % length
        if right == 0
            right = 31
        end
        if data[offset + right] == '#'
            count += 1
        end

        right += part2[num]
    end
    append!(results, count)
end

right = 1
count = 0
for line in 1:trunc(Int64, lines / 2)
    global count
    offset = ((line - 1) * 2) * length
    global right = (right) % length
    if right == 0
        right = 31
    end
    if data[offset + right] == '#'
        count += 1
    end

    right += 1
end
append!(results, count)

answer = 1
sz = size(results, 1)
for result in 1:sz
    global answer
    answer *= results[result]
end
println(results[2])
println(answer)

close(f)