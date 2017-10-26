
# pe_puppet_agent_syslog

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with pe_puppet_agent_syslog](#setup)
    * [What pe_puppet_agent_syslog affects](#what-pe_puppet_agent_syslog-affects)
    * [Beginning with pe_puppet_agent_syslog](#beginning-with-pe_puppet_agent_syslog)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This module will automatically set up rsyslog and Puppet agent such that all agent logging will be directed to a file of your choosing.  This file defaults to `/var/log/puppetlabs/puppet-agent.log`.  This automates the process of splitting Puppet agent messages out from `/var/log/messages` to their own file.

This module assumes you are running a version of Linux that utilizes rsyslog as the logging subsystem.

This class can be applied to any node in your infrastructure where you would like to have Puppet agent, both command like invocations and automated runs, log to a separate file along with `/var/log/messages`.

## Setup

### What pe_puppet_agent_syslog affects

This module will add a new rsyslog configuration file under `/etc/rsyslog.d`, set to be loaded last.  By default, it will log on syslog facility "local6", but this can be configured via parameter if it is already in use in your environment.

### Beginning with pe_puppet_agent_syslog  

Assign the class to a node group that encompasses the nodes you wish to set up.

## Usage

There are two parameters, "facility" and "log_filename":

"facility": The syslog facility on which Puppet agent will log.  This defaults to "local6".

"log_filename": The destination file where the Puppet agent logs will be stored.  This defaults to "/var/log/puppetlabs/puppet-agent.log"

## Reference

## Limitations

This module currently only handles systems with rsyslog as the logging subsystem.

## Development

## Release Notes/Contributors/Etc. **Optional**

