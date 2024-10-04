![an-eye-catching-illustration-of-a-git-merge-and-gi-mich74xdR-iNzhh-DPdCaw-dDLWCUYQQtKBuum9wR-h7w](https://github.com/user-attachments/assets/affbf339-6c43-4fa4-a9e5-a3edf2961a33)


# Git Basics: Rebase, Reset, Stash, and Git Secrets

This repository provides practical examples and explanations on fundamental Git operations such as `rebase`, `reset`, `stash`, and securing sensitive information with `git-secrets`.

## Table of Contents

- [Rebase](#rebase)
- [Reset](#reset)
- [Stash](#stash)
- [Git Secrets](#git-secrets)

---

## Rebase

### What is Git Rebase?

Rebasing in Git is used to take the changes from one branch (usually a development branch) and apply them on top of another branch (typically the master branch). This results in a linear commit history, providing a cleaner log. However, it rewrites commit history, which can cause issues in a collaborative environment.

### Example:

1. Create the master branch and commit changes:
   ```bash
   mkdir rebase-example && cd rebase-example
   git init

   I=1
   while [ $I -lt 6 ]
   do
       echo "Master $I time" > MasterFile$I
       git add . && git commit -m "Master Commit $I"
       I=$((I+1))
   done
   ```

2. Create the development branch and add commits:
   ```bash
   git checkout -b development
   I=1
   while [ $I -lt 6 ]
   do
       echo "Development $I time" > DevFile$I
       git add . && git commit -m "Development Commit $I"
       I=$((I+1))
   done
   ```

3. Now, rebase the `development` branch onto `master`:
   ```bash
   git checkout development
   git rebase master
   git log --oneline
   ```

### Golden Rule of Rebase:

According to Google’s and Bitbucket's guidelines, **never rebase commits that you’ve already pushed to a shared repository**. This can cause confusion for your collaborators as it rewrites the commit history.

---

## Reset

### Types of Git Reset:

1. **Soft Reset**: Only resets the commit history, files remain intact.
2. **Hard Reset**: Removes both commit history and files, reverting to a previous state.

### Example:

1. Create 20 commits in a repository:
   ```bash
   mkdir reset-example && cd reset-example
   git init

   I=1
   while [ $I -lt 21 ]
   do
       echo "Commit $I content" > File$I
       git add . && git commit -m "Commit $I"
       I=$((I+1))
   done
   ```

2. Perform a hard reset to an earlier commit:
   ```bash
   git reset --hard <commit-id>
   git log --oneline
   ls -al
   ```

3. Perform a soft reset:
   ```bash
   git reset --soft <commit-id>
   ls -al  # Files will remain intact
   ```

4. If changes were pushed to the remote repository, use the following command to force-push after a reset:
   ```bash
   git push origin master --force
   ```

---

## Stash

### What is Git Stash?

Git stash is used to temporarily save your uncommitted changes so that you can work on something else. Later, you can retrieve those changes using `git stash pop`.

### Example:

1. Modify `app.py`:
   ```bash
   nano app.py
   # Add some code, like:
   print("Hello Saikiran")
   ```

2. If you need to switch to another task quickly without committing:
   ```bash
   git stash
   ```

3. To retrieve the stashed changes:
   ```bash
   git stash pop
   ```

In interviews, mention that `stash` is primarily used for temporarily saving work without committing.

---

## Git Secrets

### Protect Sensitive Information

Developers or DevOps engineers sometimes mistakenly commit sensitive information (API keys, PEM files, etc.) into repositories. To prevent this, we can use `git-secrets`.

### Example:

1. Install `git-secrets`:
   ```bash
   git clone https://github.com/awslabs/git-secrets.git
   cd git-secrets
   sudo apt install make -y
   make install
   git secrets --install
   ```

2. Register AWS patterns:
   ```bash
   git secrets --register-aws
   ```

3. Create a file containing sensitive information and attempt to commit it:
   ```bash
   nano keys
   # Add some AWS access keys
   git add . && git commit -m "AWS keys"
   ```

4. `git-secrets` will block this commit if sensitive information is detected.

---

## Conclusion

This repository covers essential Git operations:
- **Rebase** for cleaner history but with caution.
- **Reset** for undoing commits.
- **Stash** for temporarily saving work.
- **Git Secrets** for protecting sensitive information.

These concepts are critical for anyone working with version control and especially useful in DevOps and development workflows.
``
