// sub01_startContainer.tag


// Python script: starting docker containers and reading variables
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
file_path = 'D:\\tst_tagui\\mode_headless\\inputs\\formVariables.json'
jsonFile = open(file_path,'r')
json_f = json.load(jsonFile)
json_str = json.dumps(json_f)
print(json_str)

py finish

wait 16