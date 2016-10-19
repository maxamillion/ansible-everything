:skip-help: true
:title: Ansible All the Things, No Seriously

.. title: Ansible All The Things, No Seriously

Ansible All The Things, No Seriously
====================================

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

... all the things.
===================

----

Topics for the day
==================

In this presentation we will discuss `Ansible`_, a radically simple IT
automation system.

More specifically, we will be discussing `Ansible`_ in the context of the
following topics:


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

  * `Zuul`_

* Ansible Container

  * Builds
  * Push (`OpenShift`_ and `Kubernetes`_)


----

Quick Introduction to Ansible
=============================

Ansible is a simple task automation tool.

Tasks are performed via ``modules``

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
    order of operations.

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

