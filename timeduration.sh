#!/usr/bin/env python3


# Function to convert time to minutes
def time_to_minutes(time_str):
    time_parts = time_str.split()
    hours, minutes = map(int, time_parts[0].split(':'))
    period = time_parts[1].lower() if len(time_parts) > 1 else None
    
    if period == 'p.m.' and hours != 12:
        hours += 12
    elif period == 'a.m.' and hours == 12:
        hours = 0
    
    return hours * 60 + minutes

# Function to calculate time difference
def calculate_time_difference(start_time, end_time):
    start_minutes = time_to_minutes(start_time)
    end_minutes = time_to_minutes(end_time)

    difference = end_minutes - start_minutes

    if difference < 0:
        difference += 1440  # 1440 minutes in a day

    hours = difference // 60
    minutes = difference % 60

    return hours, minutes

# Main script
if __name__ == "__main__":
    # Get current time
    import datetime
    current_time = datetime.datetime.now().strftime("%I:%M %p")

    # Input start time
    start_time = input("Enter start time (e.g. 9:01 a.m.): ")

    # Input end time
    end_time = input("Enter end time (e.g. 5:35 p.m.): ")

    # Calculate time difference
    hours, minutes = calculate_time_difference(start_time, end_time)

    print(f"Time difference between {start_time} and {end_time} is {hours} hours and {minutes} minutes.")
