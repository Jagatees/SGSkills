# Intake: Sgcarmart Assistant

Collect these in order:

1. Mode
- `shortlist under budget`
- `beginner best-value recommendation`
- `specific listing review`

2. Required
- Total budget in SGD
- Comfortable monthly payment in SGD/month

3. Recommended
- Minimum COE left
- Preferred body type (`sedan`, `SUV`, `hatchback`, `MPV`, `any`)
- Fuel preference (`petrol`, `hybrid`, `diesel`, `EV`, `any`)
- Maximum mileage
- Maximum owners
- Monthly driving distance in km (default `1200`)

4. Optional salary affordability mode
- Monthly salary in SGD
- Salary type: `gross` or `take-home`
- Percent of take-home user is comfortable allocating to monthly car payment

Rules:
- If salary is gross, estimate take-home as `80%` of gross.
- If both direct monthly cap and salary-based cap are available, use the lower cap.
- If recommended fields are missing, continue with defaults and state assumptions.
