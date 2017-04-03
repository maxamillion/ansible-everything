:skip-help: true
:title: Ansible Everything

.. title: Ansible Everything

Ansible Everything
==================

----

.. image:: images/ansible-all-the-things.jpg
    :align: center
    :scale: 150%

----

No, Seriously
=============



.. image:: images/ansible-logo.png
    :height: 400px
    :width: 400px
    :align: center



... everything
==============

----

Topics for the day
==================

In this presentation we will discuss `Ansible`_, a radically simple IT
automation system.

Specifically we will explore the traditional to the unorthodox use cases of
Ansible. We'll discuss various topics such as configuration management,
provisioning, deployment, orchestration, command line tooling, builds,
event-based execution, workflow automation, continuous integration, and
container management.

----

Outline
-------


* Quick intro to Ansible (just in case)
* Ansible is an Automation Tool
* Why on earth would I want to do all the things with Ansible?
* Configuration Management
* Provisioning
* Deployment
* Orchestration
* Command Line Tooling
* Builds

  * Software
  * Containers
  * Image Artifacts

* Event Based Execution
* Workflow Automation
* CI

  * CI Systems Powered By Ansible
  * Using Ansible in CI

* Ansible Container

  * Builds
  * Push (`OpenShift`_ and `Kubernetes`_)


----

Quick Introduction to Ansible
=============================

Ansible is a simple **task** automation tool.

**Tasks** are performed via ``modules``

Ad-hoc tasks are simple from the command line with ``ansible``

Example
-------

Module: ``dnf``

Arguments: ``pkg=bash state=installed``

::

    $ ansible localhost -m dnf -a "pkg=bash state=installed"

    localhost | SUCCESS => {
        "changed": false,
        "msg": "Nothing to do"
    }

What if I wanted to do more than one thing?

Enter `playbooks`_.

----

Playbooks
=========

Playbooks are a way to combine many tasks, written in `YAML`_, to be carried
out against one or many hosts.

First, we need an `inventory`_ to specify our hosts and groups of hosts.

** Note: There is also a special "all" group that is implicitly defined as the
sum of all hosts in your inventory.

A very simple Inventory
-----------------------

Below we have a simple inventory with two groups, ``appservers`` and
``webservers``.

::

    [appservers]
    app1.example.com
    app1.example.com

    [webservers]
    webserver1.example.com
    webserver2.example.com

Example playbook
----------------

.. code:: yaml

    ---
    - name: common things to run on all hosts
      hosts: all
      tasks:
        - name: make sure bash is installed
          dnf:
            pkg: bash
            state: installed

    - name: webserver-only tasks
      hosts: webservers
      tasks:
        - name: install httpd
          dnf:
            pkg: httpd
            state: installed
        - name: start and enable httpd service
          service:
            name: httpd
            state: started
            enabled: yes


This would then be executed with the ``ansible-playbook`` command.

----

Ansible is an automation tool
=============================

Ansible is often used for configuration management and is often compared to
tools in that realm such as `Puppet`_, `Chef`_, and `SaltStack`_. Ansible goes
beyond that though and is also used for many things such as deployment and
provisioning. (We will talk more about this later...)

Ansible
-------

* Is agentless, you just need `python`_ and SSH
* IS NOT a configuration management system
* IS an automation tool
* automates tasks, some of which can be config management tasks

  * (this leads to confusion)

* Is great "glue" between different tasks and tools
* Can be used with "traditional" configuration management systems

  * there's even a `puppet module`_

----

Why on earth would I want to do all the things with Ansible?
============================================================

* Ansible is a simple automation tool that can execute tasks on one or many
  hosts

  * Can also execute tasks on different hosts to orchestrate otherwise complex
    order of operations, even conditionally based on system facts.

* Modules can we written in any programming language that can understand JSON

What are you trying to accomplish that could be automated?
----------------------------------------------------------

Vague question that applies to almost all modern day IT, Developer teams, Ops
Teams, and DevOps practitioners.

But seriously, what are you trying to do?

* Deploy software?
* Provision Virtual Machines or IaaS instances?
* Test software?
* Automate workflows?
* Continuous Integraton / Continuous Deployment?
* Replace terrible shell scripts that have survived too long already?
* Other?

ANSIBLE CAN DO ALL OF THAT
--------------------------

----

Configuration Management
========================

What is `configuration management`_?

Systems engineering process for establishing and maintaining consistency of
a product's performance, functional, and physical attributes with its
requirements, design, and operational information throughout its life.

It generally boils down to:

* Managing file content
* Templating configurations
* System and Service state
* Package Management

Ansible does that!
------------------

