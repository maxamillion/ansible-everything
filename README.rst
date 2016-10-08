######################
ansible-all-the-things
######################

Ansible All The Things, No Seriously
####################################


This is currently going to serve as a brain dumping ground for various topics
about using `Ansible`_ for "All The Things". Eventually I will turn this into
a slide deck for a talk that can be given at conferences or meetups. This is
meant to be a talk that anyone with familiarity or experience with `Ansible`_
could give if they were so inclined. I hope to be able to author a first draft
that is useful but it will not be mine alone, I hope that members of the
community will add content based on their own experiences and that this can be
a presentation that anyone can use or modify.

The slide presentation will likely be put together using `hovercraft`_.

What is Ansible?
----------------

`Ansible`_ is a task orchestration utility that can be used for ad-hoc task
execution on any one or many systems within an infrastructure. These tasks are
implemented as `modules`_ and can be combined into a simple series of tasks or
a complex workflows using what are known as `playbooks`_.

Simply put, `Ansible`_ runs tasks on your systems (one or many) and can run many
tasks automatically when they are written down as a playbook.

Topics
------

* Configuration Management
* Provisioning
* Deployment
* Orchestration
* Builds

  * Software
  * Containers
  * Image Artifacts

* Workflow Automation
* CI

  * `Zuul`_

* `ansible-container`_

  * Builds
  * Push (`OpenShift`_ and `Kubernetes`_)



.. _Ansible: https://www.ansible.com/
.. _Kubernetes: http://kubernetes.io/
.. _OpenShift: https://www.openshift.org/
.. _hovercraft: https://github.com/regebro/hovercraft
.. _modules: http://docs.ansible.com/ansible/modules.html
.. _playbooks: http://docs.ansible.com/ansible/playbooks.html
.. _ansible-container:
    https://github.com/ansible/ansible-container
.. _Zuul:
    http://lists.openstack.org/pipermail/openstack-dev/2016-June/097584.html

