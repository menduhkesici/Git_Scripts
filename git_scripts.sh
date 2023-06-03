# Initialize repo
git init

# Add remote
# Create PAT with permission: Contents (Read and write)
git remote add origin https://<user ID>:<fine-grained PAT>@github.com/<owner>/<repo>.git

# Check remote
git remote -v

# Remove remote
git remote remove origin

# Commit all files
git add .
git commit -m "`date +'%Y-%m-%d %H:%M'`"
git push -u origin main
read -n 1 -s -r -p "Press any key to exit..."

# Change default branch name to main
git config --global init.defaultBranch main

# Add credentials
git config --global user.name "FIRST_NAME LAST_NAME"
git config --global user.email "MY_NAME@example.com"

# Extract a file or a folder from a git repository with full git history to another repository
cd ~/repository_path
git log --pretty=email --patch-with-stat --reverse --full-index --binary -- path/to/file_or_folder > /tmp/patch
cd ~/another_path
git init
git am < /tmp/patch

# Delete history
VAR=$(git config --get remote.origin.url)
echo $VAR
# rm -rf .git/
git init
git remote add origin $VAR
git add .
git commit -m "`date +'%Y-%m-%d %H:%M'`"
git push -uf origin main
