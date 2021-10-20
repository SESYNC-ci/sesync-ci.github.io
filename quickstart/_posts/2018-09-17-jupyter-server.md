---
title: Jupyter Server
tags:
 - Python
sticky: true
---

SESYNC provides access to remote JupyterLab sessions via a web browser. The
[Jupyter Project](https://jupyter.org) provides an environment for Python
development, and SESYNC's Jupyter Server adds direct connections to resources
like shared file storage, databases, GitLab, and a compute cluster.

## Connecting

You can access Jupyter by pointing any web browser to
<https://jupyter.sesync.org/> and logging in with your SESYNC username and
password. If you forgot your username or password, please go to
<https://pwm.sesync.org/>. If your SESYNC credentials do not give you access,
please email **{{ site.email }}** and ask to enable this resource for your
account or whole team.

## Running JupyterLab

Once you log in, you will see a JupyterLab interface. To learn how to use all
the features of the JupyterLab IDE, check out the complete
[documentation](https://jupyterlab.readthedocs.io/en/stable/user/interface.html).

## Python Packages

User contributed Python packages can be installed on JupyterLab by using the
"pip3" or "pip3.8" utility from the Terminal, depending on whether you are
using a Python 3.6 or Python 3.8 kernel. To avoid a permission error, please use the
`--user` flag. For instance, using the Terminal launched from Jupyter:

```bash
<USERNAME>@sesync01:~$ pip3 install --user <PACKAGE>
```

If you receive an error stating that the package cannot be installed, there is a
chance that some underlying system library is not installed. Please email the
error message to **{{ site.email }}**, and explain which package you need to
install.

**Note for advanced users**: Instead of installing individual packages with the 
`--user` flag, we recommend creating a project-specific kernel with a specific version of Python and
installing only the packages you need for your project into that environment. 
This is good for reproducibility because it ensures that your code is always executed in 
the same environment. See the [FAQ on creating a virtual environment][venvfaq]
on the Jupyter server for more details.

## Where should I save stuff?

"Stuff" usually belongs in one of three places:

1. Research home directory ("~/" or equivalently "/research-home/USERNAME/").
1. Research data directory ("/nfs/PROJECTNAME-data")
1. Version controlled project (e.g. on GitLab and cloned into "~/")

## Research Home Directory

When you first open JupyterLab, you will be working in your home directory which
is located at "/research-home/USERNAME" or equivalently "~/". This is a private
directory, and only you have access to the files in it. We strongly recommend
that you save source code in your home directory. This will protect against
multiple group members attempting to update a project file at the same time. If
you need to share code between project members please use a version control
application such as GitLab or GitHub.

## Research Data Directory

If you have requested it, your group will have a data directory available. Your
research data directory appears on <https://files.sesync.org/> as
PROJECTNAME-data, where PROJECTNAME is the short name assigned for your project
by SESYNC, and is accessed from <https://jupyter.sesync.org> at the path
"/nfs/PROJECTNAME-data". You can add to this directory either by saving output
from Python to folders there, or by using one of the options for uploading
described in [Quick Start: Research Data Directory]({{
'/quickstart/research-data-directory.html' | relative_url }}). You should store
all shared data here. Examples of data types that should be placed here include
csv files, landsat imagery, hdf5 data files--anything that makes sense to have
only a single copy, with access shared by your project members.

Note that to connect to the  research data directory, you will need to create a symlink 
to your root project directory by opening the terminal in JupyterLab and typing:

```
ln -s /nfs/PROJECTNAME-data PROJECTNAME-data
```

See the [FAQ on creating a symlink][symlinkfaq] for more information.

## Dealing with Data

Since everyone will be working off of the same set of code, there are three
options for working with data. If your data is quite small (i.e. a CSV with a
few hundred rows, also known as "small-batch artisanal data") you can include it
in your project, push it to your remote repository, and everyone will have a
clone. Larger datasets should be in your Research Data Directory so that
everyone is able to work off one shared copy of the data. Very large datasets
may need to be loaded into a RDBMS, and SESYNC provides both MySQL and
PostgreSQL servers for this purpose.

Let's assume that J. Smith (with USERNAME "jsmith") is part of the "Trees and
Urban Heat Island Mitigation" working group. When J. Smith logs in to
<https://files.sesync.org>, the directory "cooltrees-data" will indicate that the
PROJECTNAME mentioned above is cooltrees. Data can be written and read into
JupyterLab. For example, a script saved as "~/example_script.py" could include:

```python
import os
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Parameters and arguments

out_dir = '/nfs/cooltrees-data'

# Generate example data
x = np.arange(0., 10., 0.4)
y = x**2

plt.plot(x, y, 'bs')
plt.xlabel('x')
plt.ylabel('y')

out_plot_filename = os.path.join(out_dir, 'x_y_plot.png')
plt.savefig(out_plot_filename)

# Write out test data to current directory
dataset = pd.DataFrame({'x':x, 'y':y})
## print(dataset)
out_filename = os.path.join(out_dir, 'dataset.csv')
## write out to csv
dataset.to_csv(out_filename)
```

## See also

- [FAQ: how to create a virtual environment on the Jupyter server][venvfaq]
- [FAQ: using git on the Jupyter server][gitfaq]
- [FAQ: creating a symlink on the Jupyter server][symlinkfaq]

[venvfaq]: {{ 'faq/python-virtual-env.html' | relative_url }}
[gitfaq]: {{ 'faq/git-and-jupyterlab.html' | relative_url }}
[symlinkfaq]: {{ 'faq/how-to-create-a-symlink-to-research-directory-in-Jupyter-lab.html' | relative_url }}
