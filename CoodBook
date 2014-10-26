##CoodBook/project##
After five part operate, my final data's name is "final_mean.txt".
The dim of the data is
```R
    dim(final_mean)
```
    [1] 180  81
We can see some of its column names as follows.
```r
    names(final_mean)
```
    "subject"
    "activity_name"
    "tBodyAcc_mean_X"
    "tBodyAcc_mean_Y"
    "tBodyAcc_mean_Z"
    "tBodyAcc_std_X"
The first column "subject" is the subject id idecate the 30 volunteers

    [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25    26 27 28 29 30  1  2 
The second column "activity_name" is the 6 activity names,and it is sort by Letter order.

    [1] "LAYING""LAYING""LAYING"
    
The other column names is the conversion from features.So it is easy to read.
For instance:

    change "tBodyAcc-mean()-X" to  "tBodyAcc_mean_X"
Then we can check some special data.
For instance:
  To find the subject == 3 ,activity_name == STANDING ,and the value of tBodyAcc_mean_Z.
  
    temp[temp$subject== 3&temp$activity_name=="STANDING",list(subject,activity_name,tBodyAcc_mean_Z)]  
    subject activity_name tBodyAcc_mean_Z
    1:       3      STANDING      -0.1016217
