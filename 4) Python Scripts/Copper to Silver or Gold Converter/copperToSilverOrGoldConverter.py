def copperToSilverAndGold(value):
    gold = value // 10000
    value = value % 10000
    silver = value // 100
    copper = value % 100
    return f"{gold}g {silver}s {copper}c"

    
while True:
    user_input = input("Type the value in copper (or 'q' to quit): ")
    if user_input.lower() in ("q", "quit", "exit"):
        print("Exiting.")
        break
    try:
        value = int(user_input)
        if value < 0:
            print("Please enter a non-negative value.\n")
            continue
    except ValueError:
        print("Please use a valid integer value.\n")
        continue
    result = copperToSilverAndGold(value)
    print(result)

