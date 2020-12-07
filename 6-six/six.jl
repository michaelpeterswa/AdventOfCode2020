# Michael Peters
# Advent of Code: Day 6
# Language: Julia

linecoll = []
groups = []

linecoll2 = []
people = []
groups2 = []

total = 0
total2 = 0

function partOne()
    f = open("six.txt", "r")
    while !eof(f)
        global linecoll
        line = readline(f)

        if line == ""
            push!(groups, sort(unique(linecoll)))
            linecoll = []
        else
            append!(linecoll, line)
        end
    end 
    if eof(f)
        push!(groups, sort(unique(linecoll)))
    end

    for line in groups
        global total
        total += length(line)
    end
    println("$total: total")
    close(f)
end

function partTwo()
    count = 0
    passing = []

    f = open("six.txt", "r")
    while !eof(f)
        global linecoll2
        global groups2
        line = readline(f)

        if line == ""
            push!(groups2, linecoll2)
            push!(people, count)
            count = 0
            linecoll2 = []
        else
            count += 1
            append!(linecoll2, line)
        end
    end 

    if eof(f)
        push!(groups2, linecoll2)
        push!(people, count)
    end

    for line in groups2
        global total
        total += length(line)
    end
    
    for group in 1:length(groups2)        
        grp = groups2[group]
        src = join(grp)
        ltr = []
        println(src)
        for letter in grp
            reg = "$letter"
            amt = length(collect(eachmatch(Regex(reg), src)))
            if amt == people[group]
                ltr_join = join(ltr)
                ltr_cnt = length(collect(eachmatch(Regex(reg), ltr_join)))
                if ltr_cnt == 0
                    append!(passing, letter)
                    println("passed $letter")
                    append!(ltr, letter)
                end
            end
        end
    end

    total = length(passing)
    println("$total: total part two")
    close(f)
end

partOne()
partTwo()
