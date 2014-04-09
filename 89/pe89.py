def abbreviate_roman(roman):
    return roman.replace('IIIII', 'V').replace('VV', 'X').replace('XXXXX', 'L').replace('LL', 'C').replace('CCCCC', 'D').replace('DD', 'M').replace('IIII', 'IV').replace('VIV', 'IX').replace('XXXX', 'XL').replace('LXL', 'XC').replace('CCCC', 'CD').replace('DCD', 'CM')

assert abbreviate_roman('IIIIIIIIIIIIIIII') == 'XVI'

count_raw = 0
count_abb = 0
for line in open('roman.txt'):
    line = line.rstrip()
    count_raw += len(line)
    abb = abbreviate_roman(line)
    count_abb += len(abb)
    print line, abb

print count_raw
print count_abb
print count_raw - count_abb
