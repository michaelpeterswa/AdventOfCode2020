# Michael Peters
# Advent of Code: Day 4
# Language: Julia

f = open("four.txt", "r")

line_data = []
big_data = Any[]
required = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid" ]
optional = ["cid"]
eye_cols = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
valid_chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']
count = 1
valid = 0

while !eof(f)
    global line_data
    global big_data
    line = readline(f)
    if line != ""
        append!(line_data, " ")
        append!(line_data, line)
    elseif line == ""
        push!(big_data, line_data)
        line_data = []
        # println("-=-=-=-=-=-=-=-=-=-=-=-")
    end
end 
if eof(f)
    push!(big_data, line_data)
end

# length(big_data)
for arr in 1:length(big_data)
    req_count = 0
    global required
    global valid
    clean = lstrip(join(big_data[arr]))
    clean = split(clean, " ")
    new = []
    for elm in clean
        elm = split(elm, ":")
        
        if (elm[1] == "byr")
            if !(1920 <= parse(Int64, elm[2]) <= 2002)
                elm[1] = "byrinv"
            end
        end

        if (elm[1] == "iyr")
            if !(2010 <= parse(Int64, elm[2]) <= 2020)
                elm[1] = "iyrinv"
            end
        end

        if (elm[1] == "eyr")
            if !(2020 <= parse(Int64, elm[2]) <= 2030)
                elm[1] = "eyrinv"
            end
        end

        if elm[1] == "hgt"
            str_elm = string(elm[2])
            str_len = length(str_elm)
            if str_len == 4
                str_num = SubString(str_elm, 1, 2)
            elseif str_len < 4
                elm[1] = "hgtinv"
            else
                str_num = SubString(str_elm, 1, 3)
            end
            str_elm = SubString(str_elm, str_len - 1, str_len)
            if str_elm == "cm"
                if !(150 <= parse(Int64, str_num) <= 193)
                    elm[1] = "hgtinv"
                end

            elseif str_elm == "in"
                if !(59 <= parse(Int64, str_num) <= 76)
                    elm[1] = "hgtinv"
                end
            else
                elm[1] = "hgtinv"
            end
        end

        if elm[1] == "hcl"
            elm2 = elm[2]
            if elm2[1] != '#'
                elm[1] = "hclinv"
            end
        end

        if elm[1] == "ecl"
            valid_eyecl = false
            for col in eye_cols
                if isequal(col, elm[2])
                    valid_eyecl = true
                end
            end
            if !valid_eyecl
                elm[1] = "eclinv"
            end
        end

        if elm[1] == "pid"
            fir = elm[1]
            snd = elm[2]
            snd_len = length(elm[2])
            if snd_len != 9 
                elm[1] = "pidinv"
            end
        end

        elm = deleteat!(elm, 2)
        push!(new, elm)
    end
    # print(new)
    for elm in new
        elm = elm[1]
        for field in required
            if isequal(elm, field)
                req_count += 1
            end
        end
    end
    if isequal(req_count, length(required))
        # println("valid")
        valid += 1
    else
        # println("invalid")
    end
end
println("$valid entries are valid")
close(f)