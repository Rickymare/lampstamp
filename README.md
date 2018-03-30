# Lamp Stamp: A journey into the land of Linux


### Objectives

1. Create a database server running MySQL
1. Provision a web server running the Wordpress application
1. Create an Amazon S3 bucket for use with [WP Offload S3](https://wordpress.org/plugins/amazon-s3-and-cloudfront/)

### Goals

Merge web.sh and data.sh into one script, call it something like deploy.sh
When the user runs that script, ask what it would like to do?
1. deploy web
2. deploy data
3. deploy both

Ask the user for the necessary input that the script needs to complete the task. If it is being deployed on different servers, do you need to query the user for IP addresses and stuff like that? Make a list of all the things that would be different for different scenarios.

If deploying only web, do all the web stuff
If deploying only data, do all the data stuff
If deploying both, do both!

### Technologies used

* **L**inux - Ubuntu Xenial Xerus 16.04.1
* **A**pache HTTP Server
* **M**ySQL RDBMS
* **P**HP Hypertext Preprocessor


### Future Plans

* Include a Redis server for user sessions
* Automate the entire process of deployment

### Resources:

<details>
    <summary>PHP 5 Packages</summary>
    <li>cli</li>
    <li>curl</li>
    <li>fpm</li>
    <li>gd</li>
    <li>json</li>
    <li>mcrypt</li>
    <li>mysql</li>
</details>

<details>
    <summary>Web Packages</summary>
    <li>apache2</li>
    <li>git</li>
    <li>libapache2-mod-php5</li>
    <li>libssh2-php</li>
    <li>mailutils</li>
    <li>postfix</li>
    <li>unzip</li>
    <li>zip</li>
</details>
