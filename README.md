Programmingassignment3.3
========================

For making the tidy dataset I composed this set of different parts of available datasets. The different dataset I gave exact the same columnnames and combined
the datasets (rowwise). Exact the same I did this for the datasets containing the contents for subject and activity.
Input for making the final dataframe is the picture David Hood presented in the Discussion Forum in thread David's Course Projet FAQ. 

In detail:

Part 1:
Read the data-files for train and test in a dataframe
Read the headings-file (features) in a corresponding dataframe

Make a charachter-vector headerx for storing the columnames of the features dataframe

Use this vector as replacement for the columnnames in the data-frames train and test

Join the train and test dataframe rowwise
This is part1 dataframe

Read the subject-train-data for train in a dataframe subject_train
Read the subject-test-data for test in a dataframe subject_test
Attach on both dataframes a columname Subject
Join these two frames rowwise to get a new dataframe
This is the part2 dataframe in the code

Read the y_train and y_test txt-files in corresponding dataframes
Replace the columnname by the name Activity
Join these dataframes rowwise to one dataframe
This is dataframe part3

Read in the activity_labels txt-file in a dataframe activity_labels
Give the columns new headers Activity and Description_activity

To link dataframes part3 and activity_labels we use the join option
between these two data-frames. Joining over Activity
Only the description-column is selected by subsetting
The output is dataframe part4

Now I selected only those columns with the sentence std, mean, Subject or Activity in the columname.
For this I made a select-list (selcols[]) with a vector which contained the required fields.

The subsetting on the dataframes deliverd 4 dataframes with the wanted columns.
With a columnbind (cbind) I combined these dataframes to one dataframe (tottmp)

For part 3 of the course project I replaced the columnnames for Subject and Activity to a clean columnname.
I did no extra work on the other columnnames (Part 4 of the course project)

In step 5 I created the tidy-set by melting down the created set by Activity and Subject.

With dcast I did a group by on Subject and Activity and calculated the mean of
the group belonging to this group.

At the end I write the dataframe to a txt-file





the columname 








