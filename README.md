# Sitemap Crawler

This bash script downloads `sitemap.xml` from a given URL, parses it, and opens each page listed in the sitemap. The script also handles nested sitemaps and processes them recursively.

## Requirements

The script requires `curl` to be installed. Most modern Linux distributions come with `curl` pre-installed. If not, you can install it using your package manager, for example:

```bash
# For Debian/Ubuntu
sudo apt-get install curl

# For RedHat/CentOS
sudo yum install curl
```

## Installation

1. Clone the repository:

```bash
git clone https://github.com/FlusherDock1/Sitemap-Crawler.git
```

2. Navigate to the script directory:

```bash
cd sitemap-crawler
```

3. Make the script executable:

```bash
chmod +x sitemap_crawler.sh
```

## Usage

Run the script by providing the URL of your main sitemap as an argument:

```bash
./sitemap_crawler.sh https://example.com/sitemap.xml
```

The script will download the specified sitemap, extract all URLs and nested sitemaps, and open each page. The pages are opened using the `curl` command.

## Notes

- If you want the pages to open in your browser, uncomment the line with the `xdg-open $URL` command in the script.
- The script temporarily saves downloaded files in the `/tmp` directory and removes them after processing.

## License

This project is licensed under the terms of the MIT License. See the LICENSE file for details.

## Contributing

We welcome contributions! Please create a pull request or open an issue with your suggestions and feedback.

---

If you have any questions or issues, feel free to seek help through the issue tracker in this repository.
