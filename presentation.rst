:skip-help: true

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
* What do people normally do with Ansible?
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

* `ansible-container`_

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

.. note::
    There is also a special "all" group that is implicitly defined as the sum of
    all hosts in your inventory.

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

What do people normally do with Ansible?
========================================

Ansible is often used for configuration management and is often compared to
tools in that realm such as `Puppet`_, `Chef`_, and `SaltStack`_. Ansible goes
beyond that though and is also used for many things such as deployment and
provisioning. (We will talk more about this later...)

Ansible is an automation tool
-----------------------------

Ansible:

* Is not just a configuration management system
* Is an automation tool
* can perform many functions

  * some functions intersect with traditional configuration management systems
    festures (such as file templating and service state definition)
  * (this leads to confusion)

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

ansible-container
=================

----

References
==========

* `Source code for this presentation`_

.. _YAML: http://yaml.org/
.. _Chef: https://www.chef.io/
.. _Puppet: https://puppet.com/
.. _Ansible: https://www.ansible.com/
.. _SaltStack: https://saltstack.com/
.. _Kubernetes: http://kubernetes.io/
.. _OpenShift: https://www.openshift.org/
.. _hovercraft: https://github.com/regebro/hovercraft
.. _modules: http://docs.ansible.com/ansible/modules.html
.. _playbooks: http://docs.ansible.com/ansible/playbooks.html
.. _inventory: http://docs.ansible.com/ansible/intro_inventory.html
.. _ansible-container:
    https://github.com/ansible/ansible-container
.. _Zuul:
    http://lists.openstack.org/pipermail/openstack-dev/2016-June/097584.html
.. _Source code for this presentation:
    https://github.com/maxamillion/ansible-all-the-things

