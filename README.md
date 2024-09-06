# utils

# Recover file contents when you accidently run `git reset --hard` without commiting your changes.
- First, do not panic! it is possible to recover your file changes even though you have not added or committed them.
- Run `git fsck` to check if there are 'dangling blobs' that can be recovered. These are your file changes that were saved but not committed.
- Run `git fsck --lost-found` this will create a `.git/lost-found/others` folder which contains all your file changes in the hash.
- It is not possible to recover the file names but you can revoer its contents.
- Run script `recover.sh`.
- Once the script is complete you can go through the files to recover your content.
