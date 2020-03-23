---
title: Running code in parallel on a Windows virtual machine
tags:
  - Virtual Machine
  - Windows
  - parallel
---

If you have a program that runs only on Windows systems, and you would like to run the program in parallel, it is not possible to use SESYNC's [Slurm cluster]({{ '/faq/What-is-the-SESYNC-cluster.html' | relative_url }}). However, it is possible to take advantage of SESYNC's Winanalytics [virtual machine]({{ '/faq/what-is-a-virtual-machine.html' | relative_url }}) , which has multiple cores and much more available RAM than the typical laptop. You will need to write a little bit of code in PowerShell, which is Windows' shell scripting languge and is fairly similar to Bash scripting. Here is a quick walkthrough of how to do this.

# Writing a PowerShell script to run multiple processes in parallel

PowerShell scripting language provides a construction called a "[workflow](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/jj134242(v=ws.11)?redirectedfrom=MSDN)" in which you can write a loop that is executed in parallel. This FAQ does not go into great detail about how to write PowerShell scripts, but the following is a basic template that you can modify to create a simple script that will run multiple instances of the same program in parallel, each time taking a different file as input. *(Borrowed from [this StackOverflow answer](https://stackoverflow.com/a/56963199/2854608) by user js2010)*

```
workflow run_in_parallel {
  $file_names = "foo.txt","bar.txt","baz.txt"
  foreach -parallel ($name in $file_names) { 
    <insert full path to your program here> "Z:\files\$($name)" 
    "$($name) done" 
  }
}

run_in_parallel

```

*Note*: If the file path to your program has spaces in it, as is sometimes the case with Windows (for example, `C:\Program Files (x86)\...`), you will need to wrap the command on line 4 in the above script with an "inline script," and quote the path name, as follows: `InlineScript {  & "<insert full path to your program here>" "Z:\files\$($name)" }`. See [this Microsoft documentation page](https://docs.microsoft.com/en-us/powershell/module/psworkflow/about/about_inlinescript?view=powershell-5.1) for more information.

Save this script to somewhere on your research data directory. In this example it is saved in a subdirectory called `scripts`.

# Running the script on the Winanalytics VM

- First log into the winanalytics machine at [desktop.sesync.org](https://desktop.sesync.org).
- Open Windows PowerShell (you can click on the icon in the toolbar in the lower left near the start menu button).
- If needed, map your research data directory to a network drive (default name for the drive is `Z:`). You can either do this by (1) following [these directions]({{ '/quickstart/research-data-directory.html' | relative_url }}) under the heading "Windows VM" or (2) by typing the following into the PowerShell prompt: 

```
net use Z: \\storage.research.sesync.org\<your sesync username or group name>-data /persistent:no 
```

- Next you need to tell PowerShell it is okay to execute scripts by setting the script execution policy to "Unrestricted" for the current user. Type the following into the PowerShell prompt:

```
Set-ExecutionPolicy Unrestricted -Scope CurrentUser
```

You will be asked to enter "Y" to confirm.

- Change to the directory where your PowerShell script is found, by typing something like this into the PowerShell prompt  (if you have a subdirectory called "scripts" in your research data directory):

```
cd Z:\scripts
```

- Run your script (it should have the .ps1 filename extension) by typing this:

```
.\<name of the script>.ps1
```

You will need to enter "R" to confirm that you want to run the script once. If your PowerShell script does not contain errors, it will run your program in parallel!

