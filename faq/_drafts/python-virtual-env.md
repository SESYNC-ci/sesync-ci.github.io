---
title: How do I manage installed packages in my Python workflow?
tags:
 - Jupyter
 - Reproducible Research
---

Collaborative coding can benefit from having everyone use the same computing environment, including the same versions of packages, data, and code.  In Python, this can be done using virtual environments.  On SESYNC's Jupyter server, it take a little set-up to start using virtual envrionments.  

A Pipfile stores the information about your virtual environment.  If you have a Pipfile already, use the terminal to change to the directory containing your Pipfile, and run this code to see the path to your virtual environment.  

```{python}
pipenv --env
```

If you don't have a Pipfile, change to the directory where you would like to create one, and run 

```{python}
pipenv install
```

Take a look at the contents of the Pipfile, and see if it includes ipykernel.  If it does, it will look something like

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

If your Pipfile doesn't include ipykernel, run this code

```{python}
pipenv install ipykernel
```

Then you can activate your virtual environment by running

```{python}
pipenv shell
```

Next, add the kernel by running

```{python}
python -m ipykernel install --user --name=<name> --display-name=<"My Kernel Name">
```

Confirm that you've added the kernel by running

```{python}
jupyter kernelspec list
```

Now, you'll need to stop your current jupyter server (if running).  Go to the drop-down menu File > Hub Control Panel; it will pop open a new window, and you'll click "Stop My Server".  Jupyter lab will then ask if you'd like to restart your server; click Restart.  Once it restarts, you will see the new kernel in the Launcher, with the name you gave it during set-up.  




