// 1. Python script: starting docker containers and reading variables

py begin

import os
import time
import json

# Start docker containers
ctns = ["pg_01", "mongodb_01", "fastapi_01", "django_01"]
cmd_01 = "docker desktop start"
os.system(cmd_01)
time.sleep(16)
for ctn in ctns:
    cmd_02 = "docker start {}".format(ctn)
    os.system(cmd_02)
    time.sleep(0.5)

# Read variables
jsonFile = open('D:\\tst_tagui\\inputs\\formVariables.json','r')
json_f = json.load(jsonFile)
json_str = json.dumps(json_f)
print(json_str)

py finish

echo `py_result`
wait 16


// 2. JavaScript: parsing json string
js f = JSON.parse(py_result)
echo `f`


// 3. Operation on web pages
// (1) Go to django_demo_01
click image/tag_chrome_blank.png
http://127.0.0.1:7000
wait 1

// (2) Page: login
account = f.account
pwd = f.pwd
type //input[@name='username'] as `account`
type //input[@name='password'] as `pwd`
//click //body/div/div/div/div/form/button
click image/tag_login.png

// (3) Page: scorecard
annual_inc_bin = f.annual_inc_bin
loan_amnt_bin = f.loan_amnt_bin
int_rate_bin = f.int_rate_bin
purpose = f.purpose
grade = f.grade
home_ownership = f.home_ownership
pub_rec_bankruptcies = f.pub_rec_bankruptcies
click image/tag_scorecards.png

type //input[@id='annual_inc_bin'] as `annual_inc_bin`
type //input[@id='loan_amnt_bin'] as `loan_amnt_bin`
type //input[@id='int_rate_bin'] as `int_rate_bin`
select //select[@id='purpose'] as `purpose`
select //select[@id='grade'] as `grade`
select //select[@id='home_ownership'] as `home_ownership`
select //select[@id='pub_rec_bankruptcies'] as `pub_rec_bankruptcies`

click image/tag_predict_score.png
wait 2
dom return document.querySelector('#scorecard_outputs').textContent
wait 1
echo `dom_result`
wait 1
click image/tag_log_out.png
click image/tag_logout.png

py_step("dom_result = '"+ dom_result + "'")
py_step("json_str = '"+ py_result + "'")


// 4. Python code: processing variables and writing into CSV

py begin

import os
import time
import shutil
import json
import pandas as pd

dict_form_vars = json.loads(json_str)
del dict_form_vars['account']
del dict_form_vars['pwd']
dict_result = json.loads(dom_result)
demo = "-"*30 + "\n" +"Your Inputs" + "\n" + json.dumps(dict_form_vars) + "\n" + "Your Outputs" + "\n" + json.dumps(dict_result) 
for k,v in dict_result.items():
    dict_form_vars[k] = v

file_name = "report.csv"
df = pd.DataFrame.from_dict([dict_form_vars])    
df.to_csv(file_name, index=False)
f1 = "C:\\tagui\\src\\{}".format(file_name)
f2 = "D:\\tst_tagui\\outputs\\{}".format(file_name)
shutil.copyfile(f1, f2)   
time.sleep(0.5) 
print(demo)

py finish

echo `py_result`

// tagui process_visual_automation.tag 