# KBkup
## A simple yet useful backup tool for Linux.

> **What does it do?** Takes files from any directory, copies and compresses them to a Backups folder on your HOME directory.
> **But why?** This is very useful for important files. In case you want to mess with any folder, or if anything breaks after changes, you can just use the backup to restore it.

### Installing KBkup:

Downloading the file 
```bash
git clone https://github.com/deciiwithoutmal/KBkup ~/.KBkup
```
Making it executable
```bash
chmod +x ~/.KBkup/kbkup.sh
```
Adding an alias
```bash
echo 'alias kbkup="~/.KBkup/kbkup.sh"' >> ~/.bashrc
source ~/.bashrc
```
If you use ZSH, replace ~/.bashrc with ~/.zshrc

### Using it:
Now you can just simply type
```bash
kbkup <DIR>
```
And it will automatically back up your files!

Example:
```bash
> kbkup ~/Downloads
> kbkup ~/Pictures
```
