// sub03_operateWebsite.tag


// Operation on web pages
// (1) Go to django_demo_01
echo `f`
`django_demo_01`
wait 1
click `click_browser_maximize`

// (2) Page: login
account = f.account
pwd = f.pwd
type `input_username` as `account`
type `input_pwd` as `pwd`
click `click_login`
wait 1.5

// (3) Page: scorecard
annual_inc_bin = f.annual_inc_bin
loan_amnt_bin = f.loan_amnt_bin
int_rate_bin = f.int_rate_bin
purpose = f.purpose
grade = f.grade
home_ownership = f.home_ownership
pub_rec_bankruptcies = f.pub_rec_bankruptcies

dclick `click_scorecards`
type `input_annual_inc` as `annual_inc_bin`
type `input_loan_amnt` as `loan_amnt_bin`
type `input_int_rate` as `int_rate_bin`
select `select_purpose` as `purpose`
select `select_grade` as `grade`
select `select_home` as `home_ownership`
select `select_pub_rec` as `pub_rec_bankruptcies`
click `click_predict_score`
wait 1
dom return document.querySelector('#scorecard_outputs').textContent
wait 1
click `click_log_out` 
click `click_logout`