# http_file_prober
Simple `bash` tool for **parsing size** and type of URLs.

Each request **only gets first KB** of data and parses **content length**+**type** & **headers**.

The output will be <u>saved</u> in <u>execution path</u>, <u>appends</u> the results to a file.

---

## Install Debian/Ubuntu
```bash
▶ sudo apt install ripgrep curl
```
## Install MacOS
```bash
▶ brew install ripgrep curl
```

### Options

```bash
# Usage of http_file_prober.sh:
▶ http_file_prober.sh [url] [url2] [urlX..]
        Put one or more space-delimited urls/domains as arguments
▶ cat urls.txt | xargs -n10 -P25 /fullpath/http_file_prober.sh
        Run multiple process "-P25" - process count. Check out `man xargs` for help
```

### Usage sample

```bash
▶ ./http_file_prober.sh https://pastebin.com/raw/{8XD3uxYQ,cydhSP1v,g5wTvVq7}
https://pastebin.com/raw/8XD3uxYQ                                                     | Null       | text/plain
https://pastebin.com/raw/cydhSP1v                                                     | Null       | text/plain
https://pastebin.com/raw/g5wTvVq7                                                     | Null       | text/plain

▶ ./http_file_prober.sh https://yandex.ru/news/quotes/2002.html https://yandex.ru/support/common/troubleshooting/main.html
https://yandex.ru/news/quotes/2002.html                                               | 6856       | text/html
https://yandex.ru/support/common/troubleshooting/main.html                            | 266851     | text/html
```

