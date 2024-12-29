#### __Read this in other languages:__ [[Chinese(中文)]](README_CHT.md)<br><br>

# **tagui_demo_01**

## **RPA: Implementing an example of integrating JavaScript and Python with TagUI for Web Automation**

### **Ⅰ. Purpose** 
In recent exploration of Robotic Process Automation, I experienced RPA tools including UiPath and Power Automate. However, this project is about open source RPA, TagUI. The content of this project is a demo to implement an example of integrating JavaScript and Python with TagUI for Web Automation.<br><br>

### **Ⅱ. Tools**
TagUI、JavaScript、Python<br><br>

### **Ⅲ. Statement**

__1. The steps of the process__ <br>

The process can be roughly divided into three steps:<br>

__Step_01:__ starting docker containers<br>
That is to run services including web site, API, Database, etc. (Please refer to [django_demo_01](<https://github.com/qinglian1105>))<br><br>
__Step_02:__ operation on website <br>
Firstly, TagUI would open browser Chrome on URL, 127.0.0.1:7000, and then select item, Credit Scorecards, of side menu. In additiion, TagUI would complete the form and then submit it. After returning predict results, TagUI would save them as variables. <br><br>
__Step_03:__ processing data with JavaScript and Python<br>
JavaScript code would parse variables into JSON string. Then, Python code would process them for displaying on terminal and save them into CSV file.<br> 

Concerning to the detail of the above steps, please refer to files: process_headless.tag, process_visual_automation.tag, and report.csv.<br><br> 

__2. About tag files__ <br>

As you can see in this project, there are two tag files, namely "process_headless.tag" and "process_visual_automation.tag".
The file "process_headless.tag" can be executed in headless mode by the command with parameter "-h" or "-headless". For example:

```bash
tagui file_name.tag -h
```

However, The file "process_visual_automation.tag" is unable to do so, because it runs in the mode of visual automation, scanning the screen with png files (Please refer to the folder - image).<br><br> 

__3. Results__ <br>

As mentioned above, the programming of the process has two ways for different modes.<br>

(1)headless mode<br>

![avatar](./README_png/png_result_headless.png)<br><br>

(2)visual automation mode<br>

![avatar](./README_png/png_result_va.png)<br><br>

As you can see from pictures, different modes produce the the same result.<br>

__The above offers an example of integrating JavaScript and Python with TagUI for Web Automation.__ <br>

Similar examples with different tools (Please refer to [uipath_demo_01](<https://github.com/qinglian1105/uipath_demo_01>)  or  [power_automate_demo_01](<https://github.com/qinglian1105/power_automate_demo_01>)) 
<br><br>

---

### **Ⅳ. References**

[1] [Top 5 Five Open Source RPA Frameworks to Accelerate Automation](<https://www.simplilearn.com/top-open-source-rpa-frameworks-to-accelerate-automation-article>)

[2] [AI Singapore - TagUI](<https://aisingapore.org/aiproducts/tagui/>)

[3] [aisingapore/TagUI](<https://github.com/aisingapore/TagUI>)

[4] [Introduction to Opensource RPA TagUI](<https://www.youtube.com/watch?v=1JRuSZNBBUk&list=PL2gs9_mNDDvZSCPsJu4APZR6AaDzUY7R6>)

[5] [TagUI — TagUI 6.110.0 documentation](<https://tagui.readthedocs.io/en/latest/>)