* Service state: ``service`` module
* Ansible files and configuration modules:  ``acl`` ``archive`` ``assemble``
  ``blockinfile`` ``copy`` ``fetch`` ``file`` ``find`` ``ini_file``
  ``iso_extract`` ``lineinfile`` ``patch`` ``replace`` ``stat`` ``synchronize``
  ``tempfile`` ``template`` ``unarchive`` ``xattr``
* Ansible System state module support:  ``aix_inittab`` ``alternatives`` ``at``
  ``authorized_key`` ``beadm`` ``capabilities`` ``cron`` ``cronvar``
  ``crypttab`` ``debconf`` ``facter`` ``filesystem`` ``firewalld``
  ``gconftool2`` ``getent`` ``gluster_volume`` ``group`` ``hostname``
  ``iptables`` ``java_cert`` ``kernel_blacklist`` ``known_hosts``
  ``locale_gen`` ``lvg`` ``lvol`` ``make`` ``modprobe`` ``mount`` ``ohai``
  ``open_iscsi`` ``openwrt_init`` ``osx_defaults`` ``pam_limits`` ``pamd``
  ``parted`` ``ping`` ``puppet`` ``runit`` ``seboolean`` ``sefcontext``
  ``selinux`` ``selinux_permissive`` ``seport`` ``service`` ``setup``
  ``solaris_zone`` ``svc`` ``sysctl`` ``systemd`` ``timezone`` ``ufw`` ``user``
* Ansible Package Management support: ``bower`` ``bundler`` ``composer``
  ``cpanm`` ``easy_install`` ``gem`` ``maven_artifact`` ``npm`` ``pear`` ``pip``
  ``apk`` ``apt`` ``apt_key`` ``apt_repository`` ``apt_rpm`` ``dnf``
  ``dpkg_selections`` ``homebrew`` ``homebrew_cask`` ``homebrew_tap`` ``layman``
  ``macports`` ``openbsd_pkg`` ``opkg`` ``package`` ``pacman`` ``pkg5``
  ``pkg5_publisher`` ``pkgin`` ``pkgng`` ``pkgutil`` ``portage`` ``portinstall``
  ``pulp_repo`` ``redhat_subscription`` ``rhn_channel`` ``rhn_register``
  ``rpm_key`` ``slackpkg`` ``sorcery`` ``svr4pkg`` ``swdepot`` ``swupd``
  ``urpmi`` ``xbps`` ``yum`` ``yum_repository`` ``zypper`` ``zypper_repository``


More modules being added all the time...

----

Configuration Management - Special Topics
=========================================

Alright, we can install packages, configure and enable some services, what about
more sophisticated state definition?

Ansible has you covered
-----------------------

Ansible modules support to cater to a wide array of common Infrasturcture
Service needs.


The following categories are covered extensively by Ansible modules:
  * Clustering
  * Commands
  * Crypto
  * Database
  * Files
  * Identity
  * Inventory
  * Messaging
  * Monitoring
  * Network
  * Notification
  * Packaging
  * Remote
  * Management
  * Source
  * Control
  * Storage
  * System
  * Utilities
  * Web
  * Infrastructure
  * Windows

----

Provisioning
============



----

Deployment
==========

----

Orchestration
=============

----

Command Line Tooling
====================

----

Builds
======

----

Event Based Execution
=====================

----

Workflow Automation
===================

----

Continuous Integration
======================

----

Ansible Container
=================

----

References
==========

* `Ansible`_
* `YAML`_
* `Chef`_
* `Puppet`_
* `python`_
* `SaltStack`_
* `Kubernetes`_
* `OpenShift`_
* `hovercraft`_
* `modules`_
* `playbooks`_
* `inventory`_
* `puppet module`_
* `ansible-container`_
* `Zuul v2.5`_
* `Zuul v3`_
* `Source code for this presentation`_

.. _Ansible: https://www.ansible.com/

.. _YAML: http://yaml.org/
.. _Chef: https://www.chef.io/
.. _Puppet: https://puppet.com/
.. _python: https://www.python.org/
.. _SaltStack: https://saltstack.com/
.. _Kubernetes: http://kubernetes.io/
.. _OpenShift: https://www.openshift.org/
.. _Zuul v2.5: http://status.openstack.org/zuul/
.. _hovercraft: https://github.com/regebro/hovercraft
.. _modules: http://docs.ansible.com/ansible/modules.html
.. _playbooks: http://docs.ansible.com/ansible/playbooks.html
.. _inventory: http://docs.ansible.com/ansible/intro_inventory.html
.. _puppet module: http://docs.ansible.com/ansible/puppet_module.html
.. _ansible-container:
    https://github.com/ansible/ansible-container
.. _Zuul v3:
    http://lists.openstack.org/pipermail/openstack-dev/2016-June/097584.html
.. _Source code for this presentation:
    https://github.com/maxamillion/ansible-all-the-things
.. _configuration management:
    https://en.wikipedia.org/wiki/Configuration_management
