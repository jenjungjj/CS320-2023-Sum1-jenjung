
xs = [x * x for x in range(10)]
print("xs =", xs)

# producing generator 
xs1 = (x * x for x in range(1000000000))
print("xs1 =", xs1)

# list method
xs2 = [(i, x * x) for (i, x) in enumerate(range(10))]
print("xs2 = ", xs2)

# list_map(list_fromto(0, 10), fn x => x * x) 