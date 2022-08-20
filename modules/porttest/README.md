# porttest

#### Table of Contents

1. [Overview](#overview)
2. [Setup - The basics of getting started with porttest](#setup)
    * [What porttest affects](#what-porttest-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with porttest](#beginning-with-porttest)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

TCP port testing for Puppet.

very definitely based upon https://github.com/BIAndrews/porttest

Also found at https://forge.puppet.com/redlegoman/porttest

## Setup

### What porttest affects

* A small python script is installed in a user configurable location. This runs the TCP testing. On success a file is touched so the host:port is only tested once instead of being tested on every puppet agent run.

### Setup Requirements

Python is needed and assumed installed. Even old RedHat 5 systems have the needed Python modules installed.

### Beginning with porttest

## Usage

~~~
porttest::tcp { 'test tcp 80 to google.com': 
  target => [ 'google.com:80' ], 
  timeout   => '2', 
}

~~~

## Reference

###Defines

####Public defines
* `porttest::tcp`: Test TCP ports on hosts

####Private classes
* `porttest::install`: Installs the port test Python script

###Parameters

#####`target`

Specify the IP, hostname, or FQDN of the target to test and the port in the format 'host:port'

#####`timeout`

Specify the number of seconds before I give up and return a fail

## Limitations

Python is the only requirement and comes installed with all modern Linux flavors.
