# Michael Peters
# Advent of Code: Day 2
# Language: Julia

function determineValidityPartOne(str)
    substr = split(str, " ")
    
    amt = substr[1]
    amt_substr = split(amt, "-")
    min = parse(Int64, amt_substr[1])
    max = parse(Int64, amt_substr[2])
    
    letter = substr[2]
    letter_substr = split(letter, ":")
    letter = letter_substr[1]

    pw = substr[3]
    pw_len = length(pw)
    pw_match_count = 0

    for i in 1:pw_len
        if string(pw[i]) == string(letter)
            pw_match_count += 1
        end
    end
    if min <= pw_match_count <= max
        return(true)
    else
        return(false)
    end
end

function determineValidityPartTwo(str)
    substr = split(str, " ")
    
    amt = substr[1]
    amt_substr = split(amt, "-")
    first = parse(Int64, amt_substr[1])
    second = parse(Int64, amt_substr[2])
    
    letter = substr[2]
    letter_substr = split(letter, ":")
    letter = letter_substr[1]

    pw = substr[3]
    pw_len = length(pw)
    pw_match_count = 0

    first_result = (string(pw[first]) == string(letter))
    second_result = (string(pw[second]) == string(letter))
    return (first_result != second_result)
end

f = open("two.txt", "r")
valid_count_1 = 0
valid_count_2 = 0


while !eof(f)
    pw_info = readline(f)
    if determineValidityPartOne(pw_info)
        global valid_count_1 += 1
    end
    if determineValidityPartTwo(pw_info)
        global valid_count_2 += 1
    end
end 
close(f)

println("$valid_count_1 valid passwords (Part 1)")
println("$valid_count_2 valid passwords (Part 2)")


