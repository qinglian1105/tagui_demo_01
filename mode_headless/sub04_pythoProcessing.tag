// sub04_pythoProcessing.tag


echo `dom_result`
py_step("dom_result = '"+ dom_result + "'")
py_step("json_str = '"+ py_result + "'")

// Python code: processing variables and writing into CSV
py begin

import os
import time
import shutil
import json
import pandas as pd

# Process the string for display
dict_form_vars = json.loads(json_str)
del dict_form_vars['account']
del dict_form_vars['pwd']
dict_result = json.loads(dom_result)
demo = "-"*30 + "\n" +"Your Inputs" + "\n" + json.dumps(dict_form_vars) + "\n" + "Your Outputs" + "\n" + json.dumps(dict_result) 
for k,v in dict_result.items():
    dict_form_vars[k] = v

# Save string into CSV file
file_name = "report.csv"
df = pd.DataFrame.from_dict([dict_form_vars])    
df.to_csv(file_name, index=False)
f1 = "C:\\tagui\\src\\{}".format(file_name)
f2 = "D:\\tst_tagui\\mode_headless\\outputs\\{}".format(file_name)
shutil.move(f1, f2)  
time.sleep(0.5) 
print(demo)

py finish

echo `py_result`