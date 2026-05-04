from datetime import datetime, date
from dateutil.relativedelta import relativedelta

def date_tool():
    
    now = datetime.now()
    print(f"Current Date and Time: {now.strftime('%Y-%m-%d %H:%M:%S')}")
    print("-" * 30)
    d1 = date(2024, 1, 1)
    d2 = date(2025, 1, 1)
    delta = abs((d2 - d1).days)
    print(f"Days between {d1} and {d2}: {delta} days")
    target_date = date(1969, 7, 20)
    day_name = target_date.strftime("%A")
    print(f"The day of the week for {target_date} was a {day_name}.")
    birth_date = date(1995, 5, 15)
    today = date.today()
    age = relativedelta(today, birth_date)
    
    print(f"Age based on DOB {birth_date}:")
    print(f"{age.years} years, {age.months} months, and {age.days} days.")

if __name__ == "__main__":
    date_tool()

