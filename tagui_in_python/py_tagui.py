import os
import time
import json
import pandas as pd
import rpa as r


class WebAutoTagui():     
     
     file_form = ["formVariables.json"]
     output_file = ["report.csv"]
     file_cv = ["local_csv.json", "local_csv_va.json"]
     ctns = ["pg_01", "mongodb_01", "fastapi_01", "django_01"]
     cmd_01 = "docker desktop start"
     cmd_02 = "docker start {}"
     msg = "Mode: {} \nYour Inputs: \n {} \nYour Outputs: \n {}" 
     
     def __init__(self, play_mode): 
        self.play_mode = play_mode         
            
     # Start docker containers
     def start_docker_containers(self):
        os.system(self.cmd_01)
        time.sleep(16)
        for service in self.ctns:
            cmd = self.cmd_02.format(service)
            os.system(cmd)
            time.sleep(0.5)        
        print("---> Containers are running")    
        time.sleep(2.5) 

     # Read JSON file for variables   
     def get_obj(self, play_mode): 
        jlist = []
        pwd = os.getcwd()
        fpath = os.path.join(pwd, 'inputs', self.file_form[0])
        jsonFile = open(fpath,'r')
        json_f = json.load(jsonFile)
        jlist.append(json_f)
        if play_mode in ["visual automation"]:
           fpath = os.path.join(pwd, 'inputs', self.file_cv[1])
        else:
           fpath = os.path.join(pwd, 'inputs', self.file_cv[0])                                                           
        jsonFile = open(fpath,'r')
        json_r = json.load(jsonFile)
        jlist.append(json_r)
        return jlist          

     # Operate website and get data from page
     def operation_on_website(self, f_variables, web_variables, play_mode):
        if play_mode in ['headless']:
           init_list = [True, False]
        else:         
           init_list = [False, True]      
        r.init(headless_mode=init_list[0], visual_automation=init_list[1])
        r.url(web_variables['django_demo_01'])    
        if play_mode in ['visual automation']:
           r.click(web_variables['click_browser_maximize'])
        r.type(web_variables['input_username'] , f_variables['account'])
        r.type(web_variables['input_pwd'] , f_variables['pwd'])
        r.click(web_variables['click_login'])
        time.sleep(1)
        r.click(web_variables['click_scorecards'])
        r.type(web_variables['input_annual_inc'] , f_variables['annual_inc_bin'])
        r.type(web_variables['input_loan_amnt'] , f_variables['loan_amnt_bin'])
        r.type(web_variables['input_int_rate'] , f_variables['int_rate_bin'])
        r.select(web_variables['select_purpose'] , f_variables['purpose'])
        r.select(web_variables['select_grade'] , f_variables['grade'])
        r.select(web_variables['select_home'] , f_variables['home_ownership'])
        r.select(web_variables['select_pub_rec'] , f_variables['pub_rec_bankruptcies'])
        r.click(web_variables['click_predict_score'])
        time.sleep(1)     
        predictions = r.dom(web_variables['dom_cmd'])
        # if play_mode in ['visual automation']:
        #    r.click(web_variables['click_log_out'])
        #    r.click(web_variables['click_logout'])   
        #    r.click(web_variables['click_close'])     
        r.close()
        print("---> Completed the operation on website")
        return predictions
     
     # Process data for display in terminal and save CSV file
     def process_display(self, play_mode, f, predictions):
        del f['account']
        del f['pwd']
        msg = self.msg.format(play_mode, json.dumps(f), predictions) 
        obj = json.loads(predictions)
        f['score'] = obj['score']
        f['level'] = obj['level']
        df = pd.DataFrame([f])
        pwd = os.getcwd()
        file_path = os.path.join(pwd, 'outputs', self.output_file[0])
        df.to_csv(file_path, index=False)
        print("---> Precessed string and saved CSV file")
        return msg   
     
     # Main process 
     def main_process(self):
        self.start_docker_containers()
        variables = self.get_obj(self.play_mode) 
        predictions = self.operation_on_website(variables[0], variables[1], self.play_mode)
        msg = self.process_display(self.play_mode, variables[0], predictions)
        print("-"*30)
        print(msg)
        print("-"*30)


if __name__ == "__main__":
   play_modes = ["headless", "visual automation"] 
   # Choose mode as shown above  
   ti = WebAutoTagui(play_modes[1])   
   ti.main_process()



# python py_tagui.py    