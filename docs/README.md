# **Jekyll Website Development Guide**

Welcome\! This guide will walk you through setting up your local environment so you can develop and preview changes to our Jekyll website.

### **1\. Environment Setup**

Follow these steps to install the necessary tools.

**A. Install Ruby**

We use Ruby version 3.2. You can install it easily using [Homebrew](https://brew.sh/). RubyGems, the package manager for Ruby, is included with this installation.

\# Install Homebrew (if you don't have it)  
/bin/bash \-c "$(curl \-fsSL \[https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh\](https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh))"

\# Install Ruby 3.2  
brew install ruby@3.2

\# After installation, you may need to add Ruby to your shell's PATH.  
\# Homebrew will provide instructions, but it's usually this for Zsh (default on modern macOS):  
echo 'export PATH="/opt/homebrew/opt/ruby@3.2/bin:$PATH"' \>\> \~/.zshrc  
source \~/.zshrc

**B. Install Build Tools**

Jekyll gems sometimes need to be compiled from source, which requires gcc and make. On macOS, the easiest way to get these is by installing the Xcode Command Line Tools.

xcode-select \--install

**C. Verify Installations**

Run these commands to ensure everything is installed correctly. You should see version numbers for each.

\# Check Ruby version (should be 3.2.x)  
ruby \-v

\# Check RubyGems version (comes with Ruby)  
gem \-v

\# Check GCC version  
gcc \--version

\# Check Make version  
make \--version

**D. Install Bundler and Dependencies**

Bundler manages the specific gems (plugins) our project needs. Navigate to the project's publishing source directory (docs/) to install them.

\# Navigate to the correct directory from the project root  
cd docs/

\# Install Bundler, the Ruby package manager  
gem install bundler

\# Install all the gems defined in the Gemfile  
bundle install

### **2\. Running the Local Server**

To see your changes live before pushing them, you can run a local server.

**From within the docs/ directory**, run the following command:

bundle exec jekyll serve

You'll see output in your terminal. Once it says Server address: and Server running..., you can view the site by opening your web browser and navigating to:

**https://www.google.com/search?q=http://127.0.0.1:4000**

The server will automatically rebuild the site whenever you save a file, so you can just refresh your browser to see the changes. To stop the server, press Ctrl \+ C in your terminal.

### **3\. Deploying Changes**

The deployment process is simple and automated.

1. **Commit** your changes to your branch.  
2. Create a **Pull Request (PR)** to merge your branch into the main branch.  
3. Once the PR is reviewed and **merged**, GitHub Pages will automatically rebuild the site and your changes will be live.

### **4\. How to Edit the Jekyll Website**

Jekyll is a static site generator. It uses your content (written in Markdown), templates, and data to build a complete HTML, CSS, and JavaScript website. Here's where to find and edit things:

#### **Key Directories**

* \_posts/: This is for blog posts or articles. Files here MUST be named in the format YYYY-MM-DD-your-post-title.md.  
* \_layouts/: These are the main templates for your site (e.g., default.html, post.html). A page in your site will specify which layout to use.  
* \_includes/: These are reusable snippets of code, like the header, footer, or navigation bar. Layouts often pull these in.  
* assets/: This is where you should put static files like images, CSS stylesheets, and JavaScript files.  
* **Root Directory (docs/)**: Any .md or .html file you create here will become a page on the site. For example, about.md will be accessible at your-site-url/about.html.

#### **Front Matter: The Brains of a Page**

At the very top of any page or post (any .md file), you'll find a block of text between two \--- lines. This is called **Front Matter**. It's where you define variables for that specific page, like its title or which layout to use.

**Example from a file like about.md:**

\---  
layout: default  
title: About Us  
permalink: /about/  
\---

\#\# This is the About Us page.

Here you can write content using Markdown...

* layout: default: Tells Jekyll to wrap this page's content inside the \_layouts/default.html template.  
* title: About Us: Sets the title for this page, which can be used in the layout (e.g., in the \<title\> tag).  
* permalink: /about/: Sets a clean URL for the page.

#### **Common Tasks**

* **To edit an existing page (like "About" or "Contact"):** Find the corresponding file (e.g., about.md) in the root docs/ folder and change its content.  
* **To add a new page:** Create a new file like services.md in the docs/ folder, add the Front Matter, and write your content.  
* **To write a blog post:** Create a new file in the \_posts folder named YYYY-MM-DD-new-post.md.  
* **To change the header or footer:** Edit the corresponding file in the \_includes/ directory.