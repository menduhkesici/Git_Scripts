# Initialize repo 
git init 

# Add remote 
git remote add origin https://_@github.com/_/_.git 

# Check remote 
git remote -v 

# Remove remote 
git remote remove origin 
 
# Commit all files 
git add . 
git commit -m "commit at `date +'%Y-%m-%d %H:%M'`" 
git push -u origin main 
read -n 1 -s -r -p "Process is over." 
 
# Change default branch name to main 
git config --global init.defaultBranch main 
 
# Extract a file or a folder from a git repository with full git history 
# Create the patch file with all the commits that touch the file or folder. 
cd ~/repository_path 
git log --pretty=email --patch-with-stat --reverse --full-index --binary -- path/to/file_or_folder > /tmp/patch 
# Apply the commits to the new repository 
cd ~/another_repository_path 
git init 
git am < /tmp/patch 
 
# Delete history 
VAR=$(git config --get remote.origin.url) # store remote in a variable 
echo $VAR 
# rm -rf .git/ # delete .git folder 
git init 
git remote add origin $VAR 
git add . 
git commit -m "commit at `date +'%Y-%m-%d %H:%M'`" 
git push -uf origin main 

# Check changes of a file 
git log -U0 --pretty=format:'=> %as' -- path/to/file \ 
        | grep '^[+-=]' | grep -Ev '^(--- /dev/null|--- a/|\+\+\+ b/)' \ 
        | GREP_COLOR='01;32' egrep --color=always '^\+.*|$' \ 
        | GREP_COLOR='01;31' egrep --color=always '^-.*|$' \ 
        | GREP_COLOR='01;37' egrep --color=always '^=>.*|$' \ 
        | less -R
