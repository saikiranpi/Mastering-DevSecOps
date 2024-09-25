![03](https://github.com/user-attachments/assets/6be236b3-3be1-4c2d-ade5-3341265b409d)

# Day 03 OutputRedirection-For-While

This project demonstrates **output redirection** and the use of **for** and **while** loops in Bash scripting, along with examples using **standard input**, **output**, and **error** redirections.

## Key Concepts

### Standard Streams:
- **stdin**: Standard Input (File descriptor 0)
- **stdout**: Standard Output (File descriptor 1)
- **stderr**: Standard Error (File descriptor 2)

### Output Redirection:
- `>` : Redirects the output and **overwrites** the content in the file.
- `>>` : Redirects the output and **appends** it to the file.
- **Tee Command**: Redirects the output to a file and **displays it on the screen** simultaneously.

---

## Script Example: `std-script.sh`

This Bash script demonstrates both valid and invalid commands. We'll focus on how to redirect output.

### Script:

```bash
#!/bin/bash
ls -al           # Valid command, prints directory listing
Saikiran         # Invalid command, will trigger an error
df -h            # Valid command, prints disk space usage
Avinash          # Invalid command, will trigger an error
free             # Valid command, prints memory usage
sai              # Invalid command, will trigger an error
cat /etc/hostname # Valid command, prints hostname
avi              # Invalid command, will trigger an error
```

### How to Execute:
1. Save the script as `std-script.sh`.
2. Run it using `bash std-script.sh`.

---

### Requirements:
1. **Print only successful commands**:
   ```bash
   bash std-script.sh 2> /dev/null
   ```
   - Redirects any errors (stderr) to `/dev/null`, so only the output of successful commands is shown.

2. **Print only failed commands**:
   ```bash
   bash std-script.sh 1> /dev/null
   ```
   - Redirects standard output (stdout) to `/dev/null`, so only error messages (stderr) are displayed.

---

### Overwriting and Appending Output:
- To redirect both **stdout** and **stderr** to a file:
  ```bash
  bash std-script.sh > /tmp/error 2>&1
  ```
  - This will **overwrite** the file with both standard output and errors.

- To **append** instead of overwriting:
  ```bash
  bash std-script.sh >> /tmp/error 2>&1
  ```

---

### Display and Save Output:
To display output on the screen **and** save it to a file:
```bash
bash std-script.sh | tee /tmp/tee1
```
- If you want to **append** to the file instead of overwriting:
  ```bash
  bash std-script.sh 2>&1 | tee -a /tmp/tee1
  ```

---

## For Loops vs While Loops

### For Loops:
Used when the number of iterations is known. For example, printing numbers from 1 to 100.

#### Script: `loops.sh`

```bash
#!/bin/bash
for i in {1..100}
do
    echo $i
done
```

### While Loops:
Used when the number of iterations is not known and continues as long as the condition is true.

#### Example:
Check if a website is working using a **while loop**:
```bash
while true
do
    curl https://www.google.com | grep -i google
    sleep 1
done
```

---

## Working with Python and Bash

### Python Example:
```python
x = 5 * 4
print(x)
```

### Bash Equivalent:
```bash
x=$(expr 5 \* 4)
echo $x
```
- In Bash, we need to use `expr` to perform arithmetic.

---

## Printing Even and Odd Numbers

### Even Numbers:
```bash
#!/bin/bash
for i in {1..100}; do
    if [ $((i % 2)) -eq 0 ]; then
        echo "$i is an even number"
    fi
done
```

### Even and Odd Numbers:
```bash
#!/bin/bash
for i in {1..100}
do
    if [ $(( i % 2 )) -ne 0 ]; then
        echo "$i is an odd number"
    else
        echo "$i is an even number"
    fi
done
```

---

## Conclusion

This project covers the basic concepts of output redirection in Linux, the usage of for and while loops, and demonstrates both valid and invalid command execution. Whether you are handling script output or automating tasks, understanding how to redirect outputs and loop through commands is essential for DevOps and system automation.

Feel free to explore the scripts, modify them, and experiment with different redirection methods and loop structures!

---

Happy scripting! 😊

--- 

This `README.md` provides an overview of the key concepts, code snippets, and practical use cases from the notes.
