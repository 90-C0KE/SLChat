# SLChat Python Version
# Written by 1k0de

# IMPORTS
import subprocess
import sys
import os
import time
import rich
from rich.console import Console
from rich.align import Align
from rich.progress import Progress, SpinnerColumn, BarColumn, TextColumn, TimeElapsedColumn
from rich.table import Table
from rich.live import Live
from rich.panel import Panel
from rich.color import Color
from rich.bar import Bar
from tqdm import tqdm

console = Console()

## VARIABLES ##
cls = lambda: os.system("cls")
title = lambda _str: os.system(f"title {_str}")
print = rich.print

############# Make sure Windows Terminal is running ##############

def run_command(command):
    try:
        result = subprocess.run(command, stdout=subprocess.PIPE ,stderr=subprocess.PIPE, shell=True, text=True)
        return result.stdout.strip(), result.stderr.strip()
    except Exception as e:
        print(f"Error running command {command}: {e}")
        return "", str(e)

def is_windows_terminal_installed():
    stdout, stderr = run_command("winget list Microsoft.WindowsTerminal")
    if "Microsoft.WindowsTerminal" in stdout:
        return True
    return False

def install_windows_terminal():
    print("Windows Terminal not found. Installing...")
    # Run the install command in the background
    install_command = "winget install --id Microsoft.WindowsTerminal -e"
    
    # Start the installation process in a separate process
    process = subprocess.Popen(install_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)

    # Show loading bar until the installation is complete
    with tqdm(total=100, desc="Installing Windows Terminal", ncols=100, bar_format="{l_bar}{bar}| {n_fmt}/{total_fmt}") as pbar:
        while process.poll() is None:  # While the process is running
            # Update the progress bar (simulating progress here)
            pbar.update(1)
            time.sleep(0.1)
        
        # When the installation is done, the process will finish
        pbar.update(100 - pbar.n)  # Ensure we finish the progress bar
    process.wait()  # Wait for the process to terminate

def is_command_prompt_default():
    # Check if the default terminal is Command Prompt (Legacy) by inspecting the registry.
    stdout, stderr = run_command('reg query "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\FileExts\\.bat\\UserChoice"')
    #print(f"STDOUT: {stdout}\nSTDERR: {stderr}")
    if "cmd" in stdout.lower():
        return True
    return False

def set_windows_terminal_as_default():
    print("Changing default terminal to Windows Terminal...")
    # Modify the registry or use system command to set Windows Terminal as default
    run_command("start ms-settings:defaultapps")

def terminalCheck():
    # Check if Windows Terminal is installed, if not, install it
    if not is_windows_terminal_installed():
        install_windows_terminal()
        time.sleep(5)  # Allow some time for the installation to complete
    else:
        print("Windows Terminal is already installed.")
    
    # Check if Command Prompt (Legacy) is the default terminal
    if is_command_prompt_default():
        print("Command Prompt (Legacy) is set as the default terminal.")
        # Set Windows Terminal as the default terminal
        set_windows_terminal_as_default()
    else:
        print("The default terminal is already set to something other than Command Prompt.")

###################### END OF SECTION ######################
## FUNCS



##########
terminalCheck()
title("SLChat")
cls()

print(Align.center("""[#ffffff]
       ▄████████  ▄█        ▄████████    ▄█    █▄       ▄████████     ███     
      ███    ███ ███       ███    ███   ███    ███     ███    ███ ▀█████████▄ 
      ███    █▀  ███       ███    █▀    ███    ███     ███    ███    ▀███▀▀██ 
      ███        ███       ███         ▄███▄▄▄▄███▄▄   ███    ███     ███   ▀ 
    ▀███████████ ███       ███        ▀▀███▀▀▀▀███▀  ▀███████████     ███     
             ███ ███       ███    █▄    ███    ███     ███    ███     ███     
       ▄█    ███ ███▌    ▄ ███    ███   ███    ███     ███    ███     ███     
     ▄████████▀  █████▄▄██ ████████▀    ███    █▀      ███    █▀     ▄████▀   
                 ▀                                                            
[bold]───────────────────────────────────────────────────────────────────────────────────[/bold][/#ffffff]"""))
print(Align.center("[#ffffff][bold]Written by 1k0de[/bold][/#ffffff]"))
print(Align.center("[#ffffff][bold]───────────────────────────────────────────────────────────────────────────────────[/bold][/#ffffff]"))

with Progress(
        SpinnerColumn(),
        *Progress.get_default_columns(),
        TimeElapsedColumn(),
        console=console,
        transient=False,
    ) as progress:
        task3 = progress.add_task("                    [cyan]> Authenticating user...", total=None)

        while not progress.finished:
            time.sleep(0.01)

#print(Align.center("[#ffffff]Authenticating user...[/#ffffff]"))

os.system("pause > nul")
