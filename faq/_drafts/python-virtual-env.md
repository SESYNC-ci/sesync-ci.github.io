---
title: How do I create a virtual environment for my Python workflow?
tags:
 - Jupyter
 - Reproducible Research
---

Collaborative coding can benefit from having everyone use the same computing environment, including the same versions of packages, data, and code.  In Python, this can be done using virtual environments.  You can create a virtual environment for each project or analysis, as long as they are in different directories.  On SESYNC's Jupyter server, it takes a little set-up to start using virtual envrionments.  

-----

### 1)
A Pipfile stores the information about your virtual environment and the dependencies of your project.  It replaces the requirements.txt file that can be used in Python projects.  If you have a Pipfile already, use the terminal to change to the directory containing your Pipfile, and run this code to see the path to your virtual environment.  

```
pipenv --venv
```

If you don't have a Pipfile, change to the directory where you would like to create one, and run 

```
pipenv install
```

### 2)
Take a look at the contents of the Pipfile, and see if it includes ipykernel.  You can view this file by typing `cat Pipfile` in your terminal, or by opening it through your file browser with any text editor.  Your Pipfile will look something like

```
[[source]]
url = "https://pypi.org/simple"
verify_ssl = true
name = "pypi"

[packages]
ipykernel = "*"

[dev-packages]

[requires]
python_version = "3.8"
```

If your Pipfile doesn't include ipykernel, run this code (it may take a few minutes).

```
pipenv install ipykernel
```

### 3) 
Then you can activate your virtual environment by running

```
pipenv shell
```

### 4) 
Next, add the kernel by running the following code.  Give your kernal a name and a display name of your choosing by replacing <"kernal name"> and <"My Official Kernal Name">. 

```{python}
python -m ipykernel install --user --name=<"kernal name"> --display-name=<"My Official Kernel Name">
```

Confirm that you've added the kernel by running

```
jupyter kernelspec list
```

Your list of kernels will look something like this

```
Available kernels:
  test-kernel    /research-home/user/.local/share/jupyter/kernels/test-kernel
  python3        /research-home/user/.local/share/virtualenvs/Python_test_env-VLKWaVDK/share/jupyter/kernels/python3
  bash           /usr/local/share/jupyter/kernels/bash
  python2        /usr/local/share/jupyter/kernels/python2
```

### 5) 
Now, you'll need to stop your current jupyter server (if running).  Go to the drop-down menu File > Hub Control Panel.  
![](/assets/images/hub-control.PNG){: align="left" style="padding-right: 25px"}

This will pop open a new tab/window, and you'll click "Stop My Server".  
![](/assets/images/jupyter_server.PNG){: align="left" style="padding-right: 25px"}

Jupyter lab will then ask if you'd like to restart your server; click Restart. 
![](/assets/images/server_not_running.PNG){: align="left" style="padding-right: 25px"}

Once it restarts, you will see the new kernel in the Launcher, with the name you gave it during set-up. 
![](/assets/images/new-kernel.PNG){: align="left" style="padding-right: 25px"}

Again, if you have multiple projects for which you would like separate virtual environments, you can run the above set-up code sequence to create a different virtual environment in each separate project directory.  

### 6) 
If you would like to delete your kernel at any point, run the following (replacing kernelname with the name of your kernel).

```
jupyter kernelspec uninstall kernelname
```

It will ask you to confirm the deletion by typing `y` or cancel the deletion by typing `N`.  

