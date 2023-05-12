import getpass
import os

"""
domain = os.environ['USERDOMAIN']
print(domain)
"""

"""
print(getpass.getuser()) #username
print(platform.node()) #hostname
"""

print(os.environ['userdomain'] + '\\' + getpass.getuser())