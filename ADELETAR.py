import re


a = re.findall(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$", "Ezt721sh")
print(a)