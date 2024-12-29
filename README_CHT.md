#### __Language:__ [[English]](README.md) [[中文]](README_CHT.md)<br><br>

# **tagui_demo_01**

## **RPA：一個Web Automation例子展現TagUI與JavaScript、Python整合**

### **Ⅰ. 目的** 
研調 機器人流程自動化 (Robotic Process Automation, RPA)，實作開源RPA軟體 - TagUI來操作「應用程式」及「網頁」，並在其流程中使用JavaScript及Python處理資料。 
<br><br>

### **Ⅱ. 主要工具**
TagUI、JavaScript、Python<br><br>



### **Ⅲ. 說明**
__1.流程步驟__ <br>

Step_01: starting docker containers<br>
TagUI開啟應用程式「Docker Desktop」，然後啟動相關服務，如：前端網頁、後端API及資料庫…等( 詳見 [專案django_demo_01](<https://github.com/qinglian1105>) )。<br>

Step_02: operation on website <br>
TagUI開啟瀏覽器(Chrome)，到一個網站( 127.0.0.1:7000/login，如上述專案 ) ，接著輸入帳密登入進入首頁後，於左側side menu點選「信用評分預測(Credit Scorecards)」選單，即進入目標頁面，填完Form的 7 個變數資料，點擊按鍵「Predict Score」後，將於下方以藍色文字及儀表盤呈現預測結果(分數、評級)。 <br>

Step_03: processing data with JavaScript and Python<br>
由JavaScript程式擷取預測結果，Python程式將編輯內容及寫入CSV檔，然後返回予終端機(Terminal)顯示，完成整個Process自動化。(以上詳見檔案 process_headless.tag、process_visual_automation.tag 及 report.csv)
<br><br>
__2. 關於tag檔案__ <br>
專案中有二個tag檔案，分別為「process_headless.tag」及「process_visual_automation.tag」。前者可以headless模式執行，於執行命令加上參數 -h 或 -headless，例：

```bash
tagui file_name.tag -h
```

然而，後者無法如此，因為它以visual automation模式執行，即使用資料夾image的png檔作螢幕掃描處理。<br><br> 
__3. 執行結果畫面__ <br>
(1)headless模式<br>

![avatar](./README_png/png_result_headless.png)<br><br>

(2)visual automation模式<br>

![avatar](./README_png/png_result_va.png)<br><br>

如上二圖所示，不同模式，執行結果相同。<br>

__以上，一個Web Automation例子展現TagUI與JavaScript、Python整合。__ <br>

(相似專案 [uipath_demo_01](<https://github.com/qinglian1105/uipath_demo_01>)  or  [power_automate_demo_01](<https://github.com/qinglian1105/power_automate_demo_01>) 請參考)

<br><br><br>

---

### **Ⅳ. 參考**

[1] [Top 5 Five Open Source RPA Frameworks to Accelerate Automation](<https://www.simplilearn.com/top-open-source-rpa-frameworks-to-accelerate-automation-article>)<br>
[2] [AI Singapore - TagUI](<https://aisingapore.org/aiproducts/tagui/>)<br>
[3] [aisingapore/TagUI](<https://github.com/aisingapore/TagUI>)<br>
[4] [Introduction to Opensource RPA TagUI](<https://www.youtube.com/watch?v=1JRuSZNBBUk&list=PL2gs9_mNDDvZSCPsJu4APZR6AaDzUY7R6>)<br>
[5] [TagUI — TagUI 6.110.0 documentation](<https://tagui.readthedocs.io/en/latest/>)<br>
