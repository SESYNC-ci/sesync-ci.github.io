---
category: quickstart
tags:
  - R
---

# {{ page.title }}

SESYNC provides access to RStudio in your browser in order to remotely run R code connected to other SESYNC
resources (file storage, databases, CPU's, etc). You can access RStudio by pointing your
web browser to <https://rstudio.sesync.org/> and using your SESYNC name and password to connect.

# Requesting Access

If your SESYNC account does not let you login at <https://rstudio.sesync.org/>, please email cyberhelp@sesync.org.

# Getting Started

There are a few things you'll need to know before you get started.

 - Your sesync username and password. If you forgot your name or password, please go to
 <https://pwm.sesync.org/> to reset your password.
    
 - If your group has a data directory, you will need to know its name. This will most
 likely be the same name as your group's collab site or the first part of your
 groups mailing list with -data appended.

> ## Connecting to R Studio
> 
> Point your web browser to https://rstudio.sesync.org and use your SESYNC username and password to login. Once you login, you will see the in-browser version of RStudio. If you've used the desktop version, it works almost identically.  
> 
> ## Starting a Project
> 
> 1.  Create a project by going to File -> New Project in RStudio.
> 2.  Choose the type of project:
> 
> *   New Directory - Use this if you are just testing or learning code.
> *   Version Control - If you are using an existing project that's on Gitlab or GitHub, or are planning on sharing your project with group members use this option. Please see 'Sharing a project' below for more details.
> 
> 4.  When choosing a directory for your project, you can use the default ~PROJECT_NAME unless you feel inclined to organize your home directory.  
>     

> ## Where should I save stuff?  
> 
> SESYNC provides two locations where you can save project code and data sets:  
> 
> *   **Individual Home Directory** \- When you first open R studio, you will be working in your home directory which is located at /research-home/USERNAME (e.g., /research-home/msmorul). This is your private directory and only you have access to the files in it. We strongly recommend that you save all project files and source code in to your home directory. This will protect against multiple group members attempting to update a project file at the same time. If you need to share code between project members please see 'Sharing a project' below.
> *   **Group Data Directory** \- If you've requested it your group will have a data directory available. This directory is located at /nfs/GROUP\_DIRECTORY where GROUP\_DIRECTORY is the short name of your group appended with -data. This will likely be the same as the name of your groups collab site and mailing list. For example, if your collab site is located at https://collab.sesync.org/groups/cool-trees, then your group's data will be located at /nfs/cool-trees-data. You can upload data to this directory either by saving output from R to folders there, or by using our file upload service described in the guide at \[\[How do I access SESYNC's data storage\]\]. You should store all shared data here. Examples of data types that should be placed here include csv files, landsat imagery, hdf5 data files--anything that's not code that you will be sharing with your group members.  
>     
> 
> ## Example:
> 
> > Let's assume that Jane Smith (sesync user jsmith) is part of the Cool Trees working group. Her group has a collab site setup at https://collab.sesync.org/groups/cool-trees and has requested a data directory and access to R Studio. Bob who is also part of that group has a lot of data that he wishes to share with Jane so she can access it on R Studio. Using SESYNC's file upload service at https://files.sesync.org, Bob uploaded the file lots-of-blue-trees.csv to his group's data share. Jane can now use the following code to access the newly uploaded file:  
> > 
> > setwd("/nfs/cool-trees-data")
> > bluetrees <- read.csv(file="lots-of-blue-trees.csv")
> > 
> >   

> ## Installing Packages

> > You may use either the menu (Tools -> Install Packages) or the R 'install.packages' command. If you receive and error saying the package cannot be installed there is a chance some underlying system library is not installed. Please e-mail itrequests@sesync.org and we will install the necessary system libraries for you. Most common (numpy, database drivers, etc)

  

# Sharing an R project

> We strongly encourage groups to use a version control system/code sharing system such as GitHub or GitLab to manage sharing between group members. SESYNC provides a free gitlab service which will allow groups to create private repositories. Please see our \[\[How do I create a new Git Project\]\] guide for more information on using this service.
> 
> Even if you don't plan on sharing your code with others, we recommend you use gitlab or github to track your code. This has the advantage of allowing you to easily rollback changes; invite SESYNC staff to assist in debugging your code; and copy your code to your own laptop or desktop.  
> 
> Creating a shared project is a two step process. A single group member first creates a git repository repository for the project and some initial code; then everyone else in the group clones a copy to their own directory.  
> 
> ## Creating the Project (one person)  

> 1.  Create a new Gitlab or Github project and copy the URL for the project (e.g., https://gitlab.sesync.org/groupname/project.git)  
>     
> 2.  Add your group members to the newly created project.
> 3.  The first group member should create a new project in R Studio by doing the following:
> 
> 1.  Create a new project and choose Version Control for the project type and select Git as the type of versioned project.
> 2.  Use the URL from step one as the 'Repository URL' for your new project.
> 
> 5.  After you've created a project, create your initial R code and a README.md describing your code.
> 6.  When your finished editing your code and would like to give others access to it, do a git Commit (Tools -> Version Control -> Commit), followed by a Push (Tools -> Version Control -> Push Branch)  
>     
> 
> ## Cloning the Project
> 
> 1.  All other group members will need to create a new RStudio Project the same way the first person did (File -> New Project -> Version Control -> Git) and enter the project URL.  
>     
> 2.  The group members will now be able to see the code that the first person pushed.  
>     

> ## Dealing with Data

> Since everyone will be working off of the same set of code, there are two options for working with data. If your data is really, really small (ie a csv with a few hundred rows) you can just include it in your project and allow it to be included in your git repository. Otherwise, load your project data into your groups directory at /nfs/GROUP_DIRECTORY so that everyone is able to see it and so that everyone is working off one common copy of the data.  

  

# Connecting to databases  

> ## MySQL Access
> 
> You may access MySQL resources provisioned by your group using R.
> 
> #  
> \# Load R MySQL Library and open a database connection  
> #  
> library("RMySQL");  
> mydb = dbConnect(MySQL(), user='DATABASEUSER', password='DATABASEPASSWORD', dbname='DATABASENAME', host='researchdb00.research.sesync.org');  
> #  
> \# Create a query  
> #  
> rs = dbSendQuery(mydb, "select * from MyTable;");  
> #  
> \# Load results into an R dataframe  
> #  
> data = fetch(rs, n=-1);    # Loads the result of the query into a dataframe called data
> 
> ## PostgreSQL Access
> 
> #### You may access PostgreSQL resources provisioned by your group using R in a similar manner. Substitute "RPostgreSQL" for "RMySQL" in the libary statement and change MySQL() to PostgreSQL() in the mydb statement.
> 
> #  
> \# Load R PostgreSQL library and open a database connection (replace SQLDB with a your postgres server)  
> #  
> library("RPostgreSQL");  
> mydb = dbConnect(PostgreSQL(), user='DATABASEUSER', password='DATABASEPASSWORD', dbname='DATABASENAME', host='SQLDB.research.sesync.org');  
> #  
> \# Create a query  
> #  
> rs = dbSendQuery(mydb, "select * from MyTable;");  
> #  
> \# Load results into an R dataframe.  
> #  
> data = fetch(rs, n=-1);    
>       \# Loads the result of the query into a dataframe called data​
> 
>       Tips
> 
> *   To rerun the dbSendQuery and reassign the result​ set, you must first clear the existing result set using the following statement: dbClearResult(rs)
> *   For more information on using Databases in R please see [http://cran.r-project.org/web/packages/dbConnect/dbConnect.pdf](http://cran.r-project.org/web/packages/dbConnect/dbConnect.pdf) and [http://www.r-bloggers.com/mysql-and-r/](http://www.r-bloggers.com/mysql-and-r/)  
>
