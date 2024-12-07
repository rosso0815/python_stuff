
arr = ["eins", "zwei", "drei"]


def my_filter(entry):
    print(f'my_filer {entry}')
    return True


print(arr)
filtered_arr = [p for p in arr if p == "eins"]
print(filtered_arr)

filtered_arr = list(filter(lambda p: p == "zwei", arr))
print(filtered_arr)

filtered_arr = list(filter(my_filter, arr))
print(filtered_arr)


filtered = []
for a in arr:
    if my_filter(a):
        filtered.append(a)
print(filtered)